# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the client-only Phase 1 rules are done. The interface exists as a prototype on sample data in `client/`; nothing in it is stored, encrypted or sent. An opt-in engine mode runs its rooms on the uor-comms engine, with real messages between browsers (see Engine).

This repository is an instance of `UOR-Foundation/template`. Its Prism application, `Messenger rules`, answers eleven client questions with the rules proved here.

For the engine's state, read uor-comms `docs/STATUS.md`; this repository does not restate it.

## Upstream

uor-comms is the canonical reference; Holo Messenger is a downstream client of it (Ilya, 2026-11-19). Where this repository and uor-comms disagree on the engine's design, phases, behaviour or status, uor-comms is right and this repository is corrected. Read these there, not here:

- `docs/DESIGN.md`: the design and the decisions taken.
- `docs/STATUS.md`: what Lean proved, what is tested, what is not done.
- `docs/MATRIX-MAP.md`: what Matrix specifies and where each server job goes.
- `host/README.md`: the host's calls and what the caller supplies.

This repository owns only the client: the interface in `client/`, the client rules in `app/`, and the inventory of what a person sees and does. Its documents about uor-comms (`docs/inventory/matrix-to-uor-comms-map.md`, `docs/reading/uor-comms-report.md`, and the inventory's "uor-comms need" and "engine standing" columns) are dated snapshots kept for the record. The engine's own phase plan, when uor-comms publishes one, decides when each engine-backed item can be built.

## Engine

The interface can run rooms, membership, sending and the timeline on the uor-comms engine, with real messages between real browsers. It is opt-in: You, Try a situation, "Message real people on the uor-comms engine", `#engine` on the page's address, or opening someone's invite link. Sample mode stays the default. Once turned on, engine mode stays on across reloads and closed tabs until Sample mode turns it off.

Pinned: version `7567d541cf8507dbbddbde51e2860966e545bd224d46858a405445156ddfac35`, published from uor-comms commit `b490e2fa1e53b6ba0975a0ad36a74a83ad0f3ddc` (the merge of uor-comms #21, device trust). Besides the kernel, holo and host files of the previous version it carries `transport.mjs` (WebRTC with ntfy.sh as the rendezvous) and `trust.mjs` (the device book), and its `restore()` admits kept events parents first. The page checked every file and the version itself before pinning. Help and about in the page names the version and commit. The earlier in-tab mode, with sample people as engines in the tab on version `082f1b03`, is still in the page behind `ENGNEXT`: set to null, engine mode returns to it.

How the page loads it, as uor-comms `host/README.md` says: it fetches `manifest.json` and the eight files from `uor-foundation.github.io/uor-comms/engine/<version>/`, checks that the manifest names the pinned version and commit (the commit is the manifest's own claim: the version's BLAKE3 does not cover it), that each file's BLAKE3 is the manifest's, and that the version is the BLAKE3 of the manifest's file list. It imports the seven modules from blobs made of the checked bytes, with their relative imports pointed at the checked siblings' blobs. Only one import form is allowed: a whole line `import { names } from "./sibling.mjs";` naming a sibling already checked. If anything else in a module's text, comments and strings included, reads as an import or a re-export, engine mode does not start; a dynamic import added to `trust.mjs` and re-pinned is refused. It loads `room-kernel.holo` with prism-code's `loadArchive` and requires it to verify. If anything fails, engine mode does not start, the page stays on sample data, and a dialog says what failed. A changed `engine.mjs`, `trust.mjs`, `transport.mjs`, holo or manifest was each refused in the test. The engine files, 180,536 bytes, are fetched only when engine mode starts.

What is real, said on the first start, in About and in the strip at the top: messages go between real browsers. Browsers find each other through ntfy.sh, a public server, on topics made from room and identity addresses, so anyone who has seen a room's address can see when its members connect. Connections use a public STUN server (Google's), and the people you connect to see your network address. There is no relay, so two people both behind strict networks may not connect, and both must be online at the same time. Nothing is encrypted yet; post-quantum encryption is planned. Keys travel in invite links until Prism ID. A message over about 450 bytes cannot be sent yet.

Whose key is whose, as uor-comms `host/README.md` says ("Whose key is whose", decision 19): the page makes one 32-byte identity and one device key (`newDeviceKey`, the private half not exportable) in this browser, opens the device book (`deviceBook`) with them, and passes the book as signer and verdict to both `open` and `webrtcTransport`, with `ntfyRendezvous()`. Invite someone (Start a chat, Show my code, or Share on your own card) shows `book.invite(base)`, a `#uc1.` link and its picture code, and says that whoever has the link can reach you once and that it carries your device key. Opening such a link in engine mode calls `transport.reach(book.accept(link))` and offers "Start a chat with" the inviter, through `findDirect` or `createDirect`; opened outside engine mode, the page explains and offers to turn it on, and accepts it once on, also on a first visit after the welcome steps. The inviter's book learns the invitee's key from the one-time token when they connect. A person whose key the book does not hold cannot be reached or added, and the page says why. People show by the start of their identity: the engine has no names.

On the engine: the chat list, members and roles, creating a group and a direct chat, invite, join, decline and leave, remove, ban, lift a ban, change of role, sending (content version 1), the timeline in the host's order, and receiving. Which controls show is `offered(room, target, { granted })`, asked for 0, 50 and 100, so a role row shows only at a level the engine offers. A refusal shows one plain sentence with the engine's own word, for every reason the host names: `banned`, `closed`, `not joined`, `needs power`, `not allowed`, `unknown action`, `direct`, `unknown room`, `malformed`, `content`, `tampered`, `signature`, `device`, `a direct room names a target`, and the held `parents unknown`. `transport.onStatus` drives the strip, the chat list's engine row and a banner in a chat (offline, looking for people, connected). Sending works with no one connected: the event is signed, stored and announced, one tick shows, and it reaches the others when the browsers next meet.

Known limits of this engine version, found while building and reported to uor-comms: each device has one group room (the create event names only its creator, so a second `createRoom` returns the first room; the page says so and opens it); everyone in a group needs the keys of those who write there, so a member linked only to the creator cannot hold a room where a third person wrote; a person invited while already connected receives the room's earlier events only when the browsers meet again, so the page restarts the transport after such an invitation; a removal or ban is not sent to the person removed.

Kept in this browser, apart from the sample's saved state (the `hm-` keys in localStorage, which engine mode never writes): the engine's `browserStore`, IndexedDB `uor-comms:holo-messenger-device`; the page's IndexedDB `holo-messenger-engine`, holding the identity and device key, the book's saved state, whom to look for after a reload, and room names; and `hm-engine-on` in localStorage. On a reload the page calls `restore()` once, which admits every kept event again, parents first; the page no longer orders them itself. Measured in headless Chromium: `restore()` 5 ms with no messages, about 110 ms with 50, about 2 s with 500, the chats showing about 0.2, 0.2 and 2.1 s after the load began. Most of the 500-message time is the transport's own listener on each admitted event (in Node, 0.43 s without the transport bound against 1.36 s with it). If the store was cleared by the browser, the key is gone, or the kept chats are from the earlier in-tab engine mode, the page shows none of it, says what happened, and offers Start fresh or Sample mode. Sample mode asks first, then deletes the engine databases, the key and the book, and reloads on sample data; Sign out deletes them too.

On the page only, and sample in engine mode: room names, pictures and descriptions, attachments, typing, receipts, unread counts, pins, and edits and reactions. Delete is not offered for a message on the engine: this version refuses redactions.

## What is here

| Path | What it holds |
|---|---|
| `app/src/Messenger/` | Sixteen rule modules and their sixteen `Proofs` modules: Phase 1 client rules that need no engine |
| `app/src/MessengerRules.lex.tex` | The application: one request in, one answer out, with 63 acceptance vectors |
| `client/` | The interface: one static page with no dependencies. See `client/README.md` |
| `features/suites/rules.feature` | The pinned statements for `MR-01` to `MR-08` |
| `docs/phase-1-client-coverage.md` | Which inventory items each definition covers (161 of 171), and why the other ten have no rule |
| `docs/inventory/holo-messenger-inventory.md` | 885 items from Element Web, Element X and Element Call, each with keep, adapt or drop, a phase and an acceptance check |
| `docs/inventory/matrix-to-uor-comms-map.md` | Each Matrix concept and its standing in uor-comms |
| `docs/inventory/sources/` | The per-client inventories and parity passes the merge was built from |
| `docs/reading/` | Reading reports on uor-comms and Hologram |

Everything else is the template: the gate, the page frame and the SDK locks. `AGENTS.md` holds its rules.

## The application

A request is one operation byte followed by that operation's fields, one byte each unless noted.

| Operation | Fields | Answers |
|---|---|---|
| 1 screen | supported, started, has identity, holds lock | loading, onboarding, main, moved, fatal |
| 2 notify | enabled, room mode, mention, viewing, own | none, badge, notify, highlight |
| 3 message action | action, own, status, moderator, failed | offered, hidden |
| 4 link | kind, known, status | home, room, preview, profile, settings |
| 5 Enter | shift, modifier, modifier required, popup open | send, newline, complete |
| 6 link scheme | scheme | opens, blocked |
| 7 panes | width in pixels, two bytes | one, two, three |
| 8 tabs | calls built, spaces built, status built | the tabs shown, in order, from: chats updates spaces calls you |
| 10 main button | has text, voice notes built | send, microphone |
| 11 tick | state, engine knows delivery, engine knows read | none, clock, one, two, accent |
| 12 day label | days ago | today, yesterday, weekday, date |

Operation 9 is not used. Anything else answers `invalid request`.

## What is proved

Lean accepted all 337 theorems and the application module on the hosted LexLean verifier on 2026-11-19, after 86 theorems were added that day for the last client-only Phase 1 items. The tree was sent in nine parts, not as one project, so there are nine attestations and none covers the whole tree. Each part ended in the task state `verified`, and the files on disk are the files of the verified drafts:

| Part | Theorems | Attestation |
|---|---|---|
| `Budget`, `Overlay` | 26 | `02fbe02695be2586be0816a8e09f14501bfce6f12c7e5a8d98246196e4376b75` |
| `Composer`, `RoomList` | 67 | `e599815f2b3112e61fa2b8990f31e4f1f8e6977f85bd9467418ac3e0feae57a6` |
| `Invite`, `Membership`, `Search` | 28 | `764d52a13ddba50d28142c65dd6b8c1a2b909f0d3e361ecb3b16f60b3f0ce840` |
| `Keys`, `Settings` | 38 | `05b424187dd97bf7c111cd6bcdfe1be982c07a3044edabb003c6c3c30db3aeb9` |
| `Layout` | 53 | `14cd9d392afb7af0f3d30c7c74ca875317b8165c50325d1c664f31dbb7dab638` |
| `Menu`, `Navigation`, `Notify` | 34 | `94acfaa0d561fb01b51415607f241187e673e89295475b13982c90ef5e6839ab` |
| `Render`, `Session` | 41 | `d7781dfb8a6ecace641836425551cda168207430e33afdaa759e7b9143d8ca95` |
| `Timeline` | 50 | `c934e31149c6975530958636f1938ee8081cc00840ecac7ceedddf5d2862001c` |
| `MessengerRules` and the eight modules it imports | 0 | `e528e30f715c5b22ad93ee6a81f420a3bb73ac543941aa3c69ec0959fb5bc882` |

The hosted formatter accepts all 33 files as canonical, and the hosted build of the application module succeeds.

The hosted profile supplies its own copy of the two `Foundation` modules and its own module prefix; the files under `app/src/Foundation/` and `app/lexlean.toml` were not sent.

A proof shows a definition has the stated property. It does not show the property is the right behaviour.

The acceptance vectors are tested, not proved, and only when `prismpm verify` runs in the gate on GitHub.

## Known limits

- Thresholds and budgets in the modules are the accepted Phase 1 values (2026-11-18). None is measured in a gate. Against the 150 KB first load, `client/index.html` on 2026-11-19, with engine mode, is 359,554 bytes raw and 115,169 gzipped at level 9, measured by hand; the holo and its loader are not counted, nor the 153,452 bytes of engine files fetched only when engine mode starts.
- The named sizes in `Budget` come from `docs/whatsapp-study.md`, with text sizes divided by the 1.3 text enlargement of the phone measured. The interface carries 15 of the 16 as CSS tokens with the same values, written by hand, not read from the model; `textScaleNoted` has no token.
- Membership status numbers match `Comms.Rules` in uor-comms by inspection; nothing imports that module.
- 10 client-side Phase 1 items have no formal rule: five are fixed content, three are code structure and two wait on the engine. `docs/phase-1-client-coverage.md` gives the reason for each.
- A rule often decides part of an item, not all of it. The new room intro has a rule for its "created" line only, and the list panel has rules for its keys and widths, not for what it remembers.
- The interface follows the 14 rules added on 2026-11-19 through built-in copies of their definitions. A script compared each copy with the definition parsed from its module over 3,825 inputs, with no difference, and the page was driven through each rule's stated cases. The copies themselves are covered by no proof.
- The 86 theorems added on 2026-11-19 have 31 pins in `rules.feature`, under `MR-01`, `MR-05`, `MR-06` and `MR-07`. `cargo test -p repo-conformance` passed with them on 2026-11-19 (contract 8 of 8), run with the GNU build of the pinned Rust version because this machine has no MSVC linker.
- The gate's rule that only Prism is implemented here is relaxed for `client/`, by the owner's decision on 2026-11-18. Code there is not counted by `audit-prism` and is covered by no proof.
- The interface asks the verified holo for nine of its rules (panes, notify, Enter, message actions, link schemes, tabs, send button, ticks, day labels) and compares every answer with a built-in copy it falls back to. Every other rule it follows is a built-in copy of the model's definition, listed under Help and about in the page, and covered by no proof.
- The interface is served at `messenger/` on the Pages site, beside the `Messenger rules` application.
- The application exposes eleven of the rules. The others are proved but not callable.
- `natAt`, the byte reader in the application module, is copied from the uor-comms room kernel.
- Inventory parity calls were made from names and one-line descriptions, and web and mobile rows were paired by name.

## Check and prove

Run from `app/`. Both send the files under `src/` to the hosted verifier, which stores them unlisted, not privately.

```
npx prism-code@latest build --check --hosted
npx prism-code@latest verify --lean --hosted
```

The full gate (`just vv`) runs in the SDK image on GitHub Actions.

## Planted defects

A gate is evidence only after a planted defect shows it can fail (`AGENTS.md`). On 2026-11-19 three defects were planted one at a time in a throwaway checkout of `main` at `7274858`, and each was restored before the next. The tree passed before the first and after the last.

| Gate | Planted defect | Result |
|---|---|---|
| `cargo test -p repo-conformance --test contract` | `noDoubleTickWithoutDelivery` weakened from `3 <=?` to `4 <=?`, which would allow two ticks without delivery | rejected: `rules_mr_08` failed, "noDoubleTickWithoutDelivery in Messenger/TimelineProofs.lex.tex must hold" the registered statement |
| the same test | `tickAnswer` in `MessengerRules.lex.tex` changed to answer a constant | rejected: `rules_mr_08` failed, "tickAnswer in MessengerRules.lex.tex must hold" the registered body |
| `cargo xtask check-model` | `CONFORMANCE.md` edited by hand, "eleven questions" to "seven questions" | rejected: "CONFORMANCE.md is stale: it disagrees with model/ids.toml" |

Not planted: a defect against `prismpm verify` (a false theorem, a wrong acceptance vector), which runs only in the SDK image on GitHub. `VERIFICATION.md` is bound by `template.lock`, so this record is kept here.


## Open decisions

See "Open for Ilya" in the inventory, and the undecided rows in the mapping table.
