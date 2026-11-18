# Holo Messenger

A serverless messenger client with the feature set of Element, built on uor-comms and Prism ID.

## Status

Step 1 (reading, mapping, inventory) and the first client-only rules are done. No application code exists yet.

uor-comms has proved rules but no engine a browser can call. Items that need it are named as gaps, not specified here.

## What is here

| Path | What it holds |
|---|---|
| `app/src/Messenger/` | Ten LexLean modules: Phase 1 client rules that need no engine |
| `docs/phase-1-client-coverage.md` | Which inventory items each definition covers (74 of 171) |
| `docs/inventory/holo-messenger-inventory.md` | 885 items from Element Web, Element X and Element Call, each with keep, adapt or drop, a phase and an acceptance check |
| `docs/inventory/matrix-to-uor-comms-map.md` | Each Matrix concept and its standing in uor-comms |
| `docs/inventory/sources/` | The per-client inventories and parity passes the merge was built from |
| `docs/reading/` | Reading reports on uor-comms and Hologram |

## What is proved

Lean accepted all 79 theorems in the ten modules on the hosted LexLean verifier on 2026-11-18, attestation `c593c546a61ac9e2c15a4fb945b582878929e061aebfbaa2a2037dcc85a1ad9f`.

A proof shows a definition has the stated property. It does not show the property is the right behaviour.

## Known limits

- Thresholds and budgets in the modules are placeholders awaiting a decision.
- States are bare numbers with no legend yet.
- Membership status numbers are not checked against the uor-comms rule.
- 97 client-side Phase 1 items have no formal rule yet.
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
