# Element Web parity decisions

Source: `element-web-inventory.md` (676 rows, element-web at 07fa1225, read 2026-11-18). Same IDs, same order.
Engine facts come from `matrix-to-uor-comms-map.md`. Every parity value is a recommendation for Ilya to overrule.

## Summary

Total: 676 rows. Keep 267, adapt 184, drop 225.

### By domain

| Domain | keep | adapt | drop | total |
|---|---|---|---|---|
| identity and devices | 9 | 18 | 19 | 46 |
| rooms and membership | 19 | 18 | 34 | 71 |
| timeline and events | 55 | 5 | 24 | 84 |
| composer | 34 | 6 | 16 | 56 |
| encryption and verification | 18 | 19 | 16 | 53 |
| media and attachments | 21 | 7 | 11 | 39 |
| spaces | 14 | 8 | 2 | 24 |
| threads | 9 | 0 | 0 | 9 |
| search | 2 | 11 | 6 | 19 |
| notifications | 12 | 3 | 9 | 24 |
| calls | 12 | 11 | 12 | 35 |
| settings | 10 | 25 | 42 | 77 |
| moderation | 16 | 7 | 7 | 30 |
| navigation and layout | 33 | 25 | 8 | 66 |
| onboarding and recovery | 3 | 21 | 19 | 43 |

### By phase

| Phase | keep | adapt | total |
|---|---|---|---|
| 1 | 154 | 97 | 251 |
| 2 | 100 | 76 | 176 |
| 3 | 13 | 11 | 24 |
| dropped | - | - | 225 |

### By kind

| Kind | keep | adapt | drop |
|---|---|---|---|
| Capability | 77 | 54 | 52 |
| Feature | 60 | 33 | 94 |
| Journey | 21 | 25 | 10 |
| Surface | 109 | 72 | 69 |

### By engine standing

| Engine standing | all rows | kept or adapted | of those in Phase 1 |
|---|---|---|---|
| proved rule | 74 | 63 | 26 |
| missing | 191 | 146 | 66 |
| undecided | 101 | 66 | 30 |
| not needed | 310 | 176 | 129 |

Kept or adapted rows by the uor-comms concept they wait on:

| uor-comms need | engine standing | rows | Phase 1 rows |
|---|---|---|---|
| none | not needed | 176 | 129 |
| Membership and power levels | proved rule | 37 | 13 |
| User ID, Device (Prism ID, not wired to comms) | missing | 28 | 10 |
| Relations | missing | 25 | 10 |
| Spaces | missing | 19 | 0 |
| Account data (not in mapping table) | missing | 18 | 8 |
| Event | undecided | 18 | 5 |
| Key backup / secret storage | undecided | 15 | 9 |
| Receipts | missing | 12 | 9 |
| Media repository | missing | 12 | 7 |
| State event and resolution | proved rule | 11 | 6 |
| Verifying another user | undecided | 11 | 8 |
| Olm/Megolm sessions | undecided | 9 | 5 |
| Cross-signing (own devices) (Prism ID, not wired to comms) | missing | 8 | 4 |
| 1:1 call signalling | proved rule | 8 | 0 |
| Sync | proved rule | 7 | 7 |
| Profile (not in mapping table) | missing | 7 | 5 |
| Room | missing | 7 | 6 |
| Call media / group calls | undecided | 7 | 0 |
| Timeline order on screen | undecided | 5 | 3 |
| Redaction | missing | 4 | 3 |
| Typing | missing | 4 | 4 |
| Presence | missing | 2 | 0 |
| Push gateway | undecided | 1 | 0 |

Server-dependent rows (98): drop 74, adapt 24, keep 0.

### How to read the columns

- uor-comms need: the one mapping-table concept that gates the row. "none" means client-only UI.
- Engine standing: proved rule = a proved decision exists but the host must supply its inputs; missing = nothing exists, though a design line or planned slot does; undecided = the design itself is open; not needed = no engine capability is required.
- "Prism ID, not wired to comms": Prism ID supplies it in real code, but uor-comms does not consume it yet.
- Two needs are not in the mapping table and should be added to it: account data (private per-user data synced across own devices: favourites, ignore list, notification rules, settings) and profile (global display name and avatar).
- Labs rows are all dropped: nothing ships behind a flag. Where the feature itself is kept, the reason names the row that carries it.

### The 20 calls to look at

1. Link previews are dropped everywhere (W-CAP-081, W-FEA-036, W-FEA-089, W-FEA-130, W-SUR-055, W-SUR-074). They need a fetching server and leak links; a browser cannot fetch them cross-origin.
2. Server search is dropped; a local index is the only search, on every platform, in Phase 1 (W-CAP-136, W-CAP-137, W-FEA-015, W-FEA-016).
3. Room directory, room addresses, peeking and public rooms are dropped (W-CAP-036, W-CAP-048, W-CAP-061, W-FEA-010, W-FEA-052). Rooms are reached by invite, link or QR only.
4. People search covers known contacts only; user directory and email invites are dropped (W-CAP-062, W-CAP-040, W-JRN-023).
5. Reporting is adapted to go to room moderators, since there are no server admins (W-CAP-056, W-JRN-039, W-SUR-126). This is a new design that uor-comms does not have.
6. Location is static coordinates opened in the device's map app; embedded maps and live location are dropped because map tiles come from a third-party server (W-CAP-106, W-CAP-107, W-FEA-008).
7. Calls: relay is undecided (W-CAP-147), group calls are adapted with no media server (W-CAP-148), and hold, transfer, dial pad, phone network, Jitsi and video rooms are dropped.
8. Widgets, integration manager, stickers, bridges and the module API are dropped in full.
9. The WYSIWYG composer is dropped; Markdown with a format bar ships (W-CAP-098, W-SUR-071).
10. Manual key files and fingerprint verification are dropped; the recovery kit is the only way back (W-CAP-123, W-CAP-119, W-JRN-018).
11. Encryption has no toggle: always on, room state included (W-CAP-051, W-CAP-128, W-FEA-053).
12. Delivery while every device is offline is adapted onto an always-on party that is undecided (W-CAP-126). Notifications to a closed app have no path at all (W-CAP-142 dropped).
13. Presence is adapted to opt-in in Phase 2; the engine has no slot for it (W-CAP-029, W-FEA-062).
14. Account data and global profile are missing from the mapping table, yet kept rows wait on them (see the need table above).
15. Phase conflict in the brief: device verification is Phase 1 but multi-device is Phase 2. Own-device verification (W-CAP-117, W-JRN-009, W-JRN-010) cannot be exercised until device linking (W-CAP-031, W-JRN-008) exists. Either move linking to Phase 1 or verification of own devices to Phase 2.
16. Phase conflict in the brief: "restore identity" and the onboarding recovery offer are Phase 1, "key backup and recovery" is Phase 2. Recovery kit creation and entry are placed in Phase 1 (W-CAP-113, W-CAP-114, W-JRN-012); room-key recovery stays in Phase 2 (W-CAP-115).
17. Developer tools are dropped entirely, view source included (W-FEA-069, W-SUR-128, W-SUR-235 to W-SUR-246).
18. Ask-to-join and space-member access are kept in Phase 2 (W-CAP-037, W-CAP-049, W-SUR-109), but the proved permission rule has no knock or restricted join.
19. Account deactivation becomes revoke-and-wipe, and re-authentication becomes a local confirmation (W-CAP-028, W-CAP-015). Neither was checked against Prism ID's protocol.
20. Appearance is cut to one layout, three themes and the system font: message layouts, custom themes, chat effects, document viewer, desktop shell extras and most display toggles are dropped.

## Rows

| ID | kind | name | domain | uor-comms need | engine standing | parity | reason | phase | acceptance check |
|---|---|---|---|---|---|---|---|---|---|
| W-CAP-001 | Capability | Create engine client and start sync | onboarding and recovery | Sync | proved rule | adapt | Engine is uor-comms; no credentials or homeserver | 1 | Reload restores the session and resumes sync with no user action |
| W-CAP-002 | Capability | Sliding sync mode | navigation and layout | Sync | proved rule | adapt | Need-set sync by address replaces server windows | 1 | Opening the app fetches only addresses not already held |
| W-CAP-003 | Capability | Sync state tracking | navigation and layout | Sync | proved rule | adapt | States describe peer reachability, not a server | 1 | Offline, connecting and synced each show a distinct state |
| W-CAP-004 | Capability | Server discovery | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-CAP-005 | Capability | Password login | onboarding and recovery | Homeserver | not needed | drop | No passwords; Prism ID holds the identity | - | - |
| W-CAP-006 | Capability | SSO and CAS login | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-CAP-007 | Capability | Delegated OAuth login | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-CAP-008 | Capability | Access token refresh and storage | identity and devices | Homeserver | not needed | drop | No tokens; keys stay on the device | - | - |
| W-CAP-009 | Capability | Account registration with staged auth | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Becomes Prism ID creation with no stages | 1 | A new identity is created with no email, phone or password |
| W-CAP-010 | Capability | Guest account | onboarding and recovery | Homeserver | not needed | drop | Guests dropped | - | - |
| W-CAP-011 | Capability | Session restore | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | keep | - | 1 | After reload the same identity and rooms appear; a corrupt store is reported |
| W-CAP-012 | Capability | Single active tab lock | identity and devices | none | not needed | keep | - | 1 | A second tab asks to take over; the first shows a moved notice |
| W-CAP-013 | Capability | Soft logout | identity and devices | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-CAP-014 | Capability | Sign out and wipe | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | No token to invalidate; wipes local keys and store | 1 | After sign-out no keys or messages remain in browser storage |
| W-CAP-015 | Capability | Re-authentication for sensitive actions | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Device-held key confirms; no password or SSO | 2 | A sensitive action requires a fresh local confirmation |
| W-CAP-016 | Capability | List and inspect devices | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | From Prism ID device log; no IP or last seen | 2 | Every linked device is listed with its verification state |
| W-CAP-017 | Capability | Rename device | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | keep | - | 2 | A renamed device shows its new name on the other devices |
| W-CAP-018 | Capability | Sign out other devices | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Becomes Prism ID device revoke | 2 | A revoked device can no longer sign or read new messages |
| W-CAP-019 | Capability | Record device client information | identity and devices | Account data (not in mapping table) | missing | drop | Leaks client details; lean | - | - |
| W-CAP-020 | Capability | Set display name and avatar | identity and devices | Profile (not in mapping table) | missing | keep | - | 1 | A changed name and avatar appear to other members |
| W-CAP-021 | Capability | Extended profile fields | identity and devices | Profile (not in mapping table) | missing | drop | Server feature; lean | - | - |
| W-CAP-022 | Capability | Profile cache and lookup | identity and devices | Profile (not in mapping table) | missing | adapt | Profiles come from shared rooms only | 1 | Names of known members resolve offline from the local store |
| W-CAP-023 | Capability | Add and remove email or phone | identity and devices | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-CAP-024 | Capability | Publish contact address for discovery | identity and devices | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-CAP-025 | Capability | Service terms agreement | identity and devices | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-CAP-026 | Capability | Change password | identity and devices | Homeserver | not needed | drop | No passwords | - | - |
| W-CAP-027 | Capability | Password reset by email | onboarding and recovery | Homeserver | not needed | drop | No passwords | - | - |
| W-CAP-028 | Capability | Deactivate account | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | No account; revoke devices and wipe local data | 2 | After erase the identity cannot sign on any linked device |
| W-CAP-029 | Capability | Presence | identity and devices | Presence | missing | adapt | Peer-announced and opt-in; engine has no presence slot | 2 | Opted-in peers show online; by default nothing is shared |
| W-CAP-030 | Capability | Ignore and unignore users | moderation | Account data (not in mapping table) | missing | keep | - | 2 | An ignored user's messages and invites stay hidden after reload |
| W-CAP-031 | Capability | Sign in a new device by QR | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Becomes Prism ID device link by QR and six digits | 2 | A new device joins the identity after scan and code match |
| W-CAP-032 | Capability | Create room | rooms and membership | Room | missing | adapt | No visibility, address or federation options | 1 | A created room appears in the list and accepts a first message |
| W-CAP-033 | Capability | Start or reuse direct chat | rooms and membership | Room | missing | keep | - | 1 | Starting a chat with a known person reuses the existing one |
| W-CAP-034 | Capability | Local placeholder room | rooms and membership | none | not needed | keep | - | 1 | A placeholder chat becomes a real room on first send |
| W-CAP-035 | Capability | Join room | rooms and membership | Membership and power levels | proved rule | adapt | Join by invite or link; no addresses or routing servers | 1 | Joining an invite adds the member on every peer |
| W-CAP-036 | Capability | Preview room without joining | rooms and membership | Homeserver | not needed | drop | Peeking needs a server | - | - |
| W-CAP-037 | Capability | Ask to join (knock) | rooms and membership | Membership and power levels | proved rule | keep | - | 2 | A request shows pending, then joined after approval |
| W-CAP-038 | Capability | Approve or deny join requests | moderation | Membership and power levels | proved rule | keep | - | 2 | An approver's accept turns the request into membership |
| W-CAP-039 | Capability | Invite users | rooms and membership | Membership and power levels | proved rule | adapt | Invite by Prism ID, link or QR; no email | 1 | The invited person sees the invite; failures are listed per person |
| W-CAP-040 | Capability | Email invites | rooms and membership | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-CAP-041 | Capability | Accept or decline invite | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Accept joins; decline removes the invite from the list |
| W-CAP-042 | Capability | Bulk accept or reject invites | rooms and membership | Membership and power levels | proved rule | drop | Rarely needed; lean | - | - |
| W-CAP-043 | Capability | Invite filtering rules | moderation | Account data (not in mapping table) | missing | adapt | Block-all switch only; rule sets dropped | 2 | With block on, no invite reaches the list |
| W-CAP-044 | Capability | Leave and forget room | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | A left room disappears from the list on all own devices |
| W-CAP-045 | Capability | Tag rooms | navigation and layout | Account data (not in mapping table) | missing | adapt | Favourite only; needs synced private data | 2 | A favourite persists across reload and devices |
| W-CAP-046 | Capability | Mark room read or unread | notifications | Receipts | missing | keep | - | 1 | Mark read clears the badge; mark unread restores it |
| W-CAP-047 | Capability | Edit room name, topic, avatar | rooms and membership | State event and resolution | proved rule | keep | - | 1 | A renamed room shows the new name for every member |
| W-CAP-048 | Capability | Room addresses and directory listing | rooms and membership | Homeserver | not needed | drop | No addresses or directory | - | - |
| W-CAP-049 | Capability | Set who can join | rooms and membership | Membership and power levels | proved rule | adapt | Invite-only and ask-to-join; no public rooms or upgrades | 2 | Changing the access rule changes who can join |
| W-CAP-050 | Capability | Set history visibility and guest access | rooms and membership | Olm/Megolm sessions | undecided | adapt | History sharing only; guests dropped | 2 | A new member sees earlier messages only when sharing is on |
| W-CAP-051 | Capability | Turn on room encryption | encryption and verification | Olm/Megolm sessions | undecided | drop | Always encrypted; no toggle | - | - |
| W-CAP-052 | Capability | Edit roles and permissions | moderation | Membership and power levels | proved rule | adapt | Roles and action levels; no per-event-type power in engine | 2 | Lowering a member's role blocks the restricted action |
| W-CAP-053 | Capability | Remove, ban, unban, mute member | moderation | Membership and power levels | proved rule | keep | - | 2 | A banned member's later events are rejected by every peer |
| W-CAP-054 | Capability | Delete message | moderation | Redaction | missing | keep | - | 1 | A deleted message shows as removed for all members |
| W-CAP-055 | Capability | Bulk delete a user's recent messages | moderation | Redaction | missing | keep | - | 2 | A member's recent messages are removed in one action |
| W-CAP-056 | Capability | Report message or room | moderation | Event | undecided | adapt | No server admins; report goes to room moderators | 2 | Moderators receive the report with a reference to the message |
| W-CAP-057 | Capability | Policy ban lists | moderation | State event and resolution | proved rule | drop | Labs feature; lean | - | - |
| W-CAP-058 | Capability | Hide messages pending moderation | moderation | Relations | missing | drop | Labs feature; lean | - | - |
| W-CAP-059 | Capability | Upgrade room version | rooms and membership | Homeserver | not needed | drop | No room versions | - | - |
| W-CAP-060 | Capability | Follow room replacement | rooms and membership | Homeserver | not needed | drop | No room versions | - | - |
| W-CAP-061 | Capability | Browse public rooms | search | Homeserver | not needed | drop | No public directory | - | - |
| W-CAP-062 | Capability | Search user directory | search | none | not needed | adapt | Searches known contacts only; no directory | 1 | Typing a name lists people from shared rooms |
| W-CAP-063 | Capability | Load member list | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | The member list shows joined and invited people with roles |
| W-CAP-064 | Capability | Exclude service members | rooms and membership | State event and resolution | proved rule | drop | Bots and bridges out of scope | - | - |
| W-CAP-065 | Capability | Convert chat type | rooms and membership | Account data (not in mapping table) | missing | drop | Lean | - | - |
| W-CAP-066 | Capability | Paginated timeline window | timeline and events | Timeline order on screen | undecided | keep | - | 1 | Scrolling up loads older messages with no jump |
| W-CAP-067 | Capability | Send message | composer | Event | undecided | adapt | Text and formatted text; the address is the transaction ID | 1 | Sent text appears within one frame and confirms in place |
| W-CAP-068 | Capability | Pending, failed and resend | timeline and events | Sync | proved rule | keep | - | 1 | An offline send queues then delivers; a failed send offers retry |
| W-CAP-069 | Capability | Edit message | composer | Relations | missing | keep | - | 1 | An edited message shows new text and an edited marker to all |
| W-CAP-070 | Capability | Reply | composer | Relations | missing | keep | - | 1 | A reply shows its quoted parent; tapping it jumps to the original |
| W-CAP-071 | Capability | React | timeline and events | Relations | missing | keep | - | 1 | A reaction count updates for all; a second tap removes it |
| W-CAP-072 | Capability | Read receipts | timeline and events | Receipts | missing | keep | - | 1 | Reader avatars appear under the last message each person read |
| W-CAP-073 | Capability | Read marker | timeline and events | Receipts | missing | keep | - | 1 | The unread line sits at the last read position after reopening |
| W-CAP-074 | Capability | Typing indicators | composer | Typing | missing | keep | - | 1 | Typing in one client shows in another within one second |
| W-CAP-075 | Capability | Group and collapse events | timeline and events | none | not needed | keep | - | 1 | Consecutive membership changes collapse into one expandable row |
| W-CAP-076 | Capability | Decide which events are visible | timeline and events | none | not needed | keep | - | 1 | Deleted and ignored-user events are hidden according to settings |
| W-CAP-077 | Capability | Describe state changes as text | timeline and events | State event and resolution | proved rule | keep | - | 1 | Each state change renders as one readable sentence |
| W-CAP-078 | Capability | Links to rooms, users and messages | navigation and layout | Event | undecided | adapt | Own link format carrying addresses; no routing servers | 2 | Opening a link navigates to the room or message |
| W-CAP-079 | Capability | Mention pills | timeline and events | none | not needed | keep | - | 1 | Mentions render as chips that open the profile |
| W-CAP-080 | Capability | Safe rich text rendering | timeline and events | none | not needed | adapt | Sanitised subset; maths dropped; highlighting lazy-loaded | 1 | Hostile markup renders inert; links and code render |
| W-CAP-081 | Capability | Link previews | timeline and events | Homeserver | not needed | drop | Needs a fetching server; leaks links | - | - |
| W-CAP-082 | Capability | Jump to date | timeline and events | Timeline order on screen | undecided | keep | - | 2 | Picking a date scrolls to the first message of that day |
| W-CAP-083 | Capability | Pin and unpin messages | timeline and events | State event and resolution | proved rule | keep | - | 2 | A pinned message appears in the pin list for all members |
| W-CAP-084 | Capability | Polls | timeline and events | Relations | missing | keep | - | 2 | Votes tally identically on every peer; an ended poll locks |
| W-CAP-085 | Capability | Forward message | timeline and events | Event | undecided | keep | - | 2 | A forwarded copy appears in the chosen room |
| W-CAP-086 | Capability | Edit history | timeline and events | Relations | missing | keep | - | 2 | History lists each version of an edited message in order |
| W-CAP-087 | Capability | Track decryption failures | encryption and verification | Olm/Megolm sessions | undecided | adapt | Classify locally; report to no one | 1 | An undecryptable message states its cause |
| W-CAP-088 | Capability | Screen effects | timeline and events | none | not needed | drop | Decoration; lean | - | - |
| W-CAP-089 | Capability | Last-message preview | navigation and layout | none | not needed | keep | - | 1 | The room list shows the latest message text per room |
| W-CAP-090 | Capability | Unread and highlight state | notifications | Receipts | missing | keep | - | 1 | Badge counts match unread messages; mentions highlight |
| W-CAP-091 | Capability | Export conversation | timeline and events | none | not needed | keep | - | 2 | The export file holds the chosen range in the chosen format |
| W-CAP-092 | Capability | Sent-message history | composer | none | not needed | keep | - | 2 | A key recalls the previously sent text into the composer |
| W-CAP-093 | Capability | Draft persistence | composer | none | not needed | keep | - | 1 | Unsent text survives reload, per room |
| W-CAP-094 | Capability | Structured editor model | composer | none | not needed | keep | - | 1 | Undo restores the prior text and caret position |
| W-CAP-095 | Capability | Markdown and HTML serialisation | composer | none | not needed | adapt | Markdown only; maths dropped | 1 | Markdown input renders as a formatted message |
| W-CAP-096 | Capability | Autocomplete | composer | none | not needed | keep | - | 1 | Typing a trigger character lists matching people or emoji |
| W-CAP-097 | Capability | Slash command engine | composer | none | not needed | adapt | Small command set only | 2 | A valid command runs; an unknown one shows an error |
| W-CAP-098 | Capability | Rich text editing | composer | none | not needed | drop | Markdown with a format bar suffices; lean | - | - |
| W-CAP-099 | Capability | Explicit mentions | composer | Event | undecided | keep | - | 1 | A mentioned user gets a highlight notification |
| W-CAP-100 | Capability | Emoji shortcode and emoticon replacement | composer | none | not needed | keep | - | 2 | A typed shortcode becomes the emoji |
| W-CAP-101 | Capability | Record voice message | media and attachments | Media repository | missing | keep | - | 2 | A recorded clip plays back in another client |
| W-CAP-102 | Capability | Upload files | media and attachments | Media repository | missing | adapt | Encrypted content-addressed blob, deduplicated; no server size cap | 1 | A dropped file uploads with progress and can be cancelled |
| W-CAP-103 | Capability | Download and decrypt media | media and attachments | Media repository | missing | adapt | Fetch by address with streaming verification; no media server | 1 | An image renders progressively; a tampered chunk is rejected |
| W-CAP-104 | Capability | Media visibility rules | media and attachments | none | not needed | keep | - | 2 | Media from strangers stays hidden until tapped |
| W-CAP-105 | Capability | Audio playback management | media and attachments | none | not needed | keep | - | 2 | Only one clip plays at a time |
| W-CAP-106 | Capability | Share static location | media and attachments | Event | undecided | adapt | Coordinates only; no third-party map tiles | 2 | A shared location opens in the device's map app |
| W-CAP-107 | Capability | Share live location | media and attachments | Event | undecided | drop | Labs; needs a tile server and constant updates | - | - |
| W-CAP-108 | Capability | Stickers | media and attachments | Integration manager | missing | drop | Integration manager dropped | - | - |
| W-CAP-109 | Capability | List room files | media and attachments | none | not needed | keep | - | 2 | The files panel lists only the room's attachments |
| W-CAP-110 | Capability | View documents in panel | media and attachments | none | not needed | drop | Heavy viewer; lean | - | - |
| W-CAP-111 | Capability | Initialise encryption engine | encryption and verification | Olm/Megolm sessions | undecided | adapt | uor-comms crypto in a worker; no legacy store | 1 | Start completes crypto setup off the main thread |
| W-CAP-112 | Capability | Create cryptographic identity | encryption and verification | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Prism ID creation replaces cross-signing setup | 1 | First run yields a signing identity with no prompts |
| W-CAP-113 | Capability | Create recovery key and key storage | encryption and verification | Key backup / secret storage | undecided | adapt | Prism ID recovery kit; no server secret storage | 1 | The recovery kit is shown once and can be saved |
| W-CAP-114 | Capability | Unlock secret storage | encryption and verification | Key backup / secret storage | undecided | adapt | Unlocks locally with the recovery kit | 1 | A correct kit restores the identity; a wrong kit is refused |
| W-CAP-115 | Capability | Message key backup | encryption and verification | Key backup / secret storage | undecided | adapt | No server backup; room-key recovery is undesigned | 2 | A new device reads old messages after recovery |
| W-CAP-116 | Capability | Turn key storage off | encryption and verification | Key backup / secret storage | undecided | drop | No server-side storage to turn off | - | - |
| W-CAP-117 | Capability | Verify own device | encryption and verification | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | adapt | Prism ID device link verifies own devices | 1 | A linked device shows as verified on both devices |
| W-CAP-118 | Capability | Verify another user | encryption and verification | Verifying another user | undecided | keep | - | 1 | Both people compare a short code and see a verified badge |
| W-CAP-119 | Capability | Verify device by fingerprint | encryption and verification | User ID, Device (Prism ID, not wired to comms) | missing | drop | Code compare covers it; lean | - | - |
| W-CAP-120 | Capability | Watch device security state | encryption and verification | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | keep | - | 1 | An unverified or unrecovered device raises the matching prompt |
| W-CAP-121 | Capability | Trust indicators | encryption and verification | Verifying another user | undecided | keep | - | 1 | A verified contact shows a distinct badge on messages |
| W-CAP-122 | Capability | Identity change handling | encryption and verification | Verifying another user | undecided | keep | - | 2 | A contact's changed identity raises a warning before sending |
| W-CAP-123 | Capability | Export and import message keys | encryption and verification | Olm/Megolm sessions | undecided | drop | Recovery kit covers it; lean | - | - |
| W-CAP-124 | Capability | Rotate room session | encryption and verification | Olm/Megolm sessions | undecided | drop | Key epoch already rotates on membership change | - | - |
| W-CAP-125 | Capability | Restrict sending to verified devices | encryption and verification | Olm/Megolm sessions | undecided | keep | - | 2 | With the setting on, unverified devices cannot read new messages |
| W-CAP-126 | Capability | Offline device for key receipt | encryption and verification | Push gateway | undecided | adapt | Needs an always-on party; relay undecided | 2 | A message sent while all devices are offline arrives later |
| W-CAP-127 | Capability | Reset cryptographic identity | encryption and verification | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Prism ID guardians or a fresh identity | 2 | A reset identity is flagged to contacts as changed |
| W-CAP-128 | Capability | Encrypted room state | encryption and verification | Olm/Megolm sessions | undecided | adapt | Always on, not opt-in; encrypted before addressing | 1 | A relay cannot read a room's name |
| W-CAP-129 | Capability | Share history with invitee | encryption and verification | Olm/Megolm sessions | undecided | keep | - | 2 | An invitee reads earlier messages only when history is shared |
| W-CAP-130 | Capability | Space tree model | spaces | Spaces | missing | keep | - | 2 | The spaces tree shows nested rooms and sub-spaces |
| W-CAP-131 | Capability | Browse space contents | spaces | Spaces | missing | adapt | From held state only; no server hierarchy endpoint | 2 | A space lists the rooms the member may see, joined or not |
| W-CAP-132 | Capability | Manage space children | spaces | Spaces | missing | keep | - | 2 | An added room appears under the space for members |
| W-CAP-133 | Capability | Space-wide unread state | spaces | Spaces | missing | keep | - | 2 | A space badge equals the sum of its rooms' unread |
| W-CAP-134 | Capability | Thread model | threads | Relations | missing | keep | - | 2 | Replies group under their root with a count |
| W-CAP-135 | Capability | Thread unread tracking | threads | Receipts | missing | keep | - | 2 | An unread thread shows a badge on its root and room |
| W-CAP-136 | Capability | Server message search | search | Homeserver | not needed | drop | A server cannot read content | - | - |
| W-CAP-137 | Capability | Local encrypted search index | search | none | not needed | adapt | Local index in every browser, not desktop only | 1 | Search finds a word in a room while offline |
| W-CAP-138 | Capability | Evaluate notification rules | notifications | none | not needed | adapt | Local rules, small fixed set | 1 | A mention notifies; a muted room stays silent |
| W-CAP-139 | Capability | Manage notification rules | notifications | Account data (not in mapping table) | missing | adapt | Default level, mentions and keywords only | 1 | Changing the default level changes which messages notify |
| W-CAP-140 | Capability | Per-room notification level | notifications | Account data (not in mapping table) | missing | keep | - | 1 | A muted room raises no notification and no count |
| W-CAP-141 | Capability | Show desktop notification | notifications | none | not needed | keep | - | 1 | A background tab shows a system notification that opens the room |
| W-CAP-142 | Capability | Push targets | notifications | Push gateway | undecided | drop | Email targets need a server | - | - |
| W-CAP-143 | Capability | Silence notifications on a device remotely | notifications | Account data (not in mapping table) | missing | drop | Lean | - | - |
| W-CAP-144 | Capability | App badge and title count | notifications | none | not needed | keep | - | 1 | The tab title and app badge show the unread total |
| W-CAP-145 | Capability | Notification history list | notifications | Homeserver | not needed | drop | Server-kept history | - | - |
| W-CAP-146 | Capability | One-to-one WebRTC calls | calls | 1:1 call signalling | proved rule | adapt | Signalling as room events; media peer to peer | 3 | Two browsers complete a voice call in both directions |
| W-CAP-147 | Capability | Relay servers for calls | calls | Call media / group calls | undecided | adapt | Relay undecided | 3 | A call connects across two restrictive networks |
| W-CAP-148 | Capability | Group calls | calls | Call media / group calls | undecided | adapt | An SFU is a server; relay undecided | 3 | Three browsers hold one call |
| W-CAP-149 | Capability | Conference via Jitsi | calls | Widgets | missing | drop | Widgets dropped | - | - |
| W-CAP-150 | Capability | Phone network calls | calls | Homeserver | not needed | drop | Phone network needs a bridge | - | - |
| W-CAP-151 | Capability | Hold, resume and transfer | calls | 1:1 call signalling | proved rule | drop | Legacy telephony; lean | - | - |
| W-CAP-152 | Capability | Screen sharing | calls | Call media / group calls | undecided | keep | - | 3 | A shared screen is visible to the other party |
| W-CAP-153 | Capability | Choose media devices | calls | none | not needed | keep | - | 3 | The chosen microphone and camera are used in the next call |
| W-CAP-154 | Capability | Incoming call ring and decline | calls | 1:1 call signalling | proved rule | keep | - | 3 | An incoming call rings; decline stops ringing for the caller |
| W-CAP-155 | Capability | Host embedded apps (widgets) | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-CAP-156 | Capability | Widget permissions | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-CAP-157 | Capability | Widget layout | navigation and layout | Widgets | missing | drop | Widgets dropped | - | - |
| W-CAP-158 | Capability | Integration manager | settings | Integration manager | missing | drop | Integration manager dropped | - | - |
| W-CAP-159 | Capability | Layered settings | settings | Account data (not in mapping table) | missing | adapt | Device and account levels only | 1 | A changed setting persists after reload |
| W-CAP-160 | Capability | Themes | settings | none | not needed | adapt | Light, dark, high contrast; no custom themes | 1 | The theme follows the system and can be overridden |
| W-CAP-161 | Capability | Font and language | settings | none | not needed | adapt | System font stack and size scaling; languages later | 1 | A font size change scales all text |
| W-CAP-162 | Capability | Deployment configuration | settings | Homeserver | not needed | drop | No deployment config | - | - |
| W-CAP-163 | Capability | Extension modules | settings | none | not needed | drop | Module API out of scope | - | - |
| W-CAP-164 | Capability | Platform abstraction | navigation and layout | none | not needed | adapt | Browser and installed PWA only | 1 | The installed app and a browser tab behave the same |
| W-CAP-165 | Capability | App updates | settings | none | not needed | adapt | Service worker swaps a content-addressed bundle | 1 | A new version activates on next open after verification |
| W-CAP-166 | Capability | Keyboard binding resolution | navigation and layout | none | not needed | keep | - | 1 | Each named action fires from its key on Mac and Windows |
| W-CAP-167 | Capability | Usage analytics and error reports | settings | none | not needed | drop | Brief forbids analytics | - | - |
| W-CAP-168 | Capability | Bug report with logs | settings | none | not needed | adapt | No report endpoint; export a local log file | 2 | The user can save a log file with no secrets in it |
| W-CAP-169 | Capability | Room list model | navigation and layout | none | not needed | keep | - | 1 | The list reorders within one frame when a message arrives |
| W-CAP-170 | Capability | Recently visited rooms | navigation and layout | none | not needed | adapt | Kept locally, not synced | 2 | Recently opened rooms show in the quick switcher |
| W-CAP-171 | Capability | Optimistic setting changes | settings | none | not needed | keep | - | 1 | A failed setting change reverts with a notice |
| W-CAP-172 | Capability | Timeline grouping engine | timeline and events | none | not needed | keep | - | 1 | Grouping produces the same rows after reload |
| W-CAP-173 | Capability | Current room and navigation state | navigation and layout | none | not needed | keep | - | 1 | Back and forward restore the same room and message |
| W-CAP-174 | Capability | Scroll position memory | navigation and layout | none | not needed | keep | - | 1 | Returning to a room restores its scroll position |
| W-CAP-175 | Capability | Window and layout metrics | navigation and layout | none | not needed | keep | - | 1 | The layout switches panes at the defined widths |
| W-CAP-176 | Capability | Store base classes | navigation and layout | none | not needed | keep | - | 1 | All client state resets on sign-out |
| W-CAP-177 | Capability | Persistent widgets | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-CAP-178 | Capability | Widget actions and capabilities catalogue | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-CAP-179 | Capability | Notification level aggregation | notifications | none | not needed | keep | - | 1 | List and total badges agree with per-room state |
| W-CAP-180 | Capability | Right panel state per room | navigation and layout | none | not needed | keep | - | 1 | The right panel reopens on the same card per room |
| W-CAP-181 | Capability | Space bar layout memory | spaces | none | not needed | keep | - | 2 | Expanded spaces stay expanded after reload |
| W-CAP-182 | Capability | Room visibility rules | navigation and layout | none | not needed | keep | - | 1 | Spaces and placeholders never appear as rooms |
| W-CAP-183 | Capability | Setting-change echo context | settings | none | not needed | keep | - | 1 | Each pending change shows saving, then saved or failed |
| W-FEA-001 | Feature | Threads | threads | Relations | missing | keep | - | 2 | A thread opens beside the room and collects its replies |
| W-FEA-002 | Feature | Threads activity centre | threads | Receipts | missing | keep | - | 2 | The button lists rooms with unread threads |
| W-FEA-003 | Feature | Spaces | spaces | Spaces | missing | keep | - | 2 | Rooms grouped in a space appear under it |
| W-FEA-004 | Feature | Built-in pseudo-spaces | spaces | none | not needed | adapt | Home only; video rooms dropped | 2 | Home shows rooms outside any space |
| W-FEA-005 | Feature | Polls | timeline and events | Relations | missing | keep | - | 2 | A poll shows options, a live tally and an ended state |
| W-FEA-006 | Feature | Voice messages | media and attachments | Media repository | missing | keep | - | 2 | A voice clip records, previews and sends |
| W-FEA-007 | Feature | Location sharing | media and attachments | Event | undecided | adapt | Coordinates and external map; no tiles | 2 | A shared location opens in the device's map app |
| W-FEA-008 | Feature | Live location sharing | media and attachments | Event | undecided | drop | Labs; needs a tile server and constant updates | - | - |
| W-FEA-009 | Feature | Pinned messages | timeline and events | State event and resolution | proved rule | keep | - | 2 | The banner cycles through pins above the timeline |
| W-FEA-010 | Feature | Room directory | search | Homeserver | not needed | drop | No public directory | - | - |
| W-FEA-011 | Feature | Roles and permissions | moderation | Membership and power levels | proved rule | adapt | Roles and per-action levels only | 2 | A role change takes effect for the member at once |
| W-FEA-012 | Feature | Member moderation tools | moderation | Membership and power levels | proved rule | keep | - | 2 | Each tool is offered only to roles permitted to use it |
| W-FEA-013 | Feature | Server admin tools | moderation | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-FEA-014 | Feature | Notification rules | notifications | Account data (not in mapping table) | missing | adapt | Default level, mentions, keywords, invites, sound | 1 | Each rule switches its notification on and off |
| W-FEA-015 | Feature | Message search | search | none | not needed | adapt | Local search only | 1 | Search returns matches with context and a jump |
| W-FEA-016 | Feature | Encrypted message search (desktop) | search | none | not needed | adapt | The local index is the only search, on every platform | 1 | Index status and reset are available in settings |
| W-FEA-017 | Feature | Quick switcher (spotlight) | search | none | not needed | adapt | No public rooms or message section | 1 | The switcher finds rooms and people as typed |
| W-FEA-018 | Feature | Export chat | timeline and events | none | not needed | keep | - | 2 | The exported file opens and matches the room |
| W-FEA-019 | Feature | Voice and video calls (1:1 legacy) | calls | 1:1 call signalling | proved rule | adapt | No hold, transfer or dial pad | 3 | A call offers mute, camera and hang up |
| W-FEA-020 | Feature | Group calls (Element Call) | calls | Call media / group calls | undecided | adapt | Relay undecided; no guest link | 3 | A group call is joined from a room through a lobby |
| W-FEA-021 | Feature | Video rooms | calls | Call media / group calls | undecided | drop | Labs; lean | - | - |
| W-FEA-022 | Feature | Widgets | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-FEA-023 | Feature | Sticker picker | media and attachments | Integration manager | missing | drop | Integration manager dropped | - | - |
| W-FEA-024 | Feature | Bridges view | rooms and membership | Homeserver | not needed | drop | Bridges dropped | - | - |
| W-FEA-025 | Feature | Reactions | timeline and events | Relations | missing | keep | - | 1 | Quick reactions and the full picker both add a reaction |
| W-FEA-026 | Feature | Replies | timeline and events | Relations | missing | keep | - | 1 | A quoted reply expands and jumps to the original |
| W-FEA-027 | Feature | Message editing | composer | Relations | missing | keep | - | 1 | Own messages can be edited; the marker opens history |
| W-FEA-028 | Feature | Message deletion | moderation | Redaction | missing | keep | - | 1 | Own messages delete; moderators can delete others' |
| W-FEA-029 | Feature | Read receipts and markers | timeline and events | Receipts | missing | keep | - | 1 | Reader avatars and the unread line both show |
| W-FEA-030 | Feature | Typing notifications | composer | Typing | missing | keep | - | 1 | Names of people typing show under the timeline |
| W-FEA-031 | Feature | Mentions and pills | composer | Event | undecided | keep | - | 1 | A mention chip renders and highlights the mentioned user |
| W-FEA-032 | Feature | Emoji picker | composer | none | not needed | keep | - | 1 | The picker searches and shows recents and skin tones |
| W-FEA-033 | Feature | Formatting | composer | none | not needed | adapt | Markdown with a format bar; no WYSIWYG | 1 | Selected text can be made bold from the bar |
| W-FEA-034 | Feature | Code blocks | timeline and events | none | not needed | adapt | Highlighting lazy-loaded to protect first load | 2 | A code block highlights and copies |
| W-FEA-035 | Feature | Spoilers | timeline and events | none | not needed | keep | - | 2 | A spoiler stays hidden until tapped |
| W-FEA-036 | Feature | Link previews | timeline and events | Homeserver | not needed | drop | Needs a fetching server; leaks links | - | - |
| W-FEA-037 | Feature | File and media sharing | media and attachments | Media repository | missing | keep | - | 1 | Image, video, audio and file each send and render inline |
| W-FEA-038 | Feature | Image viewer | media and attachments | none | not needed | keep | - | 1 | The viewer zooms, rotates and downloads |
| W-FEA-039 | Feature | Files list | media and attachments | none | not needed | keep | - | 2 | The panel lists the room's files newest first |
| W-FEA-040 | Feature | Document viewer | media and attachments | none | not needed | drop | Heavy viewer; lean | - | - |
| W-FEA-041 | Feature | Forwarding | timeline and events | Event | undecided | keep | - | 2 | A message can be sent on to chosen rooms |
| W-FEA-042 | Feature | Share links and QR | navigation and layout | Event | undecided | adapt | Own links and QR; no social buttons | 2 | A QR scanned on a phone opens the same room |
| W-FEA-043 | Feature | Chat effects | timeline and events | none | not needed | drop | Decoration; lean | - | - |
| W-FEA-044 | Feature | Message layouts | settings | none | not needed | drop | One layout; lean | - | - |
| W-FEA-045 | Feature | Room list filters and sort | navigation and layout | none | not needed | adapt | Unread, people, rooms, favourites, invites | 1 | Each filter chip narrows the list |
| W-FEA-046 | Feature | Room list sections | navigation and layout | Account data (not in mapping table) | missing | adapt | Favourites, people, rooms; no custom sections | 2 | Sections collapse and remember their state |
| W-FEA-047 | Feature | Favourites and low priority | navigation and layout | Account data (not in mapping table) | missing | adapt | Favourites only; needs synced private data | 2 | A favourite room pins to the top |
| W-FEA-048 | Feature | Message previews in room list | navigation and layout | none | not needed | keep | - | 1 | The last message shows under the room name |
| W-FEA-049 | Feature | Direct chats | rooms and membership | Room | missing | keep | - | 1 | A new chat with a person opens an encrypted direct chat |
| W-FEA-050 | Feature | Ask to join | rooms and membership | Membership and power levels | proved rule | keep | - | 2 | A non-member can request access and be approved |
| W-FEA-051 | Feature | Room previews | rooms and membership | Membership and power levels | proved rule | adapt | Invite data only; no public peeking | 2 | An invite shows name, inviter and member count before joining |
| W-FEA-052 | Feature | Room addresses | rooms and membership | Homeserver | not needed | drop | No addresses | - | - |
| W-FEA-053 | Feature | Encryption by default | encryption and verification | Olm/Megolm sessions | undecided | adapt | Always on; no opt-out | 1 | No room can send unencrypted content |
| W-FEA-054 | Feature | Verification | encryption and verification | Verifying another user | undecided | keep | - | 1 | Code compare or QR marks devices and people verified |
| W-FEA-055 | Feature | Recovery | encryption and verification | Key backup / secret storage | undecided | adapt | Prism ID recovery kit | 1 | The kit restores the identity on a fresh browser |
| W-FEA-056 | Feature | Session manager | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | From Prism ID device log | 2 | The device list filters by verified and unverified |
| W-FEA-057 | Feature | Link a new device by QR | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Prism ID device link | 2 | Settings shows a QR that links a second device |
| W-FEA-058 | Feature | Ignore list | moderation | Account data (not in mapping table) | missing | keep | - | 2 | The ignored users list can be edited |
| W-FEA-059 | Feature | Invite controls | moderation | Account data (not in mapping table) | missing | keep | - | 2 | The block-all-invites switch works |
| W-FEA-060 | Feature | Media preview controls | media and attachments | none | not needed | keep | - | 2 | Media is hidden by default in invites and from strangers |
| W-FEA-061 | Feature | User status and timezone | identity and devices | Profile (not in mapping table) | missing | drop | Lean | - | - |
| W-FEA-062 | Feature | Presence indicators | identity and devices | Presence | missing | adapt | Opt-in; engine has no presence slot | 2 | An online dot shows only for opted-in peers |
| W-FEA-063 | Feature | Custom home page and welcome | onboarding and recovery | Homeserver | not needed | drop | No deployment pages | - | - |
| W-FEA-064 | Feature | Themes and custom themes | settings | none | not needed | adapt | No custom or admin themes | 1 | Light, dark, high contrast and system match all work |
| W-FEA-065 | Feature | Keyboard shortcuts | navigation and layout | none | not needed | keep | - | 1 | Every listed shortcut performs its action |
| W-FEA-066 | Feature | Landmark navigation | navigation and layout | none | not needed | keep | - | 1 | The landmark key cycles focus through regions |
| W-FEA-067 | Feature | Release announcements | navigation and layout | none | not needed | drop | Lean | - | - |
| W-FEA-068 | Feature | Feedback and bug report | settings | none | not needed | adapt | No endpoint; local log export | 2 | The user can save a log file with no secrets in it |
| W-FEA-069 | Feature | Developer tools | settings | none | not needed | drop | Costs bundle size; lean | - | - |
| W-FEA-070 | Feature | Desktop shell extras | settings | none | not needed | drop | Browser and PWA only | - | - |
| W-FEA-071 | Feature | Mobile guide | onboarding and recovery | none | not needed | drop | This app is the mobile app | - | - |
| W-FEA-072 | Feature | Labs: video rooms (beta) | calls | Call media / group calls | undecided | drop | No labs flags; video rooms dropped | - | - |
| W-FEA-073 | Feature | Labs: new notification settings (beta) | notifications | none | not needed | drop | No labs flags; one notifications page ships | - | - |
| W-FEA-074 | Feature | Labs: hide messages pending moderation | moderation | Relations | missing | drop | No labs flags; feature dropped | - | - |
| W-FEA-075 | Feature | Labs: maths rendering | timeline and events | none | not needed | drop | No labs flags; maths dropped | - | - |
| W-FEA-076 | Feature | Labs: rich text composer | composer | none | not needed | drop | No labs flags; WYSIWYG dropped | - | - |
| W-FEA-077 | Feature | Labs: policy lists | moderation | State event and resolution | proved rule | drop | No labs flags; policy lists dropped | - | - |
| W-FEA-078 | Feature | Labs: exclude insecure devices | encryption and verification | Olm/Megolm sessions | undecided | drop | No labs flags; behaviour covered by W-CAP-125 | - | - |
| W-FEA-079 | Feature | Labs: bridge info | rooms and membership | Homeserver | not needed | drop | Bridges dropped | - | - |
| W-FEA-080 | Feature | Labs: jump to date | timeline and events | Timeline order on screen | undecided | drop | No labs flags; jump to date ships as W-CAP-082 | - | - |
| W-FEA-081 | Feature | Labs: sliding sync | navigation and layout | Homeserver | not needed | drop | No labs flags; sync is need-set by address | - | - |
| W-FEA-082 | Feature | Labs: group-call video rooms | calls | Call media / group calls | undecided | drop | No labs flags; video rooms dropped | - | - |
| W-FEA-083 | Feature | Labs: native call component | calls | Call media / group calls | undecided | drop | No labs flags; one call view ships | - | - |
| W-FEA-084 | Feature | Labs: call slots | calls | Call media / group calls | undecided | drop | No labs flags | - | - |
| W-FEA-085 | Feature | Labs: live location sharing | media and attachments | Event | undecided | drop | No labs flags; live location dropped | - | - |
| W-FEA-086 | Feature | Labs: image reactions | timeline and events | Relations | missing | drop | No labs flags; lean | - | - |
| W-FEA-087 | Feature | Labs: new timeline | timeline and events | none | not needed | drop | No labs flags; one timeline ships | - | - |
| W-FEA-088 | Feature | Labs: QR sign-in (config only) | onboarding and recovery | Homeserver | not needed | drop | No labs flags; device link is W-CAP-031 | - | - |
| W-FEA-089 | Feature | Labs: bundled link previews | timeline and events | Event | undecided | drop | Browser cannot fetch previews cross-origin | - | - |
| W-FEA-090 | Feature | Labs: ask to join | rooms and membership | Membership and power levels | proved rule | drop | No labs flags; ask-to-join ships as W-CAP-037 | - | - |
| W-FEA-091 | Feature | Labs: notifications panel | notifications | Homeserver | not needed | drop | Server-kept history | - | - |
| W-FEA-092 | Feature | Labs: encrypted room state | encryption and verification | Olm/Megolm sessions | undecided | drop | No labs flags; state is always encrypted | - | - |
| W-FEA-093 | Feature | Labs: user status | identity and devices | Profile (not in mapping table) | missing | drop | Status dropped | - | - |
| W-FEA-094 | Feature | Labs: message retention | timeline and events | Homeserver | not needed | drop | Retention needs server enforcement | - | - |
| W-FEA-095 | Feature | Labs: hide bold unread (hidden flag) | notifications | none | not needed | drop | Legacy flag | - | - |
| W-FEA-096 | Feature | Labs: legacy sliding sync (hidden flag) | navigation and layout | Homeserver | not needed | drop | Legacy flag | - | - |
| W-FEA-097 | Feature | Setting: font size and custom size | settings | none | not needed | keep | - | 1 | Size steps scale all text |
| W-FEA-098 | Feature | Setting: system font and emoji font | settings | none | not needed | drop | System font stack only | - | - |
| W-FEA-099 | Feature | Setting: theme and match system | settings | none | not needed | keep | - | 1 | The theme choice persists and can follow the system |
| W-FEA-100 | Feature | Setting: layout and compact | settings | none | not needed | drop | One layout; lean | - | - |
| W-FEA-101 | Feature | Setting: image size | settings | none | not needed | drop | Lean | - | - |
| W-FEA-102 | Feature | Setting: language | settings | none | not needed | adapt | English first; strings externalised from the start | 2 | Switching language changes every label |
| W-FEA-103 | Feature | Setting: emoji suggestions | composer | none | not needed | keep | - | 2 | Emoji suggestions can be switched off |
| W-FEA-104 | Feature | Setting: sticker button | composer | Integration manager | missing | drop | Stickers dropped | - | - |
| W-FEA-105 | Feature | Setting: poll button | composer | none | not needed | drop | Poll sits in the attach menu; no toggle | - | - |
| W-FEA-106 | Feature | Setting: colon after mention | composer | none | not needed | drop | Lean | - | - |
| W-FEA-107 | Feature | Setting: modifier+Enter to send | composer | none | not needed | keep | - | 1 | With the setting on, Enter adds a line and the modifier sends |
| W-FEA-108 | Feature | Setting: surround selection | composer | none | not needed | drop | Lean | - | - |
| W-FEA-109 | Feature | Setting: auto-replace emoticons | composer | none | not needed | keep | - | 2 | Emoticon replacement can be switched off |
| W-FEA-110 | Feature | Setting: Markdown on or off | composer | none | not needed | drop | Markdown always on | - | - |
| W-FEA-111 | Feature | Setting: autocomplete delay | composer | none | not needed | drop | Lean | - | - |
| W-FEA-112 | Feature | Setting: unread emphasis | notifications | none | not needed | drop | One unread model; lean | - | - |
| W-FEA-113 | Feature | Setting: show deleted placeholder | timeline and events | none | not needed | drop | Placeholder always shown; lean | - | - |
| W-FEA-114 | Feature | Setting: show joins and leaves | timeline and events | none | not needed | keep | - | 2 | Membership rows can be hidden |
| W-FEA-115 | Feature | Setting: show avatar and name changes | timeline and events | none | not needed | drop | Folded into W-FEA-114 | - | - |
| W-FEA-116 | Feature | Setting: show read receipts | timeline and events | Receipts | missing | keep | - | 1 | Others' receipts can be hidden |
| W-FEA-117 | Feature | Setting: send read receipts | timeline and events | Receipts | missing | keep | - | 1 | With sending off, no receipt leaves the device |
| W-FEA-118 | Feature | Setting: typing notifications | composer | Typing | missing | keep | - | 1 | With sending off, no typing signal leaves the device |
| W-FEA-119 | Feature | Setting: timestamps | timeline and events | none | not needed | keep | - | 1 | Clock format and always-show timestamps both apply |
| W-FEA-120 | Feature | Setting: timezone | identity and devices | Profile (not in mapping table) | missing | drop | Lean | - | - |
| W-FEA-121 | Feature | Setting: autoplay | media and attachments | none | not needed | keep | - | 2 | With autoplay off, animations play only on tap |
| W-FEA-122 | Feature | Setting: code blocks | timeline and events | none | not needed | drop | Lean | - | - |
| W-FEA-123 | Feature | Setting: jump to bottom on send | timeline and events | none | not needed | drop | Always jumps; lean | - | - |
| W-FEA-124 | Feature | Setting: avatars in mentions | timeline and events | none | not needed | drop | Lean | - | - |
| W-FEA-125 | Feature | Setting: big emoji | timeline and events | none | not needed | drop | Lean | - | - |
| W-FEA-126 | Feature | Setting: find shortcut opens search | search | none | not needed | drop | Shortcut always opens search; no toggle | - | - |
| W-FEA-127 | Feature | Setting: chat effects | timeline and events | none | not needed | drop | Effects dropped | - | - |
| W-FEA-128 | Feature | Setting: current profiles only | timeline and events | none | not needed | drop | Lean | - | - |
| W-FEA-129 | Feature | Setting: read marker timing | timeline and events | none | not needed | drop | Lean | - | - |
| W-FEA-130 | Feature | Setting: link previews | timeline and events | Homeserver | not needed | drop | Link previews dropped | - | - |
| W-FEA-131 | Feature | Setting: explicit content in directory | search | Homeserver | not needed | drop | No directory | - | - |
| W-FEA-132 | Feature | Setting: prompt before inviting unknown IDs | rooms and membership | none | not needed | drop | Lean | - | - |
| W-FEA-133 | Feature | Setting: desktop notifications | notifications | none | not needed | keep | - | 1 | Notifications, message text and sound each toggle |
| W-FEA-134 | Feature | Setting: custom notification sound | notifications | Media repository | missing | drop | Lean | - | - |
| W-FEA-135 | Feature | Setting: mirror local video | calls | none | not needed | keep | - | 3 | Own camera preview can be mirrored |
| W-FEA-136 | Feature | Setting: legacy calls and peer-to-peer | calls | 1:1 call signalling | proved rule | drop | One call path; no legacy toggle | - | - |
| W-FEA-137 | Feature | Setting: fallback call relay | calls | Call media / group calls | undecided | adapt | Relay undecided | 3 | Relay use is the user's explicit choice |
| W-FEA-138 | Feature | Setting: audio and video devices | calls | none | not needed | keep | - | 3 | Selected devices are used and remembered |
| W-FEA-139 | Feature | Setting: analytics and session details | settings | none | not needed | drop | No analytics; no client details recorded | - | - |
| W-FEA-140 | Feature | Setting: never send to unverified devices | encryption and verification | Olm/Megolm sessions | undecided | keep | - | 2 | The setting applies globally and per room |
| W-FEA-141 | Feature | Setting: message search index | search | none | not needed | adapt | Index always on; reset only | 1 | Resetting the index rebuilds search |
| W-FEA-142 | Feature | Setting: room list | navigation and layout | none | not needed | adapt | Previews and sort only | 1 | Previews and sort order can be changed |
| W-FEA-143 | Feature | Setting: home shows all rooms | spaces | none | not needed | keep | - | 2 | Home can list every room or only rooms outside spaces |
| W-FEA-144 | Feature | Setting: show people in space | spaces | none | not needed | drop | Lean | - | - |
| W-FEA-145 | Feature | Setting: integration manager on or off | settings | Integration manager | missing | drop | Integration manager dropped | - | - |
| W-FEA-146 | Feature | Setting: widget permissions memory | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-FEA-147 | Feature | Setting: developer mode and hidden events | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-FEA-148 | Feature | Setting: desktop options | settings | none | not needed | drop | Browser and PWA only | - | - |
| W-FEA-149 | Feature | Setting: spellcheck | settings | none | not needed | drop | Browser spellcheck is used as is | - | - |
| W-FEA-150 | Feature | Deployment switches (UI features) | settings | Homeserver | not needed | drop | No deployment config | - | - |
| W-FEA-151 | Feature | Slash: /spoiler | composer | none | not needed | keep | - | 2 | The command sends the message as a spoiler |
| W-FEA-152 | Feature | Slash: /shrug /tableflip /unflip /lenny | composer | none | not needed | drop | Lean | - | - |
| W-FEA-153 | Feature | Slash: /plain | composer | none | not needed | drop | Lean | - | - |
| W-FEA-154 | Feature | Slash: /html | composer | none | not needed | drop | Raw markup is a risk; lean | - | - |
| W-FEA-155 | Feature | Slash: /me | composer | Event | undecided | keep | - | 2 | The command sends an action message |
| W-FEA-156 | Feature | Slash: /rainbow /rainbowme | composer | none | not needed | drop | Lean | - | - |
| W-FEA-157 | Feature | Slash: effect commands | composer | none | not needed | drop | Effects dropped | - | - |
| W-FEA-158 | Feature | Slash: /jumptodate | timeline and events | Timeline order on screen | undecided | keep | - | 2 | The command jumps to the given date |
| W-FEA-159 | Feature | Slash: /nick /myroomnick | identity and devices | Profile (not in mapping table) | missing | keep | - | 2 | The command changes the display name |
| W-FEA-160 | Feature | Slash: /myavatar /myroomavatar /roomavatar | identity and devices | Profile (not in mapping table) | missing | drop | Settings cover it; lean | - | - |
| W-FEA-161 | Feature | Slash: /topic /roomname | rooms and membership | State event and resolution | proved rule | keep | - | 2 | The command shows or sets the topic and name |
| W-FEA-162 | Feature | Slash: /invite | rooms and membership | Membership and power levels | proved rule | adapt | By Prism ID only | 2 | The command invites the named person |
| W-FEA-163 | Feature | Slash: /join /goto | rooms and membership | Membership and power levels | proved rule | adapt | By link only; no addresses | 2 | The command opens the linked room |
| W-FEA-164 | Feature | Slash: /part | rooms and membership | Membership and power levels | proved rule | keep | - | 2 | The command leaves the room |
| W-FEA-165 | Feature | Slash: /remove (kick) /ban /unban | moderation | Membership and power levels | proved rule | keep | - | 2 | The command sanctions the member with a reason |
| W-FEA-166 | Feature | Slash: /op /deop | moderation | Membership and power levels | proved rule | keep | - | 2 | The command sets or resets a member's role |
| W-FEA-167 | Feature | Slash: /ignore /unignore | moderation | Account data (not in mapping table) | missing | keep | - | 2 | The command ignores or restores a user |
| W-FEA-168 | Feature | Slash: /upgraderoom | rooms and membership | Homeserver | not needed | drop | No room versions | - | - |
| W-FEA-169 | Feature | Slash: /addwidget | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-FEA-170 | Feature | Slash: /verify | encryption and verification | User ID, Device (Prism ID, not wired to comms) | missing | drop | Fingerprint verification dropped | - | - |
| W-FEA-171 | Feature | Slash: /discardsession | encryption and verification | Olm/Megolm sessions | undecided | drop | Session rotation is automatic | - | - |
| W-FEA-172 | Feature | Slash: /query /msg | rooms and membership | Room | missing | keep | - | 2 | The command opens a direct chat and may send a message |
| W-FEA-173 | Feature | Slash: /whois | identity and devices | none | not needed | keep | - | 2 | The command opens the person's profile |
| W-FEA-174 | Feature | Slash: /status | identity and devices | Profile (not in mapping table) | missing | drop | Status dropped | - | - |
| W-FEA-175 | Feature | Slash: /holdcall /unholdcall | calls | 1:1 call signalling | proved rule | drop | Hold dropped | - | - |
| W-FEA-176 | Feature | Slash: /converttodm /converttoroom | rooms and membership | Account data (not in mapping table) | missing | drop | Lean | - | - |
| W-FEA-177 | Feature | Slash: /devtools /help /rageshake | settings | none | not needed | adapt | Help only; no developer tools or bug report | 2 | The command lists the available commands |
| W-FEA-178 | Feature | Setting: media and invite configuration objects | settings | Account data (not in mapping table) | missing | adapt | Backing data for kept controls only | 2 | Media and invite choices persist across devices |
| W-FEA-179 | Feature | Setting: ban list subscriptions | moderation | State event and resolution | proved rule | drop | Policy lists dropped | - | - |
| W-FEA-180 | Feature | Setting: audio processing | calls | none | not needed | keep | - | 3 | Gain, echo and noise options each apply to the call |
| W-FEA-181 | Feature | Setting: room list display | navigation and layout | none | not needed | adapt | Same as W-FEA-142 | 1 | Previews and sort order can be changed |
| W-FEA-182 | Feature | Setting: desktop options (keys) | settings | none | not needed | drop | Browser and PWA only | - | - |
| W-FEA-183 | Feature | Internal state: recents | navigation and layout | none | not needed | adapt | Kept locally, not synced; no directory choice | 1 | Recent rooms, emoji and searches persist after reload |
| W-FEA-184 | Feature | Internal state: room list layout | navigation and layout | none | not needed | keep | - | 1 | Sort, panel size and filter persist after reload |
| W-FEA-185 | Feature | Internal state: panels and viewers | navigation and layout | none | not needed | keep | - | 1 | Panel history persists per room after reload |
| W-FEA-186 | Feature | Internal state: legacy and config-only keys | settings | none | not needed | drop | Legacy keys | - | - |
| W-FEA-187 | Feature | Developer debug switches | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-JRN-001 | Journey | First launch | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | No config or server; restore or create identity | 1 | A cold start reaches the chat list or onboarding in under 1 s |
| W-JRN-002 | Journey | Register | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Create a Prism ID; no server, password or stages | 1 | First run reaches a first message in under 60 s |
| W-JRN-003 | Journey | First-time encryption setup after register | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Keys made silently; recovery offered once | 1 | Onboarding offers recovery once and it can be skipped |
| W-JRN-004 | Journey | Sign in with password | onboarding and recovery | Key backup / secret storage | undecided | adapt | Becomes restore identity from recovery kit | 1 | Kit entry restores the identity; a wrong kit shows an error |
| W-JRN-005 | Journey | Sign in with SSO or OAuth | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-JRN-006 | Journey | Choose a different server | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-JRN-007 | Journey | Second-device sign-in and verification | onboarding and recovery | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | adapt | Link via Prism ID, then verify or use the kit | 2 | A new device ends verified or is clearly marked limited |
| W-JRN-008 | Journey | Link new device by QR | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Prism ID link by QR and six digits | 2 | Both devices confirm the code; a mismatch aborts |
| W-JRN-009 | Journey | Verify own session by emoji | encryption and verification | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | keep | - | 1 | Both devices show the same code and confirm |
| W-JRN-010 | Journey | Verify own session by QR | encryption and verification | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | keep | - | 1 | A scan completes verification; a cancel shows on both |
| W-JRN-011 | Journey | Verify another person | encryption and verification | Verifying another user | undecided | keep | - | 1 | Both people see verified; a mismatch cancels on both |
| W-JRN-012 | Journey | Set up recovery | onboarding and recovery | Key backup / secret storage | undecided | adapt | Prism ID kit; offered once in onboarding | 1 | The kit must be re-entered to confirm it was saved |
| W-JRN-013 | Journey | Change recovery key | onboarding and recovery | Key backup / secret storage | undecided | adapt | Prism ID kit | 2 | The old kit stops working after the change |
| W-JRN-014 | Journey | Enter recovery key when out of sync | onboarding and recovery | Key backup / secret storage | undecided | adapt | A device missing secrets asks for the kit | 2 | A correct kit clears the out-of-sync state |
| W-JRN-015 | Journey | Reset identity | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Guardians or a fresh identity; contacts are warned | 2 | Reset warns of lost history before it proceeds |
| W-JRN-016 | Journey | Restore message history from backup | onboarding and recovery | Key backup / secret storage | undecided | adapt | Room-key recovery is undesigned | 2 | Progress shows; old messages decrypt afterwards |
| W-JRN-017 | Journey | Turn key storage on or off | encryption and verification | Key backup / secret storage | undecided | drop | No server key storage | - | - |
| W-JRN-018 | Journey | Export and import keys manually | encryption and verification | Olm/Megolm sessions | undecided | drop | Recovery kit covers it | - | - |
| W-JRN-019 | Journey | Forgot password | onboarding and recovery | Homeserver | not needed | drop | No passwords | - | - |
| W-JRN-020 | Journey | Sign out | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Warns when no recovery kit is saved | 1 | Sign-out with no kit shows a blocking warning |
| W-JRN-021 | Journey | Soft logout and return | identity and devices | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-JRN-022 | Journey | Session opened in another tab | identity and devices | none | not needed | keep | - | 1 | A second tab takes over; the first shows a moved screen |
| W-JRN-023 | Journey | Start a direct chat | rooms and membership | Room | missing | adapt | Known contacts, link or QR; no directory or email | 1 | Picking a person opens a chat ready to type |
| W-JRN-024 | Journey | Create a room | rooms and membership | Room | missing | adapt | Name and access; always encrypted; no address | 1 | The room is created and opened |
| W-JRN-025 | Journey | Invite people to a room | rooms and membership | Membership and power levels | proved rule | adapt | By Prism ID, link or QR | 1 | Progress shows; partial failures are listed |
| W-JRN-026 | Journey | Receive and answer an invite | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | An invite shows a badge; accept and decline both work |
| W-JRN-027 | Journey | Join a public room | rooms and membership | Membership and power levels | proved rule | adapt | By link or QR only; no directory | 2 | Opening a room link previews, then joins |
| W-JRN-028 | Journey | Ask to join and wait | rooms and membership | Membership and power levels | proved rule | keep | - | 2 | A request waits, can be cancelled, and joins on approval |
| W-JRN-029 | Journey | Join through an email invite link | rooms and membership | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-JRN-030 | Journey | Leave a room | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | A last-admin warning shows before leaving |
| W-JRN-031 | Journey | Leave a space | spaces | Spaces | missing | keep | - | 2 | The user picks which contained rooms to leave |
| W-JRN-032 | Journey | Send a message | composer | Event | undecided | keep | - | 1 | Echo, sent and read states appear in order; failure offers retry |
| W-JRN-033 | Journey | Send a file or image | media and attachments | Media repository | missing | keep | - | 1 | Confirm, progress, cancel and failure states each show |
| W-JRN-034 | Journey | Record and send a voice message | media and attachments | Media repository | missing | keep | - | 2 | Record, review, then send or delete; no-microphone error shows |
| W-JRN-035 | Journey | Edit or delete own message | composer | Relations | missing | keep | - | 1 | Edit saves or cancels inline; delete asks for a reason |
| W-JRN-036 | Journey | Reply in thread | threads | Relations | missing | keep | - | 2 | A thread started from a message appears in the thread list |
| W-JRN-037 | Journey | Create and run a poll | timeline and events | Relations | missing | keep | - | 2 | Members vote; the creator ends the poll |
| W-JRN-038 | Journey | Share location | media and attachments | Event | undecided | adapt | Static position or pin only; no tiles | 2 | Permission is asked; the position is sent |
| W-JRN-039 | Journey | Report content | moderation | Event | undecided | adapt | Report to room moderators; no server admins | 2 | A report is sent; the sender can be ignored |
| W-JRN-040 | Journey | Moderate a member | moderation | Membership and power levels | proved rule | keep | - | 2 | A sanction with a reason applies; lack of permission shows |
| W-JRN-041 | Journey | Place a 1:1 call | calls | 1:1 call signalling | proved rule | adapt | No hold or dial pad | 3 | Ringing, connected and ended states each show |
| W-JRN-042 | Journey | Receive a call | calls | 1:1 call signalling | proved rule | keep | - | 3 | A toast rings with accept and decline; a missed call is recorded |
| W-JRN-043 | Journey | Join a group call | calls | Call media / group calls | undecided | adapt | Relay undecided | 3 | Lobby, joined and left states each show |
| W-JRN-044 | Journey | Create a space | spaces | Spaces | missing | adapt | Private spaces only; no address | 2 | A space is created with starter rooms |
| W-JRN-045 | Journey | Add rooms to a space | spaces | Spaces | missing | keep | - | 2 | New and existing rooms can be added with progress |
| W-JRN-046 | Journey | Search messages | search | none | not needed | adapt | Local search | 1 | Results page; a result jumps to the message |
| W-JRN-047 | Journey | Change notification level for a room | notifications | Account data (not in mapping table) | missing | keep | - | 1 | A level change applies at once and reverts on failure |
| W-JRN-048 | Journey | Enable desktop notifications | notifications | none | not needed | keep | - | 1 | Permission is asked; a denial is explained |
| W-JRN-049 | Journey | Sign out another device | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Prism ID revoke with local confirmation | 2 | The other device is signed out |
| W-JRN-050 | Journey | Add an email address | identity and devices | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-JRN-051 | Journey | Deactivate account | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Revoke devices and wipe; no server account | 2 | Consequences are shown; the identity is unusable afterwards |
| W-JRN-052 | Journey | Upgrade a room | rooms and membership | Homeserver | not needed | drop | No room versions | - | - |
| W-JRN-053 | Journey | Export a chat | timeline and events | none | not needed | keep | - | 2 | Options, progress, stop and done states each show |
| W-JRN-054 | Journey | Lose and regain connection | navigation and layout | Sync | proved rule | adapt | Peers go unreachable, not a server | 1 | An offline banner shows; queued messages send on return |
| W-JRN-055 | Journey | Add a widget and grant permissions | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-JRN-056 | Journey | Contact identity changed | encryption and verification | Verifying another user | undecided | keep | - | 2 | A banner warns; the user accepts or withdraws verification |
| W-SUR-001 | Surface | App root and view switcher | navigation and layout | none | not needed | adapt | No login, register or password states | 1 | The root shows loading, onboarding or main only |
| W-SUR-002 | Surface | Loading and splash screens | onboarding and recovery | none | not needed | adapt | No server sync to wait for | 1 | A warm start shows the spinner for under 1 s |
| W-SUR-003 | Surface | Fatal error page | onboarding and recovery | none | not needed | keep | - | 1 | An unsupported browser gets a clear page with retry |
| W-SUR-004 | Surface | Welcome page | onboarding and recovery | none | not needed | adapt | One create-or-restore entry; no guests | 1 | The first screen offers create and restore |
| W-SUR-005 | Surface | Auth page frame | onboarding and recovery | none | not needed | adapt | Onboarding frame; no server row | 1 | Onboarding screens share one frame |
| W-SUR-006 | Surface | Login screen | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-007 | Surface | Registration screen | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-008 | Surface | Staged auth step views | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-009 | Surface | Forgot password screens | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-010 | Surface | Complete security screen | onboarding and recovery | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | adapt | Verify with a device or the kit after linking | 2 | Intro, busy, done and skipped states each show |
| W-SUR-011 | Surface | Encryption setup after registration | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Identity creation, not key upload | 1 | Progress shows; an error offers retry |
| W-SUR-012 | Surface | Soft logout screen | identity and devices | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-013 | Surface | Session lock screens | identity and devices | none | not needed | keep | - | 1 | Take-over confirm and moved screens both show |
| W-SUR-014 | Surface | Unsupported legacy encryption screen | encryption and verification | Olm/Megolm sessions | undecided | drop | No legacy store exists | - | - |
| W-SUR-015 | Surface | QR sign-in flow view | onboarding and recovery | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Prism ID link flow | 2 | Code, waiting, confirm, done and failed states each show |
| W-SUR-016 | Surface | Main layout | navigation and layout | none | not needed | adapt | Three panes desktop, two tablet, one mobile | 1 | The layout holds from 320 px to ultrawide with no sideways scroll |
| W-SUR-017 | Surface | Left panel | navigation and layout | none | not needed | keep | - | 1 | The panel collapses and restores |
| W-SUR-018 | Surface | Space bar | spaces | Spaces | missing | keep | - | 2 | The bar lists home, spaces and create |
| W-SUR-019 | Surface | User menu | navigation and layout | none | not needed | adapt | No status or feedback entries | 1 | The menu opens profile, theme, settings and sign out |
| W-SUR-020 | Surface | Status editor and icon | identity and devices | Profile (not in mapping table) | missing | drop | Status dropped | - | - |
| W-SUR-021 | Surface | Quick settings popover | settings | none | not needed | drop | Settings are one step away; lean | - | - |
| W-SUR-022 | Surface | Room list search bar | search | none | not needed | adapt | Search only; no explore or dial pad | 1 | The bar opens the quick switcher |
| W-SUR-023 | Surface | Room list header | navigation and layout | none | not needed | adapt | New chat, new room, sort and filter | 1 | The header menu offers those four actions |
| W-SUR-024 | Surface | Room list | navigation and layout | none | not needed | keep | - | 1 | The list scrolls at 60 fps; loading and empty states show |
| W-SUR-025 | Surface | Room list item | navigation and layout | none | not needed | keep | - | 1 | Each item shows avatar, name, preview and badge |
| W-SUR-026 | Surface | Room list section header | navigation and layout | none | not needed | keep | - | 2 | A header collapses its section and shows a rolled-up badge |
| W-SUR-027 | Surface | Create and remove section dialogs | navigation and layout | Account data (not in mapping table) | missing | drop | No custom sections | - | - |
| W-SUR-028 | Surface | Room list toast | navigation and layout | none | not needed | drop | Lean | - | - |
| W-SUR-029 | Surface | Home page | navigation and layout | none | not needed | adapt | Minimal landing | 1 | With no room selected, start-chat and create-room shortcuts show |
| W-SUR-030 | Surface | User view | identity and devices | Profile (not in mapping table) | missing | keep | - | 2 | A person link opens their profile view |
| W-SUR-031 | Surface | Room view | timeline and events | Timeline order on screen | undecided | keep | - | 1 | Loading, invite, joined and error states each render |
| W-SUR-032 | Surface | Room header | navigation and layout | none | not needed | adapt | No address or widget buttons; call buttons in Phase 3 | 1 | The header shows avatar, name, members and search |
| W-SUR-033 | Surface | Timeline | timeline and events | Timeline order on screen | undecided | keep | - | 1 | The timeline scrolls at 60 fps through 100k messages |
| W-SUR-034 | Surface | Event tile | timeline and events | Event | undecided | keep | - | 1 | A message shows sender, time, body, reactions and receipts |
| W-SUR-035 | Surface | Message action bar | timeline and events | none | not needed | keep | - | 1 | Hover or long-press shows react, reply, edit and more |
| W-SUR-036 | Surface | Message context menu | timeline and events | none | not needed | adapt | No view source or social share | 1 | The menu lists only actions the user may take |
| W-SUR-037 | Surface | Text message body | timeline and events | none | not needed | adapt | No maths | 1 | Links, chips, code and the edited marker render |
| W-SUR-038 | Surface | Image, video, file and audio bodies | media and attachments | Media repository | missing | keep | - | 1 | Placeholder, loaded, hidden and error states each show |
| W-SUR-039 | Surface | Voice message body | media and attachments | Media repository | missing | keep | - | 2 | Play, waveform and clock show; an error state shows |
| W-SUR-040 | Surface | Sticker body | media and attachments | Integration manager | missing | drop | Stickers dropped | - | - |
| W-SUR-041 | Surface | Location body and map dialog | media and attachments | Event | undecided | adapt | No embedded map | 2 | A location row opens the device's map app |
| W-SUR-042 | Surface | Live location body, dialog and warnings | media and attachments | Event | undecided | drop | Live location dropped | - | - |
| W-SUR-043 | Surface | Poll body | timeline and events | Relations | missing | keep | - | 2 | Question, options, bars, total and ended state show |
| W-SUR-044 | Surface | Undecryptable, hidden, redacted and error bodies | timeline and events | Olm/Megolm sessions | undecided | keep | - | 1 | Each placeholder states why the message cannot be shown |
| W-SUR-045 | Surface | Blocked-by-policy body | moderation | State event and resolution | proved rule | drop | Policy lists dropped | - | - |
| W-SUR-046 | Surface | State and system event tiles | timeline and events | State event and resolution | proved rule | keep | - | 1 | State changes show as text rows |
| W-SUR-047 | Surface | Call event tiles | calls | 1:1 call signalling | proved rule | keep | - | 3 | Ongoing, ended and missed call tiles show |
| W-SUR-048 | Surface | Event summaries | timeline and events | none | not needed | keep | - | 1 | Collapsed runs expand on tap |
| W-SUR-049 | Surface | New room intro | timeline and events | none | not needed | keep | - | 1 | An empty room shows who created it and an invite prompt |
| W-SUR-050 | Surface | Date separator | timeline and events | none | not needed | keep | - | 1 | A day header separates each day |
| W-SUR-051 | Surface | Reply chain and reply preview | timeline and events | Relations | missing | keep | - | 1 | The quoted parent expands; a preview sits above the composer |
| W-SUR-052 | Surface | Reactions row and picker | timeline and events | Relations | missing | keep | - | 1 | Chips show counts; the picker adds a reaction |
| W-SUR-053 | Surface | Read receipts group | timeline and events | Receipts | missing | keep | - | 1 | Stacked avatars show an overflow count and a list |
| W-SUR-054 | Surface | Thread summary on message | threads | Relations | missing | keep | - | 2 | Reply count and last replier open the thread |
| W-SUR-055 | Surface | Link preview group | timeline and events | Homeserver | not needed | drop | Link previews dropped | - | - |
| W-SUR-056 | Surface | Jump to bottom and unread bars | timeline and events | Receipts | missing | keep | - | 1 | The button returns to latest; the bar jumps to first unread |
| W-SUR-057 | Surface | Pinned message banner | timeline and events | State event and resolution | proved rule | keep | - | 2 | The banner cycles pins and opens the list |
| W-SUR-058 | Surface | Room status bar | timeline and events | Sync | proved rule | adapt | No consent or server-limit notices | 1 | Connection lost and unsent states show with retry and delete |
| W-SUR-059 | Surface | Upload bar | media and attachments | Media repository | missing | keep | - | 1 | Name, progress, remaining count and cancel show |
| W-SUR-060 | Surface | File drop target | media and attachments | none | not needed | keep | - | 1 | Dragging a file over the room shows the drop overlay |
| W-SUR-061 | Surface | Typing indicator row | composer | Typing | missing | keep | - | 1 | Avatars and names of people typing show |
| W-SUR-062 | Surface | Room preview bar | rooms and membership | Membership and power levels | proved rule | adapt | Invite states only; no peek or email variants | 1 | Invite, joining, rejected and error states each show |
| W-SUR-063 | Surface | Room preview card | rooms and membership | Spaces | missing | adapt | Spaces only; video rooms dropped | 2 | The card shows avatar, topic, members and join |
| W-SUR-064 | Surface | Join requests bar | moderation | Membership and power levels | proved rule | keep | - | 2 | Pending requests show with approve and deny |
| W-SUR-065 | Surface | Room upgrade bar | rooms and membership | Homeserver | not needed | drop | No room versions | - | - |
| W-SUR-066 | Surface | Identity warning banner | encryption and verification | Verifying another user | undecided | keep | - | 2 | The banner shows above the composer when an identity changed |
| W-SUR-067 | Surface | Widget drawer and tiles | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-068 | Surface | Widget context menu | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-069 | Surface | Message composer | composer | none | not needed | adapt | No sticker button; voice, poll, location arrive in Phase 2 | 1 | Input, emoji, attach and send work; no-permission state shows |
| W-SUR-070 | Surface | Plain composer editor | composer | none | not needed | keep | - | 1 | Chips, suggestions and the format bar work in the editor |
| W-SUR-071 | Surface | Rich text composer | composer | none | not needed | drop | WYSIWYG dropped | - | - |
| W-SUR-072 | Surface | Edit composer | composer | Relations | missing | keep | - | 1 | The message turns into an editor with save and cancel |
| W-SUR-073 | Surface | Autocomplete popup | composer | none | not needed | keep | - | 1 | Suggestions group by kind and follow the arrow keys |
| W-SUR-074 | Surface | Composer link preview | composer | Homeserver | not needed | drop | Link previews dropped | - | - |
| W-SUR-075 | Surface | Voice recorder tile | media and attachments | Media repository | missing | keep | - | 2 | Waveform, timer, stop, delete and playback show |
| W-SUR-076 | Surface | Emoji picker | composer | none | not needed | keep | - | 1 | Search, categories, recents and skin tone work |
| W-SUR-077 | Surface | Sticker picker popover | media and attachments | Integration manager | missing | drop | Integration manager dropped | - | - |
| W-SUR-078 | Surface | Poll create dialog | timeline and events | Relations | missing | keep | - | 2 | Options can be added and removed before posting |
| W-SUR-079 | Surface | Location share menu and picker | media and attachments | Event | undecided | adapt | Own position or pin; no live option, no tiles | 2 | The menu sends the chosen position |
| W-SUR-080 | Surface | Right panel container | navigation and layout | none | not needed | keep | - | 1 | The panel keeps a history stack per room |
| W-SUR-081 | Surface | Room info card | rooms and membership | State event and resolution | proved rule | adapt | No address or extensions links | 1 | The card shows name, topic, members, files and settings links |
| W-SUR-082 | Surface | Member list | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Joined and invited lists show counts and filter by search |
| W-SUR-083 | Surface | Member tile | rooms and membership | Membership and power levels | proved rule | adapt | No email-invite or presence variants | 1 | A tile shows avatar, name, role and trust icon |
| W-SUR-084 | Surface | User info card | identity and devices | Profile (not in mapping table) | missing | adapt | No timezone, status or admin tools | 1 | The card offers message, mention, verify, ignore and moderation |
| W-SUR-085 | Surface | Email invitee card | rooms and membership | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-SUR-086 | Surface | Encryption and verification card | encryption and verification | Verifying another user | undecided | keep | - | 1 | Waiting, compare, verified and cancelled steps each show |
| W-SUR-087 | Surface | Thread list panel | threads | Relations | missing | keep | - | 2 | All and mine filters work; the empty state explains threads |
| W-SUR-088 | Surface | Thread view | threads | Relations | missing | keep | - | 2 | Root, replies and a composer show in the thread |
| W-SUR-089 | Surface | Pinned messages card | timeline and events | State event and resolution | proved rule | keep | - | 2 | Each pin can be viewed, unpinned or forwarded |
| W-SUR-090 | Surface | Files card | media and attachments | none | not needed | keep | - | 2 | The files list shows; the empty state shows |
| W-SUR-091 | Surface | Notifications card | notifications | Homeserver | not needed | drop | Server-kept history | - | - |
| W-SUR-092 | Surface | Extensions card | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-093 | Surface | Widget card | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-094 | Surface | Chat side card | calls | none | not needed | keep | - | 3 | Chat shows beside a full-screen call |
| W-SUR-095 | Surface | Document viewer card | media and attachments | none | not needed | drop | Document viewer dropped | - | - |
| W-SUR-096 | Surface | Right panel empty state | navigation and layout | none | not needed | keep | - | 1 | Empty cards share one placeholder |
| W-SUR-097 | Surface | Room search view | search | none | not needed | adapt | Local results only | 1 | Searching, none and results states each show |
| W-SUR-098 | Surface | Quick switcher dialog | search | none | not needed | adapt | No public rooms or spaces chips | 1 | Recents show first; typing filters rooms and people |
| W-SUR-099 | Surface | Space home view | spaces | Spaces | missing | keep | - | 2 | The space landing shows header, invite and contents |
| W-SUR-100 | Surface | Space hierarchy browser | spaces | Spaces | missing | adapt | From held state only | 2 | The tree searches, joins and removes rooms |
| W-SUR-101 | Surface | Space create menu | spaces | Spaces | missing | adapt | No address | 2 | Name, avatar and description create a space |
| W-SUR-102 | Surface | Space context menu | spaces | Spaces | missing | keep | - | 2 | The menu offers invite, add, settings and leave |
| W-SUR-103 | Surface | Space settings dialog | spaces | Spaces | missing | adapt | General and roles tabs only | 2 | Space name and roles can be changed |
| W-SUR-104 | Surface | Space preferences dialog | spaces | none | not needed | drop | Lean | - | - |
| W-SUR-105 | Surface | Add existing rooms and sub-spaces dialogs | spaces | Spaces | missing | keep | - | 2 | Rooms are picked and added with progress and retry |
| W-SUR-106 | Surface | Create sub-space dialog | spaces | Spaces | missing | adapt | No address | 2 | Name and access create a sub-space |
| W-SUR-107 | Surface | Leave space dialog | spaces | Spaces | missing | keep | - | 2 | The dialog lists rooms to leave with the space |
| W-SUR-108 | Surface | Space share prompt | spaces | Spaces | missing | adapt | Invite link only; private spaces | 2 | The prompt copies an invite link |
| W-SUR-109 | Surface | Restricted access dialog | rooms and membership | Membership and power levels | proved rule | keep | - | 2 | Chosen spaces grant access to the room |
| W-SUR-110 | Surface | Threads activity popover | threads | Receipts | missing | keep | - | 2 | The popover lists rooms with unread threads or an empty state |
| W-SUR-111 | Surface | Room context menu | navigation and layout | none | not needed | adapt | No low priority or developer entries | 1 | The menu offers read, favourite, invite, settings and leave |
| W-SUR-112 | Surface | Room notification menu | notifications | Account data (not in mapping table) | missing | keep | - | 1 | Default, all, mentions and mute are offered |
| W-SUR-113 | Surface | Generic menus and base | navigation and layout | none | not needed | keep | - | 1 | Menus open, trap focus and close by keyboard |
| W-SUR-114 | Surface | Create room dialog | rooms and membership | Room | missing | adapt | Name, topic, access; no encryption toggle or address | 1 | The dialog validates and creates the room |
| W-SUR-115 | Surface | Invite and new-chat dialog | rooms and membership | Membership and power levels | proved rule | adapt | No email or directory | 1 | The picker adds people as chips and sends invites |
| W-SUR-116 | Surface | Invite progress and invite-anyway dialogs | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Progress shows; failures list with a proceed choice |
| W-SUR-117 | Surface | Unknown identity warning dialog | encryption and verification | Verifying another user | undecided | drop | Every Prism ID has keys | - | - |
| W-SUR-118 | Surface | Decline and block dialog | moderation | Membership and power levels | proved rule | adapt | Decline and ignore; no server report | 2 | Decline with ignore hides the inviter |
| W-SUR-119 | Surface | Forward dialog | timeline and events | none | not needed | keep | - | 2 | Each target shows sending, sent or failed |
| W-SUR-120 | Surface | Share dialog | navigation and layout | none | not needed | adapt | Link and QR; no social targets | 2 | The dialog copies a link and shows a QR |
| W-SUR-121 | Surface | Export dialog | timeline and events | none | not needed | keep | - | 2 | Options, progress, cancel-confirm and done show |
| W-SUR-122 | Surface | Upload confirm and failure dialogs | media and attachments | Media repository | missing | keep | - | 1 | Each file previews before upload; upload-all works |
| W-SUR-123 | Surface | Image viewer overlay | media and attachments | none | not needed | keep | - | 1 | Zoom, rotate, download and sender details work |
| W-SUR-124 | Surface | Delete message dialogs | moderation | Redaction | missing | keep | - | 1 | The dialog asks for a reason and confirms |
| W-SUR-125 | Surface | Member action confirm dialogs | moderation | Membership and power levels | proved rule | keep | - | 2 | The dialog asks for a reason and confirms the sanction |
| W-SUR-126 | Surface | Report message and report room dialogs | moderation | Event | undecided | adapt | Report to room moderators | 2 | The dialog takes a reason and an ignore option |
| W-SUR-127 | Surface | Edit history dialog | timeline and events | Relations | missing | keep | - | 2 | Versions list in order with differences |
| W-SUR-128 | Surface | View source | timeline and events | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-129 | Surface | End poll and unpin all dialogs | timeline and events | none | not needed | keep | - | 2 | Ending a poll and removing all pins both confirm first |
| W-SUR-130 | Surface | Poll history dialog | timeline and events | Relations | missing | keep | - | 2 | Active and past polls list with load more |
| W-SUR-131 | Surface | Room upgrade dialogs | rooms and membership | Homeserver | not needed | drop | No room versions | - | - |
| W-SUR-132 | Surface | Room topic dialog | rooms and membership | State event and resolution | proved rule | keep | - | 1 | The full topic shows with an edit link |
| W-SUR-133 | Surface | Slash command help dialog | composer | none | not needed | adapt | Small command set | 2 | The dialog lists the available commands |
| W-SUR-134 | Surface | Server picker dialog | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-135 | Surface | Email prompt at registration | onboarding and recovery | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-136 | Surface | Set email dialog | identity and devices | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-SUR-137 | Surface | Terms dialog | identity and devices | Identity server | undecided | drop | Identity server; no email or phone | - | - |
| W-SUR-138 | Surface | Re-authentication dialog | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Local confirmation; no password or SSO | 2 | A sensitive action asks for confirmation |
| W-SUR-139 | Surface | Sign-out dialog | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Kit warning only; no key export option | 1 | The dialog warns when no recovery kit is saved |
| W-SUR-140 | Surface | Deactivate account dialog | identity and devices | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Revoke and wipe | 2 | Consequences show before the final confirm |
| W-SUR-141 | Surface | Clear data confirm dialog | identity and devices | none | not needed | keep | - | 1 | The dialog confirms before wiping this device |
| W-SUR-142 | Surface | Session restore error dialog | onboarding and recovery | none | not needed | adapt | No send-logs option | 1 | The dialog offers clear storage or sign out |
| W-SUR-143 | Surface | Storage evicted dialog | onboarding and recovery | none | not needed | keep | - | 1 | The dialog explains the browser removed local data |
| W-SUR-144 | Surface | Server offline dialog | navigation and layout | Sync | proved rule | adapt | Peer-unreachable causes | 1 | The dialog lists likely causes with retry |
| W-SUR-145 | Surface | Recovery key entry dialog | encryption and verification | Key backup / secret storage | undecided | adapt | Recovery kit entry | 1 | Entry validates as typed; a reset link shows |
| W-SUR-146 | Surface | Create recovery dialog | encryption and verification | Key backup / secret storage | undecided | adapt | Recovery kit creation | 1 | The kit shows with copy and save; confirm requires re-entry |
| W-SUR-147 | Surface | Restore backup dialog | encryption and verification | Key backup / secret storage | undecided | adapt | Room-key recovery is undesigned | 2 | Progress with counts, success and error each show |
| W-SUR-148 | Surface | Set up encryption dialog | encryption and verification | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | adapt | Wraps the verify-this-device flow | 2 | The dialog hosts the verification steps |
| W-SUR-149 | Surface | Recovery method changed dialogs | encryption and verification | Key backup / secret storage | undecided | adapt | Kit changed on another device | 2 | A warning shows when the kit changed elsewhere |
| W-SUR-150 | Surface | Key export and import dialogs | encryption and verification | Olm/Megolm sessions | undecided | drop | Key files dropped | - | - |
| W-SUR-151 | Surface | Reset identity dialog | encryption and verification | User ID, Device (Prism ID, not wired to comms) | missing | adapt | Guardians or a fresh identity | 2 | A warning and confirm precede the reset |
| W-SUR-152 | Surface | Key storage off dialogs | encryption and verification | Key backup / secret storage | undecided | drop | No server key storage | - | - |
| W-SUR-153 | Surface | Verification request dialog and incoming verification | encryption and verification | Verifying another user | undecided | keep | - | 1 | A request outside a room opens the verification dialog |
| W-SUR-154 | Surface | Emoji compare, complete and cancelled views | encryption and verification | Verifying another user | undecided | keep | - | 1 | Compare, success and cancelled-with-reason views show |
| W-SUR-155 | Surface | Manual device verification dialog | encryption and verification | User ID, Device (Prism ID, not wired to comms) | missing | drop | Fingerprint verification dropped | - | - |
| W-SUR-156 | Surface | Widget permission dialogs | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-157 | Surface | Modal widget dialog | rooms and membership | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-158 | Surface | Integration manager dialogs | settings | Integration manager | missing | drop | Integration manager dropped | - | - |
| W-SUR-159 | Surface | Search index dialogs | search | none | not needed | adapt | Status and reset only | 1 | The dialog shows index size and a reset |
| W-SUR-160 | Surface | Feedback and bug report dialogs | settings | none | not needed | adapt | Local log export only | 2 | The dialog saves a log file |
| W-SUR-161 | Surface | Analytics info dialog | settings | none | not needed | drop | No analytics | - | - |
| W-SUR-162 | Surface | Changelog dialog | settings | none | not needed | drop | Lean | - | - |
| W-SUR-163 | Surface | Generic dialogs | navigation and layout | none | not needed | keep | - | 1 | Question, info, error and input dialogs share one frame |
| W-SUR-164 | Surface | Modal manager | navigation and layout | none | not needed | keep | - | 1 | Dialogs stack, centre and trap focus |
| W-SUR-165 | Surface | User settings dialog | settings | none | not needed | keep | - | 1 | The dialog hosts the kept settings tabs |
| W-SUR-166 | Surface | Settings tab: Account | settings | Profile (not in mapping table) | missing | adapt | Name, avatar, ID copy; no email, phone or password | 1 | Name and avatar change; the ID copies |
| W-SUR-167 | Surface | Settings tab: Sessions | settings | User ID, Device (Prism ID, not wired to comms) | missing | adapt | From Prism ID device log | 2 | This device and others list with sign-out |
| W-SUR-168 | Surface | Settings tab: Appearance | settings | none | not needed | adapt | Theme and font size only | 1 | Theme and size change at once |
| W-SUR-169 | Surface | Settings tab: Notifications | settings | Account data (not in mapping table) | missing | adapt | Small rule set | 1 | Master switch, default level, mentions and sound work |
| W-SUR-170 | Surface | Settings tab: Preferences | settings | none | not needed | adapt | Kept settings only | 1 | Each kept preference toggles and persists |
| W-SUR-171 | Surface | Settings tab: Keyboard | settings | none | not needed | keep | - | 1 | Shortcuts list by category |
| W-SUR-172 | Surface | Settings tab: Sidebar | settings | none | not needed | adapt | Home-shows-all toggle only | 2 | The toggle changes what Home lists |
| W-SUR-173 | Surface | Settings tab: Voice and video | settings | none | not needed | keep | - | 3 | Device pickers and audio options work |
| W-SUR-174 | Surface | Settings tab: Security and privacy | settings | Account data (not in mapping table) | missing | adapt | Invites, ignored users, media previews | 2 | Each control changes behaviour and persists |
| W-SUR-175 | Surface | Settings tab: Encryption | settings | Key backup / secret storage | undecided | adapt | Recovery and device keys; no key storage toggle | 1 | Recovery state and this device's keys show |
| W-SUR-176 | Surface | Settings tab: Labs | settings | none | not needed | drop | No labs | - | - |
| W-SUR-177 | Surface | Settings tab: Ignored lists | settings | State event and resolution | proved rule | drop | Policy lists dropped | - | - |
| W-SUR-178 | Surface | Settings tab: Help and about | settings | none | not needed | adapt | Version and bundle address; no server URLs | 1 | The tab shows the version and its content address |
| W-SUR-179 | Surface | Room settings dialog | settings | none | not needed | keep | - | 1 | The dialog hosts the kept room tabs |
| W-SUR-180 | Surface | Room settings: General | settings | State event and resolution | proved rule | adapt | Name, topic, avatar, leave; no addresses | 1 | Each field saves for all members |
| W-SUR-181 | Surface | Room settings: People | settings | Membership and power levels | proved rule | keep | - | 2 | Pending requests list with approve and deny |
| W-SUR-182 | Surface | Room settings: Voice and video | settings | Call media / group calls | undecided | drop | One call type | - | - |
| W-SUR-183 | Surface | Room settings: Security and privacy | settings | Membership and power levels | proved rule | adapt | Access and history only; no encryption toggle or directory | 2 | Access and history rules can be changed |
| W-SUR-184 | Surface | Room settings: Roles and permissions | settings | Membership and power levels | proved rule | adapt | Roles and action levels | 2 | Roles, muted and banned lists can be edited |
| W-SUR-185 | Surface | Room settings: Notifications | settings | Account data (not in mapping table) | missing | adapt | Level only; no custom sound | 1 | The level choice applies to the room |
| W-SUR-186 | Surface | Room settings: Bridges | settings | Homeserver | not needed | drop | Bridges dropped | - | - |
| W-SUR-187 | Surface | Room settings: Advanced | settings | Homeserver | not needed | drop | No room versions or federation | - | - |
| W-SUR-188 | Surface | Room settings: Poll history | settings | Relations | missing | keep | - | 2 | The room's polls list |
| W-SUR-189 | Surface | Developer tools dialog | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-190 | Surface | Legacy call view | calls | 1:1 call signalling | proved rule | adapt | No hold, transfer or dial pad | 3 | Stage, mute, camera, share and hang up work |
| W-SUR-191 | Surface | Call options and device menus | calls | none | not needed | adapt | Device pick only | 3 | Microphone, speaker and camera can be chosen in a call |
| W-SUR-192 | Surface | Dial pad | calls | Homeserver | not needed | drop | Phone network dropped | - | - |
| W-SUR-193 | Surface | Group call view | calls | Call media / group calls | undecided | adapt | Relay undecided; native view only | 3 | Lobby and in-call views show |
| W-SUR-194 | Surface | Picture-in-picture | calls | none | not needed | keep | - | 3 | A mini call view persists across navigation |
| W-SUR-195 | Surface | Screen source picker | calls | none | not needed | drop | The browser's own picker is used | - | - |
| W-SUR-196 | Surface | Toast: incoming call | calls | 1:1 call signalling | proved rule | keep | - | 3 | A toast shows the caller with accept and decline |
| W-SUR-197 | Surface | Toast: verification request | encryption and verification | Verifying another user | undecided | keep | - | 1 | A toast shows the request with accept and decline |
| W-SUR-198 | Surface | Toast: encryption reminders | encryption and verification | Key backup / secret storage | undecided | adapt | Verify device and save kit reminders only | 1 | Each reminder shows once its condition holds |
| W-SUR-199 | Surface | Toast: unverified sessions | encryption and verification | Cross-signing (own devices) (Prism ID, not wired to comms) | missing | keep | - | 2 | A new sign-in raises a review toast |
| W-SUR-200 | Surface | Toast: desktop notifications prompt | notifications | none | not needed | keep | - | 1 | A toast offers to enable notifications |
| W-SUR-201 | Surface | Toast: analytics consent | settings | none | not needed | drop | No analytics | - | - |
| W-SUR-202 | Surface | Toast: update available | settings | none | not needed | adapt | No changelog | 1 | A toast offers the new version |
| W-SUR-203 | Surface | Toast: server limit | navigation and layout | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-204 | Surface | Toast: mobile guide | onboarding and recovery | none | not needed | drop | This app is the mobile app | - | - |
| W-SUR-205 | Surface | Toast containers | navigation and layout | none | not needed | keep | - | 1 | Toasts stack by priority |
| W-SUR-206 | Surface | Notification badges | notifications | none | not needed | keep | - | 1 | Count, dot, mention, invite and muted marks show |
| W-SUR-207 | Surface | Avatars | navigation and layout | none | not needed | adapt | No widget avatars | 1 | A missing image falls back to an initial and colour |
| W-SUR-208 | Surface | Effects overlay | timeline and events | none | not needed | drop | Effects dropped | - | - |
| W-SUR-209 | Surface | Error boundary | navigation and layout | none | not needed | adapt | Reload only; no bug report | 1 | A render failure shows a reload option |
| W-SUR-210 | Surface | Desktop menus and tray | navigation and layout | none | not needed | drop | Browser and PWA only | - | - |
| W-SUR-211 | Surface | Shortcut: send and new line | composer | none | not needed | keep | - | 1 | Enter sends; the shift key adds a line |
| W-SUR-212 | Surface | Shortcut: formatting | composer | none | not needed | keep | - | 1 | Bold, italic, code, quote and link shortcuts apply |
| W-SUR-213 | Surface | Shortcut: undo and redo | composer | none | not needed | keep | - | 1 | Undo and redo shortcuts work |
| W-SUR-214 | Surface | Shortcut: composer cursor | composer | none | not needed | keep | - | 1 | Shortcuts jump the caret to start and end |
| W-SUR-215 | Surface | Shortcut: cancel reply or edit | composer | none | not needed | keep | - | 1 | Escape cancels a reply or edit |
| W-SUR-216 | Surface | Shortcut: edit previous or next message | composer | none | not needed | keep | - | 1 | Up in an empty composer edits the last own message |
| W-SUR-217 | Surface | Shortcut: sent-message history | composer | none | not needed | keep | - | 2 | The shortcut cycles previously sent messages |
| W-SUR-218 | Surface | Shortcut: sticker picker | composer | Integration manager | missing | drop | Stickers dropped | - | - |
| W-SUR-219 | Surface | Shortcut: autocomplete | composer | none | not needed | keep | - | 1 | Enter, Tab, arrows and Escape drive suggestions |
| W-SUR-220 | Surface | Shortcut: call controls | calls | none | not needed | keep | - | 3 | Shortcuts toggle microphone and camera in a call |
| W-SUR-221 | Surface | Shortcut: timeline scrolling | timeline and events | none | not needed | keep | - | 1 | Page keys scroll; shortcuts jump to first and latest |
| W-SUR-222 | Surface | Shortcut: read marker | timeline and events | none | not needed | keep | - | 1 | Escape jumps to bottom; a shortcut jumps to oldest unread |
| W-SUR-223 | Surface | Shortcut: upload file | media and attachments | none | not needed | keep | - | 1 | The shortcut opens the file picker |
| W-SUR-224 | Surface | Shortcut: search in room | search | none | not needed | keep | - | 1 | The shortcut opens room search |
| W-SUR-225 | Surface | Shortcut: quick switcher | search | none | not needed | keep | - | 1 | The shortcut opens the quick switcher |
| W-SUR-226 | Surface | Shortcut: room list navigation | navigation and layout | none | not needed | keep | - | 1 | Arrows move, Enter selects, Escape clears |
| W-SUR-227 | Surface | Shortcut: room list panel | navigation and layout | none | not needed | keep | - | 1 | Shortcuts toggle and resize the panel |
| W-SUR-228 | Surface | Shortcut: switch rooms | navigation and layout | none | not needed | keep | - | 1 | Shortcuts go to previous and next room and unread room |
| W-SUR-229 | Surface | Shortcut: history back and forward | navigation and layout | none | not needed | keep | - | 1 | Back and forward move through visited rooms |
| W-SUR-230 | Surface | Shortcut: spaces | spaces | none | not needed | keep | - | 2 | Shortcuts switch space by position |
| W-SUR-231 | Surface | Shortcut: panels and menus | navigation and layout | none | not needed | keep | - | 1 | Shortcuts toggle the right panel and user menu |
| W-SUR-232 | Surface | Shortcut: landmarks | navigation and layout | none | not needed | keep | - | 1 | The landmark shortcut cycles regions |
| W-SUR-233 | Surface | Shortcut: accessibility keys | navigation and layout | none | not needed | keep | - | 1 | Standard keys operate every control |
| W-SUR-234 | Surface | Shortcut: show hidden events (labs) | timeline and events | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-235 | Surface | Devtools: send custom event | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-236 | Surface | Devtools: room state explorer | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-237 | Surface | Devtools: sticky state explorer | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-238 | Surface | Devtools: account data explorers | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-239 | Surface | Devtools: server info and servers in room | settings | Homeserver | not needed | drop | Exists only because Matrix has servers | - | - |
| W-SUR-240 | Surface | Devtools: users | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-241 | Surface | Devtools: widget explorer | settings | Widgets | missing | drop | Widgets dropped | - | - |
| W-SUR-242 | Surface | Devtools: notification debug | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-243 | Surface | Devtools: settings explorer | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-244 | Surface | Devtools: crypto | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-245 | Surface | Devtools: custom themes | settings | none | not needed | drop | Custom themes dropped | - | - |
| W-SUR-246 | Surface | Developer menu option | settings | none | not needed | drop | Developer tools dropped | - | - |
| W-SUR-247 | Surface | User info sub-views | identity and devices | Profile (not in mapping table) | missing | adapt | No presence or admin sub-views | 1 | Header, options and ignore show |
| W-SUR-248 | Surface | Right panel card frame | navigation and layout | none | not needed | keep | - | 1 | Cards share header, back and close |
| W-SUR-249 | Surface | Public room result details | search | Homeserver | not needed | drop | No directory | - | - |
| W-SUR-250 | Surface | Small shared structures | navigation and layout | none | not needed | keep | - | 1 | Chip input, search box and scrollbars behave the same everywhere |
