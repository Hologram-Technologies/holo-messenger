# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the client-only Phase 1 rules are done. The interface exists as a prototype on sample data in `client/`; nothing in it is stored, encrypted or sent. An opt-in engine mode runs its rooms on the uor-comms engine inside the browser tab (see Engine).

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

The interface can run rooms, membership, sending and the timeline on the uor-comms engine, inside one browser tab, with the sample people. It is opt-in: You, Try a situation, "Run on the uor-comms engine, in this tab", or `#engine` on the page's address for testing. Sample mode stays the default until uor-comms ships a transport. Once turned on, engine mode stays on across reloads and closed tabs, on the chats kept in this browser, until Sample mode turns it off.

Pinned: version `082f1b036feecacba241a7c3c0fc70d027106ece74cc4f976e6cc204caa2a65c`, built from uor-comms commit `4ca4e2c364d33d4d8a6673da7b9230939d41721e` (the merge of uor-comms #18, the browser store, after #16 and #17). It has `offered()` (kernel operation 0f), holds an event whose parents have not arrived (at most 1,000) and refuses a tampered one rather than holding it, the larger content limits, `browserStore(hash, { name })` with `evicted`, and `engine.restore()`. It does not contain uor-comms #19 (named refusal reasons). Help and about in the page names the version and commit.

How the page loads it, as uor-comms `host/README.md` says: it fetches `manifest.json` and the six files from `uor-foundation.github.io/uor-comms/engine/<version>/`, checks that the manifest names the pinned version and commit (the commit is the manifest's own claim: the version's BLAKE3 does not cover it), that each file's BLAKE3 is the manifest's, and that the version is the BLAKE3 of the manifest's file list. It imports the five modules from blobs made of the checked bytes, with their relative imports pointed at the checked siblings' blobs. Only one import form is allowed: a whole line `import { names } from "./sibling.mjs";` naming a sibling already checked. If anything else in a module's text, comments and strings included, reads as an import or a re-export (`import`, `export *`, `export { … } from`, `from "…"`), engine mode does not start. Every bypass the review found (an import with no `from`, one without spaces, one after a comment on the same line), a dynamic import, `export * from`, `export { x } from`, a renamed relative import, a second import on an allowed line and an import inside a string were each re-pinned and refused. It loads `room-kernel.holo` with prism-code's `loadArchive` and requires it to verify. BLAKE3 and `loadArchive` come from the site's own `worker-runtime/`, the copy of prism-code the page already loads its holo with. If anything fails, engine mode does not start, the page stays on sample data, and a dialog says what failed. The engine files, 153,452 bytes, are fetched only when engine mode starts.

On the engine in engine mode: the chat list (`rooms()`), members and roles (`members()`), creating a room and a direct chat (an existing one is reused through the host's `findDirect`), invite, join, decline and leave, remove, ban, lift a ban, change of role, sending (content version 1: text, mentions as identities, the reply, forwarded), the timeline in the host's order, and receiving. Which membership controls show is the engine's `offered(room, target)` (kernel operation 0f, "exactly what the door admits"), read once per room and again when an event lands there: Remove, Ban and Lift the ban on a person's card, Invite to a room on the card, Add people in a room's member list, Invite people in a chat's menu, the rooms and people an invitation offers, and Leave. A direct chat offers no invitation. This version answers set power only for granting power 0, so the role changes show when that is offered and the engine's refusal answers each level. A refusal shows in plain words, one table in the page, with the engine's own word kept in the dialog; this version names `refused`, `direct`, `unknown room`, `malformed` and `a direct room names a target`, so most refusals cannot say which rule refused. The kernel stops on message text over about 450 bytes in this version (uor-comms `docs/STATUS.md`); a message that stops it shows Not sent and says so. The engines are all in the tab, so engine chats send with or without a connection. Each sample person, and you, is a separate engine with its own browser store, a 32-byte identity and device, and a P-256 key pair; the in-tab transport hands each announcement to every other engine, so every event is admitted or refused by each of them. The device verdict answers from a table of the devices made in this browser (not the sample device list in Settings); Prism ID is not wired. The sample people's scripted joins and answers are real events from their engines.

On the page only, and sample in engine mode (About lists them; each is labelled where it shows, unread counts in their accessible name and title): room names, pictures and descriptions (this engine version has no room settings), attachments, typing, receipts, unread counts, pins, and edits and reactions, because uor-comms states no rule for how they combine (`docs/STATUS.md`, "Message content, in full"). Delete is not offered for a message on the engine: this version refuses redactions. Neither Edit nor Delete is offered while a message is still being sent. Engine mode writes none of the sample's saved state.

Kept in this browser, apart from the sample's saved state (the `hm-` keys in localStorage, which engine mode never writes): each engine's `browserStore`, IndexedDB `uor-comms:holo-messenger-<person>` with the store's own marker in localStorage; the page's own IndexedDB `holo-messenger-engine`, holding each person's identity, device and P-256 key pair as CryptoKeys that cannot be exported, and the room names, descriptions and pictures; and `hm-engine-on` in localStorage, which makes a reload resume engine mode. On a reload the page opens every engine on its store and calls `restore()` once each, yours first: the chats show once your engine has admitted every kept event again, and the sample people's engines follow, with any send waiting for them. The page hands `restore()` the kept events each after the events it cites (`engInOrder`), because `browserStore` returns them by address and `restore()` then holds nearly all of them and re-checks every held one after each admission: 500 messages cost about 100,000 signature checks and 30 seconds per engine in Node, against 503 checks and one second in this order. The order decides nothing; `restore()` admits or refuses every event. Measured in headless Chromium, chats shown after the load and check of the engine: 0.2 to 0.3 s with no added messages, 0.6 to 0.9 s with 50, about 1 s with 500 (your engine's restore 16, 78 and 730 ms; the seven sample engines after that 0.1, 0.6 and 5.7 s). "Restoring…" shows when it takes more than 300 ms. If a store was cleared by the browser (`evicted`), or the key database is gone while stores remain, the page shows none of what is left, says what happened, and offers Start fresh or Sample mode. Sample mode asks first, then deletes every engine database and marker and reloads on sample data; Sign out deletes them too. Not kept: messages being sent or not sent, pins, edits and reactions, files, unread counts, and the time of a membership change (it shows the time of the load that restored it). Still not done: transport, Prism ID, encryption, room settings on the engine, attachments, typing and receipts.

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
