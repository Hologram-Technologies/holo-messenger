# uor-comms: state of the repository, 2026-11-18

Source: local clone `uor-comms` (checked out on `phase-1-room-core`, clean, every local branch tip equal to the GitHub tip per `gh api`). Repo is public, created today (first commit 09:59 UTC). Nothing was modified or fetched.

Headline: uor-comms is a proved rule set, not an engine. There is no callable messaging surface, no wire format, no transport, no store and no encryption code anywhere in the repository. A client cannot sit on top of it today.

## 1. Shipped vs. in flight

**`main` (4dab1f4, "Initial commit")**: the UOR template scaffold only, 201 files. Its one LexLean app is `app/src/Contract.lex.tex`, the template's "Template contract" (compares six policy-file digests; answers `conformant` / `drift:...` / `invalid request`). No messaging content. The `pages` and `Try Prism page` workflows failed on main; `bootstrap` passed.

**Open PRs: none. Merged PRs: none. Issues: none. Releases: none.**

**Branches not merged:**
- `phase-1-room-core` (a078d7f, 6 commits ahead of main, 13 files, +2038 lines): seven modules under `app/src/Comms/` (699 lines), `docs/DESIGN.md`, `docs/MATRIX-MAP.md` (1184 lines of Matrix research), `docs/STATUS.md`, plus a CI disk-space fix. Its build run (44292099034) was still in progress when read.
- `ci-capture-format` (ec9ad74): a throwaway branch marked "TEMPORARY ... not for merge". Its build run 44289959087 succeeded; this is the run STATUS.md cites for "46 theorems proved". I confirmed the run's conclusion is `success`; I did not open its log to confirm the attestation hash or theorem count.
- `prism/build/<sha>` x3: CI trigger branches. Three of the four earlier build runs failed.

`prism-comms` is an uncommitted local scaffold ("No commits yet") holding the same seven Comms modules; it looks like the pre-repository draft STATUS.md mentions.

## 2. Public surface a client would call

**None for messaging.** Verified in code:
- The only `dispatch` entry is the template's, in `app/src/Contract.lex.tex`: 384 bytes in (six 32-byte expected/observed digest pairs), text out. Unrelated to messaging. `site/app.json` still describes "Template contract".
- `app/lexlean.toml` lists the Comms modules as `entrypoints` so Lean proves them, but `Contract.lex.tex` does not import them, so they are **not compiled into the holo/WASM guest**. STATUS.md says this is deliberate (importing them pushes the guest compile past the ten-minute limit, LexLean #465).
- No `.holo` or `.wasm` for comms is tracked (only the vendored `Calculator.holo` fixture). No npm package, no JS API.
- `model/ids.toml` registers no messaging capability; STATUS.md: "CONFORMANCE.md claims nothing about messaging". No acceptance vectors for the model.
- DESIGN.md "Not designed yet": "The wire format and the dispatch entry point of the holo."

What exists is pure functions over `Nat`/`Bool`/`List Nat`, all on the branch only:

| Module | Function | Inputs | Output |
|---|---|---|---|
| `Comms/Admission` | `admitted` | claimedKappa, derivedKappa, signatureValid, deviceMaySign, parentsKnown, permitted (0/1 flags supplied by the host) | Bool |
| `Comms/Rules` | `permitted` | action (0 join, 1 leave, 2 invite, 3 kick, 4 ban, 5 unban, 6 send, 7 setPower), senderStatus, senderPower, targetStatus, targetPower, required, open, grantedPower; statuses 0 absent, 1 invited, 2 joined, 3 departed, 4 banned | Bool |
| `Comms/Order` | `precedes`, `same`, `orderingKey` | (rank, kappa) pairs; key = rank * 2^256 + kappa | Bool / Nat |
| `Comms/Resolve` | `merge`, `resolve` | ordering keys (List Nat), seed | Nat (greatest key wins) |
| `Comms/Epoch` | `nextEpoch`, `holdsKey` | joinedAt, leftAt, messageEpoch, historyShared | Nat / Bool |
| `Comms/Sync` | `bytesMove`, `holds`, `wanted` | head addresses; offered and held address lists | Bool / List Nat |
| `Comms/Call` | `step`, `yields` | state 0..4 (idle, calling, ringing, connected, ended), signal 0..4; two offer addresses | Nat / Bool |

How a browser would load it (intended, not built): the template ships a holo with a WASM guest (`coreContract: "hologram:guest/core-wasm@1"`, `site/guest-worker.mjs`, vendored `try/vendor/prism-code`), one bytes-in/bytes-out `dispatch`. The comms holo would follow that shape once an entry point exists.

The one browser surface that is real and on main is the template's Prism ID frame (`frame/frame.mjs`, `identity/prism-id.mjs`, `identity/PROTOCOL.md`): `frame.sign(bytes)`, `verifySession`, `frame.workspaceKey()` (32 bytes sealed to the identity), `frame.appChannel(listen)` -> `{send, stop}` (sealed channel between one identity's own devices), device link/remove/recovery. This is identity plumbing, not messaging between users.

## 3. Matrix concept map

"Rule only" = a proved decision function exists, with nothing that feeds it or acts on it.

| Concept | Status | Backing |
|---|---|---|
| Homeserver | Not needed when serverless (by design); its jobs are reassigned on paper | `docs/DESIGN.md` "Where each server job goes" |
| User ID / identity | Different shape: Prism ID (stitch), self-held, no host part. Real code, but template-level; not wired to comms | `identity/PROTOCOL.md`, `identity/prism-id.mjs` |
| Device | Different shape: Prism ID device log, link by QR + six digits, revoke. Comms takes "device may sign" as a 0/1 input | `identity/PROTOCOL.md`; `Comms/Admission.lex.tex` |
| Room | Missing as a structure. Design: named by the address of its creating event | `docs/DESIGN.md` |
| Event | Missing as a structure (no record type, no canonical bytes). Admission rule only | `Comms/Admission.lex.tex`; DESIGN "How a room works" |
| State event / resolution | Rule only: greatest ordering key wins, order-independent (proved for neighbour swap, reposition, redelivery; permutation statement not a theorem). Nothing builds keys from events | `Comms/Resolve.lex.tex`, `Comms/Order.lex.tex`, `docs/STATUS.md` |
| Sync | Rule only: compare heads, request what is not held. No transport, no reconciliation protocol | `Comms/Sync.lex.tex` |
| Federation | Not needed when serverless; replaced by peer sync, which is not built | `docs/DESIGN.md` |
| Media repository | Missing. Design: content-addressed ciphertext | `docs/DESIGN.md` |
| Push gateway | Missing; "Not solved without an always-on party" | `docs/DESIGN.md` |
| Identity server (3PID lookup) | Missing; MATRIX-MAP says Prism ID "does not supply ... finding other users" | `docs/MATRIX-MAP.md` l.62 |
| Integration manager | Missing, not mentioned in design | - |
| Widgets | Missing, not mentioned in design | - |
| Cross-signing | Different shape: replaced by the Prism ID device log (same-user devices). Verifying another user's identity is "Not designed yet" | `docs/MATRIX-MAP.md` l.61; `docs/DESIGN.md` |
| Key backup / secret storage | Different shape: Prism ID recovery kit + guardians, and `workspaceKey()`. Backup of room keys specifically: missing | `identity/PROTOCOL.md` |
| Olm/Megolm sessions | Missing. Only who-holds-which-epoch-key is modelled; key wrapping to members "Not designed yet"; no cipher chosen | `Comms/Epoch.lex.tex`; `docs/DESIGN.md` |
| Membership / power levels | Rule only, closest to equivalent: 8 actions, 5 statuses, follows room v12 "in substance". No member list derived from events; no knock, no restricted joins, no per-event-type power, no redaction rule | `Comms/Rules.lex.tex`; `docs/STATUS.md` "Not proved" |
| Receipts | Missing (one line: peers announce addresses) | `docs/DESIGN.md` |
| Typing | Missing | same |
| Presence | Missing | - |
| Threads / relations / reactions / edits | Missing | - |
| Spaces | Missing ("Directories are rooms like any other" is the only hint) | `docs/DESIGN.md` |
| Calls / media transport | Rule only for 1:1 signalling state machine and glare. No media transport (no WebRTC/STUN/TURN anywhere in the design or model). Group calls: Phase 3, not designed | `Comms/Call.lex.tex`; `docs/DESIGN.md` |

## 4. Network dependencies

- **In comms itself: none, because no networking exists.** No peer discovery, relay, signalling or bootstrap code. DESIGN assigns transport to "Hologram's sync contract (fetch, announce, discover)" and storage/reconciliation to kappa-registry's model; neither is a dependency in this repo (not in any lock or manifest I found).
- MATRIX-MAP records the gaps in those inputs: Hologram has not shipped "browser peers finding each other without out-of-band exchange or a gateway" nor the encrypted network tier, and its network crate is unpublished; kappa-registry ships as a server with peers configured as HTTP addresses, and `kappa-core` does not build for the browser. So the browser peer-to-peer path does not exist upstream either.
- **Prism ID relay: `https://ntfy.sh`**, hard-coded as `PRISM_RELAY` in `frame/frame.mjs:354` (verified). Used for device linking, device sync, revocation propagation and `appChannel`. It is a single third-party host: if it is down, creating an id and signing still work on one device, but linking, cross-device sync and hearing a device removal do not. It can withhold or delay, not read or forge (per `identity/README.md`; not independently verified). Messages are held 30 minutes.
- Open decision 8 (always-on untrusted peer) is "assumed", not built. Without it the docs concede: no delivery while all devices are offline, no mobile wake, no connection between two peers both behind restrictive networks.

## 5. Hashing and IDs

- **On `main` there is no comms hashing at all.** In the Comms model (branch) no hash is computed: an address ("kappa") is a `Nat` passed in, with `addressBound` = 2^256. BLAKE3 appears only as a stated decision and an assumption ("the host computes it correctly") in `docs/DESIGN.md` and `docs/STATUS.md`.
- **BLAKE3 is not the only hash in the repository.** SHA-256 is used throughout the template layer on main: `app/lexlean.lock` (`project_config_sha256`), `prismpm.lock` and SDK image digests, `template.lock`/`frame.lock`/`standards.lock`, `site/sw.js`, the frame's registry lookup (`frame/frame.mjs:336-338`, `crypto.subtle.digest("SHA-256")`), `try/vendor/prism-code/src/sha256.mjs`, and Prism ID itself (`identity/prism-id.mjs`: SHA-256 digests, HMAC, HKDF, P-256 signatures). BLAKE3 sits alongside it (`try/vendor/prism-code/src/blake3.mjs`, holo fingerprint shown as `blake3:` in the frame).
- Consequence: user and device identifiers come from stitch, which is SHA-256/P-256 based, while event addresses are meant to be BLAKE3. MATRIX-MAP also notes kappa-registry defaults to SHA-256.

## 6. Open questions

1. What is the entry point and wire format: one `dispatch(bytes) -> bytes` holo, or several? What are the request/response encodings for admit, resolve, sync?
2. What are the canonical bytes of an event (fields, encoding, signature placement), and how are rank and `required` power derived from room state?
3. How is the member list / room state built from events? `Rules.permitted` takes statuses and powers as given.
4. Which transport do browser peers use, and how do two browsers find each other with no gateway? Is WebRTC intended, and who signals?
5. Is an always-on peer in scope for v1 (offline delivery, mobile wake, NAT)? Who runs it?
6. Is ntfy.sh staying as the Prism ID relay? Will comms traffic also use it? Is the relay configurable or self-hostable?
7. Encryption: which scheme for room keys (MLS, Megolm-like, sender keys), how an epoch key is wrapped to each member's devices, which cipher, and how another user's Prism ID is verified.
8. Which store runs in the browser, given `kappa-core` does not build there? Hologram's store or kappa-registry's?
9. BLAKE3-only: does that cover Prism ID (currently SHA-256/P-256) and kappa-registry (SHA-256 default), or only event and content addresses?
10. The ban race (concurrent ban vs. event from the banned member): what is the intended outcome and argument?
11. Which Matrix features are in scope and in what order: receipts, typing, presence, threads, reactions, edits, redaction, spaces, media, push, group calls? None has a model today.
12. Call media: what carries audio/video, and is TURN-like relaying accepted?
13. Timeline order for display: resolution ignores timestamps; what orders messages on screen?
14. When does `phase-1-room-core` merge, and when will the modules be split into definitions/proofs so the guest can import them (LexLean #465)?
15. Should Holo Messenger be the host (store, transport, crypto, UI) around this model, or will uor-comms ship that host? DESIGN says "the host ... moves bytes and draws the screen" but no host exists.
16. Does the 46-theorem count and attestation `cdb77bf6...` hold for a078d7f (run in progress), and will the planted-defect check be repeated through this repo's gate?

## Not verified

- CI log contents (theorem count, attestation hash); only run conclusions were read.
- Claims about Hologram, kappa-registry and stitch internals; those repos were not opened here.
- `identity/prism-id.mjs` was sampled (hash/crypto primitives, relay constant), not read in full.
- `docs/MATRIX-MAP.md` was read for its outline and the "Inputs" / "Open decisions" / "Not verified" sections, not line by line.
