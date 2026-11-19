# Client

The Holo Messenger interface: one static page, no build step, no dependencies. It loads itself, plus the rules holo and its loader from the same site, and nothing from anywhere else.

Open `index.html` in a browser, or serve this folder with any static file server.

## State

A prototype on sample data. Nothing is stored, encrypted or sent. It becomes real as uor-comms gains an engine to call.

On the published site the page loads the `Messenger rules` holo, checks that it verifies, and asks it for five rules: how many panes fit, when to notify, what Enter does, which message actions are offered, and which link schemes open. It asks every case once at start-up, compares each answer with a built-in JavaScript copy, and from then on answers from the holo by table lookup, so no decision waits on a call. Settings, About says which source is in use and how many answers differed.

When the holo cannot be loaded (the page opened from a file, for example) the built-in copy is used. Other decisions, such as sort order, are JavaScript only, marked with a comment naming the proved rule they follow.

## Why this folder is exempt from the gate

The gate refuses non-Prism code everywhere else in this repository. A browser page cannot be written in LexLean, so files under `client/` are not counted. The exemption is in `xtask/src/audit.rs` and covers this folder only.

## Measured

On 2026-11-18, in one desktop browser, script time including layout, for a room of 20,000 messages: a send took 7.2 ms at the median and 14.9 ms at the 95th percentile; opening the room took 10.3 ms at the median. Painting is not included, and no phone was tested. The avatar menu has "Load 20,000 messages" to repeat it; Settings, About shows the last timings.

## Size budget

150 KB, counted as sent: the page's size after compression, which is what a browser downloads. Decided by Ilya on 2026-11-19. The raw size is not the budget.

At commit e4e976d the page is 258,930 bytes raw and 81,072 bytes compressed (`gzip -c client/index.html | wc -c`), so about 69 KB of the budget is left.
