# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the client-only Phase 1 rules are done. There is no user interface yet.

This repository is an instance of `UOR-Foundation/template`. Its Prism application, `Messenger rules`, answers seven client questions with the rules proved here.

uor-comms has a room kernel on its main branch that answers six questions about a room. It has no store, transport or encryption a browser can call. Items that need those are named as gaps, not specified here.

## What is here

| Path | What it holds |
|---|---|
| `app/src/Messenger/` | Sixteen rule modules and their sixteen `Proofs` modules: Phase 1 client rules that need no engine |
| `app/src/MessengerRules.lex.tex` | The application: one request in, one answer out, with 31 acceptance vectors |
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

Anything else answers `invalid request`.

## What is proved

Lean accepted all 164 theorems and the application module on the hosted LexLean verifier on 2026-11-18, attestation `6cbfc4a2b2e4941b8044f84a1713879da3e3363c49235b307b79619cf88b09b9`.

A proof shows a definition has the stated property. It does not show the property is the right behaviour.

The acceptance vectors are tested, not proved, and only when `prismpm verify` runs in the gate on GitHub.

## Known limits

- Thresholds and budgets in the modules are the accepted Phase 1 values (2026-11-18). None is measured; the 150 KB first load has no build to test it against.
- Membership status numbers match `Comms.Rules` in uor-comms by inspection; nothing imports that module.
- 35 client-side Phase 1 items have no formal rule; most are frames, text or lists with no decision to state.
- The application exposes seven of the rules. The others are proved but not callable.
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
