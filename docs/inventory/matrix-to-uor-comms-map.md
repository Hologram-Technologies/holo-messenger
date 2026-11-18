# Matrix to uor-comms mapping

Sources: uor-comms branch `phase-1-room-core` (read 2026-11-18, unmerged; `main` is the template scaffold) and the Matrix session's answers the same day.
Nothing in uor-comms is callable from a browser yet. "Rule only" means a proved decision over inputs the host must supply.
Standing: Decided = Ilya instructed it. Assumed = the uor-comms session chose it, reversible. Undecided = nobody has.

| Matrix concept Element depends on | uor-comms today | Status | Standing | What the messenger needs before building |
|---|---|---|---|---|
| Homeserver | No server; its jobs reassigned on paper (`docs/DESIGN.md`) | Not needed when serverless | Decided | Nothing; drop every homeserver surface |
| Federation | Replaced by peer sync, not built | Not needed when serverless | Decided | Peer transport (see Sync) |
| User ID | Prism ID, self-held, no host part (`identity/PROTOCOL.md`) | Different shape | Decided | Wiring of Prism ID into comms events |
| Device | Prism ID device log, link by QR and six digits, revoke; comms takes "device may sign" as an input | Different shape | Decided | Same wiring |
| Cross-signing (own devices) | Prism ID device log | Different shape | Decided | - |
| Verifying another user | Not designed | Missing | Undecided | A design; blocks the verification journeys |
| Key backup / secret storage | Prism ID recovery kit, guardians, `workspaceKey()`; room-key backup absent | Different shape, part missing | Undecided | Room-key recovery design |
| Room | No structure; named by address of creating event | Missing | Assumed | Canonical event bytes |
| Event | No record type or canonical bytes; admission rule only (`Comms/Admission`) | Missing (rule only) | Undecided | Wire format and canonical bytes |
| State event and resolution | Greatest ordering key wins, order-independent (`Comms/Resolve`, `Comms/Order`); no fold from events to state | Rule only | Undecided | The event-to-state fold |
| Membership and power levels | 8 actions, 5 statuses (`Comms/Rules`); no knock, restricted join, per-event-type power or redaction rule | Rule only, closest to equivalent | Assumed | Member list derivation; ban race unproved. `Comms/Member` (unmerged, 8 theorems accepted by Lean 2026-11-18 per the Matrix session) gives the status and power an action leaves; the five statuses are not final |
| Sync (and sliding sync) | Compare heads, request what is not held (`Comms/Sync`); no transport or reconciliation | Rule only | Bytes over Hologram's sync contract: Decided. Rest undecided | Browser transport, discovery, signalling |
| Timeline order on screen | Not modelled; order exists for state only | Missing | Undecided | A display order rule |
| Olm/Megolm sessions | Who holds which key epoch (`Comms/Epoch`); no cipher, no wrapping to devices | Missing (rule only) | Undecided | Encryption scheme |
| Media repository | Content-addressed ciphertext, design line only | Missing | Assumed | Store choice (kappa-core does not build in browsers; Hologram has an OPFS store) |
| Push gateway | "Not solved without an always-on party" | Missing | Undecided | Decision on an optional always-on peer |
| Identity server (find people by email or phone) | Prism ID does not supply lookup | Missing | Undecided | Likely drop; invite by link or QR instead |
| Integration manager | Not mentioned | Missing | - | Drop (server-era) |
| Widgets | Not mentioned | Missing | - | Decide keep or drop in inventory |
| Receipts | One design line | Missing | Planned, unconfirmed | uor-comms feature order |
| Typing | - | Missing | Planned, unconfirmed | Same |
| Presence | - | Missing | No slot | Same |
| Relations: replies, edits, reactions, threads | - | Missing | Planned, unconfirmed | Same |
| Redaction | No rule | Missing | No slot | Same |
| Spaces | "Directories are rooms like any other" | Missing | Planned, unconfirmed | Same |
| Account data (favourites, ignore list, notification rules, synced settings, direct-chat list) | One design line: sealed to the Prism ID workspace key. Leaning: a private room per identity. Not modelled | Missing | Assumed in scope; container, device reconciliation and drafts undecided | A per-user synced store; about 45 kept rows wait on it |
| Global profile (name, avatar) | Not in the design. Candidate: a public single-writer room per identity, signed by a device, ordered without timestamps | Missing | Undecided | Where a profile lives; trust reduces to verifying another user's Prism ID |
| 1:1 call signalling | Five-state machine with crossed-call yielding (`Comms/Call`) | Rule only | Assumed | Media transport; relay decision |
| Call media / group calls | Direct WebRTC planned; no relay design; group calls last | Missing | Undecided | Same |

## Conflicts with the brief

- Serverless: Prism ID hard-codes `https://ntfy.sh` (`frame/frame.mjs:354`) for device linking, sync and revocation. Browser peers also need signalling or a gateway; no gateway-free design exists.
- BLAKE3 only: decided for event and content addresses. Prism ID uses SHA-256 and P-256, kappa-registry defaults to SHA-256; neither is changed.
- No duplication: who builds the host (store, transport, crypto) is unassigned.

## Safe to rely on now

The five admission conditions, the permission rule, the strict total order and its key, order-independent resolution, key-epoch access, need-set sync, the call state machine.

## Wait for before specifying against it

Wire format and canonical event bytes; the event-to-state fold; the always-on peer decision; the browser store; the BLAKE3 scope.
