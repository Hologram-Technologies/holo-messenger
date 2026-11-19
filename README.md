# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the client-only Phase 1 rules are done. The interface exists as a prototype on sample data in `client/`; nothing in it is stored, encrypted or sent.

This repository is an instance of `UOR-Foundation/template`. Its Prism application, `Messenger rules`, answers eleven client questions with the rules proved here.

uor-comms has a room kernel on its main branch that answers six questions about a room. It has no store, transport or encryption a browser can call. Items that need those are named as gaps, not specified here.

## What is here

| Path | What it holds |
|---|---|
| `app/src/Messenger/` | Sixteen rule modules and their sixteen `Proofs` modules: Phase 1 client rules that need no engine |
| `app/src/MessengerRules.lex.tex` | The application: one request in, one answer out, with 63 acceptance vectors |
| `client/` | The interface: one static page with no dependencies. See `client/README.md` |
| `features/suites/rules.feature` | The pinned statements for `MR-01` to `MR-08` |
| `docs/phase-1-client-coverage.md` | Which inventory items each definition covers (136 of 171) |
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

Lean accepted all 251 theorems and the application module on the hosted LexLean verifier on 2026-11-19. The tree was sent in eight parts, not as one project, so there are eight attestations and none covers the whole tree:

| Part | Theorems | Attestation |
|---|---|---|
| `Budget` | 10 | `7fbeff24f930f16600d707010b9f637e31163fe4f32e85677c003d28482c4b5a` |
| `Overlay` | 16 | `d9242ac3f3f65f364b318fd9ce7ca11926efd83c5a1f0b69815afd18a4b3134c` |
| `RoomList` | 31 | `0e7b36bf97d5a7be43db9a683c8bf7e7a330b88d5d93cb5dfa66189be61c7931` |
| `Layout` | 32 | `6ec55a219a19f45b28bccb3e3ff37f1e613497c1801e33fa01a7743b1bcbe802` |
| `Timeline` | 40 | `379dd8f75dbca22ef10d2f398637efe0e4fe3dba289c88b8a2c32fb885d85b37` |
| `MessengerRules`, `Composer` and the application's other imports | 20 | `9ea14da48b325f11a42c51ad325fbfc0d9e52a4ca59bbce533b084f3a32f5ee8` |
| `Invite`, `Keys`, `Membership`, `Search`, `Settings` | 47 | `f82f56649d4802eaa4d266d7b10cfa63f988c18721879ed953c68be387bc88b6` |
| `Menu`, `Navigation`, `Notify`, `Render`, `Session` | 55 | `82d76935717a98dc6da20478f5f3aa186c18c819b14de64e72d47e7b56fdccbc` |

The hosted profile supplies its own copy of the two `Foundation` modules and its own module prefix; the files under `app/src/Foundation/` and `app/lexlean.toml` were not sent.

A proof shows a definition has the stated property. It does not show the property is the right behaviour.

The acceptance vectors are tested, not proved, and only when `prismpm verify` runs in the gate on GitHub.

## Known limits

- Thresholds and budgets in the modules are the accepted Phase 1 values (2026-11-18). None is measured; the 150 KB first load has no build to test it against.
- The named sizes in `Budget` come from `docs/whatsapp-study.md`, with text sizes divided by the 1.3 text enlargement of the phone measured. The interface does not read them yet, nor the four new operations.
- Membership status numbers match `Comms.Rules` in uor-comms by inspection; nothing imports that module.
- 35 client-side Phase 1 items have no formal rule; most are frames, text or lists with no decision to state.
- The gate's rule that only Prism is implemented here is relaxed for `client/`, by the owner's decision on 2026-11-18. Code there is not counted by `audit-prism` and is covered by no proof.
- The interface asks the verified holo for five of its rules (panes, notify, Enter, message actions, link schemes) and compares every answer with a built-in copy it falls back to. Sort order and the rest are still JavaScript only.
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

## Open decisions

See "Open for Ilya" in the inventory, and the undecided rows in the mapping table.
