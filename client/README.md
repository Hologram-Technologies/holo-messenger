# Client

The Holo Messenger interface: one static page, no build step, no dependencies, no network requests.

Open `index.html` in a browser, or serve this folder with any static file server.

## State

A prototype on sample data. Nothing is stored, encrypted or sent. It becomes real as uor-comms gains an engine to call.

The decisions it takes (pane breakpoints, what Enter does, sort order, when to notify, which message actions are offered, which links open) are restated in JavaScript from the proved rules in `app/src/Messenger/`. Each one is marked with a comment naming the rule. They are to be replaced by calls into the holo, so they cannot drift.

## Why this folder is exempt from the gate

The gate refuses non-Prism code everywhere else in this repository. A browser page cannot be written in LexLean, so files under `client/` are not counted. The exemption is in `xtask/src/audit.rs` and covers this folder only.

## Measured

On 2026-11-18, in one desktop browser, script time including layout, for a room of 20,000 messages: a send took 7.2 ms at the median and 14.9 ms at the 95th percentile; opening the room took 10.3 ms at the median. Painting is not included, and no phone was tested. The avatar menu has "Load 20,000 messages" to repeat it; Settings, About shows the last timings.
