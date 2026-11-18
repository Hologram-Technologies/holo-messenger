# Phase 1 interface coverage

Scope: the 227 Phase 1 items a person can see or use (features, journeys and surfaces; capabilities are left out), judged against `client/index.html` at the commit that last changed this file, on 2026-11-18.

How it was judged: each item was read against the page's code and given the lower verdict when torn. A first pass judged all 227. The items it did not mark built were then built out and judged again by reviewers who had not written the code. Six items were fixed after their second review; their rows say so, and those fixes were checked in a browser by the builder or by the session lead, not reviewed a third time. The page uses sample data: nothing is stored beyond this browser, encrypted or sent, and that does not count against an item. A strip at the top of the page says so at all times. Items marked adapt in the inventory were judged on their adapted intent. Where a static page cannot do the real thing, it offers a substitute that says what it is.

Not exercised by anyone: scanning a code with a camera, camera capture, real touch gestures, sending or playing video, real key presses, a real network drop, and any browser other than one Chromium.

- built: the behaviour is present on sample data, with its main states.
- partly: some of it is present; the last column says what is absent.
- not built: nothing in the page does this.

| Domain | items | built | partly | not built |
|---|---|---|---|---|
| identity and devices | 10 | 10 | 0 | 0 |
| onboarding and recovery | 15 | 15 | 0 | 0 |
| rooms and membership | 28 | 28 | 0 | 0 |
| encryption and verification | 16 | 16 | 0 | 0 |
| moderation | 2 | 2 | 0 | 0 |
| timeline and events | 34 | 34 | 0 | 0 |
| composer | 24 | 24 | 0 | 0 |
| media and attachments | 16 | 16 | 0 | 0 |
| search | 12 | 12 | 0 | 0 |
| notifications | 11 | 11 | 0 | 0 |
| settings | 18 | 18 | 0 | 0 |
| navigation and layout | 41 | 39 | 2 | 0 |
| Total | 227 | 225 | 2 | 0 |

| HM ID | domain | name | verdict | where in the page | absent |
|---|---|---|---|---|---|
| HM-FEA-011 | identity and devices | User profile | built | openHash() and newChat personRow info button both call the same profile() card | - |
| HM-FEA-012 | identity and devices | Edit profile | built | settings("account"): choose picture, name field, Save name | - |
| HM-JRN-001 | identity and devices | Sign out | built | signOut() "You have no recovery kit" dialog, Save a kit first | - |
| HM-JRN-003 | identity and devices | Session opened in another tab | built | lockScreen("ask"/"moved") over BroadcastChannel "hm-lock", Use it here | - |
| HM-SUR-002 | identity and devices | Session lock screens | built | lockScreen() shows take-over and moved-tab screens | - |
| HM-SUR-005 | identity and devices | User info card | built | profile(): role selector, Remove, Ban, Lift the ban, Share, Invite, Verify, Block | - |
| HM-SUR-009 | identity and devices | Sign-out dialog | built | signOut() dialog warns of no kit, offers Save a kit first | - |
| HM-SUR-011 | identity and devices | Clear data confirm dialog | built | signOut() wipe: "Remove everything from this device?" confirm | - |
| HM-SUR-012 | identity and devices | User info sub-views | built | profile(): avatar, name, identity, verified note, Message, Mention, Block | - |
| HM-SUR-013 | identity and devices | Edit profile screen | built | settings wrapper marks #acName data-was; guardLeave() asks; pickPic() source menu | - |
| HM-FEA-018 | onboarding and recovery | Recovery prompts | built | drawList() #homeBanner "Save a recovery kit", Set up, Not now | - |
| HM-JRN-008 | onboarding and recovery | First launch | built | storageOk() check at start opens noStorage() screen with retry or carry on | - |
| HM-JRN-009 | onboarding and recovery | Register | built | onboard(): Create my identity, name, kit offer, chat list | - |
| HM-JRN-010 | onboarding and recovery | First-time encryption setup after register | built | onboard(2) "Save a recovery kit" with Not now | - |
| HM-JRN-011 | onboarding and recovery | Sign in with password | built | restore() kit field, kitState() error text, Restore button | - |
| HM-JRN-016 | onboarding and recovery | Set up recovery | built | createKit(): kit shown, Copy, Save as a file, Confirm your kit | - |
| HM-JRN-023 | onboarding and recovery | Post-login onboarding | built | onboard() step 3 notification screen, skippable; kit step skipped when saved | - |
| HM-JRN-024 | onboarding and recovery | Verify by recovery key | built | restore(): paste kit, inline "not a valid kit", confirmed() | - |
| HM-SUR-015 | onboarding and recovery | Loading and splash screens | built | #boot "Loading…" removed on DOMContentLoaded; busy() slow start offers Sign out, simulation labelled | - |
| HM-SUR-016 | onboarding and recovery | Fatal error page | built | "This browser is too old" page, Try again; error dialog Reload | - |
| HM-SUR-017 | onboarding and recovery | Welcome page | built | onboard(0): Create my identity, I have a recovery kit | - |
| HM-SUR-018 | onboarding and recovery | Auth page frame | built | stage() frame shared by all first-run screens | - |
| HM-SUR-024 | onboarding and recovery | Encryption setup after registration | built | makeId: real key pair under a progress bar held 400 ms; failure with Try again (fixed after review, timed by the builder) | - |
| HM-SUR-028 | onboarding and recovery | Session restore error dialog | built | userMenu "rerr" dialog: Clear this device, Try again | - |
| HM-SUR-029 | onboarding and recovery | Storage evicted dialog | built | userMenu "evict" dialog: browser removed data, Restore from a kit | - |
| HM-FEA-021 | rooms and membership | Direct chats | built | newChat "New group chat" runs groupChat(), pickPeople(), makeRoom() with several members | - |
| HM-FEA-037 | rooms and membership | Chat list | built | drawList() rows: avatar, name, preview, time, count, @ mark, mute | - |
| HM-FEA-038 | rooms and membership | Mark read / unread | built | contextmenu "Mark as read/unread"; details "Mark as unread" | - |
| HM-FEA-039 | rooms and membership | Invites in the list | built | drawList() Invitations rows: "X invited you", Accept, Decline | - |
| HM-FEA-041 | rooms and membership | Start a chat | built | newChat(): ID or link field, New group chat, Create a room, Add by code | - |
| HM-FEA-042 | rooms and membership | Create room | built | createRoom(): picture, name, topic, who can join; then invitePeople() | - |
| HM-FEA-044 | rooms and membership | Room details | built | drawPanel(): files, pins, roles, Security, Report this room, Share link, Mute | - |
| HM-FEA-045 | rooms and membership | Edit room details | built | editRoom(): pickPic picture change, data-was and data-dirty with guardLeave() warning | - |
| HM-FEA-046 | rooms and membership | Member list | built | memList(): #mq search, Admins, Moderators, Members, Invited, Banned sections; Invite button | - |
| HM-FEA-047 | rooms and membership | Member profile | built | profile(): avatar, name, identity, role, verified note, Message, Block, Verify | - |
| HM-FEA-048 | rooms and membership | Invite people | built | pickPeople(): name search field, pasted IDs become chips, drop or keep unknown | - |
| HM-FEA-050 | rooms and membership | Leave room | built | data-leave click: confirmDlg "Leave <room>?" | - |
| HM-JRN-025 | rooms and membership | Start a direct chat | built | openHash() link to profile then Message; pasted ID in newChat; useCode() | - |
| HM-JRN-026 | rooms and membership | Create a room | built | createRoom(): access choice, topic, "Creating…" state, duplicate-name refusal, room opens | - |
| HM-JRN-027 | rooms and membership | Invite people to a room | built | pickPeople() pasted IDs, "Invite by link" shareRoom(), sendInvites() progress and failures | - |
| HM-JRN-028 | rooms and membership | Receive and answer an invite | built | drawList() invitation count badge; previewRoom() joining, declining, decline and block, error | - |
| HM-JRN-032 | rooms and membership | Leave a room | built | data-leave: only-admin and private-room warnings, room removed | - |
| HM-SUR-035 | rooms and membership | Room preview bar | built | previewRoom(id, st): invite, joining, declining, declined, error for gone, banned, offline | - |
| HM-SUR-036 | rooms and membership | Room preview card | built | previewRoom(): avatar, topic, "N people", Join | - |
| HM-SUR-040 | rooms and membership | Room info card | built | drawPanel(): files, pins, search, Favourite, Room settings link shown to everyone | - |
| HM-SUR-041 | rooms and membership | Member list | built | memList(): per-section counts, "n of m" when filtered, "Nobody here matches" state | - |
| HM-SUR-042 | rooms and membership | Member tile | built | drawPanel() .mem: avatar, name, role, trust lock icon, Invited label | - |
| HM-SUR-047 | rooms and membership | Create room dialog | built | createRoom() own dialog: name check, topic, access, Create room | - |
| HM-SUR-048 | rooms and membership | Invite and new-chat dialog | built | pickPeople(): typing filter, removable chips, pasted ID list, used for group and invite | - |
| HM-SUR-049 | rooms and membership | Invite progress and invite-anyway dialogs | built | sendInvites(): "k of n", "Some people were not invited", Invite anyway | - |
| HM-SUR-051 | rooms and membership | Room topic dialog | built | topicDlg() from panel topic button: full topic, "Edit the topic" for moderators | - |
| HM-SUR-054 | rooms and membership | Invite row and decline menu | built | drawList() .inv row with Accept and Decline | - |
| HM-SUR-055 | rooms and membership | Start-DM confirmation sheet | built | startDm() confirmDlg "Start a chat with <name>?" | - |
| HM-FEA-121 | encryption and verification | Encryption by default | built | drawRoom() "Encrypted" on every chat; no switch to turn off | - |
| HM-FEA-122 | encryption and verification | Verification | built | verifyFlow(): Compare pictures or Scan a code, for people and devices | - |
| HM-FEA-123 | encryption and verification | Recovery | built | restore() valid kit leads to confirmed() and chat list | - |
| HM-JRN-040 | encryption and verification | Verify own session by emoji | built | verifyFlow() wait, emoji, done, cancel; "They do not match" | - |
| HM-JRN-041 | encryption and verification | Verify own session by QR | built | verifyFlow qr/scan steps: real QR via qr(), scanCode camera reader, typed fallback | - |
| HM-JRN-046 | encryption and verification | Confirm identity on a new device | built | restore(): kit entry or "Confirm from another device", then confirmed() | - |
| HM-SUR-119 | encryption and verification | Encryption and verification card | built | verifyFlow() steps start, wait, emoji, done, cancel | - |
| HM-SUR-121 | encryption and verification | Recovery key entry dialog | built | restore(): "Choose the kit file" reader, live kitState, "Start again" reset link | - |
| HM-SUR-122 | encryption and verification | Create recovery dialog | built | createKit(): kit, Copy, Save as a file, re-entry to confirm | - |
| HM-SUR-129 | encryption and verification | Verification request dialog and incoming verification | built | incomingVerify() toast Accept opens verifyFlow() dialog outside rooms | - |
| HM-SUR-130 | encryption and verification | Emoji compare, complete and cancelled views | built | verifyFlow() emoji with match/no match, Verified, cancelled with reason | - |
| HM-SUR-132 | encryption and verification | Toast: verification request | built | incomingVerify() toast "Verification request" with Accept, Decline | - |
| HM-SUR-133 | encryption and verification | Toast: encryption reminders | built | reminders(): toasts "Save a recovery kit" and "Verify your other device" | - |
| HM-SUR-135 | encryption and verification | Identity confirmation screen | built | restore(): device route hidden when offline; Sign out button; reset link | - |
| HM-SUR-137 | encryption and verification | Identity confirmed screen | built | confirmed() "Identity confirmed." with one Continue | - |
| HM-SUR-138 | encryption and verification | Room footer warnings | built | drawRoom(): "Only moderators can send messages in this room." (Reading group) | - |
| HM-FEA-237 | moderation | Message deletion | built | messageAction("remove": own or moderator), deleteDlg() | - |
| HM-SUR-271 | moderation | Delete message dialogs | built | deleteDlg() "Delete this message?" with Reason field, Delete | - |
| HM-FEA-055 | timeline and events | Reactions | built | msgMenu() row of six quick emoji plus "More emoji" picker; whoReacted() | - |
| HM-FEA-056 | timeline and events | Replies | built | data-xq "more" opens the quote chain; jump() loads an unloaded original | - |
| HM-FEA-057 | timeline and events | Read receipts and markers | built | rowAfter reader avatars; "New" line; Shift+PageUp jumps to first unread | - |
| HM-FEA-072 | timeline and events | Setting: show read receipts | built | "Show read receipts" switch; rowAfter checks S.set.showReceipts | - |
| HM-FEA-073 | timeline and events | Setting: send read receipts | built | S.out[0] count in Preferences; "Read by" dialog says if reading is shared | - |
| HM-FEA-074 | timeline and events | Setting: timestamps | built | "12-hour clock" and "Always show times" switches; clock(), .stamps | - |
| HM-FEA-084 | timeline and events | Who reacted | built | whoReacted() dialog from the message menu "Reactions" | - |
| HM-FEA-085 | timeline and events | Delivery status | built | status line: Sending, Sent, Read, "Not sent. Try again · Remove" | - |
| HM-FEA-086 | timeline and events | Unread marker and jump | built | drawUbar() "Jump to the first"; #toEnd data-n shows "N new" | - |
| HM-FEA-091 | timeline and events | Copy text, caption, link | built | act "copy" and msgMenu "Copy text", "Copy link" | - |
| HM-FEA-093 | timeline and events | Collapsed room changes | built | flush() folds joins, leaves and changes; "hide these N" folds again | - |
| HM-FEA-094 | timeline and events | Link safety prompt | built | a[data-ask] click opens "Open this link?" dialog | - |
| HM-SUR-060 | timeline and events | Room view | built | tile() in drawTimeline: invited, "Loading messages…", "could not be opened" with Try again | - |
| HM-SUR-061 | timeline and events | Timeline | built | load and error tiles, #ubar jump, stress(1e5) with 80 to 240 row window | - |
| HM-SUR-062 | timeline and events | Event tile | built | ghost() deleted line; .lk lock button on each sender header | - |
| HM-SUR-063 | timeline and events | Message action bar | built | .acts toolbar: React, Reply, Edit, Copy, More, Delete | - |
| HM-SUR-064 | timeline and events | Message context menu | built | msgMenu: react, quote, forward, pin, report; openHash opens a copied message link (fixed after review) | - |
| HM-SUR-065 | timeline and events | Text message body | built | rich() //spoiler// button; "/me" italic emote; .body.nt notice via /note | - |
| HM-SUR-067 | timeline and events | Undecryptable, hidden, redacted and error bodies | built | ghost() deleted, no key, damaged; "Hidden: you blocked" line; media error line | - |
| HM-SUR-068 | timeline and events | State and system event tiles | built | say() rows: name, topic, picture, encryption on, "You verified", pins, roles | - |
| HM-SUR-069 | timeline and events | Event summaries | built | "N people joined · show" button, data-expand opens the run | - |
| HM-SUR-070 | timeline and events | New room intro | built | .intro shows "X created this room", "Add a topic", "Invite people" | - |
| HM-SUR-071 | timeline and events | Date separator | built | .day header per day from dayName() | - |
| HM-SUR-072 | timeline and events | Reply chain and reply preview | built | data-xq opens quoted parent in full with its chain; drawCtx preview | - |
| HM-SUR-073 | timeline and events | Reactions row and picker | built | .rx add button, title with names, data-rxall "+N" opens whoReacted() | - |
| HM-SUR-074 | timeline and events | Read receipts group | built | rowAfter() two avatars then "+N"; three readers in first room | - |
| HM-SUR-076 | timeline and events | Jump to bottom and unread bars | built | #toEnd "· N new"; #ubar "Jump to the first" and "Mark as read" | - |
| HM-SUR-078 | timeline and events | Room status bar | built | drawBanner() "Try all again" and "Remove all"; data-unsent handler with confirm | - |
| HM-SUR-088 | timeline and events | Shortcut: timeline scrolling | built | keydown: PageUp, PageDown, Ctrl+Home, Ctrl+End on #tl | - |
| HM-SUR-089 | timeline and events | Shortcut: read marker | built | keydown: Escape draws latest; Shift+PageUp jumps to oldest unread | - |
| HM-SUR-091 | timeline and events | Swipe to reply | built | touchstart, touchmove, touchend: 64 px drag clicks Reply | - |
| HM-SUR-092 | timeline and events | Double-tap / tap behaviours | built | data-why on send status and lock opens whyDlg() | - |
| HM-SUR-093 | timeline and events | Reaction summary sheet | built | whoReacted() tabs per emoji, time beside each person | - |
| HM-SUR-096 | timeline and events | Send-failure dialog | built | "Why?" opens whyDlg(): cause, "Try again", "Remove" | - |
| HM-FEA-095 | composer | Message editing | built | act "edit" then send(); .ed click opens histDlg() | - |
| HM-FEA-096 | composer | Typing notifications | built | #typing row "Name is typing…" set in deliver() | - |
| HM-FEA-097 | composer | Mentions and pills | built | suggest() "@room" and "#Room"; rich() pills; mentionsMe() matches @room | - |
| HM-FEA-098 | composer | Emoji picker | built | picker(): search, Recent, four ECAT groups, skin tone row for hands | - |
| HM-FEA-099 | composer | Formatting | built | #fbar on selection calls fmt(); rich() strikethrough, quote, lists | - |
| HM-FEA-105 | composer | Setting: modifier+Enter to send | built | "Send with Ctrl Enter" switch; enterAction() in keydown | - |
| HM-FEA-110 | composer | Setting: typing notifications | built | S.out[1] count for sending; "Show typing notices" hides the typing row | - |
| HM-FEA-119 | composer | Draft restore | built | saveDraft and openRoom keep text, reply target and an open edit per chat (fixed after review) | - |
| HM-JRN-038 | composer | Send a message | built | send(), deliver(): Sending, Sent, Read; failed row; read-only composer | - |
| HM-JRN-039 | composer | Edit or delete own message | built | startEdit() puts #ed in the message with Save and Cancel; deleteDlg() reason | - |
| HM-SUR-097 | composer | Typing indicator row | built | #typing row shows small avatar and first name | - |
| HM-SUR-098 | composer | Message composer | built | #comp: attach, textarea, emoji, send; ".ro" only-moderators notice | - |
| HM-SUR-099 | composer | Plain composer editor | built | #fbar format bar; #pre strip shows chips as you type; suggest() | - |
| HM-SUR-101 | composer | Edit composer | built | message row becomes #ed textarea with data-edsave and data-edx | - |
| HM-SUR-102 | composer | Autocomplete popup | built | suggest() People, Everyone, Rooms, Commands, Emoji; drawPop() group headers; arrows | - |
| HM-SUR-104 | composer | Emoji picker | built | picker(): search, categories, recents, skin tone, #ep preview line | - |
| HM-SUR-106 | composer | Shortcut: send and new line | built | keydown Enter uses enterAction(); Shift+Enter leaves a new line | - |
| HM-SUR-107 | composer | Shortcut: formatting | built | keydown in #ta: Ctrl+Shift+> quote, Ctrl+Shift+L link via fmt() | - |
| HM-SUR-108 | composer | Shortcut: undo and redo | built | ins() uses execCommand insertText so formatting and completions undo | - |
| HM-SUR-109 | composer | Shortcut: composer cursor | built | textarea #ta; timeline Ctrl+Home/End skipped while typing | - |
| HM-SUR-110 | composer | Shortcut: cancel reply or edit | built | keydown Escape in #ta calls cancelMode() | - |
| HM-SUR-111 | composer | Shortcut: edit previous or next message | built | #ed keydown: Up and Down step through ownMsgs(), Down returns to box | - |
| HM-SUR-114 | composer | Shortcut: autocomplete | built | keydown: Enter and Tab complete(), arrows move, Escape closes #pop | - |
| HM-SUR-116 | composer | Attachment menu | built | attachMenu(): "Photo or video", "Take a photo", "File" | - |
| HM-FEA-138 | media and attachments | File and media sharing | built | previewSend() confirm; img, rowMedia video, audio, file download link | - |
| HM-FEA-139 | media and attachments | Image viewer | built | viewer(): .full screen, "More" menu with "Show in chat" and Forward | - |
| HM-FEA-145 | media and attachments | Attach photo or video from library | built | inMedia multiple picker then previewSend() with caption field | - |
| HM-FEA-146 | media and attachments | Camera capture | built | attachMenu() "Record a video"; camDlg() uses getUserMedia on desktop | - |
| HM-FEA-147 | media and attachments | Paste or drop media | built | paste and drop listeners call previewSend() | - |
| HM-FEA-148 | media and attachments | Captions | built | saveEdit() saves an empty caption on a picture or file | - |
| HM-JRN-050 | media and attachments | Send a file or image | built | upload() reads file in pieces, moves progress bar; data-upx Cancel | - |
| HM-SUR-141 | media and attachments | Image, video, file and audio bodies | built | phSt shows a blurred thumbnail, then the picture; error lines for picture, video, audio, file (fixed after review) | - |
| HM-SUR-146 | media and attachments | Upload bar | built | drawUp: file name, progress, count waiting, Cancel; "A slow file" shows it, labelled simulated (fixed after review) | - |
| HM-SUR-147 | media and attachments | File drop target | built | #drop "Drop to send" overlay shown on dragover | - |
| HM-SUR-153 | media and attachments | Upload confirm and failure dialogs | built | previewSend(): each file listed, "Send N", too-large notice | - |
| HM-SUR-154 | media and attachments | Image viewer overlay | built | viewer(): wheel, keys, pinch, swipe, right-click menu | - |
| HM-SUR-155 | media and attachments | Shortcut: upload file | built | keydown Ctrl+Shift+U clicks the #file input | - |
| HM-SUR-156 | media and attachments | Avatar source sheet | built | pickPic() menu: photo, library, file, remove; used for room and profile | - |
| HM-SUR-157 | media and attachments | Timeline item: image / video / sticker | built | thumb and phSt: thumbnail first, fade to the sharp picture; play mark, duration, caption (fixed after review) | - |
| HM-SUR-161 | media and attachments | Avatar preview | built | data-avbig on room header, details and timeline avatars opens .full dialog | - |
| HM-FEA-167 | search | Message search | built | searchDlg: this chat or all chats, snippets, click jumps to message | - |
| HM-FEA-168 | search | Encrypted message search (desktop) | built | Settings, Encryption tab: "Search index" count with Rebuild button | - |
| HM-FEA-169 | search | Quick switcher (spotlight) | built | switcher() rows: chats, "No chat yet" people (startDm), "Search messages for" hand-off | - |
| HM-FEA-172 | search | Setting: message search index | built | data-rebuild button shows "Rebuilding" then "Rebuilt just now" | - |
| HM-FEA-173 | search | Room list search | built | #filter input redraws drawList on each keystroke | - |
| HM-JRN-060 | search | Search messages | built | searchDlg: scope switch, "Show 30 more", "Searching…", caught-error and not-searched notes, jump | - |
| HM-SUR-181 | search | Room list search bar | built | #kHint button in the filter bar calls switcher() on click | - |
| HM-SUR-182 | search | Room search view | built | searchDlg run/draw: Searching… status, error alert, no-match text, count, data-more paging | - |
| HM-SUR-183 | search | Quick switcher dialog | built | switcher sorts by REC visits, adds people without chats, shows "Loading chats…" | - |
| HM-SUR-184 | search | Search index dialogs | built | indexDlg: messages, chats, characters in memory; confirmDlg before Rebuild; indexAll | - |
| HM-SUR-185 | search | Shortcut: search in room | built | keydown mod+F calls searchDlg | - |
| HM-SUR-186 | search | Shortcut: quick switcher | built | keydown mod+K calls switcher | - |
| HM-FEA-174 | notifications | Notification rules | built | Notifications tab: #kw words feed KW in mentionsMe; invites, mentions, sound switches | - |
| HM-FEA-179 | notifications | Setting: desktop notifications | built | switches notify, showText, sound in Notifications tab; used by toast | - |
| HM-FEA-181 | notifications | Per-room notifications | built | levelSeg Default button, lvl() follows Settings; data-mute in Details; incoming() honours mute | - |
| HM-JRN-061 | notifications | Change notification level for a room | built | setLevel applies, reverts with toast if storage throws; contextmenu n:level entries | - |
| HM-JRN-062 | notifications | Enable desktop notifications | built | toast "Turn on notifications?", askNotify asks browser, explains a block | - |
| HM-JRN-063 | notifications | Open a notification | built | toast and Notification onclick: focus, openRoom, close | - |
| HM-SUR-190 | notifications | Room notification menu | built | LEVELS Default, Everything, Mentions, Nothing in Details segment and chat right-click menu | - |
| HM-SUR-191 | notifications | Toast: desktop notifications prompt | built | toastMsg "Turn on notifications?" with Turn on and Not now | - |
| HM-SUR-192 | notifications | Notification badges | built | drawList: badge dot, "!" unsent badge, count, "@", mute icon; Invitations count badge | - |
| HM-SUR-193 | notifications | Default notification mode screen | built | Notifications tab: default level segment plus "Chats with their own level" list, Use default | - |
| HM-SUR-195 | notifications | System notification | built | toast wrapper: new Notification with sender, room, body, tag per room | - |
| HM-FEA-207 | settings | Themes and custom themes | built | Appearance tab: System, Light, Dark and High contrast switch | - |
| HM-FEA-211 | settings | Setting: font size and custom size | built | html font-size follows --fs, sizes in rem; #fz number input sets exact value | - |
| HM-FEA-213 | settings | Setting: theme and match system | built | data-theme2 buttons, applySet saves to hm-set; System follows device | - |
| HM-FEA-229 | settings | Settings home | built | Profile tab Sign out row (data-signout); Encryption tab "Link a new device" (linkDev) | - |
| HM-FEA-233 | settings | About and legal | built | About tab: version, buildAddr sha256 of served page, Licences and Privacy buttons | - |
| HM-SUR-223 | settings | User settings dialog | built | settings(): one dialog with seven tabs | - |
| HM-SUR-224 | settings | Settings tab: Account | built | Profile tab: Save name, Choose a picture, Copy identity | - |
| HM-SUR-226 | settings | Settings tab: Appearance | built | Appearance tab: theme and text size apply at once via applySet | - |
| HM-SUR-227 | settings | Settings tab: Notifications | built | Notifications tab: Mentions switch, "Mark all chats as read" (data-allread), master, default, sound | - |
| HM-SUR-228 | settings | Settings tab: Preferences | built | Preferences tab switches (data-sw2), saved to hm-set | - |
| HM-SUR-229 | settings | Settings tab: Keyboard | built | Keyboard tab groups: Chats, Messages, Writing, Panels menus and dialogs | - |
| HM-SUR-233 | settings | Settings tab: Encryption | built | Encryption tab: recovery kit state, this device address, other devices | - |
| HM-SUR-236 | settings | Settings tab: Help and about | built | About tab: "Holo Messenger 0.1.0" and #ba sha256 address from buildAddr | - |
| HM-SUR-237 | settings | Room settings dialog | built | editRoom: General and Notifications tabs; opens for members and direct chats, fields disabled | - |
| HM-SUR-238 | settings | Room settings: General | built | editRoom General: pickPic picture, name, topic, Save, "Leave room" button | - |
| HM-SUR-243 | settings | Room settings: Notifications | built | editRoom data-rlevel segment sets the room level | - |
| HM-SUR-249 | settings | Toast: update available | built | toastMsg "An update is ready" with Update now and Later | - |
| HM-SUR-267 | settings | Licences screens | built | legal("lic"): licence list, full MIT text, link to Apache 2.0 text | - |
| HM-FEA-256 | navigation and layout | Message previews in room list | built | drawList shows preview(r) under each chat name | - |
| HM-FEA-257 | navigation and layout | Keyboard shortcuts | built | keydown handlers cover each shortcut listed in the Keyboard tab | - |
| HM-FEA-258 | navigation and layout | Landmark navigation | built | F6 handler moves focus: filter, timeline, message box, details | - |
| HM-FEA-262 | navigation and layout | Setting: room list | built | Preferences "Sort chats by" segment and list menu; listOrder; previews switch | - |
| HM-FEA-263 | navigation and layout | Setting: room list display | built | Preferences "Sort chats by" segment (setSort) and "Message previews" switch | - |
| HM-FEA-264 | navigation and layout | Internal state: recents | built | saveUi keeps REC and SQ in hm-ui; hm-emoji; shown by switcher and sqChips | - |
| HM-FEA-265 | navigation and layout | Internal state: room list layout | partly | saveUi keeps sort, width, hidden list, filter and favourites across a reload | custom sections and a background picture do not exist to be saved |
| HM-FEA-266 | navigation and layout | Internal state: panels and viewers | built | r.ph card stack per chat saved by saveUi in drawPanel, restored at start | - |
| HM-FEA-267 | navigation and layout | Offline indicator | built | #banner "No connection"; queued messages show "Waiting for a connection" | - |
| HM-JRN-075 | navigation and layout | Lose and regain connection | built | toggleOffline: banner with waiting count; queued messages send on return | - |
| HM-SUR-279 | navigation and layout | App root and view switcher | built | #boot "Loading…" screen removed by busy() once the page is ready | - |
| HM-SUR-280 | navigation and layout | Main layout | built | panes() and CSS grid: one, two or three columns by width | - |
| HM-SUR-281 | navigation and layout | Left panel | built | data-nolist buttons in list and room bars, noList(); works on phones; shortcut listed | - |
| HM-SUR-282 | navigation and layout | User menu | built | userMenu "Theme:" entry cycles system, light, dark; Profile, Settings, Sign out | - |
| HM-SUR-283 | navigation and layout | Room list header | built | #newBtn opens listMenu: New chat, Create a room, Sort by, Show | - |
| HM-SUR-284 | navigation and layout | Room list | built | drawList: keyed rows, window above 200 chats, #flt chips, loading, empty states | drag overlay for list rows (minor); 60 fps not measured as frames |
| HM-SUR-285 | navigation and layout | Room list item | built | drawList row: avatar, name, preview, time, badge; right-click menu | - |
| HM-SUR-289 | navigation and layout | Home page | built | drawRoom home view: "Pick a chat" with New chat, Create a room | - |
| HM-SUR-290 | navigation and layout | Room header | built | drawRoom bar: avatar, name, people count, search and details buttons | - |
| HM-SUR-291 | navigation and layout | Right panel container | built | card() pushes to r.ph per chat; drawPanel shows top card; data-pback pops | - |
| HM-SUR-292 | navigation and layout | Right panel empty state | built | Files and Pins panel cards render the shared ".empty" block when empty | - |
| HM-SUR-293 | navigation and layout | Room context menu | built | contextmenu on chat row: read, Favourite, Invite people, settings, Details, levels, Leave | - |
| HM-SUR-294 | navigation and layout | Generic menus and base | built | MutationObserver focuses first menu button; capture keydown arrows, Home, End, Tab trap; Esc | - |
| HM-SUR-296 | navigation and layout | Server offline dialog | built | netDlg from banner "Why?": causes, browser's online report, Try again | - |
| HM-SUR-297 | navigation and layout | Generic dialogs | built | dialog() frame used by confirmDlg, error, and input dialogs | - |
| HM-SUR-298 | navigation and layout | Modal manager | built | dialog(keep) pushes to STACK; closeTop restores the dialog under; Tab trapped | - |
| HM-SUR-300 | navigation and layout | Toast containers | built | toastMsg: waiting notices prepend to #toasts, plain ones go to #notes corner | - |
| HM-SUR-301 | navigation and layout | Avatars | built | av(): first letter on a colour from the name | - |
| HM-SUR-302 | navigation and layout | Error boundary | built | window "error" listener opens "Something went wrong" with Reload | - |
| HM-SUR-304 | navigation and layout | Shortcut: room list navigation | built | keydown: arrows move between .ri rows, Enter opens, Esc clears filter | - |
| HM-SUR-305 | navigation and layout | Shortcut: room list panel | built | Alt Shift Left/Right resizeList: hidden, 233, 321, 377 px; Ctrl Shift L toggles | - |
| HM-SUR-306 | navigation and layout | Shortcut: switch rooms | built | base keydown: Alt Up/Down, with Shift only chats with unread | - |
| HM-SUR-307 | navigation and layout | Shortcut: history back and forward | built | Alt Left and Alt Right call histGo over HIST | - |
| HM-SUR-308 | navigation and layout | Shortcut: panels and menus | built | keydown: Ctrl ` opens or closes menu; Ctrl / list; Ctrl , settings; Ctrl Alt H | - |
| HM-SUR-309 | navigation and layout | Shortcut: landmarks | built | F6 and Shift F6 cycle the four areas | - |
| HM-SUR-310 | navigation and layout | Shortcut: accessibility keys | built | capture keydown: arrows, Home, End in menus, tabs, segments; Ctrl S saves; Backspace chips | - |
| HM-SUR-311 | navigation and layout | Right panel card frame | built | block-six drawPanel frames Files, Pins, Roles cards with Back, title, Close | - |
| HM-SUR-312 | navigation and layout | Small shared structures | built | pickPeople #iq typed chips, data-unpick, Backspace removes; scroll-edge gradients in CSS | - |
| HM-SUR-313 | navigation and layout | Home tab bar | partly | #nav: Chats and Search tabs under 768 px, kept inside a chat | no side rail on wide screens; no Spaces tab (later phase) |
| HM-SUR-314 | navigation and layout | Home banners | built | #homeBanner "Save a recovery kit" with Set up and Not now | - |
| HM-SUR-316 | navigation and layout | Global indicators | built | busy() #boot full-screen overlay at start, slow start and index build | - |
