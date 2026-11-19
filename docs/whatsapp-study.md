# WhatsApp behaviour study

Why: Holo Messenger should feel familiar to people who already use WhatsApp, so we need a plain record of how WhatsApp lays things out and reacts to touch.
How: gathered on 2026-11-19 from six Android dark-theme screenshots (measured pixel by pixel), WhatsApp's own help centre and blog (read through web search, because the help pages would not load directly), and the author's memory, which is always marked "unverified".
Use: as a checklist of behaviours and sizes to match or knowingly depart from when redesigning Holo Messenger; it describes behaviour only and copies no WhatsApp text, artwork or help wording.

## How to read this

Each behaviour is one table row: where it is, what the user does, what happens, and the source.

Sources, in order of trust:

- "screenshot N" means it was seen in one of the six reference screenshots (1 chats home, 2 a chat, 3 group info, 4 home overflow menu, 5 calls, 6 new call picker).
- "help: title" means a page of that title on faq.whatsapp.com confirmed it. "blog: title" means the official blog did.
- "unverified" means neither confirmed it. Treat these as leads to check on a real phone before building on them.

Limits of this study:

- The help centre pages returned only their titles when fetched directly. Everything marked "help" comes from search summaries of those pages, not from a full reading.
- The screenshots show one phone (Samsung-style status bar, Android, dark theme, 24-hour clock, enlarged text). Nothing about light theme or iOS was seen.
- No gesture, animation or timing can be seen in a still image. All motion rows are unverified.
- Some help pages disagree with each other (old and new versions). Where they do, the row says so.

A "unit" is the screen width divided by 412. The screenshots are 923 px wide, so 1 unit = 2.24 px. The screen is 412 x 893 units.

## 1. Home (chat list)

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| H-01 | Top left of home | Looks | The app name is the screen title, large and bold, left aligned. There is no back arrow and no picture here. | screenshot 1 |
| H-02 | Top right of home | Looks | Only one control sits on the title line: a three-dot "more" button. | screenshot 1 |
| H-03 | Top right of home (older builds) | Looks | A camera button used to sit left of the three dots. | unverified |
| H-04 | Below the title | Looks | A full-width rounded search field with a magnifier on the left and grey hint text. It is a field in the page, not an icon. | screenshot 1 |
| H-05 | Search field | Taps it | A search screen opens with the keyboard up; it searches chat names and message text, and offers filters such as unread, photos, videos, links and documents. | unverified |
| H-06 | Search field | Types a question | The same field doubles as the entry to the built-in assistant (the hint text says so). | screenshot 1 |
| H-07 | Below search | Looks | One row of rounded filter chips: All, Unread, Favourites, Groups, then more that scroll off the right edge. | screenshot 1 |
| H-08 | Filter chips | Looks | The chosen chip is filled dark green with pale green text; the others are outlines with grey text. | screenshot 1 |
| H-09 | Filter chips | Looks | A chip that has unread chats shows a count after its label, in the same grey, slightly lighter weight (Unread 28, Groups 17). All and Favourites show none. | screenshot 1 |
| H-10 | Filter chips | Taps a chip | The list below is narrowed to that set at once; tapping All restores it. No new screen opens. | blog: Find Messages Faster with Chat Filters |
| H-11 | Filter chips | Looks | The four built-in sets are All, Unread, Favourites and Groups. Unread holds chats not yet opened or marked unread by hand. | help: About lists |
| H-12 | End of chip row | Taps the last chip (a plus) | Starts a custom list: name it, pick people and groups. The new list becomes a chip. | blog: Focus on What Matters With Custom Lists (plus position unverified) |
| H-13 | A list chip | Long-presses | Options for that list appear, including mute. | help: How to mute or unmute individual or group chat notifications |
| H-14 | Chat list | Pulls down at the top | The chip row comes into view if it had scrolled away. | help: About lists |
| H-15 | Chat row, left | Looks | A round picture, vertically centred in the row. | screenshot 1 |
| H-16 | Chat row, left | Looks | A group with no picture shows a tinted circle with a people symbol. | screenshot 1 |
| H-17 | Chat row, left | Looks | A group inside a community shows a rounded-square picture with a stacked edge behind it. | screenshot 1 |
| H-18 | Chat row, line 1 left | Looks | The chat name, white and bold, cut with an ellipsis if long. | screenshot 1 |
| H-19 | Chat row, line 1 right | Looks | The time of the last message, small and grey, right aligned on the name's baseline. | screenshot 1 |
| H-20 | Chat row, line 1 right | Looks | Today shows a clock time (24-hour here), the day before shows the word for yesterday. | screenshot 1 |
| H-21 | Chat row, line 1 right | Looks | Older chats show a weekday, then a short date. | unverified |
| H-22 | Chat row, line 2 | Looks | One line of grey preview text, cut with an ellipsis. | screenshot 1 |
| H-23 | Chat row, line 2 start | Looks | If the last message is yours, a tick mark comes first (one tick or two), showing its delivery state. | screenshot 1 |
| H-24 | Chat row, line 2 | Looks | In a group, the preview starts with who sent it: "You:" for yourself, or the sender's name with a tilde when they are not in your contacts. | screenshot 1 |
| H-25 | Chat row, line 2 | Looks | Non-text messages show a small symbol and a word instead of text: a picture symbol and a photo count, a camera symbol and "Video", a phone symbol and the call type. | screenshot 1 |
| H-26 | Chat row, line 2 | Looks | A reaction shows as a sentence: who reacted, the emoji, and the start of the message in quotes. | screenshot 1 |
| H-27 | Chat row, line 2 | Looks | Group events (someone added someone) show as a plain sentence. | screenshot 1 |
| H-28 | Chat row, line 2 | Looks | For a community group, line 2 starts with the community name, a small arrow, then the preview. | screenshot 1 |
| H-29 | Chat row, line 2 | Someone is typing | The preview is replaced by a green "typing" line until they stop. | unverified |
| H-30 | Chat row, line 2 right | Looks | A pinned chat shows a small grey pin at the far right of line 2. | screenshot 1 |
| H-31 | Chat row | Pins a chat | The chat stays above all unpinned chats. At most three chats can be pinned. | help: How to pin or unpin a chat |
| H-32 | Chat row (Android) | Long-presses, taps the pin in the top bar | Pins or unpins. | unverified |
| H-33 | Chat row (iOS) | Swipes right, taps Pin | Pins or unpins. | unverified |
| H-34 | Chat row, line 2 right | Looks | An unread chat shows a green rounded badge with the count in dark text, at the far right of line 2. | screenshot 1 |
| H-35 | Chat row, line 1 right | Looks | When a chat is unread, its time turns green as well. The name and preview do not change weight. | screenshot 1 |
| H-36 | Chat row, line 2 right | Looks | A muted chat shows a small crossed-out speaker beside the badge or pin. | unverified |
| H-37 | Chat row | Mutes a chat | The choices are 8 hours, 1 week or always. Messages still arrive; only sound and alerts stop. A mention still alerts you. | help: How to mute or unmute individual or group chat notifications |
| H-38 | Chat row | Marks as unread | A green badge (a dot with no number) appears on the row. Only you see this; the sender's ticks stay as read. | help: How to mark a message as read or unread (dot shape unverified) |
| H-39 | Chat row (iOS) | Swipes right | Offers mark unread or read. | unverified |
| H-40 | Chat row | Taps | The chat opens and the unread badge clears. | unverified |
| H-41 | Chat row picture | Taps the picture | A small card pops up over the list with a larger picture and quick buttons (message, call, video, info). | unverified |
| H-42 | Chat row (Android) | Long-presses | The row becomes selected and the title bar is replaced by an action bar. Tapping more rows adds them. | help: How to archive or unarchive a chat or group |
| H-43 | Selection action bar (Android) | Looks | Left: a close arrow and the number selected. Right: icons for pin, delete, mute, archive, then three dots for the rest (mark unread, add to list or favourites, select all, lock, block). | unverified |
| H-44 | Selected row (Android) | Looks | The row gets a tinted background and a green tick over the picture. | unverified |
| H-45 | Selection action bar (Android) | Taps the archive icon | The chat leaves the main list. | help: How to archive or unarchive a chat or group |
| H-46 | Chat row (iOS) | Swipes left | Two buttons appear: More and Archive. | help: How to archive or unarchive a chat or group (More button unverified) |
| H-47 | Chat row (iOS) | Long-presses | A preview of the chat lifts up with a menu under it. | unverified |
| H-48 | Chat row (Android) | Swipes sideways | Nothing; Android rows have no swipe actions. | unverified |
| H-49 | Top of chat list | Looks | Once any chat is archived, an "Archived" row appears above the chats, with a count of unread archived chats. | help: How to archive or unarchive a chat or group (count unverified) |
| H-50 | Archived chat | Gets a new message | It stays archived by default. A setting can make it return to the list instead. | help: How to archive or unarchive a chat or group (the pages disagree on which is the default) |
| H-51 | Chat row | Deletes a chat | It is removed for you only, and this cannot be undone except from a backup. | help: How to delete chats |
| H-52 | Between rows | Looks | No divider lines. Rows are separated by space alone. | screenshot 1 |
| H-53 | Bottom right, above the bottom bar | Looks | A green rounded-square button with a "new chat" symbol floats over the list. | screenshot 1 |
| H-54 | New-chat button | Taps | A contact picker opens: search at top, then new group, new contact, new community, then contacts. | unverified |
| H-55 | Above the new-chat button | Looks | A smaller dark rounded-square button for the assistant, same right edge. | screenshot 1 |
| H-56 | Three-dot button on home | Taps | A menu drops from the top right corner, over the search field and chips. Items: new group, new community, new broadcast, linked devices, starred, read all. | screenshot 4 |
| H-57 | Home menu | Looks | Settings is not in this menu any more; it moved to the "You" tab. | screenshot 4 |
| H-58 | Home menu | Taps "read all" | Every unread badge clears at once. | screenshot 4 (effect unverified) |
| H-59 | Home menu | Taps outside it | The menu closes and nothing else happens. | unverified |
| H-60 | Bottom bar | Looks | Five places, evenly spread: Chats, Updates, Communities, Calls, You. Each is an icon over a label. | screenshot 1 |
| H-61 | Bottom bar | Looks | The current place has a dark green rounded highlight behind its icon, a filled icon and a bolder label. | screenshot 1, screenshot 5 |
| H-62 | Bottom bar | Looks | Chats carries a green badge with the number of unread chats; Calls carries the number of missed calls; Updates carries a plain green dot. | screenshot 1 |
| H-63 | Bottom bar | Looks | The last place, "You", shows your own picture instead of an icon. | screenshot 1 |
| H-64 | Bottom bar | Opens Calls | The missed-call badge on Calls disappears. | screenshot 1 against screenshot 5 |
| H-65 | Bottom bar (Android) | Looks | The places sit at the bottom of the screen; their order cannot be changed. | help: About finding the More options icon |
| H-66 | Bottom bar (iOS) | Looks | Five places too, but in another order, with Chats near the right and Settings last. | unverified |
| H-67 | Home | Swipes sideways across the list | Does not change place; only the bottom bar does. (Old Android builds had swipeable top tabs.) | unverified |
| H-68 | Home with no chats | Looks | A short centred message and a button to start a chat or invite people. | unverified |

## 2. Chat (conversation)

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| C-01 | Top bar | Looks | Left to right: back arrow, round picture, name, then video call, voice call and three dots at the right. | screenshot 2 |
| C-02 | Top bar | Taps the name or picture | The contact or group info screen opens. | help: How to mute or unmute individual or group chat notifications |
| C-03 | Top bar, under the name | Looks | A small second line appears when there is something to say: "online", a last-seen time, "typing", or (in groups) the member names. When there is nothing, the name sits alone, centred on the bar's height. | screenshot 2 (name alone); help: About last seen and online |
| C-04 | Top bar, under the name | Other person types | The line changes to "typing" while they type, then returns. In a group it names who is typing. | help: About last seen and online (group wording unverified) |
| C-05 | Top bar, under the name | Looks | Who can see your online and last-seen line is a privacy choice (everyone, contacts, some contacts, nobody). | help: About last seen and online |
| C-06 | Top bar (iOS) | Looks | The back arrow carries the count of other unread chats beside it. | unverified |
| C-07 | Background | Looks | A dark wallpaper with a faint line-drawing pattern sits behind the messages. | screenshot 2 |
| C-08 | Bubbles | Looks | Messages you receive are dark grey bubbles on the left; messages you send are dark green bubbles on the right. | screenshot 2 |
| C-09 | Bubbles | Looks | A bubble is only as wide as its text needs, up to about four fifths of the screen. Long text wraps inside. | screenshot 2 |
| C-10 | Bubbles | Looks | The first bubble in a run from one sender has a small tail at its top outer corner (top left for received, top right for sent). | screenshot 2 |
| C-11 | Bubbles | Looks | Later bubbles in the same run have no tail and sit closer together; a new sender, a date change or a call event starts a new run. | unverified |
| C-12 | Bubbles in groups | Looks | The first received bubble of a run shows the sender's name in a colour at its top, and their small picture beside the run. | unverified |
| C-13 | Inside a bubble, bottom right | Looks | The time, small and grey, sits on the last line at the right. If the last line is full, the time drops to its own line. | screenshot 2 |
| C-14 | Inside a sent bubble | Looks | Tick marks sit right after the time. | help: How to check read receipts |
| C-15 | Ticks | Looks | A clock: not sent yet. | help: How to check read receipts |
| C-16 | Ticks | Looks | One grey tick: sent. | help: How to check read receipts |
| C-17 | Ticks | Looks | Two grey ticks: delivered to the other person's phone or linked device. | help: How to check read receipts |
| C-18 | Ticks | Looks | Two blue ticks: read. | help: How to check read receipts |
| C-19 | Ticks in a group | Looks | The second tick appears only when everyone has received it; blue only when everyone has read it. | help: How to check read receipts |
| C-20 | Ticks | Either side turns read receipts off | Blue ticks stop showing in one-to-one chats. Groups always send them. | help: How to check read receipts |
| C-21 | Timeline | Looks | A small centred rounded label marks each new day: the weekday for the past week, the word for yesterday or today, a full date before that. | screenshot 2 (full date unverified) |
| C-22 | Timeline | Scrolls | The day label for the messages on screen floats at the top while scrolling, then fades. | unverified |
| C-23 | Timeline | Opens a chat with unread messages | A centred divider with the unread count sits above the first unread message, and the chat opens at that point. | unverified |
| C-24 | Timeline | Looks | System notes (encryption notice, someone joined, timer changed) are centred labels like the day label. | unverified |
| C-25 | A message | Swipes it to the right | The message slides a little, a reply arrow appears, and on release a quote of it docks above the text field with a close button. | help: How to reply to a message |
| C-26 | A sent reply | Looks | The reply bubble carries the quoted message at its top, with a coloured bar and the sender's name. | help: How to reply to a message (bar and name unverified) |
| C-27 | Quote in a bubble | Taps | The chat scrolls to the original message and flashes it. | unverified |
| C-28 | A message | Long-presses | The message is selected and a row of emoji appears just above it. | help: How to react to messages |
| C-29 | Reactions row | Looks | Six common emoji and a plus for the full picker. | unverified |
| C-30 | Reactions row | Taps an emoji | A small round chip with that emoji attaches to the bubble's bottom edge, overlapping it. One reaction per person per message. | help: How to react to messages; screenshot 2 |
| C-31 | Reaction chip | Looks | It hangs from the bottom of the bubble, on the inner side, half over the bubble and half below it. The next message is pushed down to make room. | screenshot 2 |
| C-32 | Reaction chip | Taps | A sheet from the bottom lists who reacted with what; tapping your own removes it. | unverified |
| C-33 | Reaction | Adds or removes | The sender is told about a new reaction, not about a removed one. | help: How to react to messages |
| C-34 | Long-pressed message (Android) | Looks | The top bar becomes an action bar: back arrow and count on the left; reply, star, delete, forward and three dots on the right (copy, info, edit, pin, report under the dots). | help: How to delete messages; help: How to star or unstar a message (exact icon order unverified) |
| C-35 | Long-pressed message (Android) | Taps other messages | They join the selection; reply and info disappear when more than one is chosen. | unverified |
| C-36 | Long-pressed message (iOS) | Looks | The rest of the screen blurs; the reactions row sits above the message and a menu list sits below it (reply, forward, copy, star, info, delete, more). | unverified |
| C-37 | Action bar | Taps forward | A picker of chats opens; choose up to five, then send. | help: How to forward messages |
| C-38 | A forwarded message | Looks | It carries a small "forwarded" label at the top. One passed along through many chats gets a stronger label and can then go to only one chat at a time. | help: About forwarding limits |
| C-39 | Beside a media or document bubble | Looks | A small round forward button sits outside the bubble, level with its middle, on the side facing the screen centre. | screenshot 2 |
| C-40 | Action bar | Taps star | A small star appears beside the time in the bubble. All starred messages are listed under "starred" in the home menu and in the chat's info. | help: How to star or unstar a message (star position unverified); screenshot 4 |
| C-41 | Action bar | Taps copy | The text goes to the clipboard and a short note confirms it. | unverified |
| C-42 | Action bar | Taps delete on your own recent message | A choice appears: delete for everyone, delete for me, cancel. | help: How to delete messages |
| C-43 | Delete for everyone | Confirms | The bubble stays in place but its content is replaced by a grey italic "deleted" note, for everyone. Allowed for about two days after sending (an older help page says about an hour). | help: How to delete messages |
| C-44 | Delete for me | Confirms | The bubble disappears from your phone only. A short "undo" note shows for a few seconds. | help: How to delete messages (undo unverified) |
| C-45 | Delete in a group | An admin deletes someone's message | The note names the admin who removed it. | help: How to delete messages |
| C-46 | Action bar, three dots | Taps info on your own message | A screen shows when it was delivered and when it was read (or played, for voice). In a group it lists who has read it and who has only received it. | help: How to check read receipts |
| C-47 | Action bar, three dots | Taps edit, within 15 minutes of sending | The text returns to the text field; on send, the bubble updates for everyone with no new alert. Media cannot be edited. | help: How to edit messages |
| C-48 | An edited bubble | Looks | The word "edited" sits beside the time. | help: How to edit messages |
| C-49 | A message with a web link | Sends or receives | A preview card sits at the top of the bubble: picture, page title, short description, site name. The link itself stays in the text below. Tapping opens the page. | unverified |
| C-50 | Text field | Types a link | The preview appears above the text field before sending, with a close button to drop it. | unverified |
| C-51 | Link previews | Turns them off | A privacy setting stops previews being made. | help: How to change your privacy settings |
| C-52 | A document bubble | Looks | An inner card holds a file-type icon on the left, the file name (up to two lines), and below it a grey line: page count, size, type. The time sits under the card. | screenshot 2 |
| C-53 | A document bubble | Taps | The file downloads if needed, then opens in a viewer. | unverified |
| C-54 | Documents | Sends | Files up to 2 GB are allowed. | help: How to send media, contacts, or location |
| C-55 | A photo or video bubble | Looks | The picture fills the bubble edge to edge with a thin border; the time sits over the picture's bottom right corner. A caption, if any, goes below the picture. | unverified |
| C-56 | Several photos sent together | Looks | They are grouped into one tile grid (up to four shown, with a "+N" on the last). | unverified |
| C-57 | A photo | Taps | It opens full screen on black; swipe sideways for the next, swipe down to close. | unverified |
| C-58 | A video bubble | Looks | A play button in the middle and the length in a corner. | unverified |
| C-59 | A photo not yet downloaded | Looks | It is blurred with a download button showing the size. | unverified |
| C-60 | Microphone button | Presses and holds | Recording starts at once; a timer and a "slide to cancel" hint replace the text field. Releasing sends it. | help: How to send voice messages |
| C-61 | Microphone button, while holding | Slides left | The recording is thrown away. | unverified |
| C-62 | Microphone button, while holding | Slides up | Recording locks, so the finger can lift. Pause, a bin and send buttons appear; it can be played back before sending. | help: How to preview a voice message |
| C-63 | Microphone button | Taps briefly | Nothing is sent; a hint says to hold. | unverified |
| C-64 | A voice note bubble | Looks | Play button, a waveform with a moving dot, length, and the sender's picture with a small microphone. | unverified |
| C-65 | A voice note bubble | Looks | The microphone mark is grey until the other person has played it, then blue. | help: How to send voice messages |
| C-66 | A voice note bubble | Taps the speed label while playing | Speed steps through 1x, 1.5x, 2x. | unverified |
| C-67 | Timeline | Looks | Calls appear in the timeline as bubbles, on the side of whoever placed the call. | screenshot 2 |
| C-68 | Call bubble | Looks | A round icon on the left, a bold title (call type), and a grey second line: the length for a finished call, a "tap to call back" hint for a missed one. Time at the bottom right. | screenshot 2 |
| C-69 | Missed-call bubble | Looks | The icon is red. The bubble is otherwise a normal received bubble. | screenshot 2 |
| C-70 | Call bubble | Taps | Calls that person back with the same kind of call. | screenshot 2 (hint text seen; effect unverified) |
| C-71 | Timeline | Scrolls up from the bottom | A small round button with a down arrow appears at the bottom right, above the text field. | unverified |
| C-72 | Scroll-to-latest button | New messages arrive while scrolled up | A green count badge sits on the button. Tapping jumps to the newest message and clears it. | unverified |
| C-73 | Timeline | Is at the bottom when a message arrives | The list scrolls to show it; no button appears. | unverified |
| C-74 | Top bar, three dots | Taps | A menu drops from the top right: search, media, mute, disappearing messages, wallpaper, more. | unverified |
| C-75 | Chat search | Types | Matches are highlighted in the timeline with up and down arrows to step through them. | unverified |
| C-76 | Text in a bubble | Looks | Simple marks format text: asterisks for bold, underscores for italic, tildes for strike-through, backticks for code. | unverified |
| C-77 | A long message | Looks | It is cut after many lines with a "read more" link. | unverified |
| C-78 | A message of only emoji | Looks | One to three emoji alone are drawn larger. | unverified |
| C-79 | An unsent message with no network | Looks | The clock mark stays; it sends by itself when the network returns. | help: How to check read receipts |

## 3. Composer (the text field row)

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| M-01 | Bottom of chat (Android) | Looks | Two separate shapes: a long rounded field on the left and one round green button on the right. | screenshot 2 |
| M-02 | Inside the field (Android) | Looks | Left to right: an emoji/sticker button, the grey hint word, a paperclip, a camera. | screenshot 2 |
| M-03 | Round button | Looks, field empty | It shows a microphone. | screenshot 2 |
| M-04 | Round button | Types any text | The same button changes to a Send arrow in place. Clearing the text changes it back. | unverified |
| M-05 | Inside the field (Android) | Types text | The camera hides to give room; the paperclip stays. | unverified |
| M-06 | Send button | Taps | The message is sent, the field empties, the keyboard stays open, and the list scrolls to the new bubble. | unverified |
| M-07 | Field | Types several lines | The field grows upward one line at a time, to about six lines, then scrolls inside. The buttons stay level with the bottom line. | unverified |
| M-08 | Keyboard Enter key | Presses | Adds a new line by default on phones. A setting can make it send. | unverified |
| M-09 | Emoji button | Taps | The keyboard is swapped for a panel of the same height with emoji, GIF and sticker sections; the button turns into a keyboard symbol to swap back. | unverified |
| M-10 | Paperclip (Android) | Taps | A panel of round coloured choices rises just above the field: document, camera, gallery, audio, location, contact, poll and more. | help: How to send media, contacts, or location (panel shape, poll unverified) |
| M-11 | Attach (iOS) | Taps the plus at the left of the field | A list of the same choices slides up from the bottom. | help: How to send media, contacts, or location (sheet shape unverified) |
| M-12 | Gallery choice | Picks photos | Up to 100 at once; a preview screen lets you add a caption before sending. | help: How to send media, contacts, or location (preview unverified) |
| M-13 | Camera | Taps | The camera opens full screen; tap for a photo, hold for video. | unverified |
| M-14 | Composer (iOS) | Looks | Plus on the left; a field with a sticker button inside; camera and microphone on the right. Typing replaces camera and microphone with one round Send button. | unverified |
| M-15 | Field | Leaves a chat with unsent text | The text is kept as a draft; the chat row shows "Draft" in green before the preview. | unverified |
| M-16 | Above the field | Is replying or editing | A strip docks on top of the field showing what is being replied to or edited, with a close button. | help: How to reply to a message (strip shape unverified) |
| M-17 | Field in a group | Types @ | A list of members appears above the field; picking one inserts a mention. | unverified |
| M-18 | Composer | Is in a group where only admins may send | The field is replaced by a grey note saying so. | help: How to change group admin settings (note shape unverified) |

## 4. Chat info and group info

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| I-01 | Top bar | Looks | A back arrow on the left; a QR-code button and three dots on the right. No title text. | screenshot 3 |
| I-02 | Top, centred | Looks | A large round picture, centred. | screenshot 3 |
| I-03 | Picture | Taps | It opens full screen. | unverified |
| I-04 | Under the picture | Looks | The name, large, centred, regular weight. | screenshot 3 |
| I-05 | Under the name | Looks | A small grey facts line: for a group, the word for group, a dot, and the member count. For a person, the phone number. | screenshot 3 (person case unverified) |
| I-06 | Under the facts line | Looks | If there is no description and you may edit, a green link invites you to add one. Otherwise the description text sits here. | screenshot 3 (description text case unverified) |
| I-07 | Action row | Looks | Four equal rounded buttons in one row, each an icon in a dark pill with a label beneath: call, status, share, search. | screenshot 3 |
| I-08 | Action row | Looks | The call button has a small down arrow (it offers voice or video) and is greyed out when there is nobody else to call. | screenshot 3 |
| I-09 | Action row, one-to-one chat | Looks | The buttons are voice call, video call and search (and pay, in some countries). | unverified |
| I-10 | Below the action row | Looks | A thin divider, then three text tabs: members, media, settings. The current tab is white with a short green underline; the others are grey. | screenshot 3 |
| I-11 | Tabs | Taps or swipes | The content below switches without leaving the screen. | unverified |
| I-12 | Members tab | Looks | A grey count on the left and a search button on the right. | screenshot 3 |
| I-13 | Members tab | Looks | First row is "add members": a green round icon and a label. | screenshot 3 |
| I-14 | Add members | Taps | A contact picker opens with multi-select; admins add, and may let others add. | help: How to add and remove group members |
| I-15 | Member row | Looks | Round picture, name, a second line (their about text, or for yourself a green link to add a tag). You are listed first, as "You". | screenshot 3 |
| I-16 | Member row, right | Looks | An admin has a small dark green tag with pale green text at the right of the row. | screenshot 3 |
| I-17 | Member row | Taps another member | A small menu offers message, call, view, make admin, remove (the last two for admins only). | help: How to manage group admins (menu shape unverified) |
| I-18 | Members tab | Looks | A green link under the list opens a history of who joined and left. | screenshot 3 |
| I-19 | Lower on the screen | Looks | A header for media, links and documents with a total count and an arrow at the right. | screenshot 3 |
| I-20 | Media strip | Looks | One row of square-ish thumbnails that scrolls sideways, newest first. | screenshot 3 |
| I-21 | Media header or Media tab | Taps | A full screen opens with three tabs: media, links, documents, grouped by month. | unverified |
| I-22 | Settings tab or lower rows | Looks | Holds notifications (mute), media visibility, starred messages, disappearing messages, chat lock, encryption note, group permissions. | unverified |
| I-23 | Mute | Taps | A choice of 8 hours, 1 week or always. | help: How to mute or unmute individual or group chat notifications |
| I-24 | Starred | Taps | A list of this chat's starred messages; tapping one jumps to it in the chat. | help: How to star or unstar a message (jump unverified) |
| I-25 | Disappearing messages | Taps | A choice of timer (24 hours, 7 days, 90 days, off). Only new messages are affected; a note is posted in the chat. | help: About disappearing messages (timer values unverified) |
| I-26 | Disappearing messages in a group | Looks | Any member can change it unless admins limit it to admins. | help: About disappearing messages |
| I-27 | Chat with a timer on | Looks | A small clock mark shows on the chat's picture. | unverified |
| I-28 | Group permissions | Admin opens | Switches for who may edit group info, send messages, add members, and whether joins need approval. | help: How to change group admin settings |
| I-29 | Bottom of a person's info | Looks | Red rows: block, report. | help: How to block and report someone (colour and position unverified) |
| I-30 | Block | Confirms | Their messages and calls stop reaching you. In shared groups you still see each other's messages. | help: About reporting and blocking on WhatsApp |
| I-31 | Bottom of a group's info | Looks | Red rows: exit group, report group. | unverified |
| I-32 | Exit group | Confirms in a dialog | You leave. If you were the only admin, another member is made admin at random. | help: How to manage group admins |
| I-33 | Group limits | Looks | Up to 1024 members; any number of admins; the creator cannot be removed. | help: How to add and remove group members; help: How to manage group admins |
| I-34 | Three dots on info | Taps | A small menu: change name, share, edit, verify security code and similar. | unverified |
| I-35 | Name, as admin | Taps | Edits the group name on a simple one-field screen. | help: How to make changes to groups (screen shape unverified) |

## 5. Calls

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| L-01 | Top bar | Looks | The title is the word for calls, large, left aligned, regular weight; a search button and three dots on the right. | screenshot 5 |
| L-02 | Under the title | Looks | A row of round quick actions with labels beneath: call, schedule, keypad. | screenshot 5 |
| L-03 | Quick actions row | Looks | After the three actions, the same row continues with favourite people as round pictures with names; the row scrolls sideways. | screenshot 5 |
| L-04 | A favourite's picture | Taps | Calls that person. | unverified |
| L-05 | Below | Looks | A bold section heading for recent calls, then the list. | screenshot 5 |
| L-06 | Call row | Looks | Round picture, name on line 1, and on line 2 a small arrow followed by the day and time in grey. | screenshot 5 |
| L-07 | Call row, arrow | Looks | Green arrow pointing up-right: a call you made. Green arrow pointing down-left: a call you answered. Red arrow pointing down-left: a call you missed. | screenshot 5 |
| L-08 | Call row, name | Looks | For a missed call the name itself is red. | screenshot 5 |
| L-09 | Call row, name | Looks | Several calls in a row with the same person and outcome fold into one row, with the count in brackets after the name. | screenshot 5 |
| L-10 | Call row, right | Looks | A phone or a video-camera icon shows which kind of call it was. | screenshot 5 |
| L-11 | Call row, right icon | Taps | Calls back with that kind of call. | unverified |
| L-12 | Call row | Taps the row | Opens that call's details: each call in the fold with time and length. | unverified |
| L-13 | Call row | Long-presses | Selects it; a bin appears in the top bar to remove it from the log. | unverified |
| L-14 | Bottom right | Looks | The same green rounded-square floating button as on Chats, here with a phone-and-plus symbol. | screenshot 5 |
| L-15 | New-call button | Taps | The new-call picker opens as a full screen. | screenshot 6 |
| L-16 | Picker, top | Looks | A rounded search field with the back arrow inside it on the left and a keypad button on the right. It takes a name, a number or a username. | screenshot 6 |
| L-17 | Picker, under the field | Looks | A centred grey line states how many people can be added (31 besides you). | screenshot 6 |
| L-18 | Picker | Looks | Four action rows with green round icons: new call link, call a number, new contact (with a QR button at the right), schedule call. | screenshot 6 |
| L-19 | Picker | Looks | A grey section heading for frequent contacts, then contact rows: picture, name, optional about line, and an empty circle at the right. Thin dividers start under the text, not under the picture. | screenshot 6 |
| L-20 | Contact row | Taps | The circle fills with a tick. Several can be chosen; chosen people collect in a strip at the top, and call buttons (voice, video) appear at the bottom. | unverified |
| L-21 | Group calls | Looks | Up to 32 people can be in one call. | help: About group calls |
| L-22 | New call link | Taps | Makes a link for a voice or video call that can be shared into chats. | help: How to create and share WhatsApp call links |
| L-23 | Schedule | Taps | Creates an event with a date, time and a call link; people are reminded when it starts. | help: How to create and edit events in groups |
| L-24 | Incoming call | Looks | A full-screen page with the caller's picture and name; swipe up to answer on Android, buttons on iOS. | unverified |
| L-25 | During a call | Looks | A bottom bar of round buttons: speaker, video, mute, end (red). | unverified |
| L-26 | During a call | Leaves the call screen | A green strip at the top of the app returns to the call when tapped. | unverified |
| L-27 | Calls with no history | Looks | A short centred hint about starting a call. | unverified |

## 6. You / Settings

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| S-01 | Bottom bar (Android) | Taps "You" | Opens your own page. It replaces the old route through the three-dot menu. | screenshot 1; screenshot 4 |
| S-02 | Top of the page | Looks | Your picture, name and about line, with a QR-code button; tapping opens profile editing (picture, name, about, phone, links). | unverified |
| S-03 | Settings list | Looks | A plain list of rows, each an icon, a title and a grey one-line summary. | unverified |
| S-04 | Settings list | Looks | Usual groups, in order: account; privacy; avatar; lists; chats; notifications; storage and data; accessibility; app language; help; invite a friend. | unverified |
| S-05 | Privacy | Opens | Who sees last seen and online, picture, about, status; read receipts; default message timer; blocked people; app lock; chat lock. A guided check-up walks through these. | help: About privacy checkup; help: How to change your privacy settings |
| S-06 | Chats | Opens | Theme (light, dark, system), wallpaper, enter-key-sends, font size, keep chats archived, backup, history. | unverified |
| S-07 | Notifications | Opens | Tones, vibration, pop-ups, separately for messages, groups and calls. | help: How to manage your notifications (contents unverified) |
| S-08 | Linked devices (Android) | Opens from the home three-dot menu | Lists linked devices; link a new one by scanning a QR code. Up to four. Idle ones drop off after 30 days. | screenshot 4; help: About linked devices |
| S-09 | Linked devices (iOS) | Opens from Settings | Same screen. | help: How to link a device |
| S-10 | Starred (Android) | Opens from the home three-dot menu | All starred messages across chats. | screenshot 4 |
| S-11 | Starred (iOS) | Opens from Settings | Same list. | unverified |
| S-12 | Settings (iOS) | Looks | The last place in the bottom bar; rows are grouped into rounded cards in the system style. | unverified |
| S-13 | Settings (Web/Desktop) | Clicks the gear or own picture at the bottom of the left rail | Settings open in the list column, not as a new window. | help: How to contact WhatsApp Support (column placement unverified) |

## 7. Wide screens (Web and Desktop)

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| W-01 | Whole window | Looks | Three areas side by side: a narrow icon rail, a chat-list column, and the open conversation filling the rest. | unverified |
| W-02 | Left rail, top | Looks | Icons only, stacked: chats, calls, status, channels, communities, assistant. The current one is highlighted; unread counts sit on the icons. | unverified |
| W-03 | Left rail, bottom | Looks | Settings and your own picture. | unverified |
| W-04 | Chat-list column | Looks | Title, new-chat and menu buttons at the top; a search field; the same filter chips; then the same chat rows as on phones. | unverified |
| W-05 | Chat-list column | Clicks a row | The conversation opens on the right; the row stays highlighted. The list never goes away. | unverified |
| W-06 | Conversation area | Nothing selected | A calm placeholder with a short note. | unverified |
| W-07 | Chat row | Hovers | A small down-arrow appears at the right of the row; clicking it opens a menu: archive, mute, pin, mark unread, delete. | help: How to pin or unpin a chat; help: How to mark a message as read or unread |
| W-08 | Chat row | Right-clicks | The same menu opens at the pointer. | unverified |
| W-09 | A message | Hovers | A small down-arrow appears in the bubble's corner and an emoji button beside the bubble. | help: How to reply to a message; help: How to react to messages (emoji button unverified) |
| W-10 | Message arrow | Clicks | A menu anchored to the bubble: reply, react, forward, star, pin, info, edit, delete. | help: How to reply to a message; help: How to forward messages; help: How to star or unstar a message |
| W-11 | Conversation header | Clicks the name | Contact or group info opens as a panel on the right side, narrowing the conversation; a close button returns. | unverified |
| W-12 | Search in chat, starred, media | Opens | These also use the right-side panel. | unverified |
| W-13 | Composer | Looks | Plus (attach) and emoji on the left, the field in the middle, microphone on the right, changing to Send when there is text. | unverified |
| W-14 | Composer | Presses Enter | Sends. Shift+Enter adds a line. | unverified |
| W-15 | Microphone | Clicks (no holding) | Recording starts; pause, bin and send controls show; a click on send finishes. | help: How to send voice messages |
| W-16 | Keyboard | Uses shortcuts | Shortcuts exist for mute, archive, pin, mark unread, search, new chat. Web and Windows pages list different keys for some. | help: About keyboard shortcuts |
| W-17 | Files | Drags a file onto the conversation | A preview opens with a caption field before sending. | unverified |
| W-18 | Calls | Starts a call | Voice and video calls, one-to-one and group, work in the browser and desktop app. | blog: Introducing Web Calling on WhatsApp, Plus More New Updates |
| W-19 | Narrow window | Shrinks the window | The rail stays; below a certain width the list and conversation stop sharing space and show one at a time. | unverified |
| W-20 | Menus and dialogs | Opens | Menus are small and anchored to what was clicked; confirmations are centred boxes over a dimmed page; nothing slides up from the bottom. | unverified |

## 8. Motion and feedback

| ID | Where | User does | What happens | Source |
|---|---|---|---|---|
| X-01 | Opening a chat (Android) | Taps a row | The chat screen comes in with the standard system page change (a short slide or fade); back reverses it. | unverified |
| X-02 | Opening a chat (iOS) | Taps a row | The chat slides in from the right; dragging from the left edge slides it back, following the finger. | unverified |
| X-03 | Switching bottom places | Taps another place | The content swaps with no slide; the highlight moves to the new icon. | unverified |
| X-04 | Three-dot menus (Android) | Taps | A small menu grows from the corner of the button, anchored to it, with no dimming behind. Used for lists of commands. | screenshot 4 (the still shows the anchored menu and no dimming; the growth is unverified) |
| X-05 | Bottom sheets | Opens reactions list, attach (iOS), member options, share | A panel slides up from the bottom over a dimmed page; swipe down to close. Used for choices tied to the thumb and for lists that may be long. | unverified |
| X-06 | Centred dialogs | Deletes, leaves a group, blocks, clears a chat | A small box in the middle of a dimmed page with text buttons. Used when something cannot be undone. | unverified |
| X-07 | iOS choices | Deletes, mutes | A system list of buttons slides up from the bottom, destructive choices in red, cancel separate. | unverified |
| X-08 | Rows and buttons (Android) | Presses | A ripple spreads from the finger in a lighter shade. | unverified |
| X-09 | Rows (iOS) | Presses | The row turns a flat grey while held. | unverified |
| X-10 | Message long-press | Holds | A short vibration, then the bubble is tinted across the full width of the screen. | unverified |
| X-11 | Swipe to reply | Drags a bubble | The bubble follows the finger a short way, a reply arrow fades in, a light vibration marks the trigger point, and it springs back. | unverified |
| X-12 | Sending | Taps Send | The new bubble appears at once with a clock, which changes to one tick, then two, without moving the bubble. | help: How to check read receipts (instant appearance unverified) |
| X-13 | Short confirmations | Copies, archives, deletes for me | A brief note appears near the bottom, sometimes with an undo button, and leaves by itself. | unverified |
| X-14 | Voice recording | Holds the microphone | The button grows under the finger and a red dot blinks beside a running timer. | unverified |
| X-15 | Chat list | New message arrives | That chat moves to the top (under the pinned ones) and its badge count goes up. | unverified |
| X-16 | Empty states | Opens an empty list | A short centred line of grey text, sometimes a simple drawing and one button; never a blank page. | unverified |
| X-17 | Pull to refresh | Pulls the chat list down | Nothing reloads; lists are always live. | unverified |
| X-18 | Loading media | Waits | A ring fills around a cancel button over the blurred thumbnail. | unverified |
| X-19 | Colour for meaning | Looks | Green marks unread, active and primary actions; red marks missed calls and destructive actions; blue is kept for read ticks and played voice notes. | screenshot 1, 2, 3, 5; help: How to check read receipts |

## 9. Type and size

Measured from the screenshots. 1 unit = screen width / 412 = 2.24 px here.

How text size was worked out: the height of a capital letter was measured in pixels and divided by 0.71 (the usual ratio of capital height to font size for Roboto-like fonts). Expect an error of about one unit.

The phone's text is enlarged. Comparing with WhatsApp's usual sizes (unverified: about 16 for message text and 17 for chat names at default), the enlargement is about 1.3 times. So for a default phone, divide the text sizes below by about 1.3. Heights that hold text (rows, fields, chips) will shrink a little too; pictures, icons and margins should not.

### Text

| Element | Capital height (px) | Size (units) | Weight as it appears | Colour (approx.) |
|---|---|---|---|---|
| Home title (app name) | 42 | 26 | Bold | White |
| Other screen titles (Calls) | 42 to 44 | 26 to 28 | Regular | White |
| Section heading (Recent) | 40 | 25 | Bold | White |
| Chat name in the list | 34 | 21 | Semi-bold to bold | White #F8FCFE |
| Preview line | about 31 | 19.5 | Regular | Grey #91979A |
| Time in the list | 27 | 17 | Regular | Grey; green when unread |
| Unread badge number | 29 | 18 | Bold | Near-black on green |
| Chip label | about 30 | 19 | Semi-bold | Grey #939A9C; pale green when chosen |
| Chip count | about 27 | 17 | Regular | Grey |
| Search hint | 37 | 22 | Regular | Grey |
| Bottom bar label | about 25 | 15.5 | Semi-bold; bold when current | White |
| Name in chat top bar | 35 | 22 | Regular | White |
| Message text | 33 | 20.5 (line step 22.5) | Regular | White |
| Time in a bubble | 26 | 16 | Regular | Grey #A3ACAE |
| Day label | about 26 | 16.5 | Semi-bold | Grey |
| Document name | about 31 | 19.5 | Regular | White |
| Document facts line | about 26 | 16 | Regular | Grey |
| Call bubble title | 35 | 21.5 | Bold | White |
| Call bubble second line | about 30 | 19 | Regular | Grey |
| Composer hint | about 35 | 22 | Regular | Grey |
| Menu item | about 32 | 20.5 | Regular | White |
| Info screen name | about 47 | 29.5 | Regular | White |
| Info facts line | about 26 | 16.5 | Regular | Grey |
| Info green link (add description) | about 33 | 20.5 | Regular | Green |
| Info action label | 27 | 17 | Regular | White |
| Info tab label | 34 | 20.5 | Bold | White current, grey others |
| Member and contact name | 35 | 22 | Regular to medium | White |
| Admin tag text | about 24 | 15 | Regular | Pale green #D2F9E1 |
| Call row name | 35 | 22 | Regular | White; red #D76476 when missed |
| Call row second line | about 30 | 19 | Regular | Grey |
| Quick action label (Calls) | 28 | 17 | Regular | Grey |

### Sizes and spacing

| Element | Pixels | Units | Notes |
|---|---|---|---|
| Screen | 923 x 2000 | 412 x 893 | |
| Status bar | 75 | 33 | System, not the app's |
| Title line (home) | about 125 | 56 | From status bar to just above the search field |
| Search field height | 114 | 51 | Fully rounded ends; fill #23272A |
| Search field side margin | 29 | 13 | Field is 386 wide |
| Search icon to field edge | 35 | 16 | Hint text starts 60 from the screen edge |
| Gap, search field to chips | 60 | 27 | |
| Chip height | 75 | 33.5 | Fully rounded ends; thin outline; chosen chip filled #0F3627 |
| Chip inner side padding | 27 | 12 | |
| Gap between chips | 16 | 7 | First chip starts 17.5 from the screen edge |
| Gap, chips to first row | about 39 | 17 | |
| Chat row height | 183 | 82 | No dividers |
| Chat picture (home) | 114 | 51 | Round; 12.5 from the left edge |
| Gap, picture to text | 31 | 14 | Text starts at 78 |
| Right margin of time and badge | 39 | 17 | |
| Unread badge | 78 x 51 (3 digits) | 35 x 23 | Fully rounded; a circle for one digit; green #21BC62 |
| Floating button | 137 x 136 | 61 x 61 | Rounded square, corner about 17; green #21C064; 16.5 from the right edge; about 17 above the bottom bar |
| Second floating button | about 100 | 45 | Rounded square, dark; about 20 above the main one |
| Bottom bar height | about 189 (229 with the system gesture strip) | about 84 (102) | Same colour as the page, no line on top |
| Bottom bar current highlight | 154 x 78 | 69 x 35 | Fully rounded; #0F3627 |
| Bottom bar icon | about 54 | 24 | Label sits about 19 below the icon |
| Chat top bar height | about 124 | 55 | |
| Picture in chat top bar | 86 | 38 | |
| Bubble side margin | 42 | 19 | Same on both sides; the tail reaches about 6 further out |
| Bubble maximum width | 743 | 332 | 80% of the screen |
| Bubble padding, left | 27 | 12 | |
| Bubble padding, top | about 16 to 20 | 7 to 9 | To the top of the first line |
| Bubble padding, right of time | 21 | 9.5 | |
| Bubble padding, below time | about 11 | 5 | |
| Bubble corner | about 27 | 12 | |
| Bubble colours | | | Received #1F2829; sent #134A36; page #0C1214 |
| Gap between runs of bubbles | 25 | 11 | Within a run it is smaller (not seen; about 2 to 3, unverified) |
| Day label | about 180 x 68 | 80 x 30 | Corner about 8; about 10 clear above and below |
| Reaction chip | about 66 | 30 | Round; starts 9 in from the bubble's edge; overlaps the bubble by about 3 |
| Document icon | 52 | 23 | |
| Call bubble icon circle | 96 | 43 | |
| Call bubble | 558 x 176 (missed), 384 x 178 (made) | 249 x 79, 171 x 79 | |
| Forward button beside a bubble | about 76 | 34 | Round; about 12 from the bubble |
| Composer field height | 122 | 54.5 | Fully rounded ends; fill #1F2829; 9 from the left edge |
| Composer round button | 118 | 53 | Green #21C064; 10 from the right edge |
| Gap, field to round button | 20 | 9 | |
| Composer icons | about 50 | 22 to 24 | |
| Gap under the composer | 45 | 20 | Includes the system gesture strip |
| Overflow menu | 471 x 749 (6 items) | 210 x 334 | Corner about 13; 4.5 from the right edge; fill #14181B |
| Menu item height | 115 | 51 | Text starts 19 in from the menu's edge |
| Info screen picture | 287 | 128 | |
| Info action button | 154 x 116 | 69 x 52 | Fully rounded; gap 26; fill #23272A |
| Info tab underline | 172 x 7 | 77 x 3 | As wide as the label |
| Member and action rows | 163 | 73 | Picture or green icon circle 43 |
| Admin tag | 219 x 59 | 98 x 26 | Corner about 3; fill #0F3627 |
| Media strip thumbnail | about 240 x 157 | 107 x 70 | Gap about 4; height is cut off by the screenshot |
| Calls quick action circle | 134 | 60 | Gap 26; fill #1F2829 |
| Call row height | 159 | 71 | Picture 43.5 |
| Picker search field | 115 | 51 | Side margin 17 |
| Picker contact row | 165 | 74 | Picture 42.5; select circle 26, 17 from the right edge |

### System fonts

| Platform | Font | Source |
|---|---|---|
| Android | The phone's own system font: Roboto on most phones, the maker's font on some (Samsung's own on Samsung). The app follows the phone's text-size setting, as the screenshots show. | screenshots 1 to 6 (letter shapes match Roboto); font name unverified |
| iOS | San Francisco (SF Pro), the iPhone system font, following the system text-size setting. | unverified |
| Web and Desktop | The computer's system font: Segoe UI on Windows, San Francisco or Helvetica Neue on Mac, with common fallbacks. | unverified |

## 10. Android and iOS side by side

| Thing | Android | iOS | Source |
|---|---|---|---|
| Main navigation | Bottom bar: Chats, Updates, Communities, Calls, You | Bottom bar with Settings as the last place and a different order | screenshot 1; iOS unverified |
| Act on a chat row | Long-press, then icons in the top bar | Swipe left (More, Archive) or right (unread, pin); long-press for a preview menu | help: How to archive or unarchive a chat or group; rest unverified |
| Act on a message | Long-press: reactions above, actions in the top bar | Long-press: reactions above, menu below, page blurred | help: How to react to messages; layout unverified |
| Reply | Swipe the message right | Swipe the message right | help: How to reply to a message |
| Attach | Paperclip inside the field | Plus at the left of the field | help: How to send media, contacts, or location |
| Send and microphone | One round button outside the field that changes | Microphone and camera at the right, replaced by a round Send | screenshot 2; change and iOS unverified |
| Command menus | Small menu anchored at the top right | System list sliding from the bottom | screenshot 4; iOS unverified |
| Back | System back, arrow at top left | Arrow at top left with unread count, edge swipe | screenshot 2; iOS unverified |
| Linked devices, starred | Home three-dot menu | Settings | screenshot 4; help: How to link a device |
| New chat | Floating button at bottom right | Button at top right of Chats | screenshot 1; iOS unverified |

## 11. Open questions

- Every motion and timing claim is from memory. Record a real phone before copying any animation.
- The home selection action bar (which icons, in what order) was not seen and the help pages confirm only the archive icon.
- Light theme was not seen at all.
- The one-to-one contact info screen was not seen; screenshot 3 is a group with one member, so the call button is disabled and there is no description.
- The group info "Settings" tab was not opened, so where mute, disappearing messages and exit now sit is unconfirmed.
- Web and Desktop layout is from memory; the help centre confirms only the hover menus, voice recording controls, calling and shortcuts.
- Default text sizes are inferred by dividing by 1.3; measure a phone at default text size to confirm.
- Help pages disagree on the delete-for-everyone window (about two days against about an hour) and on whether archived chats stay archived by default.
