# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the first client-only rules are done. No application code exists yet.

uor-comms has proved rules and, on its `phase-1-room-core` branch, a room kernel entry point that answers six questions about a room. It has no store, transport or encryption a browser can call. Items that need it are named as gaps, not specified here.

## What is here

| Path | What it holds |
|---|---|
| `app/src/Messenger/` | Sixteen rule modules and their sixteen `Proofs` modules: Phase 1 client rules that need no engine |
| `docs/phase-1-client-coverage.md` | Which inventory items each definition covers (136 of 171) |
| `docs/inventory/holo-messenger-inventory.md` | 885 items from Element Web, Element X and Element Call, each with keep, adapt or drop, a phase and an acceptance check |
| `docs/inventory/matrix-to-uor-comms-map.md` | Each Matrix concept and its standing in uor-comms |
| `docs/inventory/sources/` | The per-client inventories and parity passes the merge was built from |
| `docs/reading/` | Reading reports on uor-comms and Hologram |

## What is proved

Lean accepted all 164 theorems on the hosted LexLean verifier on 2026-11-18, attestation `2be57721564fe4a2fa4b0cc644b60a701f69ba1b7c6c49092b4c63eb27049a60`.

A proof shows a definition has the stated property. It does not show the property is the right behaviour.

## Known limits

- Thresholds and budgets in the modules are the accepted Phase 1 values (2026-11-18). None is measured; the 150 KB first load has no build to test it against.
- Membership status numbers match `Comms.Rules` on the uor-comms `phase-1-room-core` branch by inspection; nothing imports that module yet.
- 35 client-side Phase 1 items have no formal rule; most are frames, text or lists with no decision to state.
- `app/` is a hand-written LexLean project scaffolded by `prism-code init`; `lexlean.toml` still carries the scaffold name. It is not yet an instance of `UOR-Foundation/template`, which is how uor-comms builds hand-written modules, and it has no entry module.
- Inventory parity calls were made from names and one-line descriptions, and web and mobile rows were paired by name.

## Check and prove

Run from `app/`. Both send the files under `src/` to the hosted verifier, which stores them unlisted, not privately.

```
npx prism-code@latest build --check --hosted
npx prism-code@latest verify --lean --hosted
```

## Open decisions

See "Open for Ilya" in the inventory, and the undecided rows in the mapping table.
