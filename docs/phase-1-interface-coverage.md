# Phase 1 interface coverage

2026-11-21: sample mode was removed; the page runs only on the uor-comms engine with real people, and this coverage now counts real people only.

The page, `client/index.html`, has no sample people, rooms or messages. Every chat is a room on the uor-comms engine (pinned version 4230a137…, commit bed745b), between real browsers that reach each other through invite links. Nothing is encrypted yet, and the page never shows a message as delivered, read, encrypted or verified, or a person as online.

Scope: the 228 Phase 1 items (226 judged on 2026-11-19, and two added on 2026-11-20 by the wa-ui pass, `docs/wa-ui-gap.md`) a person can see or use (features, journeys and surfaces; capabilities are left out), judged against `client/index.html` as it stood on 2026-11-21.

How it was judged: on 2026-11-21 every row was read again against the page's code, against the acceptance check its inventory row names, and given the lower verdict when torn. This pass read code only; it drove nothing in a browser. Items marked adapt in the inventory were judged on their adapted intent. Where an item needs something the engine does not have yet, the row names it. The engine's limits that recur below: a group's name, description and picture reach only the browser that set them (others see "Group · N people"); a person not invited cannot obtain a room (uor-comms item 8), so groups are invite only; there is no relay across strict networks (uor-comms member relay); there is no encryption, no read receipts, no profiles and no Prism ID.

Not exercised by anyone: two browsers on different networks, a real network drop, reading a picture code with a camera, real touch gestures, and any browser other than one Chromium.

- built: it works between real people now, with its main states.
- partly: some of it works between real people; the last column says what is missing.
- not built: nothing in the page does this; the last column names what it waits on in uor-comms, or why it was removed with sample mode.

| Domain | items | built | partly | not built |
|---|---|---|---|---|
| identity and devices | 10 | 5 | 5 | 0 |
| onboarding and recovery | 15 | 8 | 2 | 5 |
| rooms and membership | 28 | 17 | 11 | 0 |
| encryption and verification | 15 | 1 | 0 | 14 |
| moderation | 2 | 1 | 1 | 0 |
| timeline and events | 35 | 26 | 5 | 4 |
| composer | 25 | 16 | 7 | 2 |
| media and attachments | 16 | 1 | 1 | 14 |
| search | 12 | 9 | 0 | 3 |
| notifications | 11 | 10 | 1 | 0 |
| settings | 18 | 13 | 4 | 1 |
| navigation and layout | 41 | 39 | 1 | 1 |
| Total | 228 | 146 | 38 | 44 |

| HM ID | domain | name | verdict | where in the page | absent |
|---|---|---|---|---|---|
| HM-FEA-011 | identity and devices | User profile | partly | profile(id) opened by data-user from memList(), a bubble's name or picture, and personRow()'s info button: the name you gave, Holo ID (personRows), Message, Mention | no link opens a person's card (share-contact links removed with sample mode); the card shows the name you gave, never one they chose: uor-comms has no profiles |
| HM-FEA-012 | identity and devices | Edit profile | partly | nameDlg("me") from data-acname and askName(); setName("me") keeps it in the page's database (engMeta "myname") | others never see your name, and there is no picture of your own (myFace is your initial): both wait on profiles, which uor-comms does not have |
| HM-JRN-001 | identity and devices | Sign out | built | signOut() confirmDlg "Sign out and delete everything here?": says there is no recovery kit, then deletes the hm- keys and engWipe() | - |
| HM-JRN-003 | identity and devices | Session opened in another tab | built | lockScreen("ask"/"moved") over BroadcastChannel "hm-lock", Use it here (data-take) | - |
| HM-SUR-002 | identity and devices | Session lock screens | built | lockScreen() shows the take-over and moved-tab screens | - |
| HM-SUR-005 | identity and devices | User info card | partly | profile(): Message, Mention, Name only you see, Holo ID, Invite to a group (personRows, inviteRooms); Make admin, Make moderator, Dismiss, Remove from group, Ban, Lift the ban only where offered() allows (engCan, engCanLv, personAct) | no ignore or block: removed with sample mode, uor-comms has no ignore list |
| HM-SUR-009 | identity and devices | Sign-out dialog | built | signOut(): the dialog says the identity lives in this browser only and there is no recovery kit, and that it cannot be undone | - |
| HM-SUR-011 | identity and devices | Clear data confirm dialog | built | signOut() asks before deleting; Delete and sign out (danger) | - |
| HM-SUR-012 | identity and devices | User info sub-views | partly | profile(): picture, name, role line, personRows(), Message, Mention, the moderation rows | no ignore: removed with sample mode, uor-comms has no ignore list |
| HM-SUR-013 | identity and devices | Edit profile screen | partly | nameDlg("me"): #cn2 marked data-was, guardLeave() asks before leaving changes, Save (data-acsave) | no picture field: a picture of your own waits on profiles; the name is seen only in this browser |
| HM-FEA-018 | onboarding and recovery | Recovery prompts | not built | - | removed with sample mode: there is no recovery kit, since the device key cannot leave the browser |
| HM-JRN-008 | onboarding and recovery | First launch | built | start-up: storageOk() else noStorage() with Try again or Carry on; a new browser gets welcome(), a returning one engineStart(true) | - |
| HM-JRN-009 | onboarding and recovery | Register | built | welcome() Create my identity, engineStart() makes the identity and a non-extractable device key, askName(), notice(), then the chat list with Invite someone and Open an invite | - |
| HM-JRN-010 | onboarding and recovery | First-time encryption setup after register | not built | - | removed with sample mode: no recovery kit, since the device key cannot leave the browser; encryption waits on uor-comms |
| HM-JRN-011 | onboarding and recovery | Sign in with password | not built | - | removed with sample mode: no recovery kit to restore from, since the device key cannot leave the browser |
| HM-JRN-016 | onboarding and recovery | Set up recovery | not built | - | removed with sample mode: no recovery kit, since the device key cannot leave the browser |
| HM-JRN-023 | onboarding and recovery | Post-login onboarding | partly | firstRun(): askName() then notice(), each shown until done (EN.meta "myname", "noticed"), also after a reload | the name step cannot be skipped; the notifications offer comes as a toast on the first message that arrives, not as a step |
| HM-JRN-024 | onboarding and recovery | Verify by recovery key | not built | - | removed with sample mode: no recovery kit, since the device key cannot leave the browser |
| HM-SUR-015 | onboarding and recovery | Loading and splash screens | built | #boot "Loading…" removed on DOMContentLoaded; busy("Restoring…") after 300 ms on a resume; bootOut() offers Reload or Sign out after 5 s | - |
| HM-SUR-016 | onboarding and recovery | Fatal error page | built | "This browser is too old" page with Try again; engFailed() when the engine cannot be loaded and checked, with Try again | - |
| HM-SUR-017 | onboarding and recovery | Welcome page | partly | welcome(): Create my identity; says when an invite link was opened | no restore route: removed with sample mode, there is no recovery kit |
| HM-SUR-018 | onboarding and recovery | Auth page frame | built | stage() frame shared by welcome(), askName(), notice(), noStorage(), engLost(), engFailed() | - |
| HM-SUR-024 | onboarding and recovery | Encryption setup after registration | built | adapted to identity setup: welcome() shows "Creating your identity…" with a progress bar while engineStart() runs; a failure opens engFailed() with Try again | - |
| HM-SUR-028 | onboarding and recovery | Session restore error dialog | built | engLost("keys") and engLost("older"): says what was found, shows nothing partial, Start fresh (engWipe, engineStart) | - |
| HM-SUR-029 | onboarding and recovery | Storage evicted dialog | built | engLost("evicted") when browserStore reports evicted: "The chats were cleared", Start fresh | - |
| HM-FEA-021 | rooms and membership | Direct chats | partly | engOpenDm(): findDirect() reuses the one room per pair, else createDirect(); startDm() confirms first | not encrypted: waits on uor-comms encryption |
| HM-FEA-037 | rooms and membership | Chat list | built | drawList() rows from engSyncNow(): picture, name, preview(), listTime(), rowMark() count, dot or @, unsent "!", pin and mute marks | - |
| HM-FEA-038 | rooms and membership | Mark read / unread | built | chatMenu() "Mark as read/unread" by right-click, the row arrow (data-chev) or selAct; homeMenu Read all (readAll); the read point is kept in hm-local by saveUi() | - |
| HM-FEA-039 | rooms and membership | Invites in the list | built | drawList() Invitations section: "X invited you", Accept (data-accept), Decline (data-decline) | - |
| HM-FEA-041 | rooms and membership | Start a chat | built | adapted, invite links in place of codes: newChat(): New group, Invite someone (engInviteDlg), Open an invite (openInviteDlg), People you can reach; a pasted uc1 link opens engLinkOpen() | - |
| HM-FEA-042 | rooms and membership | Create room | partly | createRoom() then engMakeRoom(): createRoom on the engine, name, description and picture by changeSetting, then invitePeople() | the name and picture reach only the browser that set them; others see "Group · N people" until uor-comms delivers room settings to members |
| HM-FEA-044 | rooms and membership | Room details | partly | drawPanel(): hero, Search, Mute, Links (data-files), members (memList), Notifications (data-levels), favourites, Roles and permissions, Leave where offered() names leave | a group's name, description and picture show only on the browser that set them (uor-comms room settings delivery) |
| HM-FEA-045 | rooms and membership | Edit room details | partly | editRoom(): pickPic() picture, name, description where mayChangeSetting allows (engMay); data-was and data-dirty with guardLeave(); each change one changeSetting | the change reaches only this browser (uor-comms room settings delivery) |
| HM-FEA-046 | rooms and membership | Member list | built | memList(): #mq search, #mc count, you first, then by power with Admin and Moderator tags, Invited, and Banned for moderators | - |
| HM-FEA-047 | rooms and membership | Member profile | partly | profile(): picture, name, role line, personRows(), Message | no block: removed with sample mode, uor-comms has no ignore list |
| HM-FEA-048 | rooms and membership | Invite people | built | pickPeople() several at once from the people this browser holds a key for, then engInvite() | - |
| HM-FEA-050 | rooms and membership | Leave room | built | leaveDlg() confirmDlg "Leave <name>?", then engine.leave | - |
| HM-JRN-025 | rooms and membership | Start a direct chat | built | startDm() then engOpenDm(); engLinkOpen() offers Start chat with a name; the chat opens ready to type | - |
| HM-JRN-026 | rooms and membership | Create a room | built | createRoom(): name check, "Creating…" state, duplicate-name refusal; engMakeRoom() opens the room | - |
| HM-JRN-027 | rooms and membership | Invite people to a room | partly | engInvite(): one engAct per person, each refusal in plain words (ENGSAY); people with no key listed as "not added" | no progress count while the invitations go out |
| HM-JRN-028 | rooms and membership | Receive and answer an invite | built | drawList() Invitations count badge; previewRoom() Join (engine.join) or Decline (engine.leave), with a name asked for an unnamed person's direct chat | - |
| HM-JRN-032 | rooms and membership | Leave a room | built | leaveDlg(): "You are the only admin" warning; the chat leaves the list once the engine admits the leave | - |
| HM-SUR-035 | rooms and membership | Room preview bar | built | previewRoom(id, st): invite, "Joining…", "Declining…", the "Invitation declined" toast; a refusal opens engAct()'s dialog with the engine's reason | - |
| HM-SUR-036 | rooms and membership | Room preview card | partly | previewRoom(): picture, name, "X invited you · N people", description, Join | the inviter's group name, description and picture do not reach the invitee (uor-comms room settings delivery) |
| HM-SUR-040 | rooms and membership | Room info card | partly | drawPanel(): hero, description (data-topic), member count, Links, settings pencil (data-editroom); says when the name has not reached this browser (r.setMiss) | a group's name, description and picture show only on the browser that set them (uor-comms room settings delivery) |
| HM-SUR-041 | rooms and membership | Member list | built | memList(): #mc total, "n of m" when filtered, invited listed, "Nobody here matches" | - |
| HM-SUR-042 | rooms and membership | Member tile | partly | memList() .rw.m row: picture, name or start of identity with Add name, role .tag, Invited | no trust icon: checking someone's identity waits on Prism ID (removed with sample mode) |
| HM-SUR-047 | rooms and membership | Create room dialog | built | createRoom(): name required, duplicate refused, description, picture, Create group | - |
| HM-SUR-048 | rooms and membership | Invite and new-chat dialog | built | pickPeople(): typing filters, picked people as removable chips (data-unpick), Invite by link (engInviteDlg) | - |
| HM-SUR-049 | rooms and membership | Invite progress and invite-anyway dialogs | partly | engInvite(): "N people were not added" dialog for people with no key, refusals per person from engAct() | no progress, and no invite-anyway choice |
| HM-SUR-051 | rooms and membership | Room topic dialog | partly | topicDlg() from data-topic: the whole description, Edit where engMay(r, "description") | the description shows only on the browser that set it (uor-comms room settings delivery) |
| HM-SUR-054 | rooms and membership | Invite row and decline menu | built | drawList() .inv row with Accept and Decline | - |
| HM-SUR-055 | rooms and membership | Start-DM confirmation sheet | built | startDm() confirmDlg "Start a chat with <name>?" | - |
| HM-FEA-121 | encryption and verification | Encryption by default | not built | "Not encrypted yet" (data-why="lock") at the top of every chat and in drawPanel(), whyDlg() explains | waits on uor-comms encryption |
| HM-FEA-122 | encryption and verification | Verification | not built | - | removed with sample mode: no other device can be linked, since the device key cannot leave the browser; verification waits on Prism ID |
| HM-FEA-123 | encryption and verification | Recovery | not built | - | removed with sample mode: no recovery kit, since the device key cannot leave the browser |
| HM-JRN-040 | encryption and verification | Verify own session by emoji | not built | - | removed with sample mode: no other device to verify; waits on Prism ID |
| HM-JRN-041 | encryption and verification | Verify own session by QR | not built | - | removed with sample mode: no other device to verify; waits on Prism ID |
| HM-JRN-046 | encryption and verification | Confirm identity on a new device | not built | - | removed with sample mode: the identity cannot move to a new device, since the device key cannot leave the browser |
| HM-SUR-121 | encryption and verification | Recovery key entry dialog | not built | - | removed with sample mode: no recovery kit |
| HM-SUR-122 | encryption and verification | Create recovery dialog | not built | - | removed with sample mode: no recovery kit |
| HM-SUR-129 | encryption and verification | Verification request dialog and incoming verification | not built | - | removed with sample mode: no other device; waits on Prism ID |
| HM-SUR-130 | encryption and verification | Emoji compare, complete and cancelled views | not built | - | removed with sample mode: no other device; waits on Prism ID |
| HM-SUR-132 | encryption and verification | Toast: verification request | not built | - | removed with sample mode: no other device; waits on Prism ID |
| HM-SUR-133 | encryption and verification | Toast: encryption reminders | not built | - | removed with sample mode: neither reminder's condition can arise (no kit, no other device); Session.homeBanner is kept as a rule copy and not drawn |
| HM-SUR-135 | encryption and verification | Identity confirmation screen | not built | - | removed with sample mode: no route to confirm an identity from another device or a kit |
| HM-SUR-137 | encryption and verification | Identity confirmed screen | not built | - | removed with sample mode: nothing is restored, so nothing is confirmed |
| HM-SUR-138 | encryption and verification | Room footer warnings | built | drawRoom(): "Your role in this group is too low to send messages." when maySend() (offered()) refuses; engOustedWhy() when removed or banned | - |
| HM-FEA-237 | moderation | Message deletion | built | msgActs() offers Delete where engine.mayRedact allows (EN.may); deleteDlg() then engine.redact; every browser shows "Message deleted" | - |
| HM-SUR-271 | moderation | Delete message dialogs | partly | deleteDlg() "Delete this message?": removed for everyone, cannot be undone; unsent ones removed from this page only | no reason field: engine.redact carries none |
| HM-FEA-055 | timeline and events | Reactions | built | engReact() one per person (reactionAfterPick): six quick emoji in msgMenu() and .qrow, "More emoji" picker() | - |
| HM-FEA-056 | timeline and events | Replies | built | engSend() with relates; .quote data-jump runs jump(); chainDlg() "Show the reply chain" | - |
| HM-FEA-057 | timeline and events | Read receipts and markers | partly | .day.new unread pill from seenLine; Shift+PageUp jumps to the first unread | no readers: waits on uor-comms receipts (read and received are not tracked yet) |
| HM-FEA-072 | timeline and events | Setting: show read receipts | not built | - | waits on uor-comms receipts; the switch was removed with sample mode |
| HM-FEA-073 | timeline and events | Setting: send read receipts | not built | - | waits on uor-comms receipts; the switch was removed with sample mode |
| HM-FEA-074 | timeline and events | Setting: timestamps | built | every bubble shows clock() in .meta; the "12-hour clock" switch (data-sw2 h12) changes every time at once, kept in hm-set | - |
| HM-FEA-084 | timeline and events | Who reacted | built | whoReacted() from msgMenu "Reactions" (doAct "rx") or the .rxc chip, from messages().reactions (engRx) | - |
| HM-FEA-085 | timeline and events | Delivery status | built | tick(): clock while sending, one tick at sent; "!" (.tkb.bad) when the engine refused it opens whyDlg() with Try again (retry) and Remove (rmFail); two ticks never show (KNOWS) | - |
| HM-FEA-086 | timeline and events | Unread marker and jump | built | openRoom() then toUnread() at the .day.new pill; roomMenu "Jump to first unread"; #toEnd badge counts new messages | - |
| HM-FEA-091 | timeline and events | Copy text, caption, link | built | doAct "copy" ("Copy text") from msgMenu() or the selection bar | - |
| HM-FEA-093 | timeline and events | Collapsed room changes | built | flush() folds three or more joins, leaves and changes into one line; "hide these N" | - |
| HM-FEA-094 | timeline and events | Link safety prompt | built | a[data-ask] click opens "Open this link?" | - |
| HM-SUR-060 | timeline and events | Room view | partly | drawTimeline(): invited tile() with Join and Decline; joined timeline; the read-only notice when removed (engOustedWhy) | no loading or error state for one chat: chats are drawn from this browser's store, and only the whole engine can fail (engFailed) |
| HM-SUR-061 | timeline and events | Timeline | partly | drawTimeline() keeps a window of 80 to 240 rows (WIN, MAXW); onScroll() pages back 50 events at a time (engOlder) | 100,000 messages cannot be reached to test: the stress run was removed with sample mode, and no chat between real people has that many |
| HM-SUR-062 | timeline and events | Event tile | partly | drawTimeline() row: sender name and picture in groups, clock(), rich() body, "edited", .rxc reactions, tick() | no receipts: waits on uor-comms receipts |
| HM-SUR-063 | timeline and events | Message action bar | built | drawRbar() after a long press: Reply, Copy, Forward, Delete, More (BARACT, barActs, doAct); on wide the bubble arrow .chv opens msgMenu() | - |
| HM-SUR-064 | timeline and events | Message context menu | built | msgMenu() from msgActs(): only what messageAction() and engine.mayRedact allow | - |
| HM-SUR-065 | timeline and events | Text message body | built | rich(): links, mention and room pills, code, strike, hidden text (.spoil), quotes, lists; "/me" italic; .ed "edited" | - |
| HM-SUR-067 | timeline and events | Undecryptable, hidden, redacted and error bodies | built | ghost(): "Message deleted", and the unsupportedShown() placeholder with its time for a newer kind; "has not arrived in full yet" while engWant() fetches; sysText() neutral line for an unknown change | - |
| HM-SUR-068 | timeline and events | State and system event tiles | built | engEvent() then sysText(): created, joined, left, invited, removed, banned, name, description, picture, and the neutral line | - |
| HM-SUR-069 | timeline and events | Event summaries | built | "N joined, N left · show", data-expand opens the run | - |
| HM-SUR-070 | timeline and events | New room intro | built | .intro: "X created this room", Add a description (engMay), Invite people (engCanAny) | - |
| HM-SUR-071 | timeline and events | Date separator | built | .day pill per day from dayText() and dayLabel() | - |
| HM-SUR-072 | timeline and events | Reply chain and reply preview | built | .quote data-jump; chainDlg(); drawCtx() "Replying to" over the field | - |
| HM-SUR-073 | timeline and events | Reactions row and picker | built | .rxc chip under the bubble (4 px over a received bubble, 8 px over a sent one), emoji stacked, count from two (reactionCountShown), yours outlined (.mine) | - |
| HM-SUR-074 | timeline and events | Read receipts group | not built | - | waits on uor-comms receipts; Message info (whyDlg "info") lists no readers |
| HM-SUR-076 | timeline and events | Jump to bottom and unread bars | built | #toEnd with a count badge (syncEnd); .day.new "N unread messages"; roomMenu "Jump to first unread" | no "Mark as read" inside the open chat: opening it marks it read |
| HM-SUR-078 | timeline and events | Room status bar | built | drawBanner(): no connection, not connected, nobody else connected (engRoomNet); "Try all again" and "Remove all" (data-unsent) | - |
| HM-SUR-088 | timeline and events | Shortcut: timeline scrolling | built | keydown: PageUp, PageDown, Ctrl+Home, Ctrl+End on #tl | - |
| HM-SUR-089 | timeline and events | Shortcut: read marker | built | keydown: Escape draws the latest; Shift+PageUp jumps to the oldest unread | - |
| HM-SUR-091 | timeline and events | Swipe to reply | built | touchstart, touchmove, touchend: a 64 px drag runs doAct("reply") | - |
| HM-SUR-092 | timeline and events | Double-tap / tap behaviours | partly | a sender's name (.nm) or picture (.mav) opens profile(); data-why on the tick and on "Not encrypted yet" opens whyDlg() | no media to open: attachments were removed with sample mode and wait on uor-comms encryption |
| HM-SUR-093 | timeline and events | Reaction summary sheet | built | whoReacted(): a tab per emoji; your own is a button that takes it back | - |
| HM-SUR-096 | timeline and events | Send-failure dialog | built | "!" (.tkb.bad, data-why) opens whyDlg(): the engine's reason in plain words (engSay), Try again, Remove | - |
| HM-SUR-318 | timeline and events | Reaction button beside a message | not built | - | page work with no engine need: the bubble arrow (.chv) opens the menu, but no 32 px button beside the bubble |
| HM-FEA-095 | composer | Message editing | partly | doAct "edit" runs startEdit(); #send then saveEdit() sends engEdit(); "edited" shows from messages() | the edited mark opens no history: removed with sample mode (messages() gives the last edit only) |
| HM-FEA-096 | composer | Typing notifications | built | adapted, as WhatsApp: transport.typingIn() names typists under the chat name (drawSub, headerLine) and in the chat's list row; myTyping() sends transport.typing | - |
| HM-FEA-097 | composer | Mentions and pills | built | engMentions() sends mentions by identity; rich() pills (mentionPill); mentionsMe() reads e.ment from messages() | - |
| HM-FEA-098 | composer | Emoji picker | partly | picker(): search, Recent (hm-emoji), four ECAT groups, skin tone for hands (toneApplied) | emoji are drawn by the system font, not the pinned graphics (HM-CAP-228); picking for text closes the picker |
| HM-FEA-099 | composer | Formatting | built | #fbar over a selection calls fmt(); rich() renders bold, italic, strike, code, quote, list, link | - |
| HM-FEA-105 | composer | Setting: modifier+Enter to send | built | "Send with Ctrl Enter" switch (modSend); enterWith() in keydown | - |
| HM-FEA-110 | composer | Setting: typing notifications | built | Privacy: "Send typing notices" (tySend) stops myTyping(); "Show typing notices" (tyShow) hides the line | - |
| HM-FEA-119 | composer | Draft restore | built | saveDraft() keeps text, the reply target (S.rep) and an open edit per chat; the text is kept in hm-local and back after a reload | - |
| HM-JRN-038 | composer | Send a message | partly | send() then engSend(): clock while signing and storing, one tick once announced, "waiting for a browser" while in the outbox; a refusal shows "!" with Try again | no read state: waits on uor-comms receipts |
| HM-JRN-039 | composer | Edit or delete own message | partly | startEdit() puts the text in #ta under "Editing"; #send saves (saveEdit), data-cancel cancels; deleteDlg() confirms | delete asks no reason: engine.redact carries none |
| HM-SUR-097 | composer | Typing indicator row | built | typingText() from subLine() and headerLine(): one name, two first names, or "N people are typing…"; "typing…" in a direct chat; never yourself | - |
| HM-SUR-098 | composer | Message composer | partly | #comp: emoji (data-emoji), #ta, #send; .ro notice when sending is not allowed; enterWith() leaves Enter to an input method and adds a line on touch; grow() one to five lines (composerRows) | no attach button: attachments were removed with sample mode and wait on uor-comms encryption (message content version 1 holds text only) |
| HM-SUR-099 | composer | Plain composer editor | built | #pre preview of pills and formatting (grow), suggest(), #fbar | - |
| HM-SUR-101 | composer | Edit composer | built | #ta holds the text, #ctx says "Editing" (drawCtx), #send shows Save (grow), data-cancel | - |
| HM-SUR-102 | composer | Autocomplete popup | built | suggest() People, Everyone, Rooms, Commands, Emoji; drawPop() group headers; arrows | - |
| HM-SUR-104 | composer | Emoji picker | partly | picker(): search, categories, recents, skin tone, #ep preview line; 8 columns of 36 px cells (.emo) | 296 px wide with 24 px emoji drawn by the system font, where the check asks 340 px, 22 px and the pinned graphics (HM-CAP-228) |
| HM-SUR-106 | composer | Shortcut: send and new line | built | keydown Enter uses enterWith(); Shift+Enter adds a line | - |
| HM-SUR-107 | composer | Shortcut: formatting | partly | keydown in #ta: Ctrl+B, I, E, and Ctrl+Shift+> for a quote, via fmt() | no link shortcut: Ctrl+Shift+L hides the chat list (listPanelKey); a link comes from the format bar |
| HM-SUR-108 | composer | Shortcut: undo and redo | built | ins() uses execCommand insertText, so formatting and completions undo | - |
| HM-SUR-109 | composer | Shortcut: composer cursor | built | textarea #ta; the timeline's Ctrl+Home and Ctrl+End are skipped while typing | - |
| HM-SUR-110 | composer | Shortcut: cancel reply or edit | built | keydown Escape in #ta calls startEdit(null) or cancelMode() | - |
| HM-SUR-111 | composer | Shortcut: edit previous or next message | built | Up in an empty #ta edits the last of ownMsgs(); Up and Down step while editing | - |
| HM-SUR-114 | composer | Shortcut: autocomplete | built | keydown: Enter and Tab complete(), arrows move, Escape closes #pop | - |
| HM-SUR-116 | composer | Attachment menu | not built | - | removed with sample mode: pictures, files and the camera wait on uor-comms encryption; message content version 1 holds text only |
| HM-SUR-317 | composer | Typing bubble | not built | - | page work with no engine need: typing shows under the chat name, not as a bubble in the timeline |
| HM-FEA-138 | media and attachments | File and media sharing | not built | - | removed with sample mode: attachments wait on uor-comms encryption; message content version 1 holds text only |
| HM-FEA-139 | media and attachments | Image viewer | not built | - | removed with sample mode: no pictures in messages yet (uor-comms encryption) |
| HM-FEA-145 | media and attachments | Attach photo or video from library | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-FEA-146 | media and attachments | Camera capture | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-FEA-147 | media and attachments | Paste or drop media | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-FEA-148 | media and attachments | Captions | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-JRN-050 | media and attachments | Send a file or image | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-141 | media and attachments | Image, video, file and audio bodies | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-146 | media and attachments | Upload bar | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-147 | media and attachments | File drop target | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-153 | media and attachments | Upload confirm and failure dialogs | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-154 | media and attachments | Image viewer overlay | not built | - | removed with sample mode: no pictures in messages yet (uor-comms encryption); the viewer rules are kept as copies only |
| HM-SUR-155 | media and attachments | Shortcut: upload file | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-156 | media and attachments | Avatar source sheet | partly | pickPic(): Take a photo, Photo library, Choose a file, Remove the picture; used by createRoom() and editRoom() | the group picture it sets reaches only this browser (uor-comms room settings delivery); no picture of your own (profiles) |
| HM-SUR-157 | media and attachments | Timeline item: image / video / sticker | not built | - | removed with sample mode: attachments wait on uor-comms encryption |
| HM-SUR-161 | media and attachments | Avatar preview | built | data-avbig on the info hero, a person's card and the Profile screen opens a .full dialog: the group's picture, else the initial | - |
| HM-FEA-167 | search | Message search | built | searchDlg(): this chat or all chats, engAllOf() pages each chat back first, snip() context, a result jumps to its message | - |
| HM-FEA-168 | search | Encrypted message search (desktop) | not built | - | removed with sample mode: the index dialog is gone; search reads the loaded messages each time, and nothing is encrypted to index |
| HM-FEA-169 | search | Quick switcher (spotlight) | built | finds() for switcher() on mod+K and the one-pane #filter (findOn): recent chats first, chats, people with no chat (Start chat), the "Search messages for" hand-off | - |
| HM-FEA-172 | search | Setting: message search index | not built | - | removed with sample mode: no search index to reset |
| HM-FEA-173 | search | Room list search | built | #filter input redraws drawList() at each key | - |
| HM-JRN-060 | search | Search messages | built | searchDlg(): scope switch, "Show 30 more", "Searching…", the error note, the note when a chat was cut short at 5,000 events, jump | - |
| HM-SUR-181 | search | Room list search bar | built | #filter over the list: matching chats, People, "Search messages for" (data-allhits), Messages found; on one pane it opens the switcher on focus (findOn) with a close arrow (#fx) | - |
| HM-SUR-182 | search | Room search view | built | searchDlg(): "Loading the whole chat from the engine…", "Searching…", error note, "No messages match.", count, data-more | - |
| HM-SUR-183 | search | Quick switcher dialog | built | switcher(): recent searches (sqChips) and Recent before typing, then chats and people (finds); the one-pane #filter is the same, closed by #fx, Escape or Back | - |
| HM-SUR-184 | search | Search index dialogs | not built | - | removed with sample mode: no search index |
| HM-SUR-185 | search | Shortcut: search in room | built | keydown mod+F calls searchDlg() | - |
| HM-SUR-186 | search | Shortcut: quick switcher | built | keydown mod+K calls switcher() | - |
| HM-FEA-174 | notifications | Notification rules | built | Notifications screen (youSub "notify"): Notifications, Mentions, Words to watch (#kw, KW in mentionsMe), Show message text, Play a sound | - |
| HM-FEA-179 | notifications | Setting: desktop notifications | built | switches notify, showText, sound; used by toast() for messages that arrived (arrived) | - |
| HM-FEA-181 | notifications | Per-room notifications | built | levelDlg() from data-levels, editRoom() data-rlevel, chatMenu() n:level; lvl() follows Settings; arrived() asks notifyLevel(), which gives nothing for a muted chat | - |
| HM-JRN-061 | notifications | Change notification level for a room | partly | setLevel() applies at once and saves to hm-local (saveUi) | the revert never runs: saveUi() swallows a storage failure itself, so setLevel()'s catch is never reached |
| HM-JRN-062 | notifications | Enable desktop notifications | built | toast "Turn on notifications?" or Settings Turn on (data-notifyon); askNotify() asks the browser and explains a block | - |
| HM-JRN-063 | notifications | Open a notification | built | the in-page toast and Notification onclick: focus, openRoom(), close | - |
| HM-SUR-190 | notifications | Room notification menu | built | LEVELS Default, Everything, Mentions, Nothing in levelDlg(), editRoom() and chatMenu() | - |
| HM-SUR-191 | notifications | Toast: desktop notifications prompt | built | toast(): "Turn on notifications?" with Turn on and Not now, once | - |
| HM-SUR-192 | notifications | Notification badges | built | drawList() rowMark(): dot, count (badgeNumber, badgePlus) or "@"; "!" unsent; mute mark; Invitations count; #nav badge | - |
| HM-SUR-193 | notifications | Default notification mode screen | built | Notifications screen: Default level (data-deflevel) and "Chats with their own level" with Use default (data-lvreset) | - |
| HM-SUR-195 | notifications | System notification | built | toast(): new Notification with sender, room, text or "New message", tag per room | - |
| HM-FEA-207 | settings | Themes and custom themes | built | Chats screen (youSub "chats"): System, Light, Dark (data-theme2) and High contrast (contrast) | - |
| HM-FEA-211 | settings | Setting: font size and custom size | built | A− and A+ (data-font2) and #fz from 12 to 24 set --fz; sizes in rem | - |
| HM-FEA-213 | settings | Setting: theme and match system | built | data-theme2; applySet() saves to hm-set; System follows the device | - |
| HM-FEA-229 | settings | Settings home | partly | drawYou(): Profile, Account (Sign out), Privacy, Chats, Notifications, Storage and data, Keyboard shortcuts, Help and about | no devices and no recovery rows: removed with sample mode, since the device key cannot leave the browser |
| HM-FEA-233 | settings | About and legal | built | Help and about: version 0.2.0, buildAddr() sha256 of the served page, engAbout() with the pinned engine, Licences and Privacy (data-legal) | - |
| HM-SUR-223 | settings | User settings dialog | built | settings() opens the You column (drawYou): eight screens from youSub(), each with a back arrow (data-yback) to where it was opened from (settingsBack) | - |
| HM-SUR-224 | settings | Settings tab: Account | partly | Profile screen: Your name (data-acname, nameDlg), Holo ID copy (personRows), Your invite link | no picture, and the name stays in this browser: both wait on profiles |
| HM-SUR-226 | settings | Settings tab: Appearance | built | Chats screen: theme, contrast and text size apply at once via applySet() | - |
| HM-SUR-227 | settings | Settings tab: Notifications | built | Notifications screen: master switch, default level, Mentions, sound | - |
| HM-SUR-228 | settings | Settings tab: Preferences | built | Chats and Privacy screens: switches (data-sw2) and segments, saved to hm-set | - |
| HM-SUR-229 | settings | Settings tab: Keyboard | built | Keyboard shortcuts screen (youSub "keys"): Chats, Messages, Writing, Panels, menus and dialogs; shown on wide screens only (rowShown) | - |
| HM-SUR-233 | settings | Settings tab: Encryption | partly | Account screen: the identity lives in this browser and why it has no recovery kit; Profile shows the Holo ID | this device's key is not shown; encryption waits on uor-comms |
| HM-SUR-236 | settings | Settings tab: Help and about | built | Help and about: "Holo Messenger 0.2.0" and #ba sha256 address from buildAddr() | - |
| HM-SUR-237 | settings | Room settings dialog | built | editRoom(): General and Notifications tabs; a direct chat has its name only you see and notifications | - |
| HM-SUR-238 | settings | Room settings: General | partly | editRoom() General: pickPic() picture, name, description where engMay() allows, Save (one changeSetting each), Leave | the saved name, description and picture reach only this browser, not all members (uor-comms room settings delivery) |
| HM-SUR-243 | settings | Room settings: Notifications | built | editRoom() data-rlevel segment sets the chat's level | - |
| HM-SUR-249 | settings | Toast: update available | not built | - | removed with sample mode: the toast was a simulated situation, and the page has no update check |
| HM-SUR-267 | settings | Licences screens | built | legal("lic"): licence list, full MIT text, link to the Apache 2.0 text | - |
| HM-FEA-256 | navigation and layout | Message previews in room list | built | drawList() shows preview(r) under each chat name | - |
| HM-FEA-257 | navigation and layout | Keyboard shortcuts | built | keydown handlers cover each shortcut the Keyboard shortcuts screen lists | - |
| HM-FEA-258 | navigation and layout | Landmark navigation | built | F6 moves focus: #filter, #tl, #ta, the panel | - |
| HM-FEA-262 | navigation and layout | Setting: room list | built | Chats screen: "Sort chats by" (data-sort, setSort, listOrder) and "Message previews" | - |
| HM-FEA-263 | navigation and layout | Setting: room list display | built | Chats screen: "Sort chats by" (setSort) and "Message previews" | - |
| HM-FEA-264 | navigation and layout | Internal state: recents | built | saveUi() keeps REC and SQ in hm-local; hm-emoji keeps recent emoji; shown by switcher() and sqChips() | - |
| HM-FEA-265 | navigation and layout | Internal state: room list layout | built | chip, sort, list width, hidden list, text size, theme and 12-hour clock in hm-set (applySet); favourites, pins, levels and drafts in hm-local (saveUi) | - |
| HM-FEA-266 | navigation and layout | Internal state: panels and viewers | built | r.ph card stack per chat saved by saveUi() from drawPanel(), put back by uiApply() | - |
| HM-FEA-267 | navigation and layout | Offline indicator | built | drawBanner(): "No connection" from navigator.onLine (netReal), "Not connected" and "Nobody else in this chat is connected now" from the transport (engRoomNet) | - |
| HM-JRN-075 | navigation and layout | Lose and regain connection | built | netReal() banner; what is sent is signed and stored, waits in the engine's outbox and goes out when a browser of the chat connects; Try again (engine.retry) | - |
| HM-SUR-279 | navigation and layout | App root and view switcher | built | #boot loading, stage() first-run screens, or #app; busy() removes the loading screen | - |
| HM-SUR-280 | navigation and layout | Main layout | built | panes() and CSS grid: one, two or three columns by width; on one pane Back closes the top screen (popstate, hsync) | - |
| HM-SUR-281 | navigation and layout | Left panel | built | data-nolist in the list bar and the room bar, noList(); Ctrl Shift L | - |
| HM-SUR-282 | navigation and layout | User menu | built | You tab (drawYou): profile row, the settings screens, Account with Sign out; the theme is under Chats | no menu and no one-press theme entry: the user menu became the You screen |
| HM-SUR-283 | navigation and layout | Room list header | built | drawBar(): title, New chat (data-home, #fab on a phone) and #moreBtn, which opens homeMenu(): New group, Read all, Settings | - |
| HM-SUR-284 | navigation and layout | Room list | built | drawList(): keyed rows, a window above 200 chats, #flt chips, "Loading chats…", empty states with Invite someone and Open an invite | drag overlay for list rows (minor); 60 fps not measured as frames |
| HM-SUR-285 | navigation and layout | Room list item | built | drawList() row: picture, name, preview, time, badge stopping at 999 with a plus (badgeNumber, badgePlus), a tick only on your own last message with nothing unread (previewTicks); chatMenu() by right-click or the row arrow | - |
| HM-SUR-289 | navigation and layout | Home page | partly | drawRoom() with no chat: "Pick a chat to read it here" with New chat (data-home) | no create-group shortcut there: New group is in the header menu |
| HM-SUR-290 | navigation and layout | Room header | built | drawRbar(): picture, name, the people count or typing line (drawSub), Search and More; no online line, since the engine reports no presence | - |
| HM-SUR-291 | navigation and layout | Right panel container | built | card() pushes to r.ph per chat; drawPanel() shows the top card; data-pback pops; under 1200 px Escape or a click outside closes it (hidePanel) | - |
| HM-SUR-292 | navigation and layout | Right panel empty state | built | panelShows() 3: a card with nothing in it shows its ".empty" words (the Links card) | - |
| HM-SUR-293 | navigation and layout | Room context menu | built | contextmenu on a chat row, chatMenu(): read, Pin, favourites, Invite people (engCanAny), settings, Info, levels, Leave | - |
| HM-SUR-294 | navigation and layout | Generic menus and base | built | MutationObserver focuses a menu's first button; controlKey() arrows, Home, End; Tab kept inside; Escape | - |
| HM-SUR-296 | navigation and layout | Server offline dialog | built | netDlg() from the banner's "Why?": causes, the browser's online report, Try again (offlineDialog) | - |
| HM-SUR-297 | navigation and layout | Generic dialogs | built | dialog() frame used by confirmDlg(), failed(), engAct() refusals and input dialogs | - |
| HM-SUR-298 | navigation and layout | Modal manager | built | dialog(keep) pushes to STACK; closeTop() restores the dialog under; Tab trapped over buttons, fields and links | - |
| HM-SUR-300 | navigation and layout | Toast containers | built | toastMsg(): notices that wait for an answer go to #toasts, plain ones to #notes | - |
| HM-SUR-301 | navigation and layout | Avatars | built | av(): first letter on a colour from the name; rav() uses a group's picture when held | - |
| HM-SUR-302 | navigation and layout | Error boundary | built | "error" and "unhandledrejection" listeners call failed(): "Something went wrong" with Reload | - |
| HM-SUR-304 | navigation and layout | Shortcut: room list navigation | built | listGo(): arrows move between .ri rows, Enter opens, Escape clears the filter | - |
| HM-SUR-305 | navigation and layout | Shortcut: room list panel | built | listPanelKey(): Alt Shift Left/Right resizeList() through hidden, 240, 320, 384 px; Ctrl Shift L toggles | - |
| HM-SUR-306 | navigation and layout | Shortcut: switch rooms | built | keydown Alt Up/Down, with Shift only chats with unread | - |
| HM-SUR-307 | navigation and layout | Shortcut: history back and forward | built | Alt Left and Alt Right call histGo() over HIST | - |
| HM-SUR-308 | navigation and layout | Shortcut: panels and menus | built | keydown: mod+. toggles info; mod+` opens You or returns to chats; mod+/ shortcuts; mod+, settings; Ctrl Alt H | - |
| HM-SUR-309 | navigation and layout | Shortcut: landmarks | built | F6 and Shift F6 cycle the four areas | - |
| HM-SUR-310 | navigation and layout | Shortcut: accessibility keys | built | controlKey(): arrows, Home, End in menus, tabs and segments; mod+S saves (saveKey); Backspace removes chips | - |
| HM-SUR-311 | navigation and layout | Right panel card frame | built | drawPanel() frames each card in CARDS (Links, Roles and permissions) with Back (data-pback, panelBack), title, Close (panelClose) | - |
| HM-SUR-312 | navigation and layout | Small shared structures | built | pickPeople() #iq with chips, data-unpick, Backspace removes; one search field style (.search, .pin) | - |
| HM-SUR-313 | navigation and layout | Home tab bar | built | #nav from tabsShown(): Chats and You, a bar under 768 px and a rail on wide screens (drawNav); Spaces waits on FEATURES.spaces | - |
| HM-SUR-314 | navigation and layout | Home banners | not built | - | removed with sample mode: no recovery kit and no other device, so neither banner can show; Session.homeBanner is kept as a rule copy and not drawn |
| HM-SUR-316 | navigation and layout | Global indicators | built | busy() #boot overlay at start and on a resume; toastMsg(); confirmDlg() | - |
