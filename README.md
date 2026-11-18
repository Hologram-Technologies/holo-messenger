# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the first client-only rules are done. No application code exists yet.

uor-comms has proved rules but no engine a browser can call. Items that need it are named as gaps, not specified here.

## What is here

| Path | What it holds |
|---|---|
| `app/src/Messenger/` | Sixteen LexLean modules: Phase 1 client rules that need no engine |
| `docs/phase-1-client-coverage.md` | Which inventory items each definition covers (136 of 171) |
| `docs/inventory/holo-messenger-inventory.md` | 885 items from Element Web, Element X and Element Call, each with keep, adapt or drop, a phase and an acceptance check |
| `docs/inventory/matrix-to-uor-comms-map.md` | Each Matrix concept and its standing in uor-comms |
| `docs/inventory/sources/` | The per-client inventories and parity passes the merge was built from |
| `docs/reading/` | Reading reports on uor-comms and Hologram |

## What is proved

Lean accepted all 164 theorems in the sixteen modules on the hosted LexLean verifier on 2026-11-18, attestation `5c14b53f83259a602b6c3fd85480a5e6fe2e18914cf5ca7e8de9079798b63f2c`.

A proof shows a definition has the stated property. It does not show the property is the right behaviour.

## Known limits

- Thresholds and budgets in the modules are placeholders awaiting a decision.
- Membership status numbers match `Comms.Rules` on the uor-comms `phase-1-room-core` branch by inspection; nothing imports that module yet.
- 35 client-side Phase 1 items have no formal rule; most are frames, text or lists with no decision to state.
- `app/` is a hand-written LexLean project scaffolded by `prism-code init`; `lexlean.toml` still carries the scaffold's project name. How these modules reach a Prism app build is undecided.
- Inventory parity calls were made from names and one-line descriptions, and web and mobile rows were paired by name.

## Check and prove

Run from `app/`. Both send the files under `src/` to the hosted verifier, which stores them unlisted, not privately.

```
npx prism-code@latest build --check --hosted
npx prism-code@latest verify --lean --hosted
```

## Open decisions

See "Open for Ilya" in the inventory, and the undecided rows in the mapping table.
