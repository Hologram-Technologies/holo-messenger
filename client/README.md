# Client

The Holo Messenger interface: one static page, no build step, no dependencies. It loads itself and the rules holo and its loader from the same site, and the pinned uor-comms engine from uor-foundation.github.io, which it runs only once every file matches its BLAKE3 (the repository README, "Engine").

Open it from a web server (the engine needs IndexedDB and a secure page, https or localhost).

## State

Real people only (2026-11-21). Every chat is a room on the uor-comms engine, between real browsers; nothing is made up. There is no sample mode: its people, chats, scripted replies, simulated situations, sample devices, verification, receipts and recovery kit were removed, and the storage it left in a browser is deleted on load.

First run: a welcome, Create my identity (the identity and a non-extractable device key, made in this browser), your name (kept on this device; until profiles exist others do not see it), then one notice:

> Why: Holo Messenger sends real messages between real browsers, and no server keeps them. It is early: nothing is encrypted yet, so send nothing sensitive.
> How: Connection setup goes through ntfy.sh, a public server; the people you connect to and a public STUN server (Google's) see your network address. Both people must be online at the same time.
> What: Test with someone on the same network for now: a relay is coming, and until then two people on different networks may not connect. Invite someone with your link, or open an invite someone sent you.

Then the empty chat list, with Invite someone and Open an invite.

Works between real people: direct chats and groups, invite links both ways, names you give your contacts (kept only in this browser), send, reply, edit, one reaction per person, delete for everyone, forward, mentions, search, paging, reload restore, roles and removal through the engine, typing notices, and a placeholder for content newer than this engine reads.

Not built, so not shown: pictures, files, the camera and voice (they wait on encryption); read receipts and "online" (the engine cannot know); verifying people or devices; a recovery kit or linked devices (the device key cannot leave this browser, so the identity lives here only); blocking, reporting and message pins; groups anyone can join (uor-comms item 8). A group's name, description and picture reach only the browser that set them until uor-comms delivers settings to members; others see "Group · N people". Testing across networks waits on uor-comms's member relay.

The page asks the verified holo for nine of its rules and compares every answer with a built-in copy (173 answers, none differ in the tests); the other rules are built-in copies of the model's definitions, listed under Help and about.

## Why this folder is exempt from the gate

The gate refuses non-Prism code everywhere else in this repository. A browser page cannot be written in LexLean, so files under `client/` are not counted. The exemption is in `xtask/src/audit.rs` and covers this folder only.

## Size budget

150 KB, counted as sent: the page's size after compression, which is what a browser downloads. Decided by Ilya on 2026-11-19. The raw size is not the budget.

On 2026-11-21, real users only, the page is 323,056 bytes raw and 104,709 bytes compressed (`gzip -c client/index.html | wc -c`; 104,502 at level 9), down from 406,983 and 131,086 with sample mode, so about 45 KB of the budget is left. The engine files are fetched at every start and not counted.
