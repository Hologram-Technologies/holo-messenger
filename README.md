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

- Thresholds and budgets in the modules are the accepted Phase 1 values (2026-11-18). None is measured in a gate. Against the 150 KB first load, `client/index.html` on 2026-11-19 is 316,806 bytes raw and 101,491 gzipped at level 9, measured by hand; the holo and its loader are not counted.
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
