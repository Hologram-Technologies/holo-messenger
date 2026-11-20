# What Holo Messenger needs to feel like WhatsApp

Why: a person who uses WhatsApp every day should find Holo Messenger where their hands expect it, without it wearing WhatsApp's name, colours or pictures.
How: every component of wa-ui (github.com/froggy1014/wa-ui at `77518bab`, MIT), a reproduction of WhatsApp Web, was read for what a person sees and does, its sizes and its behaviour, and set against the inventory, the model and the page. The findings and their source files are in `docs/whatsapp-study.md`, section 12; emoji are in `docs/emoji.md`.
Use: the build order below is the work that remains. Each item says what the client does alone, what it needs from uor-comms, and its phase. uor-comms decides the engine; the needs are requests to it, not rules here.

## 1. Every wa-ui component, classified

wa-ui's folder holds 35 component files, not 31: four are helpers that other components use (`message-status`, `reaction`, `forwarded-label`, `reply-preview`). All 35 are classified.

- (a) already in Holo Messenger and matching;
- (b) in Holo Messenger but differing, with what changes;
- (c) missing, and needed by a person-to-person messenger: a new inventory row;
- (d) WhatsApp Business only: not adopted.

| wa-ui file | Class | Holo Messenger item | Evidence, or what differs and which part of the specification changes |
|---|---|---|---|
| `action-button.tsx` | d | - | A call-to-action pill whose examples are channel buttons; channels and updates are dropped. Not adopted: business messaging |
| `call-permission.tsx` | d | - | A business asking leave to call. Not adopted: business messaging |
| `carousel-template.tsx` | d | - | Product cards in a row. Not adopted: business messaging |
| `chat-bubble.tsx` | b | HM-SUR-062, HM-CAP-079 | Same anatomy (`Timeline.bubbleSide`, `Timeline.tailShown`, `Timeline.groupsWith`). Differs: 2, 6 and 24 px spacing (new `Timeline.gapAfter`); 60% width and 8 px corners on wide screens (new `Budget.wideBubbleMaxPercent`, `Budget.wideBubbleCorner`). wa-ui puts the tail on the last bubble of a run; the phone screenshot puts it on the first, which stays |
| `chat-header.tsx` | b | HM-SUR-290, HM-FEA-004 | Same parts (`Layout.headerLine`, `Layout.callButtonsShown`). Differs: 59 px height and 40 px picture and targets on wide screens (`Budget.wideHeaderHeight`, `Budget.wideHeaderPicture`); an online line only when the engine reports presence (new `Layout.onlineShown`); HM-SUR-290's check rewritten |
| `chat-list-item.tsx` | b | HM-SUR-285, HM-FEA-037 | Same row (`RoomList.rowMark`, `RoomList.timeAccented`). Differs: badge stops at 999 with a plus (new `RoomList.badgeNumber`, `RoomList.badgePlus`); ticks never on the preview while unread (new `RoomList.previewTicks`); 49 px picture, 10 px padding, 17, 13 and 12 px text, an inset 12 px-cornered highlight on wide screens (`Budget.wide*`); HM-SUR-285's check rewritten |
| `chat-menu.tsx` | a | HM-SUR-294, HM-SUR-064 | Anchored menu with keys and Escape (`Overlay.surfaceFor`, `Overlay.escapeCloses`, `Keys.controlKey`); page: interface coverage "built". Its 150 ms is within `Budget.motionMs` |
| `contact-bubble.tsx` | c | HM-FEA-268, HM-SUR-319 (new) | Sharing a person as a card. Needs a content kind from uor-comms (N-9) and a ruling on keys (Decisions, 5). Phase 2 |
| `cta-url-bubble.tsx` | d | - | A business link button. Not adopted: business messaging |
| `date-separator.tsx` | a | HM-SUR-071 | `Timeline.dividerBefore`, `Timeline.dayLabel`; page `.day` pill. The 28 px pill is recorded in the study |
| `emoji-picker.tsx` | b | HM-FEA-098, HM-SUR-104, HM-CAP-228 (new) | Holo Messenger's picker already does more (search, recents, skin tone: `Composer.pickerSection`). Differs: it stays open while picking for text and closes after a reaction (new `Composer.pickerStaysOpen`); 340 px or the screen less 16 px (new `Composer.pickerFull`); 8 columns of 36 px cells, 22 px emoji (`Budget`); graphics from the pinned set (HM-CAP-228, `docs/emoji.md`) |
| `file-attachment-bubble.tsx` | a | HM-SUR-141, HM-FEA-138 | Badge, name, size and type, download, progress; page: built on sample data. Sizes recorded; file-type badge colours are own colours |
| `forwarded-label.tsx` | b | HM-FEA-061, HM-CAP-075 | Forwarding is Phase 2 and named no label. Differs: the copy carries "Forwarded" (HM-FEA-061's check rewritten). Needs a field in content (N-7). The "many times" label is not adopted: it needs a forward count no peer can check |
| `image-bubble.tsx` | b | HM-SUR-157, HM-SUR-158, HM-CAP-131 | Thumbnail first, then the picture; page: built. Differs: the time sits on the picture without a caption (new `Timeline.timeOnMedia`); albums of up to four 165 px cells and "+n" (new `Timeline.albumCells`, `Timeline.albumMoreShown`); 336 by 330 px (`Budget`). Checks of HM-SUR-157 and HM-SUR-158 rewritten |
| `interactive-button-bubble.tsx` | d | - | Business reply buttons. Not adopted: business messaging |
| `interactive-reply-bubble.tsx` | d | - | The answer to a business button or list. Not adopted: business messaging |
| `list-message-bubble.tsx` | d | - | A business menu in a sheet. Not adopted: business messaging |
| `location-bubble.tsx` | b | HM-SUR-144, HM-FEA-135, HM-CAP-125 | Phase 2, open in the device's map app. Differs: no map picture fetched from a third party (wa-ui links Google Maps), and opening asks first (`Timeline.asksBeforeOpening`); HM-SUR-144's reason and check rewritten. Needs a content kind (N-8) |
| `media-viewer.tsx` | b | HM-SUR-154, HM-FEA-139 | Viewer with keys and download; page: built. Differs: arrows and an "n / m" counter only with several items, wrapping at both ends (new `Render.viewerNext`, `Render.viewerPreviousWraps`, `Render.viewerArrowsShown`); HM-SUR-154's check rewritten |
| `message-actions.tsx` | b | HM-SUR-063, HM-SUR-064, HM-FEA-055, HM-CAP-063, HM-SUR-318 (new) | Six quick reactions and more; page: built (`msgMenu()`, `.qrow`); menu offers only allowed actions (`Menu.messageAction`). Differs: a round reaction button beside the bubble on hover (new HM-SUR-318); picking your own reaction again takes it back and another replaces it (new `Menu.reactionAfterPick`, `Menu.quickReactions`); HM-CAP-063's check rewritten |
| `message-bubble.tsx` | a | HM-SUR-073 | A wrapper that hangs reactions from any bubble; covered by the reaction rows |
| `message-input.tsx` | b | HM-SUR-098, HM-SUR-106 | Field, emoji, attach, send or microphone (`Composer.enterAction`, `Composer.mainButton`); page: built. Differs: Enter never sends while an input method composes, and adds a line on a touch screen (new `Composer.enterWith`); the field grows from one to five lines (new `Composer.composerRows`, `Budget.composerMaxHeight`); HM-SUR-098's check rewritten |
| `message-status.tsx` (helper) | a | HM-JRN-038, HM-SUR-062 | Clock, one tick, two, two in colour, failed: `Timeline.tickShown`, with two ticks and the accent only when the engine reports them. wa-ui's blue is an own colour (`--accent`) |
| `message-text.tsx` | a | HM-CAP-070, HM-FEA-099, HM-CAP-091 | Bold, italic, strike, code and links with safe schemes (`Render.formatApplied`, `Render.markupAllowed`, `Render.schemeAllowed`); the link colour is an own colour |
| `reaction-pill.tsx` | b | HM-SUR-073 | Chips with counts; page: built. Differs: one pill per message, emoji stacked, a count only from two (new `Timeline.reactionCountShown`); your own outlined in the accent; 24 px clear below (`Timeline.gapAfter`); HM-SUR-073's check rewritten |
| `reaction.tsx` (helper) | b | HM-SUR-073 | As `reaction-pill.tsx`: the stacked display, 20 px circles overlapping by 5 px (`Budget.stackedEmojiCircle`) |
| `reply-bar.tsx` | a | HM-SUR-072, HM-SUR-110 | Preview above the composer, Escape cancels (`Composer.escapeStep`); page: built |
| `reply-preview.tsx` (helper) | a | HM-SUR-072, HM-CAP-086 | Quoted parent, jump to it; page: built. Sizes recorded (42 px, 3 px bar, two lines, 52 px thumbnail) |
| `sticker-bubble.tsx` | b | HM-SUR-143, HM-CAP-127, HM-FEA-137, HM-FEA-151 | Stickers are dropped in the inventory. Not changed here: Decisions, 4 |
| `system-message-bubble.tsx` | a | HM-CAP-066, HM-SUR-062 | `Timeline.systemLine`, `Timeline.collapses`. wa-ui's example notice claims encryption; Holo Messenger keeps "Not encrypted yet" until the engine encrypts |
| `template-bubble.tsx` | d | - | Business message templates. Not adopted: business messaging |
| `typing-indicator.tsx` | c | HM-SUR-317 (new), HM-CAP-087 | The dots bubble at the foot of the chat is new (new `Timeline.typingBubble`); the line under the chat name stays (HM-SUR-097). Needs typing from the engine (N-3) |
| `unsupported-message-bubble.tsx` | b | HM-CAP-082, HM-SUR-067 | The inventory says an unknown kind shows a placeholder; the model hid it (`Timeline.shown` answers 0). New `Timeline.unsupportedShown` shows a placeholder for an unknown message, never nothing; HM-SUR-067's check rewritten. The engine refuses unknown kinds today (N-2) |
| `video-bubble.tsx` | a | HM-SUR-157, HM-SUR-141 | Play mark, length, caption; page: built. wa-ui plays inline; Holo Messenger opens the viewer (HM-SUR-092), unchanged |
| `voice-message-bubble.tsx` | b | HM-SUR-142, HM-FEA-134, HM-CAP-120 | Phase 2. Differs: the time counts up while playing; the played mark waits on the engine; 40 px button, 30 bars (`docs/whatsapp-study.md` 12.2); HM-SUR-142's check rewritten |

Totals: a 10, b 15, c 2, d 8 (35 files).

## 2. Build order

Client-only work first, so what can be finished is finished; then the items that wait on the engine, in the order uor-comms's slices are likely to land (its `docs/DESIGN.md`, "Phases": media is slice 4, voice and video calls slice 5).

| Order | Item | (i) Client work: interface and model rule | (ii) Needs from uor-comms | (iii) Phase |
|---|---|---|---|---|
| 1 | Wide-screen sizes | Apply the `Budget.wide*` set at two and three panes: 59 px headers, 49 px row pictures, 17, 13 and 12 px list text, 14.2 px messages, 11 px times, 60% bubbles with 8 px corners and 8 by 13 px tails; the inset list highlight | none | 1 |
| 2 | Bubble spacing | 2 px within a run, 6 px after a run, 24 px under reactions (`Timeline.gapAfter`); the tail stays on the first bubble of a run (`Timeline.tailShown`) | none | 1 |
| 3 | Composer keys and growth | `Composer.enterWith` in place of `Composer.enterAction` at the field (input-method composition and touch screens); the field grows one to five lines, then scrolls (`Composer.composerRows`) | none | 1 |
| 4 | Emoji graphics | HM-CAP-228 and `docs/emoji.md` E-01 to E-09: self-hosted, hash-pinned, lazy, with the system's emoji as the fallback (`Render.emojiForm`); one to three emoji alone at 32 px (`Render.emojiOnlyLarge`); picker stays open for text, closes after a reaction, 340 px (`Composer.pickerStaysOpen`, `Composer.pickerFull`) | none | 1 |
| 5 | Reactions | One stacked pill under the bubble, a count from two (`Timeline.reactionCountShown`); the round reaction button beside a bubble on wide screens (HM-SUR-318); your own reaction taken back or replaced (`Menu.reactionAfterPick`) | N-6 (HM-CAP-063): one reaction per member per message | 1 |
| 6 | Chat list | Badge 999+ (`RoomList.badgeNumber`, `RoomList.badgePlus`); ticks only on your own last message and never while unread (`RoomList.previewTicks`) | none | 1 |
| 7 | Unsupported messages | A placeholder with the time for a message of an unknown kind, hidden for a state change of an unknown kind (`Timeline.unsupportedShown`) | N-2 (HM-CAP-082, HM-SUR-067): pass an unreadable content on, not refuse it | 1 |
| 8 | Media viewer | Arrows and "n / m" only with several items, wrapping (`Render.viewerNext`, `Render.viewerPreviousWraps`, `Render.viewerArrowsShown`) | N-1 for real media (HM-CAP-121, HM-CAP-122) | 1 |
| 9 | Pictures, videos, files | Time on the picture without a caption (`Timeline.timeOnMedia`); 336 by 330 px; albums of up to four cells with "+n" (`Timeline.albumCells`, `Timeline.albumMoreShown`, HM-SUR-158 in Phase 2) | N-1 (HM-CAP-121, HM-CAP-122, HM-CAP-130, HM-CAP-131, HM-FEA-138) | 1 (albums 2) |
| 10 | Typing | The dots bubble at the foot of the chat (HM-SUR-317, `Timeline.typingBubble`) beside the line under the name (HM-SUR-097, `Layout.headerLine`) and the list row | N-3 (HM-CAP-087, HM-FEA-096, HM-FEA-110) | 1 |
| 11 | Ticks past one | Two ticks and the accent once the engine reports delivery and read (`Timeline.tickShown`, unchanged) | N-4 (HM-CAP-064, HM-FEA-057, HM-FEA-072, HM-FEA-073) | 1 |
| 12 | Online | The online line and dot (`Layout.onlineShown`) | N-5 (HM-CAP-018, HM-FEA-004) | 2 |
| 13 | Forwarding label | "Forwarded" above a forwarded copy | N-7 (HM-CAP-075, HM-FEA-061) | 2 |
| 14 | Voice notes | Record, play, bars filling, time counting up; played mark from the engine | N-1 and N-4 (HM-CAP-120, HM-FEA-134, HM-SUR-142, HM-SUR-148) | 2 |
| 15 | Location | Name or coordinates; asks before opening the map app; no third-party map picture | N-8 (HM-CAP-125, HM-FEA-135, HM-SUR-144) | 2 |
| 16 | Contact cards | The 280 px card with Message and Add (HM-SUR-319) | N-9 (HM-FEA-268) and Decisions, 5 | 2 |
| 17 | Calls | as the inventory's calls rows say | as those rows say | 3 (ruling) |

Not adopted: the eight business components; status and updates (ruling); the doodle wallpaper and every brand colour (`docs/whatsapp-study.md`, 12.1).

## 3. Client needs to send to uor-comms

These are what the client needs. uor-comms decides whether and how; its answer overrides this list.

| ID | Need | Inventory items | Engine standing today (uor-comms `docs/STATUS.md`, `docs/DESIGN.md`, `host/README.md`, read 2026-11-20 at `25152c3`) |
|---|---|---|---|
| N-1 | Attachments in message content: picture, video, voice, file, with caption, size, length, dimensions and a small thumbnail, fetched by content address | HM-CAP-121, HM-CAP-122, HM-CAP-130, HM-CAP-131, HM-FEA-134, HM-FEA-138 | "Attachments wait for the cipher"; media is Phase 4 slice 4 |
| N-2 | A content of a kind or version this client cannot read is admitted and reported as unreadable, with its sender and time, instead of refused, so the page can show a placeholder | HM-CAP-082, HM-SUR-067 | `unknownKindIsRefused`, `onlyVersionOneIsRead` (Comms.ContentProofs) |
| N-3 | A typing signal that is never stored, with an opt-out that sends nothing | HM-CAP-087, HM-FEA-096, HM-FEA-110, HM-SUR-097, HM-SUR-317 | the relay job lists typing; not built |
| N-4 | Delivered and read per member (and played for voice), with an opt-out for sending read | HM-CAP-064, HM-FEA-057, HM-FEA-072, HM-FEA-073, HM-SUR-142 | "Read and received are not tracked yet (receipts)"; `transport.delivered` is not a receipt |
| N-5 | Presence that a person opts into, reported only to people they choose | HM-CAP-018, HM-FEA-004 | "presence ... not in the model" |
| N-6 | One reaction per member per message: a member's newer reaction replaces their older one, or one call that redacts the old and sends the new together | HM-CAP-063 | Holo Messenger README: the engine counts "a reaction once per member"; whether one member may hold two different reactions on a message is not stated |
| N-7 | A forwarded flag in message content | HM-CAP-075, HM-FEA-061 | not in content version 1 |
| N-8 | A location content: coordinates and an optional name | HM-CAP-125, HM-FEA-135, HM-SUR-144 | not in content version 1 |
| N-9 | A contact card content naming an identity and how to reach it | HM-FEA-268, HM-SUR-319 | not in content version 1; keys travel in invite links (decision 19) or as introductions inside a group (decision 20) |

## 4. Decisions for Ilya

The standing rulings were kept: calls Phase 3, status and updates dropped, verifying another person and room-key recovery Phase 2, direct chats of exactly two, X-Wing, device keys in invite links until Prism ID. Feature complete in WhatsApp's sense needs no change to any of them except, possibly, the last (5).

1. Which emoji set to pin: jdecked/twemoji v17.0.3 (recommended, Emoji 17.0) or twitter/twemoji v14.0.2 (the original, Emoji 14.0). `docs/emoji.md`.
2. The emoji-only size, 32 px, is this specification's value, not a measurement.
3. Whether the composer field should draw emoji graphics, which needs a rich editor; left on the system's emoji.
4. Stickers stay dropped (HM-CAP-127, HM-FEA-137, HM-SUR-143, HM-SUR-149). A daily WhatsApp user sends them; showing received ones at 160 px with no bubble (wa-ui `sticker-bubble.tsx`) would be the smallest step, and it waits on N-1.
5. Contact cards carry a way to reach a person. Under the ruling that device keys travel in invite links until Prism ID, a card can either hold the person's own invite link, wait for Prism ID, or pass a key as a group introduction does; this specification does not choose.
6. The tail stays on the first bubble of a run, from the phone screenshot; wa-ui puts it on the last. Confirm.
7. The viewer wraps at both ends, as wa-ui does; WhatsApp's own behaviour is not verified.
8. The typing bubble (HM-SUR-317) is shown in addition to the line under the chat name, which the 2026-11-19 call placed there; confirm both.
9. The wide list column: wa-ui's CSS says 440 px (at least 340), its `DESIGN.md` 360 px; the page's resize steps (240, 320, 384 px) are unchanged here.
