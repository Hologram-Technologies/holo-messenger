# Phase 1 interface coverage

Scope: the 227 Phase 1 items a person can see or use (features, journeys and surfaces; capabilities are left out), judged against `client/index.html` at the commit that adds this file, on 2026-11-18.

How it was judged: each item was read against the page's code and given the lower verdict when torn. The page was not run for this file. The page uses sample data: nothing is stored, encrypted or sent, and that does not count against an item. Items marked adapt in the inventory were judged on their adapted intent.

- built: the behaviour is present on sample data, with its main states.
- partly: some of it is present; the last column says what is absent.
- not built: nothing in the page does this.

| Domain | items | built | partly | not built |
|---|---|---|---|---|
| identity and devices | 10 | 7 | 3 | 0 |
| onboarding and recovery | 15 | 11 | 2 | 2 |
| rooms and membership | 28 | 11 | 17 | 0 |
| encryption and verification | 16 | 12 | 4 | 0 |
| moderation | 2 | 2 | 0 | 0 |
| timeline and events | 34 | 13 | 21 | 0 |
| composer | 24 | 10 | 14 | 0 |
| media and attachments | 16 | 6 | 9 | 1 |
| search | 12 | 6 | 6 | 0 |
| notifications | 11 | 5 | 6 | 0 |
| settings | 18 | 9 | 9 | 0 |
| navigation and layout | 41 | 16 | 22 | 3 |
| Total | 227 | 108 | 113 | 6 |

| HM ID | domain | name | verdict | where in the page | absent |
|---|---|---|---|---|---|
| HM-FEA-011 | identity and devices | User profile | partly | profile() card opens from names inside a room | no way to open the card from a link or from search |
| HM-FEA-012 | identity and devices | Edit profile | built | settings("account"): choose picture, name field, Save name | - |
| HM-JRN-001 | identity and devices | Sign out | built | signOut() "You have no recovery kit" dialog, Save a kit first | - |
| HM-JRN-003 | identity and devices | Session opened in another tab | built | lockScreen("ask"/"moved") over BroadcastChannel "hm-lock", Use it here | - |
| HM-SUR-002 | identity and devices | Session lock screens | built | lockScreen() shows take-over and moved-tab screens | - |
| HM-SUR-005 | identity and devices | User info card | partly | profile() footer: Message, Mention, Verify, Block | no moderation actions, role change, share or invite on the card |
| HM-SUR-009 | identity and devices | Sign-out dialog | built | signOut() dialog warns of no kit, offers Save a kit first | - |
| HM-SUR-011 | identity and devices | Clear data confirm dialog | built | signOut() wipe: "Remove everything from this device?" confirm | - |
| HM-SUR-012 | identity and devices | User info sub-views | built | profile(): avatar, name, identity, verified note, Message, Mention, Block | - |
| HM-SUR-013 | identity and devices | Edit profile screen | partly | settings("account"): picture, name, read-only identity, Save name, too-large alert | no discard-changes warning; picture comes from a file only, no source menu |
| HM-FEA-018 | onboarding and recovery | Recovery prompts | built | drawList() #homeBanner "Save a recovery kit", Set up, Not now | - |
| HM-JRN-008 | onboarding and recovery | First launch | partly | start code: too-old page, onboard(0), or chat list | no screen when browser storage is unavailable |
| HM-JRN-009 | onboarding and recovery | Register | built | onboard(): Create my identity, name, kit offer, chat list | - |
| HM-JRN-010 | onboarding and recovery | First-time encryption setup after register | built | onboard(2) "Save a recovery kit" with Not now | - |
| HM-JRN-011 | onboarding and recovery | Sign in with password | built | restore() kit field, kitState() error text, Restore button | - |
| HM-JRN-016 | onboarding and recovery | Set up recovery | built | createKit(): kit shown, Copy, Save as a file, Confirm your kit | - |
| HM-JRN-023 | onboarding and recovery | Post-login onboarding | partly | onboard(2) kit offer; toast "Turn on notifications?" with Not now | notification offer is not an onboarding step; shows only when a message arrives |
| HM-JRN-024 | onboarding and recovery | Verify by recovery key | built | restore(): paste kit, inline "not a valid kit", confirmed() | - |
| HM-SUR-015 | onboarding and recovery | Loading and splash screens | not built | no spinner or splash anywhere in the page | no starting spinner or slow-start splash |
| HM-SUR-016 | onboarding and recovery | Fatal error page | built | "This browser is too old" page, Try again; error dialog Reload | - |
| HM-SUR-017 | onboarding and recovery | Welcome page | built | onboard(0): Create my identity, I have a recovery kit | - |
| HM-SUR-018 | onboarding and recovery | Auth page frame | built | stage() frame shared by all first-run screens | - |
| HM-SUR-024 | onboarding and recovery | Encryption setup after registration | not built | onboard(1) sets identity at once, no progress shown | no progress view and no error with retry while the identity is made |
| HM-SUR-028 | onboarding and recovery | Session restore error dialog | built | userMenu "rerr" dialog: Clear this device, Try again | - |
| HM-SUR-029 | onboarding and recovery | Storage evicted dialog | built | userMenu "evict" dialog: browser removed data, Restore from a kit | - |
| HM-FEA-021 | rooms and membership | Direct chats | partly | newChat() person list, startDm() opens chat labelled Encrypted | no small group chat started with several people from search |
| HM-FEA-037 | rooms and membership | Chat list | built | drawList() rows: avatar, name, preview, time, count, @ mark, mute | - |
| HM-FEA-038 | rooms and membership | Mark read / unread | built | contextmenu "Mark as read/unread"; details "Mark as unread" | - |
| HM-FEA-039 | rooms and membership | Invites in the list | built | drawList() Invitations rows: "X invited you", Accept, Decline | - |
| HM-FEA-041 | rooms and membership | Start a chat | partly | newChat(): Find a person, Or create a room | no add by ID, link, code or QR |
| HM-FEA-042 | rooms and membership | Create room | partly | newChat() Room name + Create; Invite people button after | no topic, picture or access choice when creating |
| HM-FEA-044 | rooms and membership | Room details | partly | drawPanel(): name, topic, notify levels, people, invite, leave | no media, pins, security, roles or report sections; no share link |
| HM-FEA-045 | rooms and membership | Edit room details | partly | editRoom() "Room settings": name, topic, Save | no room picture change; no warning on leaving with unsaved changes |
| HM-FEA-046 | rooms and membership | Member list | partly | drawPanel() people list sorted by role with role label, Invite people | no search, no role sections, no banned list |
| HM-FEA-047 | rooms and membership | Member profile | built | profile(): avatar, name, identity, role, verified note, Message, Block, Verify | - |
| HM-FEA-048 | rooms and membership | Invite people | partly | invitePeople() multi-select from contacts, "Invite N people" | no field to paste an ID; no search in the picker |
| HM-FEA-050 | rooms and membership | Leave room | built | data-leave click: confirmDlg "Leave <room>?" | - |
| HM-JRN-025 | rooms and membership | Start a direct chat | partly | newChat() pick person, startDm() confirm, chat opens with focus | cannot start a chat from a link or QR |
| HM-JRN-026 | rooms and membership | Create a room | partly | newChat() create(): room made and opened, shown as Encrypted | no access choice or topic; no creating state |
| HM-JRN-027 | rooms and membership | Invite people to a room | partly | sendInvites() "k of n" progress, not-reached list, Invite anyway | cannot invite by pasted ID, link or QR |
| HM-JRN-028 | rooms and membership | Receive and answer an invite | partly | Invitations rows Accept/Decline; previewRoom() shows inviter | no invite badge; no decline-and-block; no joining or failure states |
| HM-JRN-032 | rooms and membership | Leave a room | built | data-leave: only-admin and private-room warnings, room removed | - |
| HM-SUR-035 | rooms and membership | Room preview bar | partly | previewRoom() invite view with Join and Decline | no joining, rejected or error states |
| HM-SUR-036 | rooms and membership | Room preview card | built | previewRoom(): avatar, topic, "N people", Join | - |
| HM-SUR-040 | rooms and membership | Room info card | partly | drawPanel(): name, topic, people, "Edit name and topic", invite, leave | no files, pins, search or favourite links; settings link only for moderators |
| HM-SUR-041 | rooms and membership | Member list | partly | drawPanel() "N people" list and Invited group, Invite people | no search filter; invited list has no count; no empty-search state |
| HM-SUR-042 | rooms and membership | Member tile | built | drawPanel() .mem: avatar, name, role, trust lock icon, Invited label | - |
| HM-SUR-047 | rooms and membership | Create room dialog | partly | newChat() Room name field, Create, empty name refused | no topic or access fields; not a separate dialog |
| HM-SUR-048 | rooms and membership | Invite and new-chat dialog | partly | invitePeople() chips #ic, pick list, Invite; newChat() person search | invite picker has no typing, search or pasted list |
| HM-SUR-049 | rooms and membership | Invite progress and invite-anyway dialogs | built | sendInvites(): "k of n", "Some people were not invited", Invite anyway | - |
| HM-SUR-051 | rooms and membership | Room topic dialog | partly | drawPanel() hero shows full topic with "Edit name and topic" | no separate topic dialog |
| HM-SUR-054 | rooms and membership | Invite row and decline menu | built | drawList() .inv row with Accept and Decline | - |
| HM-SUR-055 | rooms and membership | Start-DM confirmation sheet | built | startDm() confirmDlg "Start a chat with <name>?" | - |
| HM-FEA-121 | encryption and verification | Encryption by default | built | drawRoom() "Encrypted" on every chat; no switch to turn off | - |
| HM-FEA-122 | encryption and verification | Verification | built | verifyFlow(): Compare pictures or Scan a code, for people and devices | - |
| HM-FEA-123 | encryption and verification | Recovery | built | restore() valid kit leads to confirmed() and chat list | - |
| HM-JRN-040 | encryption and verification | Verify own session by emoji | built | verifyFlow() wait, emoji, done, cancel; "They do not match" | - |
| HM-JRN-041 | encryption and verification | Verify own session by QR | partly | verifyFlow("qr") shows sample code, "The other side scanned it", Cancel | no scanning side; "Scan a code" only shows a code |
| HM-JRN-046 | encryption and verification | Confirm identity on a new device | built | restore(): kit entry or "Confirm from another device", then confirmed() | - |
| HM-SUR-119 | encryption and verification | Encryption and verification card | built | verifyFlow() steps start, wait, emoji, done, cancel | - |
| HM-SUR-121 | encryption and verification | Recovery key entry dialog | partly | restore() #kit with live kitState() messages | no reset link; no kit file upload |
| HM-SUR-122 | encryption and verification | Create recovery dialog | built | createKit(): kit, Copy, Save as a file, re-entry to confirm | - |
| HM-SUR-129 | encryption and verification | Verification request dialog and incoming verification | built | incomingVerify() toast Accept opens verifyFlow() dialog outside rooms | - |
| HM-SUR-130 | encryption and verification | Emoji compare, complete and cancelled views | built | verifyFlow() emoji with match/no match, Verified, cancelled with reason | - |
| HM-SUR-132 | encryption and verification | Toast: verification request | built | incomingVerify() toast "Verification request" with Accept, Decline | - |
| HM-SUR-133 | encryption and verification | Toast: encryption reminders | partly | #homeBanner "Save a recovery kit" with Not now | no verify-this-device reminder; kit reminder is a banner, not a toast |
| HM-SUR-135 | encryption and verification | Identity confirmation screen | partly | restore(): Restore, Confirm from another device, Back | both routes always shown, not only those available; no sign-out |
| HM-SUR-137 | encryption and verification | Identity confirmed screen | built | confirmed() "Identity confirmed." with one Continue | - |
| HM-SUR-138 | encryption and verification | Room footer warnings | built | drawRoom(): "Only moderators can send messages in this room." (Reading group) | - |
| HM-FEA-237 | moderation | Message deletion | built | messageAction("remove": own or moderator), deleteDlg() | - |
| HM-SUR-271 | moderation | Delete message dialogs | built | deleteDlg() "Delete this message?" with Reason field, Delete | - |
| HM-FEA-055 | timeline and events | Reactions | partly | picker() adds a reaction; whoReacted() lists people | no separate quick-reaction row; one small picker serves both |
| HM-FEA-056 | timeline and events | Replies | partly | quote button with data-jump scrolls to the original | quoted chain cannot be expanded; jump fails if original is not loaded |
| HM-FEA-057 | timeline and events | Read receipts and markers | built | rowAfter reader avatars; "New" line; Shift+PageUp jumps to first unread | - |
| HM-FEA-072 | timeline and events | Setting: show read receipts | built | "Show read receipts" switch; rowAfter checks S.set.showReceipts | - |
| HM-FEA-073 | timeline and events | Setting: send read receipts | partly | "Send read receipts" switch in Preferences | switch changes nothing a user can see |
| HM-FEA-074 | timeline and events | Setting: timestamps | built | "12-hour clock" and "Always show times" switches; clock(), .stamps | - |
| HM-FEA-084 | timeline and events | Who reacted | built | whoReacted() dialog from the message menu "Reactions" | - |
| HM-FEA-085 | timeline and events | Delivery status | built | status line: Sending, Sent, Read, "Not sent. Try again · Remove" | - |
| HM-FEA-086 | timeline and events | Unread marker and jump | partly | "New" line drawn at first unread in drawTimeline | no button to jump to unread; no new-message mark on "Jump to latest" |
| HM-FEA-091 | timeline and events | Copy text, caption, link | built | act "copy" and msgMenu "Copy text", "Copy link" | - |
| HM-FEA-093 | timeline and events | Collapsed room changes | partly | flush() folds 3+ joins into "N people joined · show" | leaves and setting changes never fold; cannot fold again |
| HM-FEA-094 | timeline and events | Link safety prompt | built | a[data-ask] click opens "Open this link?" dialog | - |
| HM-SUR-060 | timeline and events | Room view | partly | drawRoom header, banner, timeline, composer; previewRoom invite dialog | no loading state, no room error state; invite is only a dialog |
| HM-SUR-061 | timeline and events | Timeline | partly | drawTimeline window, day headers, "New" line, #toEnd button | no loading or error state, no jump-to-unread button; tested at 20,000 only |
| HM-SUR-062 | timeline and events | Event tile | partly | .msg row: avatar, name, time, body, reactions, status, receipts | no deleted-message placeholder, no per-message lock, no thread summary |
| HM-SUR-063 | timeline and events | Message action bar | built | .acts toolbar: React, Reply, Edit, Copy, More, Delete | - |
| HM-SUR-064 | timeline and events | Message context menu | partly | msgMenu(): Reply, Edit, Copy text, Copy link, Reactions, History, Delete | no react, forward, pin, quote or report entries |
| HM-SUR-065 | timeline and events | Text message body | partly | rich(): links, mention chips, code, bold, italic; "edited" mark | no spoilers, no emote or notice styles |
| HM-SUR-067 | timeline and events | Undecryptable, hidden, redacted and error bodies | partly | UNDEC text "this device did not receive its key" | deleted and blocked messages vanish with no placeholder; no error body |
| HM-SUR-068 | timeline and events | State and system event tiles | partly | sysText(): joined, left, invited rows | no rows for name or topic changes, encryption, verification |
| HM-SUR-069 | timeline and events | Event summaries | built | "N people joined · show" button, data-expand opens the run | - |
| HM-SUR-070 | timeline and events | New room intro | partly | .intro tile: name, topic, encryption note, "Invite people" | does not say who created the room; no topic prompt |
| HM-SUR-071 | timeline and events | Date separator | built | .day header per day from dayName() | - |
| HM-SUR-072 | timeline and events | Reply chain and reply preview | partly | .quote above message; drawCtx "Replying to" above composer | quoted parent does not expand |
| HM-SUR-073 | timeline and events | Reactions row and picker | partly | .rx chips with counts; picker() adds a reaction | no add button in the row, no name tooltips, no show-all |
| HM-SUR-074 | timeline and events | Read receipts group | partly | .rcpt stacked avatars, "Read by" dialog, Sent and Sending marks | overflow count needs four readers; sample rooms normally give three |
| HM-SUR-076 | timeline and events | Jump to bottom and unread bars | partly | #toEnd "Jump to latest" button | no unread count on it; no bar to jump to unread or mark read |
| HM-SUR-078 | timeline and events | Room status bar | partly | #banner "No connection. N messages will send when you are back" | no retry-all or delete-all for unsent messages; retry is per message |
| HM-SUR-088 | timeline and events | Shortcut: timeline scrolling | built | keydown: PageUp, PageDown, Ctrl+Home, Ctrl+End on #tl | - |
| HM-SUR-089 | timeline and events | Shortcut: read marker | built | keydown: Escape draws latest; Shift+PageUp jumps to oldest unread | - |
| HM-SUR-091 | timeline and events | Swipe to reply | built | touchstart, touchmove, touchend: 64 px drag clicks Reply | - |
| HM-SUR-092 | timeline and events | Double-tap / tap behaviours | partly | data-view opens viewer; data-user opens profile; data-jump jumps | tapping the send status or the lock explains nothing |
| HM-SUR-093 | timeline and events | Reaction summary sheet | partly | whoReacted() groups people under each emoji | no tabs per emoji and no reaction times |
| HM-SUR-096 | timeline and events | Send-failure dialog | partly | inline "Not sent. Try again · Remove" on the message | no dialog and no explanation of why the send failed |
| HM-FEA-095 | composer | Message editing | built | act "edit" then send(); .ed click opens histDlg() | - |
| HM-FEA-096 | composer | Typing notifications | built | #typing row "Name is typing…" set in deliver() | - |
| HM-FEA-097 | composer | Mentions and pills | partly | suggest() "@" list; rich() .pill chip; .msg.hl highlight | no room mention and no mention of everyone |
| HM-FEA-098 | composer | Emoji picker | partly | picker(): search box, "Recent" row, 24 emoji | no categories and no skin tones |
| HM-FEA-099 | composer | Formatting | partly | rich() renders bold, italic, code, named links; Ctrl+B, I, E | no format bar on selection; no strikethrough, quote or lists |
| HM-FEA-105 | composer | Setting: modifier+Enter to send | built | "Send with Ctrl Enter" switch; enterAction() in keydown | - |
| HM-FEA-110 | composer | Setting: typing notifications | partly | "Send typing notices" switch in Preferences | switch changes nothing visible; no switch to hide others' typing |
| HM-FEA-119 | composer | Draft restore | partly | saveDraft() and S.drafts restore text per chat | reply target is dropped on reopening; openRoom clears S.mode |
| HM-JRN-038 | composer | Send a message | built | send(), deliver(): Sending, Sent, Read; failed row; read-only composer | - |
| HM-JRN-039 | composer | Edit or delete own message | partly | edit in composer with cancel; deleteDlg() with optional reason | edit is not in place of the message; it uses the main box |
| HM-SUR-097 | composer | Typing indicator row | partly | #typing row shows the first name of who is typing | no avatars in the typing row |
| HM-SUR-098 | composer | Message composer | built | #comp: attach, textarea, emoji, send; ".ro" only-moderators notice | - |
| HM-SUR-099 | composer | Plain composer editor | partly | textarea with suggest() popup for people and emoji | no format bar on selection; mentions stay plain text while typing |
| HM-SUR-101 | composer | Edit composer | partly | "Editing your message" strip above composer, cancel button, Esc | message does not turn into an editor; no save button of its own |
| HM-SUR-102 | composer | Autocomplete popup | partly | #pop list for "@" people and ":" emoji; arrow keys | no rooms, commands or room mention; no grouping by kind |
| HM-SUR-104 | composer | Emoji picker | partly | picker(): search and recents | no categories, no skin tone, no preview |
| HM-SUR-106 | composer | Shortcut: send and new line | built | keydown Enter uses enterAction(); Shift+Enter leaves a new line | - |
| HM-SUR-107 | composer | Shortcut: formatting | partly | keydown wraps selection for Ctrl+B, Ctrl+I, Ctrl+E | no quote or link shortcut; Ctrl+Shift+L hides the chat list instead |
| HM-SUR-108 | composer | Shortcut: undo and redo | partly | plain textarea #ta keeps the browser's own undo and redo | no code for it; scripted edits (formatting, completions) may not undo |
| HM-SUR-109 | composer | Shortcut: composer cursor | built | textarea #ta; timeline Ctrl+Home/End skipped while typing | - |
| HM-SUR-110 | composer | Shortcut: cancel reply or edit | built | keydown Escape in #ta calls cancelMode() | - |
| HM-SUR-111 | composer | Shortcut: edit previous or next message | partly | ArrowUp in empty #ta starts editing the last own message | cannot step to earlier messages or back down with Down |
| HM-SUR-114 | composer | Shortcut: autocomplete | built | keydown: Enter and Tab complete(), arrows move, Escape closes #pop | - |
| HM-SUR-116 | composer | Attachment menu | built | attachMenu(): "Photo or video", "Take a photo", "File" | - |
| HM-FEA-138 | media and attachments | File and media sharing | built | previewSend() confirm; img, rowMedia video, audio, file download link | - |
| HM-FEA-139 | media and attachments | Image viewer | partly | viewer(): zoom in, zoom out, rotate, download link | not full screen; no jump to message; no menu |
| HM-FEA-145 | media and attachments | Attach photo or video from library | built | inMedia multiple picker then previewSend() with caption field | - |
| HM-FEA-146 | media and attachments | Camera capture | partly | inCam input with capture attribute feeds previewSend() | photo only, no video; desktop gets a file picker, not a camera |
| HM-FEA-147 | media and attachments | Paste or drop media | built | paste and drop listeners call previewSend() | - |
| HM-FEA-148 | media and attachments | Captions | partly | #cap caption field in previewSend(); Edit changes it later | caption cannot be removed after sending; empty text will not save |
| HM-JRN-050 | media and attachments | Send a file or image | partly | previewSend() confirm, over-25 MB notice, failed row with retry | no progress bar and no cancel while sending |
| HM-SUR-141 | media and attachments | Image, video, file and audio bodies | partly | img button, video and audio players, file download link | no placeholder, no hidden-until-click, no error state for media |
| HM-SUR-146 | media and attachments | Upload bar | not built | none; a sending file only shows "Sending" on the message | no bar with name, progress, remaining count or cancel |
| HM-SUR-147 | media and attachments | File drop target | built | #drop "Drop to send" overlay shown on dragover | - |
| HM-SUR-153 | media and attachments | Upload confirm and failure dialogs | built | previewSend(): each file listed, "Send N", too-large notice | - |
| HM-SUR-154 | media and attachments | Image viewer overlay | partly | viewer(): zoom, rotate, download, sender and time in header | buttons only; no wheel, keys, pinch or swipe; no menu |
| HM-SUR-155 | media and attachments | Shortcut: upload file | built | keydown Ctrl+Shift+U clicks the #file input | - |
| HM-SUR-156 | media and attachments | Avatar source sheet | partly | Profile settings: "Choose a picture" and "Remove" buttons | no take-photo choice, no sheet; no room picture at all |
| HM-SUR-157 | media and attachments | Timeline item: image / video / sticker | partly | img thumbnail, video player, caption in body below | no placeholder before load, no hidden-media state, no play overlay |
| HM-SUR-161 | media and attachments | Avatar preview | partly | data-avbig in profile card opens a large picture dialog | room pictures cannot be opened; not reachable from timeline avatars directly |
| HM-FEA-167 | search | Message search | built | searchDlg: this chat or all chats, snippets, click jumps to message | - |
| HM-FEA-168 | search | Encrypted message search (desktop) | built | Settings, Encryption tab: "Search index" count with Rebuild button | - |
| HM-FEA-169 | search | Quick switcher (spotlight) | partly | switcher (Ctrl K) filters chats by name, labels Person or Room | people without an existing chat are not found; no hand-off to message search |
| HM-FEA-172 | search | Setting: message search index | built | data-rebuild button shows "Rebuilding" then "Rebuilt just now" | - |
| HM-FEA-173 | search | Room list search | built | #filter input redraws drawList on each keystroke | - |
| HM-JRN-060 | search | Search messages | partly | searchDlg: type, scope switch, count, results, jump, no-results text | no paging past 30 results; no searching or error state |
| HM-SUR-181 | search | Room list search bar | partly | #filter bar shows a "Ctrl K" hint beside the filter box | clicking the bar does not open the switcher; it only filters |
| HM-SUR-182 | search | Room search view | partly | searchDlg results with context, scope switch, count, "No messages match" | no searching state, no error state, no paging |
| HM-SUR-183 | search | Quick switcher dialog | partly | switcher shows "Recent" list first, typing filters chats | "Recent" is by latest message, not visits; people without chats missing; no loading state |
| HM-SUR-184 | search | Search index dialogs | partly | Encryption tab row: messages indexed count and Rebuild | no size on disk, no chat count, no confirm before reset |
| HM-SUR-185 | search | Shortcut: search in room | built | keydown mod+F calls searchDlg | - |
| HM-SUR-186 | search | Shortcut: quick switcher | built | keydown mod+K calls switcher | - |
| HM-FEA-174 | notifications | Notification rules | partly | Notifications tab: master switch, default level, sound switches | no keyword or invite rule |
| HM-FEA-179 | notifications | Setting: desktop notifications | built | switches notify, showText, sound in Notifications tab; used by toast | - |
| HM-FEA-181 | notifications | Per-room notifications | partly | Details panel "Notify me about" Everything, Mentions, Nothing; mute silences | no "follow default" choice |
| HM-JRN-061 | notifications | Change notification level for a room | partly | data-level buttons in Details and room settings apply at once | no default choice, not in chat right-click menu, no failure and revert |
| HM-JRN-062 | notifications | Enable desktop notifications | built | toast "Turn on notifications?", askNotify asks browser, explains a block | - |
| HM-JRN-063 | notifications | Open a notification | built | toast and Notification onclick: focus, openRoom, close | - |
| HM-SUR-190 | notifications | Room notification menu | partly | Details panel segment: Everything, Mentions, Nothing | no Default option |
| HM-SUR-191 | notifications | Toast: desktop notifications prompt | built | toastMsg "Turn on notifications?" with Turn on and Not now | - |
| HM-SUR-192 | notifications | Notification badges | partly | drawList: count badge, "@" mention badge, mute icon, Invitations section | no dot mark, no unsent mark, no invite badge |
| HM-SUR-193 | notifications | Default notification mode screen | partly | Notifications tab: "New chats notify me about" Everything or Mentions | no list of chats with custom levels |
| HM-SUR-195 | notifications | System notification | built | toast wrapper: new Notification with sender, room, body, tag per room | - |
| HM-FEA-207 | settings | Themes and custom themes | built | Appearance tab: System, Light, Dark and High contrast switch | - |
| HM-FEA-211 | settings | Setting: font size and custom size | partly | A- and A+ buttons set --fs from 12 to 24 | only message text and the message box scale; no exact value entry |
| HM-FEA-213 | settings | Setting: theme and match system | built | data-theme2 buttons, applySet saves to hm-set; System follows device | - |
| HM-FEA-229 | settings | Settings home | partly | settings tabs: Profile, Appearance, Notifications, Preferences, Encryption, Keyboard, About | sign out is only in the user menu; no link-a-device row |
| HM-FEA-233 | settings | About and legal | partly | About tab: "Holo Messenger 0.1.0" and a licence line | no content address of the build; no policy links |
| HM-SUR-223 | settings | User settings dialog | built | settings(): one dialog with seven tabs | - |
| HM-SUR-224 | settings | Settings tab: Account | built | Profile tab: Save name, Choose a picture, Copy identity | - |
| HM-SUR-226 | settings | Settings tab: Appearance | built | Appearance tab: theme and text size apply at once via applySet | - |
| HM-SUR-227 | settings | Settings tab: Notifications | partly | Notifications tab: master switch, system notices, default level, sound | no mention rule; no mark all read |
| HM-SUR-228 | settings | Settings tab: Preferences | built | Preferences tab switches (data-sw2), saved to hm-set | - |
| HM-SUR-229 | settings | Settings tab: Keyboard | partly | Keyboard tab: read-only list of shortcuts | one flat list, not grouped by category |
| HM-SUR-233 | settings | Settings tab: Encryption | built | Encryption tab: recovery kit state, this device address, other devices | - |
| HM-SUR-236 | settings | Settings tab: Help and about | partly | About tab shows version 0.1.0 and rule source | no content address of the build shown |
| HM-SUR-237 | settings | Room settings dialog | partly | editRoom "Room settings" dialog: name, topic, notify level | no tabs; opens only for moderators, not in direct chats |
| HM-SUR-238 | settings | Room settings: General | partly | editRoom saves name and topic | no room picture; leave is in Details, not in this dialog |
| HM-SUR-243 | settings | Room settings: Notifications | built | editRoom data-rlevel segment sets the room level | - |
| HM-SUR-249 | settings | Toast: update available | built | toastMsg "An update is ready" with Update now and Later | - |
| HM-SUR-267 | settings | Licences screens | partly | About tab line: "Licence: MIT or Apache 2.0" | no licence list or readable licence text |
| HM-FEA-256 | navigation and layout | Message previews in room list | built | drawList shows preview(r) under each chat name | - |
| HM-FEA-257 | navigation and layout | Keyboard shortcuts | built | keydown handlers cover each shortcut listed in the Keyboard tab | - |
| HM-FEA-258 | navigation and layout | Landmark navigation | built | F6 handler moves focus: filter, timeline, message box, details | - |
| HM-FEA-262 | navigation and layout | Setting: room list | partly | "Message previews" switch in Preferences | sort order cannot be changed |
| HM-FEA-263 | navigation and layout | Setting: room list display | partly | "Message previews" switch in Preferences | sort order cannot be changed |
| HM-FEA-264 | navigation and layout | Internal state: recents | partly | hm-emoji keeps recent emoji; hm-ui keeps the last open chat | recent chats list and recent searches are not kept after reload |
| HM-FEA-265 | navigation and layout | Internal state: room list layout | not built | no sort, panel size or filter is saved | sort, panel size, hidden-list state and filter all reset on reload |
| HM-FEA-266 | navigation and layout | Internal state: panels and viewers | partly | hm-ui saves one open-or-closed flag for the details panel | no panel history, none per chat; flag saved only when opening a chat |
| HM-FEA-267 | navigation and layout | Offline indicator | built | #banner "No connection"; queued messages show "Waiting for a connection" | - |
| HM-JRN-075 | navigation and layout | Lose and regain connection | built | toggleOffline: banner with waiting count; queued messages send on return | - |
| HM-SUR-279 | navigation and layout | App root and view switcher | partly | start code shows first run, chats, old-browser or other-tab screen | no loading state |
| HM-SUR-280 | navigation and layout | Main layout | built | panes() and CSS grid: one, two or three columns by width | - |
| HM-SUR-281 | navigation and layout | Left panel | partly | Ctrl Shift L toggles "nolist" to hide the chat list | no visible control; not on phones; shortcut not listed |
| HM-SUR-282 | navigation and layout | User menu | partly | userMenu: Profile, Settings, Sign out | no theme switch in the menu |
| HM-SUR-283 | navigation and layout | Room list header | partly | #newBtn opens New chat dialog: find a person or create room | no header menu; no sort option |
| HM-SUR-284 | navigation and layout | Room list | partly | drawList: Invitations and Chats sections, "No chats match" text | no loading state, no filter chips, not windowed, empty state has no action |
| HM-SUR-285 | navigation and layout | Room list item | built | drawList row: avatar, name, preview, time, badge; right-click menu | - |
| HM-SUR-289 | navigation and layout | Home page | built | drawRoom home view: "Pick a chat" with New chat, Create a room | - |
| HM-SUR-290 | navigation and layout | Room header | built | drawRoom bar: avatar, name, people count, search and details buttons | - |
| HM-SUR-291 | navigation and layout | Right panel container | partly | #panel side panel shows one Details card | no history stack, per chat or overall |
| HM-SUR-292 | navigation and layout | Right panel empty state | partly | shared ".empty" block used in lists and dialogs | the side panel has no cards that use it |
| HM-SUR-293 | navigation and layout | Room context menu | partly | contextmenu on chat row: Mark read or unread, Details, Leave | no favourite, invite or settings entries |
| HM-SUR-294 | navigation and layout | Generic menus and base | partly | #menu opens by click or Ctrl `, closes on Esc | focus does not move into menus; no arrow keys; no focus trap |
| HM-SUR-296 | navigation and layout | Server offline dialog | not built | only a "No connection" banner exists | no dialog listing likely causes with a retry |
| HM-SUR-297 | navigation and layout | Generic dialogs | built | dialog() frame used by confirmDlg, error, and input dialogs | - |
| HM-SUR-298 | navigation and layout | Modal manager | partly | dialog() centres in #scrim; Tab is trapped inside | dialogs do not stack; a new one replaces the old |
| HM-SUR-300 | navigation and layout | Toast containers | partly | #toasts column stacks toasts in arrival order | no priority order; no separate area for low-urgency notices |
| HM-SUR-301 | navigation and layout | Avatars | built | av(): first letter on a colour from the name | - |
| HM-SUR-302 | navigation and layout | Error boundary | built | window "error" listener opens "Something went wrong" with Reload | - |
| HM-SUR-304 | navigation and layout | Shortcut: room list navigation | built | keydown: arrows move between .ri rows, Enter opens, Esc clears filter | - |
| HM-SUR-305 | navigation and layout | Shortcut: room list panel | partly | Ctrl Shift L hides and shows the chat list | no shrink or grow shortcuts; panel cannot be resized |
| HM-SUR-306 | navigation and layout | Shortcut: switch rooms | partly | Alt Up and Alt Down open previous and next chat | no previous or next unread chat shortcut |
| HM-SUR-307 | navigation and layout | Shortcut: history back and forward | built | Alt Left and Alt Right call histGo over HIST | - |
| HM-SUR-308 | navigation and layout | Shortcut: panels and menus | partly | Ctrl . toggles details; Ctrl ` opens the user menu | second press does not close menu; no shortcut-list, settings or home keys |
| HM-SUR-309 | navigation and layout | Shortcut: landmarks | built | F6 and Shift F6 cycle the four areas | - |
| HM-SUR-310 | navigation and layout | Shortcut: accessibility keys | partly | native buttons take Enter and Space; Esc and Tab handled | no arrow keys in menus, tabs or segments; no Home, End or save key |
| HM-SUR-311 | navigation and layout | Right panel card frame | partly | #panel bar: "Details" title and a close button | no back button; only one card exists |
| HM-SUR-312 | navigation and layout | Small shared structures | partly | ".qs" search inputs shared by dialogs; chips row in invitePeople | chips cannot be typed or removed by key; no scroll overflow marks |
| HM-SUR-313 | navigation and layout | Home tab bar | not built | only a "Chats" header; no tab bar or side rail | no chats and spaces tabs at any width |
| HM-SUR-314 | navigation and layout | Home banners | built | #homeBanner "Save a recovery kit" with Set up and Not now | - |
| HM-SUR-316 | navigation and layout | Global indicators | partly | shared .toast and confirmDlg used throughout | no blocking loading overlay beyond the invite progress dialog |
