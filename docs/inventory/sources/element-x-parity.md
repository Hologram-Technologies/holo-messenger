# Element X and Element Call parity

Input: `element-x-inventory.md` (445 rows, same IDs, same order). Parity values are recommendations for Ilya to overrule.
Holo Messenger is a browser app, so native-only items are adapted to a browser equivalent or dropped.
Engine standing follows `matrix-to-uor-comms-map.md`: proved rule = a proved decision over inputs the host must supply; missing = no structure or code; undecided = waits on an open decision; not needed = pure client UI or a server-only concept. Where a row needs several concepts the weakest standing is shown.
Prism ID identity and devices exist outside uor-comms but are not wired into it; they are shown as missing.

## Summary

Total 445: keep 208, adapt 170, drop 67.

| Domain | keep | adapt | drop |
|---|---|---|---|
| timeline and events | 54 | 4 | 4 |
| rooms and membership | 28 | 26 | 5 |
| calls | 14 | 19 | 13 |
| media and attachments | 16 | 24 | 5 |
| identity and devices | 9 | 15 | 8 |
| onboarding and recovery | 1 | 17 | 14 |
| moderation | 22 | 5 | 2 |
| settings | 6 | 17 | 5 |
| encryption and verification | 13 | 11 | 2 |
| notifications | 0 | 16 | 5 |
| spaces | 16 | 4 | 0 |
| composer | 13 | 3 | 0 |
| navigation and layout | 5 | 9 | 1 |
| search | 5 | 0 | 3 |
| threads | 6 | 0 | 0 |

| Phase | rows |
|---|---|
| Phase 1 | 159 |
| Phase 2 | 186 |
| Phase 3 | 33 |
| dropped | 67 |

| Engine standing | all rows | kept or adapted rows |
|---|---|---|
| proved rule | 49 | 49 |
| missing | 200 | 189 |
| undecided | 62 | 51 |
| not needed | 134 | 89 |

## The 20 calls to look at

1. Sign-in is replaced, not ported (X-JRN-001 to 004, X-SUR-002 to 006): server choice, web sign-in and passwords are dropped; first run creates or restores a Prism ID.
2. QR sign-in and device linking become the Prism ID device link (X-CAP-006, 007; X-JRN-005, 006). Its relay is the hard-coded third-party host, so this is where "serverless" is decided. Placed in Phase 2.
3. Emoji verification between my own devices is dropped in favour of the device link's code check (X-CAP-065; X-JRN-010, 011). Verifying another person is kept (X-CAP-066) but has no design in uor-comms.
4. Recovery becomes the Prism ID recovery kit, generated locally (X-CAP-067; X-JRN-012, 013). Restoring the identity is Phase 1; recovering old room keys is undesigned and sits in Phase 2 (X-CAP-068).
5. The key-storage on/off switch is dropped (X-JRN-015, X-SUR-114): there is no server-side storage to switch.
6. Push while the app is closed is kept as adapt but cannot be built until the always-on peer is decided (X-CAP-092, 093; X-JRN-032). Phase 1 covers notifications while a tab or installed app is open.
7. Notification rules move from the server to the device (X-CAP-096; X-FEA-097, 098). They need the synced per-user store the mapping lists as unasked.
8. Finding people has no directory (X-CAP-018; X-FEA-010, 070): by Prism ID, link or QR only.
9. Public directory, room addresses and address resolution are dropped (X-CAP-039, 040; X-FEA-014; X-SUR-030, 096, 148). Joining is by invite or link.
10. Reporting a message goes to the room's moderators, not server admins (X-FEA-076; X-SUR-078); reporting a room is dropped (X-FEA-077).
11. The encryption switch is dropped: rooms are always encrypted (X-CAP-037). Badges show verification only (X-FEA-082).
12. Live location is dropped (X-CAP-081; X-FEA-052; X-JRN-029): a browser cannot track in the background. Static location is kept without map tiles, because tiles need an outside provider (X-CAP-080; X-FEA-051, 053).
13. Link previews are dropped on both platforms (X-CAP-060; X-FEA-040): fetching them tells a third party what was read.
14. Calls: 1:1 is direct WebRTC in Phase 3; anything with more than two people is marked "relay undecided" (X-CAP-100, 103; X-FEA-088; X-JRN-036). The selective forwarding server, its token service and transport discovery are dropped (X-CAP-101, 102).
15. Incoming calls ring only while the app is open or a wake path exists (X-CAP-109; X-JRN-034, 035). No system call screen in a browser.
16. The embedded call app, its widget bridge and the standalone call site with guests are dropped; the call view is part of the app (X-CAP-106 to 108; X-FEA-096; X-JRN-051; X-SUR-145, 146).
17. Multiple accounts are dropped: one identity per browser profile (X-CAP-002; X-FEA-106; X-JRN-048; X-SUR-021, 127).
18. Screen lock is kept as WebAuthn or a passphrase, Phase 2 (X-CAP-114; X-FEA-107; X-JRN-042, 043). It could equally be dropped; a browser lock is weaker than a native one.
19. Share into the app becomes Web Share Target, which works only for an installed app and not on iOS Safari (X-CAP-119; X-FEA-116; X-JRN-044).
20. Knock and space-restricted joins are kept in Phase 2 (X-CAP-027, 028, 090) although the proved membership rule does not model them; they are marked missing, not proved.

## Rows

| ID | kind | name | domain | uor-comms need | engine standing | parity | reason | phase | acceptance check | web twin |
|---|---|---|---|---|---|---|---|---|---|---|
| X-CAP-001 | Capability | Session store and restore | identity and devices | User ID; Device | missing | adapt | Prism ID kept locally; no server tokens | 1 | Reloading the tab reopens the same identity with no prompt |  |
| X-CAP-002 | Capability | Multiple signed-in accounts | identity and devices | User ID | missing | drop | lean; one identity per browser profile | - | - |  |
| X-CAP-003 | Capability | Server discovery | identity and devices | Homeserver | not needed | drop | no server to discover | - | - |  |
| X-CAP-004 | Capability | OAuth/OIDC sign-in | identity and devices | Homeserver | not needed | drop | no account provider | - | - |  |
| X-CAP-005 | Capability | Password sign-in | identity and devices | Homeserver | not needed | drop | no passwords in the brief | - | - |  |
| X-CAP-006 | Capability | Sign in by QR from another device | identity and devices | Device | missing | adapt | becomes Prism ID device link; relay undecided | 2 | New browser scans a code, both show matching digits, device joins the identity |  |
| X-CAP-007 | Capability | Link a new device from a signed-in one | identity and devices | Device | missing | adapt | becomes Prism ID device link; relay undecided | 2 | Existing device approves a new one after the codes match |  |
| X-CAP-008 | Capability | Account provisioning link | onboarding and recovery | Homeserver | not needed | drop | no account provider | - | - |  |
| X-CAP-009 | Capability | Import a session from the classic app | onboarding and recovery | Homeserver | not needed | drop | no predecessor app | - | - |  |
| X-CAP-010 | Capability | Own profile read/write | identity and devices | Global profile | missing | keep | - | 1 | Changing name or avatar shows on another member's screen |  |
| X-CAP-011 | Capability | User status | identity and devices | Presence | missing | keep | - | 2 | A set status shows beside my name for a contact |  |
| X-CAP-012 | Capability | Presence control | identity and devices | Presence | missing | keep | - | 2 | Turning presence sharing off stops contacts seeing me online |  |
| X-CAP-013 | Capability | Account deactivation | identity and devices | User ID | missing | adapt | no server account; erase identity locally and revoke devices | 2 | After erase, reload shows first run and other devices show this one revoked |  |
| X-CAP-014 | Capability | Account management hand-off | identity and devices | Homeserver | not needed | drop | no provider pages | - | - |  |
| X-CAP-015 | Capability | Sign out | identity and devices | Device | missing | adapt | no server session; local wipe plus device revoke | 1 | After sign-out browser storage is empty and reload shows first run |  |
| X-CAP-016 | Capability | Forced sign-out handling | identity and devices | Device | missing | adapt | becomes reaction to device revocation | 2 | Revoking a device from another ends its session on next sync |  |
| X-CAP-017 | Capability | Ignore list | moderation | Account data | missing | keep | - | 2 | A blocked user's messages disappear and stay hidden after reload |  |
| X-CAP-018 | Capability | User lookup | rooms and membership | Identity server | missing | adapt | no directory; find by Prism ID, link or QR | 1 | Pasting a contact's ID or scanning their code opens their profile |  |
| X-CAP-019 | Capability | Recently visited rooms | navigation and layout | none | not needed | keep | - | 2 | Recently opened chats are listed first in pickers |  |
| X-CAP-020 | Capability | Room list stream | rooms and membership | Sync | proved rule | adapt | no sliding sync; list from local store then delta sync | 1 | Chat list paints from cache in under 100 ms and updates on new events |  |
| X-CAP-021 | Capability | Room list filters | rooms and membership | none | not needed | keep | - | 2 | Choosing the unread filter shows only chats with unread messages |  |
| X-CAP-022 | Capability | Room summary | rooms and membership | Event; Receipts | missing | keep | - | 1 | A row's last message, time and unread count match the room |  |
| X-CAP-023 | Capability | Create room | rooms and membership | Room; Membership and power levels | missing | adapt | no address option; room named by its creating event | 1 | A created room opens for both invited members |  |
| X-CAP-024 | Capability | Find or create direct chat | rooms and membership | Room; Account data | missing | keep | - | 1 | Starting a chat with an existing contact reopens the same room |  |
| X-CAP-025 | Capability | Room preview | rooms and membership | Room | missing | adapt | no server to ask; preview carried in invite or link | 2 | An invite link shows name, avatar and member count before joining |  |
| X-CAP-026 | Capability | Join | rooms and membership | Membership and power levels | proved rule | adapt | no via-server routing; join through a peer holding the room | 1 | Accepting an invite shows the timeline and adds me to the member list |  |
| X-CAP-027 | Capability | Ask to join (knock) | rooms and membership | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A join request with a note reaches moderators and can be withdrawn |  |
| X-CAP-028 | Capability | Review join requests | moderation | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A moderator accepts a request and the requester gains access |  |
| X-CAP-029 | Capability | Invite handling | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Declining an invite removes it and the inviter sees it declined |  |
| X-CAP-030 | Capability | Leave and forget | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | After leaving, the room is gone from my list and others see me left |  |
| X-CAP-031 | Capability | Member list | rooms and membership | Membership and power levels; State event and resolution | proved rule | keep | - | 1 | Member list matches on two devices after a join and a leave |  |
| X-CAP-032 | Capability | Invite users | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | An invited user sees the invite; an unknown ID is flagged |  |
| X-CAP-033 | Capability | Roles and permissions | moderation | Membership and power levels | proved rule | keep | - | 2 | A member raised to moderator can remove a member; a plain member cannot |  |
| X-CAP-034 | Capability | Remove, ban, unban | moderation | Membership and power levels | proved rule | keep | - | 2 | A banned member can no longer send and their concurrent message is refused |  |
| X-CAP-035 | Capability | Room details edit | rooms and membership | State event and resolution | proved rule | keep | - | 1 | A changed room name shows for all members |  |
| X-CAP-036 | Capability | Access and visibility settings | rooms and membership | Membership and power levels (knock, restricted join: not modelled); State event and resolution | missing | adapt | no directory or public address; join rule and history only | 2 | Switching to invite only blocks a join by link |  |
| X-CAP-037 | Capability | Turn on encryption for a room | encryption and verification | Olm/Megolm sessions | missing | drop | always encrypted; no unencrypted mode | - | - |  |
| X-CAP-038 | Capability | Room flags | rooms and membership | Account data | missing | keep | - | 2 | A favourited chat appears under the favourites filter on my other device |  |
| X-CAP-039 | Capability | Public room directory | search | Homeserver | not needed | drop | no server directory | - | - |  |
| X-CAP-040 | Capability | Address resolution | rooms and membership | Homeserver | not needed | drop | no alias directory; rooms are named by address | - | - |  |
| X-CAP-041 | Capability | Permalinks | navigation and layout | Room; Event | missing | adapt | own link format carrying content addresses | 2 | A copied message link opens that message for another member |  |
| X-CAP-042 | Capability | Upgraded-room links | rooms and membership | Homeserver | not needed | drop | room versions are a server concern | - | - |  |
| X-CAP-043 | Capability | Typing signals | composer | Typing | missing | keep | - | 1 | Typing on one device shows the indicator on the other within 1 s |  |
| X-CAP-044 | Capability | Composer drafts | composer | none | not needed | keep | - | 1 | Text typed, room left and reopened, is still in the composer |  |
| X-CAP-045 | Capability | Timeline stream | timeline and events | Event; Timeline order on screen | undecided | keep | - | 1 | Scrolling back loads older messages in order without jumps |  |
| X-CAP-046 | Capability | Timeline variants | timeline and events | Event; Timeline order on screen | undecided | keep | - | 1 | Live and event-focused timelines work in Phase 1; pinned, thread and media-only in Phase 2 |  |
| X-CAP-047 | Capability | Virtual timeline items | timeline and events | none | not needed | keep | - | 1 | Date dividers and the unread line appear at the right places |  |
| X-CAP-048 | Capability | Item mapping | timeline and events | Event | missing | keep | - | 1 | Each supported kind renders; an unknown kind shows a placeholder |  |
| X-CAP-049 | Capability | Send with local echo | composer | Event | missing | keep | - | 1 | Sent text appears within one frame, then shows confirmed in place |  |
| X-CAP-050 | Capability | Send queue control | timeline and events | Event; Sync | missing | keep | - | 1 | A message sent offline stays queued and delivers once on reconnect |  |
| X-CAP-051 | Capability | Edit and delete | timeline and events | Relations; Redaction | missing | keep | - | 1 | An edit replaces the text for all; a delete leaves a placeholder |  |
| X-CAP-052 | Capability | Replies | timeline and events | Relations | missing | keep | - | 1 | A reply shows the quoted original, loaded on demand |  |
| X-CAP-053 | Capability | Reactions | timeline and events | Relations | missing | keep | - | 1 | Toggling a reaction updates its count on both devices |  |
| X-CAP-054 | Capability | Read state | timeline and events | Receipts | missing | keep | - | 1 | Reading a room on one device clears its unread count on the other |  |
| X-CAP-055 | Capability | Polls | timeline and events | Event; Relations | missing | keep | - | 2 | A vote changes the tally for all; ending the poll freezes it |  |
| X-CAP-056 | Capability | Pinned events | timeline and events | State event and resolution | proved rule | keep | - | 2 | Pinning a message lists it under pins for all members |  |
| X-CAP-057 | Capability | Forwarding | timeline and events | Event | missing | keep | - | 2 | A forwarded message arrives in each chosen room |  |
| X-CAP-058 | Capability | State event text | timeline and events | State event and resolution | proved rule | keep | - | 1 | A join or rename shows as one readable line |  |
| X-CAP-059 | Capability | Decryption retry | encryption and verification | Olm/Megolm sessions | missing | keep | - | 1 | A message arriving before its key shows a placeholder, then its text |  |
| X-CAP-060 | Capability | Link metadata | timeline and events | none | not needed | drop | fetching previews leaks reads to third parties | - | - |  |
| X-CAP-061 | Capability | Slash commands | composer | none | not needed | keep | - | 2 | Typing a slash command runs it instead of sending text |  |
| X-CAP-062 | Capability | Background history pre-fetch | timeline and events | Sync | proved rule | adapt | idle-time fetch in a worker; no background process | 2 | Opening a recent unvisited room shows messages without a spinner |  |
| X-CAP-063 | Capability | Message index and search | search | none | not needed | keep | - | 1 | Searching a word returns matching local messages across rooms |  |
| X-CAP-064 | Capability | End-to-end encryption | encryption and verification | Olm/Megolm sessions | missing | keep | - | 1 | A network capture of a send shows only ciphertext |  |
| X-CAP-065 | Capability | Session verification | encryption and verification | Cross-signing (own devices) | missing | adapt | Prism ID device log replaces emoji check between own devices | 1 | A linked device shows as trusted on the other with no extra step |  |
| X-CAP-066 | Capability | User verification | encryption and verification | Verifying another user | undecided | keep | - | 2 | Two users compare a short code and each sees a verified mark |  |
| X-CAP-067 | Capability | Recovery key | onboarding and recovery | Key backup / secret storage | undecided | adapt | Prism ID recovery kit; nothing stored on a server | 1 | Entering the recovery kit in a fresh browser restores the identity |  |
| X-CAP-068 | Capability | Key backup | onboarding and recovery | Key backup / secret storage | undecided | adapt | room-key backup undesigned; ciphertext held by peers | 2 | A restored device reads history sent before the restore |  |
| X-CAP-069 | Capability | Identity reset | onboarding and recovery | User ID | missing | adapt | no re-auth; reset creates a new Prism ID | 2 | After a reset, contacts see an identity-changed warning |  |
| X-CAP-070 | Capability | Identity change tracking | encryption and verification | Verifying another user | undecided | keep | - | 2 | A contact whose identity changed is flagged in shared rooms |  |
| X-CAP-071 | Capability | Message authenticity shields | encryption and verification | Verifying another user; Olm/Megolm sessions | undecided | adapt | no unencrypted case; trust warnings only | 2 | A message from an untrusted device carries a warning mark |  |
| X-CAP-072 | Capability | Verified-user send blocks | encryption and verification | Verifying another user | undecided | keep | - | 2 | A send to a verified user with a changed identity is held until resolved |  |
| X-CAP-073 | Capability | Exclude unverified devices | encryption and verification | Device | missing | drop | developer flag; device log already binds devices | - | - |  |
| X-CAP-074 | Capability | Store encryption | encryption and verification | none | not needed | adapt | browser store encrypted with a non-extractable WebCrypto key | 1 | Reading browser storage directly shows no plaintext |  |
| X-CAP-075 | Capability | Media upload pipeline | media and attachments | Media repository | missing | adapt | canvas and WebCodecs processing; no server size limit | 1 | A 10 MB photo sends as a resized image with a thumbnail |  |
| X-CAP-076 | Capability | Media loading and cache | media and attachments | Media repository | missing | adapt | BLAKE3 address replaces content URI; cached forever | 1 | Reopening an image makes no network request |  |
| X-CAP-077 | Capability | Send attachments | media and attachments | Media repository; Event | missing | keep | - | 1 | A file sends with progress and can be cancelled mid-upload |  |
| X-CAP-078 | Capability | Galleries | media and attachments | Event | missing | keep | - | 2 | Several images sent together arrive as one grid message |  |
| X-CAP-079 | Capability | Voice messages | media and attachments | Media repository | missing | adapt | MediaRecorder; format differs per browser | 2 | A recorded clip plays back with seek on Safari and Chrome |  |
| X-CAP-080 | Capability | Static location | media and attachments | Event | missing | adapt | coordinates only; map tiles need an outside provider | 2 | A shared point opens in the device's maps app |  |
| X-CAP-081 | Capability | Live location | media and attachments | Event | missing | drop | browsers cannot track location in the background | - | - |  |
| X-CAP-082 | Capability | Media-only timeline | media and attachments | Event | missing | keep | - | 2 | The media view lists only media, newest first |  |
| X-CAP-083 | Capability | Content scanning | media and attachments | Homeserver | not needed | drop | needs a scanning service | - | - |  |
| X-CAP-084 | Capability | Media visibility policy | moderation | Account data | missing | keep | - | 2 | With previews off, media stays blurred until tapped |  |
| X-CAP-085 | Capability | Image editing before send | media and attachments | none | not needed | adapt | crop and rotate on canvas; no drawing | 2 | A cropped image sends as cropped |  |
| X-CAP-086 | Capability | File viewing and export | media and attachments | none | not needed | adapt | browser viewer plus download or Web Share | 1 | A PDF opens in place; save writes identical bytes |  |
| X-CAP-087 | Capability | Space tree | spaces | Spaces | missing | adapt | unjoined children come from peers, not a server | 2 | A space lists its rooms, joined or not |  |
| X-CAP-088 | Capability | Space editing | spaces | Spaces | missing | keep | - | 2 | Adding a room to a space shows it there for members |  |
| X-CAP-089 | Capability | Leave space with children | spaces | Spaces; Membership and power levels | missing | keep | - | 2 | Leaving a space offers its rooms and leaves the chosen ones |  |
| X-CAP-090 | Capability | Space-restricted access | spaces | Spaces; Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A space member joins a restricted room; a non-member is refused |  |
| X-CAP-091 | Capability | Threads | threads | Relations | missing | keep | - | 2 | A thread reply appears in the thread and in the root's summary |  |
| X-CAP-092 | Capability | Push registration | notifications | Push gateway | undecided | adapt | always-on peer undecided; Web Push needs a push service | 2 | With the app closed, a message raises a system notification |  |
| X-CAP-093 | Capability | Notification resolution | notifications | Push gateway | undecided | adapt | service worker decrypts on wake; always-on peer undecided | 2 | A woken worker shows sender and text, never ciphertext |  |
| X-CAP-094 | Capability | Notification presentation | notifications | none | not needed | adapt | Notifications API and app badge | 1 | A message in a background tab raises one notification per room, cleared on read |  |
| X-CAP-095 | Capability | Notification actions | notifications | none | not needed | adapt | notification actions; inline reply Chromium only | 2 | Mark-as-read on a notification clears the room's unread count |  |
| X-CAP-096 | Capability | Notification rules | notifications | Account data | missing | adapt | rules evaluated on the device, not a server | 1 | A room set to mentions only stays silent for ordinary messages |  |
| X-CAP-097 | Capability | Notification sounds | notifications | none | not needed | adapt | in-app sound only; system sound otherwise | 2 | A chosen tone plays for a message while the app is open |  |
| X-CAP-098 | Capability | Push diagnostics | notifications | Push gateway | undecided | drop | push-provider specific | - | - |  |
| X-CAP-099 | Capability | Background work | notifications | Sync | proved rule | adapt | service worker and Background Sync where supported | 2 | A queued message sends after the tab closes, where the browser allows |  |
| X-CAP-100 | Capability | Call membership signalling | calls | 1:1 call signalling; Call media / group calls | undecided | adapt | no server-timed leave; peers time out a silent member | 3 | A device that drops is removed from the call within the timeout |  |
| X-CAP-101 | Capability | Media transport discovery | calls | Call media / group calls | undecided | drop | no server media backends to discover | - | - |  |
| X-CAP-102 | Capability | Media authorisation | calls | Call media / group calls | undecided | drop | no token service | - | - |  |
| X-CAP-103 | Capability | Media publish and subscribe | calls | Call media / group calls | undecided | adapt | direct WebRTC for 1:1; group relay undecided | 3 | Two browsers exchange audio and video directly |  |
| X-CAP-104 | Capability | Call media encryption | calls | Call media / group calls; Olm/Megolm sessions | undecided | adapt | media keys from the room key epoch | 3 | A relay or observer sees only encrypted media frames |  |
| X-CAP-105 | Capability | Ringing | calls | 1:1 call signalling | proved rule | keep | - | 3 | The callee rings; decline or timeout shows on the caller's side |  |
| X-CAP-106 | Capability | Widget bridge | calls | Widgets | missing | drop | call UI is built in; no embedded widget | - | - |  |
| X-CAP-107 | Capability | Bundled call app | calls | none | not needed | drop | call UI is part of the app | - | - |  |
| X-CAP-108 | Capability | Call launch parameters | calls | none | not needed | drop | no separate call app to configure | - | - |  |
| X-CAP-109 | Capability | System call integration | calls | Push gateway | undecided | adapt | Notifications and Web Push, limited; no system call screen | 3 | An incoming call rings in an open tab and notifies a background one |  |
| X-CAP-110 | Capability | Host-controlled audio routing | calls | none | not needed | adapt | audio output selection where the browser supports it | 3 | Choosing another output moves call audio to it |  |
| X-CAP-111 | Capability | Picture-in-picture | calls | none | not needed | adapt | Document Picture-in-Picture with video fallback | 3 | The call floats above other windows and returns on click |  |
| X-CAP-112 | Capability | Room call state | calls | 1:1 call signalling | proved rule | keep | - | 3 | A room shows an active call and a join button to members |  |
| X-CAP-113 | Capability | Native call stack | calls | Call media / group calls | undecided | drop | experimental and native only | - | - |  |
| X-CAP-114 | Capability | App lock | settings | none | not needed | adapt | WebAuthn user check or passphrase on the local key | 2 | After the grace period the app asks to unlock before showing chats |  |
| X-CAP-115 | Capability | Feature flags | settings | none | not needed | adapt | one short labs list; no developer tier | 2 | A labs toggle changes behaviour without reload |  |
| X-CAP-116 | Capability | Diagnostics | settings | none | not needed | adapt | no report server; logs export to a file | 2 | Export produces a log file with no message content |  |
| X-CAP-117 | Capability | Analytics with consent | settings | none | not needed | drop | no analytics | - | - |  |
| X-CAP-118 | Capability | Deep link routing | navigation and layout | none | not needed | adapt | URL routes and installed-app link handling | 1 | Opening a room link lands in that room |  |
| X-CAP-119 | Capability | Share into the app | media and attachments | none | not needed | adapt | Web Share Target; installed app only, not iOS Safari | 2 | Sharing a photo from the gallery offers the app and opens the room picker |  |
| X-CAP-120 | Capability | Cache maintenance | settings | none | not needed | keep | - | 2 | Clear cache frees space and the app refetches what it needs |  |
| X-CAP-121 | Capability | Connectivity awareness | navigation and layout | Sync | proved rule | adapt | tracks peer reachability, not a homeserver | 1 | Going offline shows an indicator within 2 s; it clears on reconnect |  |
| X-CAP-122 | Capability | Server capability checks | settings | Homeserver | not needed | drop | no server capabilities to probe | - | - |  |
| X-FEA-001 | Feature | Chat list | rooms and membership | Event; Receipts | missing | keep | - | 1 | The list shows every joined room with preview, time and unread badge |  |
| X-FEA-002 | Feature | Filter chips | rooms and membership | none | not needed | keep | - | 2 | Selecting a filter chip narrows the list; clearing restores it |  |
| X-FEA-003 | Feature | Filter chats by space | spaces | Spaces | missing | keep | - | 2 | Picking a space limits the chat list to its rooms |  |
| X-FEA-004 | Feature | Room list search | search | none | not needed | keep | - | 1 | Typing part of a room name filters the list as I type |  |
| X-FEA-005 | Feature | Global search | search | none | not needed | keep | - | 1 | One search box finds rooms and local messages |  |
| X-FEA-006 | Feature | Mark read / unread | rooms and membership | Receipts; Account data | missing | keep | - | 1 | Mark unread shows a badge that survives reload |  |
| X-FEA-007 | Feature | Favourite a chat | rooms and membership | Account data | missing | keep | - | 2 | A favourited chat shows under the favourites filter |  |
| X-FEA-008 | Feature | Invites in the list | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | An invite row shows the inviter with accept and decline |  |
| X-FEA-009 | Feature | Pending join request rows | rooms and membership | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A room I asked to join shows as pending in the list |  |
| X-FEA-010 | Feature | Start a chat | rooms and membership | Identity server | missing | adapt | no directory; find people by ID, link or QR | 1 | The start screen offers new chat, new room and add by code |  |
| X-FEA-011 | Feature | Create room | rooms and membership | Room; Membership and power levels | missing | adapt | no public address; access options limited to modelled rules | 1 | A room with name and avatar is created and members can be invited |  |
| X-FEA-012 | Feature | Create space | spaces | Spaces | missing | keep | - | 2 | A created space appears in the spaces list |  |
| X-FEA-013 | Feature | Join by address | rooms and membership | Homeserver | not needed | adapt | paste an invite link instead of an alias | 2 | A pasted invite link shows valid or invalid before continuing |  |
| X-FEA-014 | Feature | Public room directory | search | Homeserver | not needed | drop | no server directory | - | - |  |
| X-FEA-015 | Feature | Room preview before joining | rooms and membership | Room | missing | adapt | preview from the invite payload or a peer | 2 | The preview offers the action that fits my membership state |  |
| X-FEA-016 | Feature | Ask to join with a message | rooms and membership | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A request with a note can be sent and withdrawn |  |
| X-FEA-017 | Feature | Decline and block | moderation | Membership and power levels | proved rule | adapt | decline plus block; no report to server admins | 2 | Declining with block hides the inviter's later invites |  |
| X-FEA-018 | Feature | Text messages with formatting | composer | Event | missing | keep | - | 1 | Bold, italic, code, quote, list and link render the same for the reader |  |
| X-FEA-019 | Feature | Mentions | composer | Event; Membership and power levels | missing | keep | - | 2 | Typing @ suggests members; the mentioned member is notified |  |
| X-FEA-020 | Feature | Reply | timeline and events | Relations | missing | keep | - | 1 | Tapping a reply's quote jumps to the original |  |
| X-FEA-021 | Feature | Edit | composer | Relations | missing | keep | - | 1 | An edited message is marked edited for all |  |
| X-FEA-022 | Feature | Delete message | timeline and events | Redaction | missing | keep | - | 1 | A deleted message leaves a placeholder for all members |  |
| X-FEA-023 | Feature | Reactions | timeline and events | Relations | missing | keep | - | 1 | A quick reaction from the menu shows as a chip under the message |  |
| X-FEA-024 | Feature | Who reacted | timeline and events | Relations | missing | keep | - | 1 | The who-reacted view lists each person per emoji |  |
| X-FEA-025 | Feature | Read receipts | timeline and events | Receipts | missing | keep | - | 1 | Avatars under my last message show who has read it |  |
| X-FEA-026 | Feature | Delivery status | timeline and events | Event | missing | keep | - | 1 | A failed message is marked and offers retry or remove |  |
| X-FEA-027 | Feature | Typing indicator | timeline and events | Typing | missing | keep | - | 1 | The typing line names who is typing |  |
| X-FEA-028 | Feature | Unread marker and jump | timeline and events | Receipts | missing | keep | - | 1 | Opening a room shows a line at the first unread message |  |
| X-FEA-029 | Feature | Jump to date start | timeline and events | Timeline order on screen | undecided | keep | - | 2 | Tapping the date badge jumps to that day's first message |  |
| X-FEA-030 | Feature | Open a message by link | timeline and events | Event; Timeline order on screen | undecided | keep | - | 2 | A message link opens the room at that message with a return to latest |  |
| X-FEA-031 | Feature | Polls | timeline and events | Event; Relations | missing | keep | - | 2 | A poll can be created, voted on, changed and ended |  |
| X-FEA-032 | Feature | Poll history | timeline and events | Event | missing | keep | - | 2 | Poll history lists ongoing and past polls |  |
| X-FEA-033 | Feature | Pin messages | timeline and events | State event and resolution | proved rule | keep | - | 2 | The pin banner cycles pins and jumps to each |  |
| X-FEA-034 | Feature | Forward | timeline and events | Event | missing | keep | - | 2 | Several selected messages forward to several rooms |  |
| X-FEA-035 | Feature | Multi-select messages | timeline and events | none | not needed | keep | - | 2 | Selection mode shows a count and an action bar |  |
| X-FEA-036 | Feature | Copy text, caption, link | timeline and events | none | not needed | keep | - | 1 | Copy puts the message text on the clipboard |  |
| X-FEA-037 | Feature | Translate | timeline and events | none | not needed | drop | native system feature; browsers translate pages themselves | - | - |  |
| X-FEA-038 | Feature | View source | settings | Event | missing | keep | - | 2 | View source shows the event's address and raw fields |  |
| X-FEA-039 | Feature | Collapsed room changes | timeline and events | State event and resolution | proved rule | keep | - | 1 | A run of joins and leaves folds into one expandable line |  |
| X-FEA-040 | Feature | Link previews | timeline and events | none | not needed | drop | fetching previews leaks reads to third parties | - | - |  |
| X-FEA-041 | Feature | Link safety prompt | timeline and events | none | not needed | keep | - | 1 | A link whose text and target differ asks before opening |  |
| X-FEA-042 | Feature | Slash commands | composer | none | not needed | keep | - | 2 | Typing / lists commands with a description |  |
| X-FEA-043 | Feature | Celebration effects | timeline and events | none | not needed | drop | lean | - | - |  |
| X-FEA-044 | Feature | Attach photo or video from library | media and attachments | Media repository | missing | adapt | browser file picker filtered to media | 1 | Several photos can be picked and previewed before sending |  |
| X-FEA-045 | Feature | Camera capture | media and attachments | Media repository | missing | adapt | file input capture on phones; camera API on desktop | 1 | A photo taken from the attach menu reaches the preview screen |  |
| X-FEA-046 | Feature | Attach file | media and attachments | Media repository | missing | keep | - | 1 | Any file can be picked and sent |  |
| X-FEA-047 | Feature | Paste or drop media | media and attachments | Media repository | missing | keep | - | 1 | Pasting or dropping an image opens the upload preview |  |
| X-FEA-048 | Feature | Captions | media and attachments | Event | missing | keep | - | 1 | A caption can be added, edited and removed after sending |  |
| X-FEA-049 | Feature | Upload quality | media and attachments | none | not needed | keep | - | 2 | With optimise on, a large photo is sent smaller |  |
| X-FEA-050 | Feature | Voice messages | media and attachments | Media repository | missing | adapt | MediaRecorder; tap to record | 2 | A voice clip records with a timer and plays with seek and speed |  |
| X-FEA-051 | Feature | Share location | media and attachments | Event | missing | adapt | Geolocation API; no embedded third-party map | 2 | Current position sends after the browser's permission prompt |  |
| X-FEA-052 | Feature | Share live location | media and attachments | Event | missing | drop | browsers cannot track location in the background | - | - |  |
| X-FEA-053 | Feature | View location | media and attachments | Event | missing | adapt | coordinates and an open-in-maps link; no map tiles | 2 | A shared location opens in the maps app |  |
| X-FEA-054 | Feature | Media viewer | media and attachments | Media repository | missing | keep | - | 1 | The viewer swipes between a room's images with zoom |  |
| X-FEA-055 | Feature | Room media gallery | media and attachments | Media repository | missing | keep | - | 2 | The gallery shows media and files in two tabs by date |  |
| X-FEA-056 | Feature | Hide media until tapped | moderation | none | not needed | keep | - | 2 | Hidden media shows blurred with a reveal control |  |
| X-FEA-057 | Feature | Stickers and galleries display | media and attachments | Event | missing | adapt | galleries kept; stickers dropped with integration manager | 2 | A received gallery renders as a grid |  |
| X-FEA-058 | Feature | Threads | threads | Relations | missing | keep | - | 2 | Reply in thread opens a thread with its own composer and draft |  |
| X-FEA-059 | Feature | Thread list | threads | Relations | missing | keep | - | 2 | The thread list shows each thread with reply count |  |
| X-FEA-060 | Feature | Spaces tab | spaces | Spaces | missing | keep | - | 2 | The spaces view lists joined spaces with a create action |  |
| X-FEA-061 | Feature | Space view | spaces | Spaces | missing | adapt | unjoined children listed from peers | 2 | A space shows its rooms with join buttons where not joined |  |
| X-FEA-062 | Feature | Manage space rooms | spaces | Spaces | missing | keep | - | 2 | Rooms can be added to and removed from a space in bulk |  |
| X-FEA-063 | Feature | Space settings | spaces | Spaces; State event and resolution | missing | keep | - | 2 | Space settings reach details, access, roles, members and leave |  |
| X-FEA-064 | Feature | Leave space | spaces | Spaces; Membership and power levels | missing | keep | - | 2 | Leaving a space lets me choose which child rooms to leave |  |
| X-FEA-065 | Feature | Room details | rooms and membership | State event and resolution | proved rule | adapt | no address row; call shortcut arrives in Phase 3 | 1 | Room details show identity, people, notifications and leave |  |
| X-FEA-066 | Feature | Edit room details | rooms and membership | State event and resolution; Media repository | missing | keep | - | 1 | Changing the room avatar and name warns on unsaved exit |  |
| X-FEA-067 | Feature | Member list | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | The member list is searchable and grouped by role |  |
| X-FEA-068 | Feature | Member profile | rooms and membership | Membership and power levels; Verifying another user | undecided | keep | - | 1 | A member's card offers message and block; verify arrives in Phase 2 |  |
| X-FEA-069 | Feature | User profile | identity and devices | User ID; Global profile | missing | keep | - | 1 | A user opened from a link shows the same card |  |
| X-FEA-070 | Feature | Invite people | rooms and membership | Membership and power levels; Identity server | missing | adapt | pick from contacts or paste an ID; no directory search | 1 | Several people can be selected and invited at once |  |
| X-FEA-071 | Feature | Security and privacy | rooms and membership | Membership and power levels (knock, restricted join: not modelled); State event and resolution | missing | adapt | no encryption switch, directory or address | 2 | Join rule and history visibility can be changed and saved |  |
| X-FEA-072 | Feature | Roles and permissions | moderation | Membership and power levels | proved rule | keep | - | 2 | An admin sets the minimum role for sending and it is enforced |  |
| X-FEA-073 | Feature | Transfer ownership | moderation | Membership and power levels | proved rule | keep | - | 2 | The last owner must pick a new owner before leaving |  |
| X-FEA-074 | Feature | Moderate a member | moderation | Membership and power levels | proved rule | keep | - | 2 | A moderator removes or bans from the member sheet with a reason |  |
| X-FEA-075 | Feature | Join requests | moderation | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | Moderators see a banner for pending requests with accept |  |
| X-FEA-076 | Feature | Report message | moderation | Event | missing | adapt | no server admins; report goes to room moderators | 2 | A report reaches moderators with the message and reason |  |
| X-FEA-077 | Feature | Report room | moderation | Homeserver | not needed | drop | no server admins; leave and block cover it | - | - |  |
| X-FEA-078 | Feature | Block users | moderation | Account data | missing | keep | - | 2 | The blocked list shows each blocked user with unblock |  |
| X-FEA-079 | Feature | Leave room | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Leaving asks for confirmation first |  |
| X-FEA-080 | Feature | Upgraded room notice | rooms and membership | Homeserver | not needed | drop | no room versions | - | - |  |
| X-FEA-081 | Feature | Share room link | rooms and membership | Room | missing | adapt | own invite link or QR | 2 | Share produces a link that opens the room preview |  |
| X-FEA-082 | Feature | Encryption state badges | encryption and verification | Verifying another user | undecided | adapt | always encrypted; badge shows verification state only | 2 | A room where all members are verified shows a verified mark |  |
| X-FEA-083 | Feature | Identity change banner | encryption and verification | Verifying another user | undecided | keep | - | 2 | A changed identity raises a banner with acknowledge |  |
| X-FEA-084 | Feature | Verify another user | encryption and verification | Verifying another user | undecided | keep | - | 2 | Verify from a profile ends with a badge on both sides |  |
| X-FEA-085 | Feature | Incoming verification request | encryption and verification | Verifying another user; Cross-signing (own devices) | undecided | adapt | device requests go through Prism ID link; user requests kept | 2 | An incoming verification asks to accept or ignore |  |
| X-FEA-086 | Feature | Key storage and recovery settings | onboarding and recovery | Key backup / secret storage | undecided | adapt | Prism ID recovery kit and guardians; no server storage | 2 | Settings show recovery state with set up or change |  |
| X-FEA-087 | Feature | Recovery prompts | onboarding and recovery | Key backup / secret storage | undecided | keep | - | 1 | A dismissible banner offers recovery setup once after first run |  |
| X-FEA-088 | Feature | Voice and video calls | calls | 1:1 call signalling; Call media / group calls | undecided | adapt | direct 1:1 calls; group calls wait on the relay decision | 3 | A call button in a direct chat rings the other person |  |
| X-FEA-089 | Feature | Call events in the timeline | calls | 1:1 call signalling; Event | missing | keep | - | 3 | A started call shows in the timeline with a join action |  |
| X-FEA-090 | Feature | In-call controls | calls | Call media / group calls | undecided | adapt | browser media APIs; output choice where supported | 3 | Mute, camera, screen share and hang up each take effect at once |  |
| X-FEA-091 | Feature | Call layouts | calls | none | not needed | keep | - | 3 | Layout switches between grid and spotlight |  |
| X-FEA-092 | Feature | Raise hand and reactions in calls | calls | Relations | missing | keep | - | 3 | A raised hand shows on my tile for others |  |
| X-FEA-093 | Feature | Call lobby | calls | none | not needed | keep | - | 3 | The pre-join screen shows camera preview and device choice |  |
| X-FEA-094 | Feature | Background blur and images | calls | none | not needed | drop | lean; needs a heavy model download | - | - |  |
| X-FEA-095 | Feature | Call quality and encryption indicators | calls | Call media / group calls | undecided | keep | - | 3 | A dropped connection shows reconnecting, then recovers |  |
| X-FEA-096 | Feature | Standalone call site | calls | Homeserver | not needed | drop | guests and a separate site; calls live in rooms | - | - |  |
| X-FEA-097 | Feature | Notification settings | notifications | Account data | missing | adapt | rules kept on the device and synced to my own devices | 1 | Default mode for groups can be set to mentions only |  |
| X-FEA-098 | Feature | Per-room notifications | notifications | Account data | missing | adapt | rules kept on the device | 1 | A muted room raises no notification |  |
| X-FEA-099 | Feature | Push provider choice | notifications | Push gateway | undecided | drop | no push providers to choose from | - | - |  |
| X-FEA-100 | Feature | Troubleshoot notifications | notifications | Push gateway | undecided | drop | push-provider specific; permission state shown in settings | - | - |  |
| X-FEA-101 | Feature | Reply from a notification | notifications | none | not needed | adapt | notification actions; inline reply Chromium only | 2 | Replying from a notification sends the message, where supported |  |
| X-FEA-102 | Feature | Settings home | settings | none | not needed | adapt | rows for dropped items removed | 1 | Settings list profile, devices, notifications, recovery, appearance, about, sign out |  |
| X-FEA-103 | Feature | Edit profile | identity and devices | Global profile | missing | keep | - | 1 | Name and avatar can be edited and saved |  |
| X-FEA-104 | Feature | Set a status | identity and devices | Presence | missing | keep | - | 2 | A status can be set from presets or typed, and cleared |  |
| X-FEA-105 | Feature | Manage account and devices | identity and devices | Device | missing | adapt | in-app device list from the Prism ID log, with revoke | 2 | Devices are listed and one can be revoked |  |
| X-FEA-106 | Feature | Add and switch accounts | identity and devices | User ID | missing | drop | lean; one identity per browser profile | - | - |  |
| X-FEA-107 | Feature | Screen lock | settings | none | not needed | adapt | WebAuthn or passphrase | 2 | A lock can be set, changed and removed |  |
| X-FEA-108 | Feature | Moderation and safety settings | moderation | Account data | missing | keep | - | 2 | Media preview policy and blocked users are in one place |  |
| X-FEA-109 | Feature | Location settings | settings | none | not needed | drop | follows live location | - | - |  |
| X-FEA-110 | Feature | Appearance | settings | none | not needed | keep | - | 1 | Light, dark and system themes switch at once |  |
| X-FEA-111 | Feature | Labs | settings | none | not needed | adapt | one short list | 2 | Labs lists experimental toggles |  |
| X-FEA-112 | Feature | Developer options | settings | none | not needed | adapt | minimum: log level, clear cache, view source | 2 | Developer options stay hidden until enabled |  |
| X-FEA-113 | Feature | Report a problem | settings | none | not needed | adapt | no report server; exports a log bundle | 2 | Report a problem builds a file I can send myself |  |
| X-FEA-114 | Feature | Analytics choice | settings | none | not needed | drop | no analytics | - | - |  |
| X-FEA-115 | Feature | About and legal | settings | none | not needed | keep | - | 1 | About shows version, the build's content address and licences |  |
| X-FEA-116 | Feature | Share from other apps | media and attachments | none | not needed | adapt | Web Share Target; installed app only | 2 | Shared text lands in the chosen room's composer |  |
| X-FEA-117 | Feature | Offline indicator | navigation and layout | Sync | proved rule | keep | - | 1 | An offline banner shows while disconnected |  |
| X-FEA-118 | Feature | Draft restore | composer | none | not needed | keep | - | 1 | A reply draft returns with its reply target |  |
| X-FEA-119 | Feature | Full-screen composer | composer | none | not needed | keep | - | 2 | The composer expands to a tall editor and back |  |
| X-FEA-120 | Feature | Message history sharing notice | encryption and verification | Olm/Megolm sessions | missing | keep | - | 2 | A room whose history is shared with new members says so |  |
| X-JRN-001 | Journey | First launch to signed in | onboarding and recovery | User ID | missing | adapt | no server or sign-in; create or restore a Prism ID | 1 | First run reaches the chat list in under 60 s with no email, phone or password |  |
| X-JRN-002 | Journey | Choose or change server | onboarding and recovery | Homeserver | not needed | drop | no server to choose | - | - |  |
| X-JRN-003 | Journey | Web (OIDC) sign-in | onboarding and recovery | Homeserver | not needed | drop | no account provider | - | - |  |
| X-JRN-004 | Journey | Password sign-in | onboarding and recovery | Homeserver | not needed | drop | no passwords | - | - |  |
| X-JRN-005 | Journey | Sign in with QR (new device) | onboarding and recovery | Device | missing | adapt | Prism ID device link; relay undecided | 2 | Scan, match digits, approve: the new browser opens signed in; each failure offers start over |  |
| X-JRN-006 | Journey | Link a new device (existing device) | identity and devices | Device | missing | adapt | Prism ID device link; relay undecided | 2 | Settings to link device to done in one pass; a wrong code allows retry |  |
| X-JRN-007 | Journey | Carry over from the classic app | onboarding and recovery | Homeserver | not needed | drop | no predecessor app | - | - |  |
| X-JRN-008 | Journey | Post-login onboarding | onboarding and recovery | User ID | missing | adapt | steps cut to recovery offer and notification permission | 1 | After creating an identity, each step shows once and can be skipped |  |
| X-JRN-009 | Journey | Confirm identity on a new device | encryption and verification | Device; Key backup / secret storage | undecided | adapt | choose link from another device or recovery kit | 1 | A second browser offers both routes and reaches the chat list by either |  |
| X-JRN-010 | Journey | Verify with another device (requester) | encryption and verification | Cross-signing (own devices) | missing | adapt | folded into the device link code check | 2 | Linking shows the same digits on both devices before approval |  |
| X-JRN-011 | Journey | Verify with another device (responder) | encryption and verification | Cross-signing (own devices) | missing | adapt | folded into the device link code check | 2 | The existing device shows the new device's details before approving |  |
| X-JRN-012 | Journey | Verify by recovery key | onboarding and recovery | Key backup / secret storage | undecided | adapt | recovery kit restores identity; room-key recovery undesigned | 1 | A valid kit restores the identity; an invalid one shows an inline error |  |
| X-JRN-013 | Journey | Set up recovery | onboarding and recovery | Key backup / secret storage | undecided | adapt | kit generated locally; nothing uploaded | 1 | Generate, save, confirm saved; leaving before confirming warns |  |
| X-JRN-014 | Journey | Change recovery key | onboarding and recovery | Key backup / secret storage | undecided | adapt | new kit generated locally | 2 | After a change the old kit no longer restores |  |
| X-JRN-015 | Journey | Turn key storage off / on | onboarding and recovery | Key backup / secret storage | undecided | drop | no server-side key storage to switch | - | - |  |
| X-JRN-016 | Journey | Reset identity | onboarding and recovery | User ID | missing | adapt | no re-auth step; warning and confirm only | 2 | Reset explains the consequences and ends with a new identity |  |
| X-JRN-017 | Journey | Sign out safely | identity and devices | Device; Key backup / secret storage | undecided | adapt | warns if the recovery kit is unsaved; no upload wait | 1 | Sign-out with no saved kit warns first; confirm wipes local data |  |
| X-JRN-018 | Journey | Deactivate account | identity and devices | User ID | missing | adapt | erase identity and revoke devices; no password | 2 | Erase explains, confirms, and returns to first run |  |
| X-JRN-019 | Journey | Start a direct chat | rooms and membership | Room; Identity server | missing | adapt | person found by ID, link or QR | 1 | Pick a contact, confirm, and the composer is ready; an existing chat reopens |  |
| X-JRN-020 | Journey | Create a room and invite | rooms and membership | Room; Membership and power levels | missing | adapt | no address step | 1 | Fill the form, create, invite or skip, and the room opens |  |
| X-JRN-021 | Journey | Receive and answer an invite | rooms and membership | Membership and power levels | proved rule | adapt | invite arrives by sync or link; closed-app push undecided | 1 | An invite can be accepted inline or from its preview; a withdrawn one says so |  |
| X-JRN-022 | Journey | Join from a link | rooms and membership | Room; Membership and power levels | missing | adapt | link carries the room address and a peer hint | 2 | Tap link, see preview, join, land in the timeline; unreachable offers retry |  |
| X-JRN-023 | Journey | Ask to join and wait | rooms and membership | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | Send a request, see it pending, then gain access or see it declined |  |
| X-JRN-024 | Journey | Approve join requests | moderation | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A moderator accepts or declines from the banner or the list |  |
| X-JRN-025 | Journey | Send a text message | composer | Event; Sync | missing | keep | - | 1 | Type, send, see sending then sent then read; offline queues; a failure offers retry |  |
| X-JRN-026 | Journey | Send to a room with a trust problem | encryption and verification | Verifying another user | undecided | keep | - | 2 | A blocked send explains why and offers resolve and resend |  |
| X-JRN-027 | Journey | Send media | media and attachments | Media repository | missing | adapt | no server size limit; chunked verified transfer | 1 | Pick, preview, send with progress; a failed transfer offers retry or cancel |  |
| X-JRN-028 | Journey | Record and send a voice message | media and attachments | Media repository | missing | adapt | MediaRecorder | 2 | Permission, record, preview, send or delete; denial explains how to allow |  |
| X-JRN-029 | Journey | Share live location | media and attachments | Event | missing | drop | browsers cannot track location in the background | - | - |  |
| X-JRN-030 | Journey | Reply, edit, delete from the message menu | timeline and events | Relations; Redaction | missing | keep | - | 1 | The message menu starts reply, edit or delete, each cancellable |  |
| X-JRN-031 | Journey | Open a notification | notifications | none | not needed | adapt | single identity; a click focuses or opens the app at the room | 1 | Clicking a notification opens that room and clears it |  |
| X-JRN-032 | Journey | Enable notifications | notifications | Push gateway | undecided | adapt | browser permission; closed-app delivery depends on always-on peer | 1 | Prompt, allow, and a test message notifies; a blocked permission explains the fix |  |
| X-JRN-033 | Journey | Place a call | calls | 1:1 call signalling; Call media / group calls | undecided | adapt | direct 1:1 WebRTC; relay undecided | 3 | Tap call, grant mic, ring, connect, hang up; unanswered ends with a notice |  |
| X-JRN-034 | Journey | Receive a call (iOS) | calls | 1:1 call signalling; Push gateway | undecided | adapt | rings in an open app; closed-app ring needs a wake path | 3 | An incoming call rings with accept and decline; answering elsewhere stops it |  |
| X-JRN-035 | Journey | Receive a call (Android) | calls | 1:1 call signalling; Push gateway | undecided | adapt | rings in an open app; closed-app ring needs a wake path | 3 | A missed call leaves a notification and a timeline entry |  |
| X-JRN-036 | Journey | Join an ongoing call | calls | 1:1 call signalling; Call media / group calls | undecided | adapt | group join waits on the relay decision | 3 | Join from the room header connects to the running call |  |
| X-JRN-037 | Journey | Minimise and return to a call | calls | none | not needed | adapt | Document Picture-in-Picture; call continues in the tab | 3 | Leaving the call view keeps audio and shows a floating tile |  |
| X-JRN-038 | Journey | Report and block | moderation | Event | missing | adapt | block kept; report goes to room moderators | 2 | Report with a reason and optional block; the blocked user's messages vanish |  |
| X-JRN-039 | Journey | Leave a room | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Leave, confirm, and the room is gone; a leave error is shown |  |
| X-JRN-040 | Journey | Remove or ban a member | moderation | Membership and power levels | proved rule | keep | - | 2 | Pick member, remove or ban with reason, confirm, done; unban from the banned list |  |
| X-JRN-041 | Journey | Change room access | rooms and membership | Membership and power levels (knock, restricted join: not modelled); State event and resolution | missing | adapt | no address or directory steps | 2 | Change access, save; leaving with edits asks to discard |  |
| X-JRN-042 | Journey | Unlock the app | settings | none | not needed | adapt | WebAuthn prompt or passphrase | 2 | Returning after the grace period asks to unlock; repeated failures lock out |  |
| X-JRN-043 | Journey | Set up screen lock | settings | none | not needed | adapt | WebAuthn registration or passphrase | 2 | Set a lock, confirm it, and it applies on next return |  |
| X-JRN-044 | Journey | Share into a chat | media and attachments | none | not needed | adapt | Web Share Target; installed app only | 2 | Share from another app, pick a room, and the content is in the composer |  |
| X-JRN-045 | Journey | Search and jump to a message | search | none | not needed | keep | - | 1 | Search, tap a result, and the room opens at that message |  |
| X-JRN-046 | Journey | Browse a space and join a room | spaces | Spaces | missing | adapt | children listed from peers | 2 | Open a space, tap an unjoined room, preview, join |  |
| X-JRN-047 | Journey | Forced sign-out | identity and devices | Device | missing | adapt | triggered by device revocation | 2 | A revoked device clears itself and explains why |  |
| X-JRN-048 | Journey | Switch account | identity and devices | User ID | missing | drop | lean; one identity per browser profile | - | - |  |
| X-JRN-049 | Journey | Verify another user | encryption and verification | Verifying another user | undecided | keep | - | 2 | Verify from a profile; a later identity change warns and offers re-verify |  |
| X-JRN-050 | Journey | Fix broken notifications (Android) | notifications | Push gateway | undecided | drop | push-provider specific | - | - |  |
| X-JRN-051 | Journey | Guest joins a call by link (standalone) | calls | Homeserver | not needed | drop | no guests | - | - |  |
| X-SUR-001 | Surface | Splash / placeholder screen | navigation and layout | none | not needed | keep | - | 1 | A placeholder shows while the identity loads, never a blank page |  |
| X-SUR-002 | Surface | Start screen | onboarding and recovery | User ID | missing | adapt | create or restore identity; no sign-in or account buttons | 1 | Start screen offers create, restore and link from another device |  |
| X-SUR-003 | Surface | Server confirmation screen | onboarding and recovery | Homeserver | not needed | drop | no server | - | - |  |
| X-SUR-004 | Surface | Server picker | onboarding and recovery | Homeserver | not needed | drop | no server | - | - |  |
| X-SUR-005 | Surface | Password login screen | onboarding and recovery | Homeserver | not needed | drop | no passwords | - | - |  |
| X-SUR-006 | Surface | Web sign-in sheet | onboarding and recovery | Homeserver | not needed | drop | no account provider | - | - |  |
| X-SUR-007 | Surface | QR sign-in screens | onboarding and recovery | Device | missing | adapt | Prism ID link; camera API with typed-code fallback | 2 | Scanner, code display and typed errors each have a start-over action |  |
| X-SUR-008 | Surface | Link new device screens | identity and devices | Device | missing | adapt | Prism ID link | 2 | The chooser shows a code to scan or opens the scanner |  |
| X-SUR-009 | Surface | Classic-app account card | onboarding and recovery | Homeserver | not needed | drop | no predecessor app | - | - |  |
| X-SUR-010 | Surface | Identity confirmation screen | encryption and verification | Device; Key backup / secret storage | undecided | adapt | two routes: another device or recovery kit | 1 | Only the routes available to this identity are shown |  |
| X-SUR-011 | Surface | Verification screen | encryption and verification | Verifying another user | undecided | adapt | user verification only; device case folded into link | 2 | The screen steps from request to compare to verified, with cancel at each step |  |
| X-SUR-012 | Surface | Identity confirmed screen | encryption and verification | none | not needed | keep | - | 1 | A success screen with one continue button |  |
| X-SUR-013 | Surface | Analytics prompt | onboarding and recovery | none | not needed | drop | no analytics | - | - |  |
| X-SUR-014 | Surface | Notification permission prompt | onboarding and recovery | none | not needed | adapt | browser permission; iOS needs the installed app | 1 | Enable triggers the browser prompt; not now skips |  |
| X-SUR-015 | Surface | Home tab bar | navigation and layout | none | not needed | adapt | bottom tabs on phones; left rail on desktop | 1 | Chats and spaces are one tap away at every width |  |
| X-SUR-016 | Surface | Chat list screen | navigation and layout | none | not needed | keep | - | 1 | The list shows skeleton rows, an empty state or rooms, plus an offline mark |  |
| X-SUR-017 | Surface | Chat row | navigation and layout | none | not needed | adapt | long-press on touch; right-click and hover on desktop | 1 | Tap opens the room; long-press or right-click opens the row menu |  |
| X-SUR-018 | Surface | Chat row menu | navigation and layout | none | not needed | adapt | no report-room entry | 1 | The row menu offers read state, favourite, details and leave |  |
| X-SUR-019 | Surface | Invite row and decline menu | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | An invite row has accept and decline |  |
| X-SUR-020 | Surface | Home banners | navigation and layout | none | not needed | adapt | recovery banner only | 1 | The recovery banner shows once and can be dismissed |  |
| X-SUR-021 | Surface | Avatar swipe (account switch) | navigation and layout | none | not needed | drop | follows multi-account | - | - |  |
| X-SUR-022 | Surface | Space filter sheet | spaces | Spaces | missing | keep | - | 2 | The space filter lists spaces with search and clear |  |
| X-SUR-023 | Surface | Search screen | search | none | not needed | keep | - | 1 | Search shows history, searching, results and no-results states |  |
| X-SUR-024 | Surface | Start chat screen | rooms and membership | Identity server | missing | adapt | no directory row; add by ID, link or QR | 1 | The start-chat screen lists contacts and the add-by-code action |  |
| X-SUR-025 | Surface | Start-DM confirmation sheet | rooms and membership | Room | missing | keep | - | 1 | A confirmation names the person before the chat is created |  |
| X-SUR-026 | Surface | Join-by-address sheet | rooms and membership | Homeserver | not needed | adapt | paste an invite link | 2 | The field validates the link inline before continue |  |
| X-SUR-027 | Surface | Create room screen | rooms and membership | Room | missing | adapt | no address field; parent space arrives in Phase 2 | 1 | The form validates the name and creates the room |  |
| X-SUR-028 | Surface | Avatar source sheet | media and attachments | none | not needed | adapt | file input with capture | 1 | The avatar sheet offers take photo, choose file and remove |  |
| X-SUR-029 | Surface | Invite people screen | rooms and membership | Membership and power levels | proved rule | adapt | contacts and pasted IDs | 1 | Selected people show as chips; existing members are marked |  |
| X-SUR-030 | Surface | Room directory screen | search | Homeserver | not needed | drop | no server directory | - | - |  |
| X-SUR-031 | Surface | Join room screen | rooms and membership | Room; Membership and power levels | missing | adapt | invited mode in Phase 1; request modes in Phase 2 | 1 | The screen shows room identity and the one action that fits my state |  |
| X-SUR-032 | Surface | Decline-and-block screen | moderation | Membership and power levels | proved rule | adapt | no report toggle | 2 | Decline with an optional block toggle |  |
| X-SUR-033 | Surface | Room screen | navigation and layout | Event | missing | adapt | banners arrive with their features | 1 | Header, timeline and composer fit a 320 px wide screen without overlap |  |
| X-SUR-034 | Surface | Timeline list | timeline and events | Event; Timeline order on screen | undecided | keep | - | 1 | The list stays anchored when older messages load above; 60 fps on long rooms |  |
| X-SUR-035 | Surface | Message bubble | timeline and events | none | not needed | keep | - | 1 | Own messages sit right, others left with avatar on the first of a group |  |
| X-SUR-036 | Surface | Swipe to reply | timeline and events | none | not needed | adapt | touch gesture; no haptics | 1 | Dragging a bubble sideways past the threshold starts a reply |  |
| X-SUR-037 | Surface | Long-press message menu | timeline and events | none | not needed | adapt | long-press on touch; right-click or hover bar on desktop; no translate | 1 | The menu shows only actions valid for that message and my role |  |
| X-SUR-038 | Surface | Double-tap / tap behaviours | timeline and events | none | not needed | keep | - | 1 | Tapping media opens the viewer; tapping a sender opens their card |  |
| X-SUR-039 | Surface | Reaction chips row | timeline and events | Relations | missing | keep | - | 1 | Chips show emoji and count, highlighted when mine |  |
| X-SUR-040 | Surface | Emoji picker sheet | timeline and events | none | not needed | keep | - | 1 | The picker has search, categories and recently used |  |
| X-SUR-041 | Surface | Reaction summary sheet | timeline and events | Relations | missing | keep | - | 1 | The summary lists people per emoji |  |
| X-SUR-042 | Surface | Read receipts row and sheet | timeline and events | Receipts | missing | keep | - | 1 | Stacked avatars open the full reader list |  |
| X-SUR-043 | Surface | Scroll-to-bottom button | timeline and events | none | not needed | keep | - | 1 | The button appears when scrolled up and returns to the latest message |  |
| X-SUR-044 | Surface | Floating date badge | timeline and events | none | not needed | keep | - | 2 | A date pill shows while scrolling |  |
| X-SUR-045 | Surface | Timeline item: text / emote / notice | timeline and events | Event | missing | keep | - | 1 | Formatted text renders; markup in a message body never executes |  |
| X-SUR-046 | Surface | Timeline item: image / video / sticker | media and attachments | Media repository | missing | adapt | stickers dropped | 1 | A thumbnail placeholder shows at once and sharpens when verified bytes arrive |  |
| X-SUR-047 | Surface | Timeline item: file / audio | media and attachments | Media repository | missing | keep | - | 1 | A file row shows name and size and downloads on tap |  |
| X-SUR-048 | Surface | Timeline item: voice message | media and attachments | Media repository | missing | keep | - | 2 | The voice bubble plays, scrubs and changes speed |  |
| X-SUR-049 | Surface | Timeline item: location and live location | media and attachments | Event | missing | adapt | static only; no map tiles | 2 | A location bubble shows coordinates and an open-in-maps action |  |
| X-SUR-050 | Surface | Timeline item: poll | timeline and events | Event | missing | keep | - | 2 | A poll bubble shows options, my choice and totals |  |
| X-SUR-051 | Surface | Timeline item: gallery | media and attachments | Event | missing | keep | - | 2 | A gallery bubble opens the viewer at the tapped item |  |
| X-SUR-052 | Surface | Timeline item: state and collapsed group | timeline and events | State event and resolution | proved rule | keep | - | 1 | State lines are small and centred; groups expand on tap |  |
| X-SUR-053 | Surface | Timeline item: placeholders | timeline and events | Olm/Megolm sessions; Redaction | missing | adapt | no scan-failed placeholder | 1 | Deleted, waiting-for-key and unsupported each have a distinct placeholder |  |
| X-SUR-054 | Surface | Timeline item: call | calls | 1:1 call signalling | proved rule | keep | - | 3 | A call item shows started, missed or declined |  |
| X-SUR-055 | Surface | Timeline separators | timeline and events | none | not needed | keep | - | 1 | Date dividers, unread line and loading rows render in place |  |
| X-SUR-056 | Surface | Reply quote and thread summary | threads | Relations | missing | keep | - | 1 | Reply quote in Phase 1 with loading and error states; thread chip in Phase 2 |  |
| X-SUR-057 | Surface | Typing indicator | timeline and events | Typing | missing | keep | - | 1 | The typing line collapses names when many are typing |  |
| X-SUR-058 | Surface | Pinned messages banner | timeline and events | State event and resolution | proved rule | keep | - | 2 | The banner shows the current pin with its position |  |
| X-SUR-059 | Surface | Pinned messages list | timeline and events | State event and resolution | proved rule | keep | - | 2 | The pin list has an empty state and the message menu |  |
| X-SUR-060 | Surface | Join-requests banner | moderation | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | The banner names requesters with accept and view |  |
| X-SUR-061 | Surface | Live-location banner | media and attachments | Event | missing | drop | follows live location | - | - |  |
| X-SUR-062 | Surface | Room footer warnings | encryption and verification | Verifying another user; Membership and power levels | undecided | adapt | cannot-send in Phase 1; identity warnings in Phase 2; no successor notice | 1 | A member without send permission sees a disabled composer with the reason |  |
| X-SUR-063 | Surface | Composer | composer | Event | missing | adapt | Enter sends on desktop; send button and keyboard-aware layout on phones | 1 | The composer grows with text and stays above the on-screen keyboard |  |
| X-SUR-064 | Surface | Formatting toolbar | composer | none | not needed | keep | - | 2 | The toolbar toggles each format on the selection |  |
| X-SUR-065 | Surface | Suggestion list | composer | Membership and power levels | proved rule | keep | - | 2 | The suggestion list filters as I type and inserts on select |  |
| X-SUR-066 | Surface | Attachment menu | composer | none | not needed | adapt | entries appear with their phase | 1 | The attach menu lists media, camera and file in Phase 1 |  |
| X-SUR-067 | Surface | Voice recording bar | composer | Media repository | missing | adapt | MediaRecorder; tap to record | 2 | The recording bar shows timer, waveform, cancel and send |  |
| X-SUR-068 | Surface | Upload preview screen | media and attachments | Media repository | missing | keep | - | 1 | The preview pages through picked items with a caption field and progress |  |
| X-SUR-069 | Surface | Selection bar | timeline and events | none | not needed | keep | - | 2 | Selection mode shows a count, cancel and forward |  |
| X-SUR-070 | Surface | Delete confirmation sheet | timeline and events | Redaction | missing | keep | - | 1 | Delete asks to confirm, with a reason field for moderators |  |
| X-SUR-071 | Surface | Send-failure dialog | timeline and events | Event | missing | keep | - | 1 | The failure dialog offers retry and remove |  |
| X-SUR-072 | Surface | Trust-failure sheet | encryption and verification | Verifying another user | undecided | keep | - | 2 | The sheet names the user and the problem with resolve and cancel |  |
| X-SUR-073 | Surface | Shield explanation dialog | encryption and verification | Verifying another user | undecided | keep | - | 2 | Tapping a warning mark explains it in one sentence |  |
| X-SUR-074 | Surface | Re-invite prompt | rooms and membership | Membership and power levels | proved rule | keep | - | 2 | Sending in a direct chat the other person left offers to re-invite |  |
| X-SUR-075 | Surface | Thread screen | threads | Relations | missing | keep | - | 2 | The thread view has the root on top and its own composer |  |
| X-SUR-076 | Surface | Thread list screen | threads | Relations | missing | keep | - | 2 | The thread list has rows, paging and an empty state |  |
| X-SUR-077 | Surface | Forward / room picker screen | timeline and events | none | not needed | keep | - | 2 | The room picker is searchable and multi-select |  |
| X-SUR-078 | Surface | Report message screen | moderation | Event | missing | adapt | sends to room moderators, not server admins | 2 | The report form has a reason field and a block toggle |  |
| X-SUR-079 | Surface | Poll form | timeline and events | Event | missing | keep | - | 2 | The poll form adds and removes options and warns on discard |  |
| X-SUR-080 | Surface | Poll history screen | timeline and events | Event | missing | keep | - | 2 | Poll history switches between ongoing and past with empty states |  |
| X-SUR-081 | Surface | Location picker | media and attachments | Event | missing | adapt | current position only; no map tiles | 2 | The picker shows the position's accuracy and a send action |  |
| X-SUR-082 | Surface | Location viewer | media and attachments | Event | missing | adapt | coordinates plus open-in-maps link | 2 | The viewer shows sender, time and coordinates |  |
| X-SUR-083 | Surface | Media viewer | media and attachments | Media repository | missing | adapt | pinch and swipe on touch; keys and wheel on desktop | 1 | The viewer zooms, pages and closes by gesture or Escape |  |
| X-SUR-084 | Surface | Media details sheet | media and attachments | Media repository | missing | keep | - | 2 | The details sheet shows sender, date, size, save, share and delete |  |
| X-SUR-085 | Surface | Media gallery screen | media and attachments | Media repository | missing | keep | - | 2 | The gallery groups by date and loads older items at the end |  |
| X-SUR-086 | Surface | Avatar preview | media and attachments | Media repository | missing | keep | - | 1 | Tapping an avatar shows it full size |  |
| X-SUR-087 | Surface | Room details screen | rooms and membership | State event and resolution | proved rule | adapt | rows for dropped features removed | 1 | Every row leads somewhere; none is a dead end |  |
| X-SUR-088 | Surface | Edit room details screen | rooms and membership | State event and resolution | proved rule | keep | - | 1 | Save enables on change; leaving with edits asks to discard |  |
| X-SUR-089 | Surface | Member list screen | rooms and membership | Membership and power levels | proved rule | keep | - | 1 | Search, role sections and pending invitees; banned tab in Phase 2 |  |
| X-SUR-090 | Surface | Member details / user profile screen | identity and devices | Membership and power levels; Verifying another user | undecided | keep | - | 1 | The card shows avatar, name, ID and actions that fit my role |  |
| X-SUR-091 | Surface | Member moderation sheet | moderation | Membership and power levels | proved rule | keep | - | 2 | The sheet offers profile, remove and ban with confirm and reason |  |
| X-SUR-092 | Surface | Roles and permissions screen | moderation | Membership and power levels | proved rule | keep | - | 2 | Rows for admins, moderators, permissions and reset |  |
| X-SUR-093 | Surface | Change roles screen | moderation | Membership and power levels | proved rule | keep | - | 2 | The member picker warns before promoting or transferring ownership |  |
| X-SUR-094 | Surface | Change permissions screen | moderation | Membership and power levels | proved rule | keep | - | 2 | Each action group has a role picker; save and discard work |  |
| X-SUR-095 | Surface | Security and privacy screen | rooms and membership | Membership and power levels (knock, restricted join: not modelled); State event and resolution | missing | adapt | no encryption switch, directory or address rows | 2 | Access and history are radio groups with save and discard |  |
| X-SUR-096 | Surface | Edit address screen | rooms and membership | Homeserver | not needed | drop | no room addresses | - | - |  |
| X-SUR-097 | Surface | Authorised spaces picker | spaces | Spaces; Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | A checklist of spaces whose members may join |  |
| X-SUR-098 | Surface | Room notification settings screen | notifications | Account data | missing | adapt | rule stored on the device | 1 | Use default or pick all, mentions only or mute |  |
| X-SUR-099 | Surface | Join requests list screen | moderation | Membership and power levels (knock, restricted join: not modelled) | missing | keep | - | 2 | Request cards with accept, decline and accept all, plus empty state |  |
| X-SUR-100 | Surface | Report room screen | moderation | Homeserver | not needed | drop | no server admins | - | - |  |
| X-SUR-101 | Surface | Spaces list screen | spaces | Spaces | missing | keep | - | 2 | The spaces list has a create action and an empty state |  |
| X-SUR-102 | Surface | Space screen | spaces | Spaces | missing | adapt | children listed from peers | 2 | The space view shows header, child rows and an overflow menu |  |
| X-SUR-103 | Surface | Add rooms to space screen | spaces | Spaces | missing | keep | - | 2 | A searchable multi-select of rooms with save progress |  |
| X-SUR-104 | Surface | Leave space screen | spaces | Spaces; Membership and power levels | missing | keep | - | 2 | Child rooms with select all, blocked rooms explained, confirm |  |
| X-SUR-105 | Surface | Space settings screen | spaces | Spaces | missing | keep | - | 2 | Rows to details, access, roles, members and leave |  |
| X-SUR-106 | Surface | Parent-space selector sheet | spaces | Spaces | missing | keep | - | 2 | A sheet to choose a new room's parent space |  |
| X-SUR-107 | Surface | Settings screen | settings | none | not needed | adapt | centred popup on desktop, full screen on phones; fewer rows | 1 | Settings open and close without losing the current room |  |
| X-SUR-108 | Surface | Edit profile screen | identity and devices | Global profile | missing | keep | - | 1 | Avatar and name fields with save, discard and error states |  |
| X-SUR-109 | Surface | Status picker sheet | identity and devices | Presence | missing | keep | - | 2 | A sheet with presets, custom text and clear |  |
| X-SUR-110 | Surface | Notification settings screen | notifications | Account data | missing | adapt | no provider row or server rule repair | 1 | Permission warning, master switch and default rows |  |
| X-SUR-111 | Surface | Default notification mode screen | notifications | Account data | missing | adapt | rule stored on the device | 1 | A radio for all messages or mentions, plus rooms with custom settings |  |
| X-SUR-112 | Surface | Key storage screen | onboarding and recovery | Key backup / secret storage | undecided | adapt | recovery kit and guardians | 2 | The screen shows recovery state with set up or change |  |
| X-SUR-113 | Surface | Recovery key screen | onboarding and recovery | Key backup / secret storage | undecided | adapt | kit shown locally with copy and save | 1 | The kit is shown once with a confirm step; entry validates inline |  |
| X-SUR-114 | Surface | Turn-off key storage screen | onboarding and recovery | Key backup / secret storage | undecided | drop | no server-side key storage | - | - |  |
| X-SUR-115 | Surface | Identity reset screens | onboarding and recovery | User ID | missing | adapt | warning and confirm only | 2 | A consequence list and a destructive confirm |  |
| X-SUR-116 | Surface | Sign-out confirmation | identity and devices | Device; Key backup / secret storage | undecided | adapt | two modes: kit saved and kit not saved | 1 | Sign-out without a saved kit offers to save it first |  |
| X-SUR-117 | Surface | Deactivate account screen | identity and devices | User ID | missing | adapt | erase identity; no password field | 2 | A consequence list and a destructive confirm |  |
| X-SUR-118 | Surface | Blocked users screen | moderation | Account data | missing | keep | - | 2 | Blocked users with unblock and an empty state |  |
| X-SUR-119 | Surface | Moderation and safety screen | moderation | Account data | missing | keep | - | 2 | A radio for media previews and a row to blocked users |  |
| X-SUR-120 | Surface | Small settings screens | settings | none | not needed | adapt | upload quality, about and labs only | 2 | Each is a short list of switches or links |  |
| X-SUR-121 | Surface | Developer options screen | settings | none | not needed | adapt | minimum set | 2 | A short list of switches with confirm on bulk actions |  |
| X-SUR-122 | Surface | Bug report screen | settings | none | not needed | adapt | builds a local log bundle to download | 2 | Description field and include-logs toggle produce a file |  |
| X-SUR-123 | Surface | Log viewer | settings | none | not needed | drop | lean; log export covers it | - | - |  |
| X-SUR-124 | Surface | App lock screen | settings | none | not needed | adapt | WebAuthn prompt or passphrase field | 2 | The lock covers all content until unlocked |  |
| X-SUR-125 | Surface | App lock setup screens | settings | none | not needed | adapt | WebAuthn registration or passphrase | 2 | Set, change and remove the lock, with mismatch errors |  |
| X-SUR-126 | Surface | Privacy cover | settings | none | not needed | adapt | content hidden on page hide; best effort in browsers | 2 | Switching away hides chat content in the task switcher where the browser allows |  |
| X-SUR-127 | Surface | Account picker | identity and devices | User ID | missing | drop | follows multi-account | - | - |  |
| X-SUR-128 | Surface | Signed-out screen | identity and devices | Device | missing | adapt | shown when this device is revoked | 2 | A revoked device explains what happened and offers start again |  |
| X-SUR-129 | Surface | Notification troubleshoot screens | notifications | Push gateway | undecided | drop | push-provider specific | - | - |  |
| X-SUR-130 | Surface | System notification | notifications | none; Push gateway | undecided | adapt | Notifications API; closed-app delivery undecided | 1 | A notification shows sender, room and preview, grouped per room |  |
| X-SUR-131 | Surface | Call screen (WebView host) | calls | Call media / group calls | undecided | adapt | in-app call view; no WebView | 3 | The call view handles permission prompts and load errors |  |
| X-SUR-132 | Surface | Incoming call UI | calls | 1:1 call signalling | proved rule | adapt | in-app ring screen plus a notification | 3 | Caller name with accept and decline, on phone and desktop widths |  |
| X-SUR-133 | Surface | Ongoing-call affordances | calls | 1:1 call signalling | proved rule | adapt | header join button, row marker and tab-title mark | 3 | An active call is visible from the chat list and the room |  |
| X-SUR-134 | Surface | Picture-in-picture tile | calls | none | not needed | adapt | Document Picture-in-Picture | 3 | The floating tile has return and hang up |  |
| X-SUR-135 | Surface | Native call screen | calls | Call media / group calls | undecided | drop | experimental and native only | - | - |  |
| X-SUR-136 | Surface | In-call view (call app) | calls | none | not needed | keep | - | 3 | Header, tiles and footer; controls hide on tap in full view |  |
| X-SUR-137 | Surface | Participant tile | calls | Call media / group calls | undecided | keep | - | 3 | A tile shows video or avatar, name, mute and speaking state |  |
| X-SUR-138 | Surface | Call footer | calls | none | not needed | keep | - | 3 | Footer with mic, camera, screen share, layout and hang up |  |
| X-SUR-139 | Surface | Ringing state in call | calls | 1:1 call signalling | proved rule | keep | - | 3 | The caller sees ringing with ring-back sound until answer, decline or timeout |  |
| X-SUR-140 | Surface | Earpiece overlay | calls | none | not needed | drop | browsers cannot route audio to the earpiece | - | - |  |
| X-SUR-141 | Surface | Call lobby | calls | none | not needed | keep | - | 3 | Self preview, mic meter, device toggles and join |  |
| X-SUR-142 | Surface | Call settings dialog | calls | none | not needed | adapt | devices and preferences only | 3 | Camera, microphone and output can be chosen mid-call |  |
| X-SUR-143 | Surface | Reactions overlay and hand indicator | calls | Relations | missing | keep | - | 3 | Reactions float over the call; raised hands are ordered |  |
| X-SUR-144 | Surface | Call error and ended views | calls | none | not needed | adapt | no rating or feedback | 3 | A typed error view offers retry or close; reconnecting shows a banner |  |
| X-SUR-145 | Surface | Call invite dialog | calls | none | not needed | drop | standalone only; room invite covers it | - | - |  |
| X-SUR-146 | Surface | Standalone call home | calls | Homeserver | not needed | drop | no separate call site | - | - |  |
| X-SUR-147 | Surface | Share-in room picker | media and attachments | none | not needed | adapt | Web Share Target | 2 | The room picker opens when content is shared in |  |
| X-SUR-148 | Surface | Address-resolving screen | rooms and membership | Homeserver | not needed | drop | no address lookup | - | - |  |
| X-SUR-149 | Surface | Global indicators | navigation and layout | none | not needed | keep | - | 1 | Toasts, loading overlays and confirm dialogs look the same everywhere |  |
| X-SUR-150 | Surface | Wide-screen split layout | navigation and layout | none | not needed | adapt | three panes on desktop, two on tablet, one on phones | 1 | From 320 px to ultrawide there is no horizontal scroll and no dead pane |  |
| X-SUR-151 | Surface | Event debug screen | settings | Event | missing | keep | - | 2 | The debug view shows an event's address, kind and fields |  |
| X-SUR-152 | Surface | Licences screens | settings | none | not needed | keep | - | 1 | Licences are listed and readable |  |
