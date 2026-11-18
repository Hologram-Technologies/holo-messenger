# Hologram: what a browser-only E2EE messenger can use

Source: local clone `hologram`, `main` at `12bc8cb` (2026-11-18, PR 156), identical to the remote head (checked with `gh api`). Repo is public. Read-only; nothing was built or run. "Verified" below means read in code; throughput numbers are the repo's own (BENCHMARKS.md), not re-measured.

## 1. What it is, shipped vs. in progress

Hologram (workspace version 0.14.0, Rust, MIT/Apache-2.0) is two things in one repo.

- A tensor engine: compiles a graph to a `.holo` archive and runs it with content-addressed memoization and lookup tables. Not relevant to a messenger.
- A "space substrate": one content address (κ, `blake3:<64 hex>`, 71 bytes) for bytes, peers, networks and snapshots, behind a trait contract (`hologram-space`) with store backends (`hologram-store`), a network layer (`hologram-net`), a container runtime, emulators, and a wasm32 browser peer (`spaces/holospaces-browser`).

On `main`, in code with tests:
- κ addressing, verify by re-derivation, `KappaStore`/`KappaSync` traits, in-memory store, piece tree and stream verifier, file store, redb store, OPFS stores, bare frame protocol, HTTP-CAS server and parallel verified fetch, TCP Kademlia DHT, QUIC peer, WebRTC data-channel link, private-network key-epoch data forms.

Not released:
- No crate is on crates.io (checked the crates.io API for `hologram-types`, `hologram-space`, `hologram-store`, `hologram-net`, `hologram-tck`, `uor-hologram`: all "does not exist"). CHANGELOG 0.14.0 plans a first release of seven tensor crates only; `hologram-space`, `hologram-store`, `hologram-net`, `holospaces` are `publish = false`.
- Latest GitHub release and tag: v0.13.0 (2026-09-06). The large-blob work (PR 153) and the BLAKE3 hazmat piece tree (PR 156, merged today) are under `[Unreleased]`.
- npm: `@tryhologram/sdk` 0.13.0 and `@tryhologram/wasm` 0.12.1 exist, but they carry only the tensor graph builder and compiler, no store or network.
- One open PR: 151 (release validation gaps for Holospaces).

Design-only (specs/refactor/04-networks.md): WebRTC signaling ownership, native WebRTC/WS listener for browser interop, iroh, durability and replication, abuse limits, OPFS eviction detection.

## 2. Primitives usable from a browser

All paths are under `hologram/`.

### Content address
- `address_bytes(&[u8]) -> KappaLabel71`, `verify_kappa(bytes, &κ) -> Result<bool>`, `derive_label(domain, &[κ]) -> κ` (ordered composition key). `crates/hologram-space/src/substrate.rs` (mod `kappa`). `no_std` + alloc, builds for wasm32 (Justfile builds it). Mature: used everywhere, differential tests against reference hashers.
- JS exports: `kappa(bytes) -> string`, `verify_kappa(bytes, κ) -> bool` in `spaces/holospaces-browser/src/lib.rs:111,118`; `address`, `verify` in `crates/hologram-store/src/opfs/js_api.rs:22,28`.

### Content-addressed store
- Trait `KappaStore` (`substrate.rs:681`): `put(axis, bytes) -> κ` (idempotent, so dedup is intrinsic), `get(κ) -> Option<Arc<[u8]>>`, `contains`, `pin`/`unpin`, `iterate`, `content_len`, `get_range(κ, offset, len)`, `put_writer(axis, expected κ) -> KappaWriter` (streaming put that stores nothing unless bytes match the expected κ). Synchronous by design.
- `MemKappaStore` (`crates/hologram-space/src/mem.rs`): reference in-memory store, wasm-safe. Mature. This is what the browser `Console` content store actually uses.
- `GarbageCollect::gc(registry)`: reachability GC from pinned roots.
- Shared conformance battery: `crates/hologram-tck`.

### Persistence in the browser: OPFS only, no IndexedDB
- `OpfsKappaStore` (`crates/hologram-store/src/opfs/sync_store.rs`, feature `opfs`): one append-only OPFS pack file through `FileSystemSyncAccessHandle` in a Worker, plus an in-RAM `κ -> (offset, len)` index. Caveats read from code: the index is RAM only and the constructor expects a freshly truncated handle, so it does not survive a reload as written; `pin`/`unpin` are no-ops; `get` does not re-verify; default `get_range`/`put_writer` (buffered). It is the emulator's disk cache, not a durable message store.
- Async file-per-κ layer (`opfs/js_api.rs`, feature `js-api`): `opfs_put(bytes) -> κ`, `opfs_get(κ) -> Uint8Array|null` (verified on read), `opfs_iterate()`, `opfs_delete(κ)`, `opfs_gc(pins)`. Survives reload. Tested in Chromium via Playwright (`crates/hologram-store/web/opfs-test.mjs`). Described in code as a "reference".
- `KappaStoreBridge` (`opfs/bridge.rs`): sync store on the main thread via SharedArrayBuffer + `Atomics.wait` to a paired Worker; 8 MiB payload cap; needs cross-origin isolation.
- No IndexedDB anywhere in the repo.

### Chunking, tree hashing, verified streaming
`crates/hologram-space/src/piece.rs` (669 lines, `no_std`, merged in PRs 153 and 156; unreleased).
- `PIECE_LEN` = 1 MiB. `PieceTree`: one 32-byte BLAKE3 chaining value per piece, cut from BLAKE3's own tree, so its root equals the blob's ordinary `blake3:` κ. No second identity and no signed manifest.
- `PieceTree::from_bytes`, `from_parts(len, cvs)`, `verify_root(&κ)`, `verify_piece(index, bytes)`, `verify_range(offset, len, covering_bytes) -> &[u8]`, `pieces_covering`, `encode`/`decode` (wire form `HPTREE01`, 32 bytes per MiB).
- `PieceTreeBuilder` (one pass, holds one piece), `piece_chaining_value(index, bytes, total)` (for parallel hashing), `StreamVerifier::new(&κ).with_len(n)`, `update`, `finish`.
- `PieceSink` trait for pieces arriving in any order.
- Not exposed to JS: no `#[wasm_bindgen]` wrapper exists for any of this. A browser app must write its own binding.
- Fixed 1 MiB pieces only. No content-defined chunking.

### Dedup
- Idempotent `put` in every backend. Sub-blob dedup only in the native redb store (64 KiB shards, `native.rs`), which is not a browser backend.
- `convergent_nonce(key, plaintext) -> [u8;12]` and `seal_private(cipher, key, plaintext)` (`substrate.rs:632,646`): encryption that keeps dedup, at the documented cost of leaking equality of plaintexts.

### Delta sync
- `resolve_closure(root κ, store, registry) -> Closure { all, missing, truncated }` and `resolve_closure_bounded(.., max_nodes)` (`substrate.rs:286,299`): walk the κ graph from a root and list what is absent locally. This is the "fetch only what I lack" primitive.
- `get_with_fetch` (`substrate.rs:858`): local first, else fetch, verify, cache.
- `KappaSync::discover(prefix, limit)`: list κs a peer holds. No set reconciliation, no version vectors, no CRDT.
- Resumable out-of-order download (`PartialBlob`) exists only in the std file store (`crates/hologram-store/src/file.rs`), not in the browser.

### Caching
- Browser: `MemKappaStore` as RAM cache in front of OPFS, by convention. Size-bounded LRU read-through cache exists only in the native redb store (`CacheConfig`).
- HTTP-CAS server sends the κ as `ETag` with `Accept-Ranges` and CORS, so ordinary browser HTTP caching and `Range` requests work against it.

### Transport and peer networking
- Trait `KappaSync` (`substrate.rs:829/845`, `?Send` on wasm32): `fetch(κ)`, `announce(κ)`, `discover`, `add_peer`, `add_gateway`.
- `BareNetSync` (`crates/hologram-net/src/bare.rs`, `no_std`): frames `u32 LE len | u8 kind | payload`; kinds HELLO, FETCH_REQ/RES_OK/RES_404, ANNOUNCE, DISCOVER_REQ/RES; version handshake (`protocol.rs`); verify on receipt.
- `WebRtcLink` (`spaces/holospaces-browser/src/webrtc.rs`, `#[wasm_bindgen]`): `new(initiator)`, `create_offer() -> sdp`, `accept_offer(sdp) -> sdp`, `accept_answer(sdp)`, `add_ice(json)`, `take_ice()`, `is_open()`, `send(frame)`, `recv()`, `close()`. One ordered reliable data channel `uor-content-net`. No ICE servers configured (host candidates only). Signaling is manual, out of band.
- `Console` content-net methods (`spaces/holospaces-browser/src/lib.rs:1015-1140`): `cn_put(bytes) -> κ`, `cn_announce(κ)`, `cn_discover() -> JSON`, `cn_fetch_start(κ)`, `cn_fetch_poll() -> undefined|null|bytes`, `cn_pump(link)`, `cn_inbound`/`cn_outbound`. Poll-driven, one fetch in flight at a time, whole blob in one frame, link MTU 256 KiB, so blobs larger than about 256 KiB look unfetchable on this path (read from code, not run). Tested two-tab in `web/webrtc-content-net-test.mjs`.
- HTTP-CAS (`crates/hologram-net/src/http/`): path helpers and `accept_received` are portable; the live server (`serve_with`: HEAD, Range, ETag, CORS, `/cas/{κ}/pieces`) and the parallel multi-source verified fetch (`fetch_piece_tree`, `fetch_pieces`) use `std::net`, so native only. A browser can talk to that server with its own `fetch()` and verify with `PieceTree` in wasm.
- TCP Kademlia DHT and QUIC (`tcp/`, `quic.rs`): native only.
- `WsEgress` (`wsnet.rs`): tunnels a guest OS's TCP through a WebSocket relay. Emulator plumbing, not peer messaging.

### Channels, membership, keys (data forms, not a protocol)
`crates/hologram-space/src/realizations.rs`: `Channel`, `Route` (publish = add a route from channel κ to payload κ; append-only), `PeerEndpoint` (TCP v4/v6 only, no WebRTC form), `Network` (membership, policy, tier Public/Restricted/Private), `KeyEpoch`/`KeyWrap`/`MembershipChange` (fresh key per membership change, wrapped per member), `KeyRotation`, `AttestationKey`, `SessionAttestation`, `RevocationEvent`. Traits `PayloadCipher`, `KeyWrapper`, `SignatureVerifier` (`substrate.rs:603-673`) are seams only; ChaCha20-Poly1305, X25519 and Ed25519 implementations exist only in tests and examples. A browser space must supply its own (WebCrypto).

### Workers, WASM, WebGPU
- WASM: `holospaces-browser` is a wasm-bindgen `cdylib` (`holospaces_web.js` + `_bg.wasm`); single-threaded.
- Workers: required for the OPFS sync handle; `web/provision-worker.mjs`, `crates/hologram-store/web/bridge-worker.mjs`. No worker pool for hashing.
- WebGPU: `crates/hologram-compute/src/wgpu_backend/` (tensor kernels, WGSL). Not used for hashing or storage.
- BLAKE3 in wasm: `blake3` 1.8 with feature `wasm32_simd`, which only takes effect when the build enables `simd128`. The browser build script (`scripts/browser-manager-test.sh`, plain `wasm-pack build --release --target web`) sets no such flag, so the shipped bundle likely hashes without SIMD. No wasm hashing benchmark exists; native numbers are 5.99 GB/s one-shot and 6.77 GB/s piece verify on one thread.

## 3. How a browser app loads it
- There is no installable package for the store or network. Options today: build `spaces/holospaces-browser` with wasm-pack and import `./holospaces_web.js` (pulls in emulators, OCI import, the wasmi runtime: heavy), or write a small wasm-bindgen crate on `hologram-space` (+ `hologram-store` feature `js-api`) by git or path dependency.
- `@tryhologram/wasm` on npm is the tensor compiler driver, not this.
- Size: not knowable from the repo; no built artifact is checked in and no size is documented.

## 4. Hash functions
- Hologram's own identities are BLAKE3 only (ADR-052; `KappaLabel71`).
- Not BLAKE3-only overall: the κ verifier is "axis-polymorphic" and also accepts `sha256`, `sha3-256`, `keccak256`, `sha512` for stored content keys (`substrate.rs:88-205`, via `uor-prism` crypto). `sha2` is a real dependency in `hologram-cli` and in `holospaces` feature `net` (OCI image digests). The file and redb stores accept BLAKE3 only. The piece tree is BLAKE3 only (`VerifyError::NotBlake3`).

## 5. Server or hosted dependency
- None required for the κ, store, piece and WebRTC paths. WebRTC uses no STUN/TURN and no signaling server, which also means no NAT traversal and no rendezvous.
- GitHub Pages serves the browser bundle (static).
- Optional: an HTTP-CAS gateway (`hologram node`), the WebSocket egress relay (`web/relay.mjs`) or the Direct Sockets extension, both only for a guest OS's internet access.

## 6. Relation to uor-comms and Prism
- uor-comms: not mentioned anywhere in the repo (grep for `uor-comms`, `messenger`, `messaging` found nothing relevant).
- Prism: `crates/hologram-types/src/lib.rs` says "Hologram is a Prism application (wiki ADR-031)". It depends on crates `uor-prism` 0.4, `uor-prism-tensor`, `uor-foundation` 0.5.2, `uor-addr` 0.2.0, and takes its hasher (`prism::crypto::Blake3Hasher`) and shape vocabulary from them. The repo does not say how this relates to the LexLean/Prism app builder; I did not verify that they are the same thing.

## 7. Gaps for a messenger
- No messaging protocol: no message format, ordering, acks, receipts, inbox, offline delivery or push.
- No E2EE implementation: only traits and key-epoch data forms. No X3DH/double ratchet/MLS, no per-message forward secrecy (forward secrecy is per membership epoch only). The built-in convergent encryption leaks plaintext equality, which is wrong for chat.
- No rendezvous: manual SDP exchange, no STUN/TURN, one data channel per pair, no mesh routing in the browser. `PeerEndpoint` cannot name a browser peer.
- Browser content path is small-blob and serial: 256 KiB frames, one fetch at a time, polling, in-memory store. Piece-level ranged fetch is not wired to WebRTC.
- No durable, indexed browser store ready to use: the pack-file store loses its index on reload; the file-per-κ store is a reference; no IndexedDB; no eviction detection or `navigator.storage.persist()` handling (spec lists it as open).
- No JS API for piece tree, stream verifier, closure walk or the realization types.
- No package: nothing on crates.io or npm for these parts; no size budget; SIMD not enabled in the browser build.
- No small-message fast path: κ is a 71-byte ASCII label per reference; no batching, compression, or multiplexed streams.
- No multi-device sync, no set reconciliation, no backpressure or flow control on the data channel, no abuse limits (spec lists them as owed).

## What is directly reusable
1. `address_bytes` / `verify_kappa` and the 71-byte κ label format.
2. `piece.rs` (`PieceTree`, `StreamVerifier`, `PieceTreeBuilder`) for attachments: verified ranges, parallel and resumable fetch, 32 bytes of overhead per MiB.
3. The `KappaStore` trait with `put_writer`/`get_range`, and the file-per-κ OPFS layer as a starting point.
4. The `BareNetSync` frame codec over `WebRtcLink` for small verified fetches.
5. `resolve_closure_bounded` for "what am I missing" sync.
6. `KeyEpoch`/`KeyWrap`/`Route`/`Channel` as content-addressed data shapes for groups and logs.
