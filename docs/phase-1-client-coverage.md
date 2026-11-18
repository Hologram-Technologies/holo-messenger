# Client-only Phase 1 coverage

Scope: the 171 Phase 1 items whose engine standing is "not needed" or "proved rule".
A spec item is a definition in `src/Messenger/*.lex.tex`. "none yet" means the item has no formal rule in this pass.

| Domain | items | with a spec item | none yet |
|---|---|---|---|
| identity and devices | 4 | 4 | 0 |
| onboarding and recovery | 6 | 2 | 4 |
| rooms and membership | 21 | 11 | 10 |
| timeline and events | 22 | 10 | 12 |
| composer | 18 | 8 | 10 |
| encryption and verification | 2 | 0 | 2 |
| media and attachments | 4 | 1 | 3 |
| search | 13 | 7 | 6 |
| notifications | 8 | 6 | 2 |
| settings | 19 | 10 | 9 |
| navigation and layout | 54 | 15 | 39 |
| Total | 171 | 74 | 97 |

| HM ID | domain | name | engine standing | spec item |
|---|---|---|---|---|
| HM-CAP-002 | identity and devices | Single active tab lock | not needed | Session.lockStep |
| HM-JRN-003 | identity and devices | Session opened in another tab | not needed | Session.lockStep |
| HM-SUR-002 | identity and devices | Session lock screens | not needed | Session.lockStep |
| HM-SUR-011 | identity and devices | Clear data confirm dialog | not needed | Session.wipeAllowed |
| HM-CAP-023 | onboarding and recovery | Create engine client and start sync | proved rule | none yet |
| HM-SUR-015 | onboarding and recovery | Loading and splash screens | not needed | Session.rootView |
| HM-SUR-016 | onboarding and recovery | Fatal error page | not needed | Session.rootView |
| HM-SUR-018 | onboarding and recovery | Auth page frame | not needed | none yet |
| HM-SUR-028 | onboarding and recovery | Session restore error dialog | not needed | none yet |
| HM-SUR-029 | onboarding and recovery | Storage evicted dialog | not needed | none yet |
| HM-CAP-037 | rooms and membership | Local placeholder room | not needed | none yet |
| HM-CAP-038 | rooms and membership | Join room | proved rule | none yet |
| HM-CAP-041 | rooms and membership | Invite users | proved rule | none yet |
| HM-CAP-043 | rooms and membership | Accept or decline invite | proved rule | Membership.previewBar |
| HM-CAP-045 | rooms and membership | Leave and forget room | proved rule | Membership.leaveWarning |
| HM-CAP-046 | rooms and membership | Edit room name, topic, avatar | proved rule | none yet |
| HM-CAP-052 | rooms and membership | Load member list | proved rule | Membership.memberSection |
| HM-FEA-039 | rooms and membership | Invites in the list | proved rule | Membership.previewBar |
| HM-FEA-044 | rooms and membership | Room details | proved rule | none yet |
| HM-FEA-046 | rooms and membership | Member list | proved rule | Membership.memberSection |
| HM-FEA-050 | rooms and membership | Leave room | proved rule | Membership.leaveWarning |
| HM-JRN-027 | rooms and membership | Invite people to a room | proved rule | none yet |
| HM-JRN-028 | rooms and membership | Receive and answer an invite | proved rule | Membership.previewBar |
| HM-JRN-032 | rooms and membership | Leave a room | proved rule | Membership.leaveWarning |
| HM-SUR-035 | rooms and membership | Room preview bar | proved rule | Membership.previewBar |
| HM-SUR-040 | rooms and membership | Room info card | proved rule | none yet |
| HM-SUR-041 | rooms and membership | Member list | proved rule | Membership.memberSection |
| HM-SUR-042 | rooms and membership | Member tile | proved rule | none yet |
| HM-SUR-049 | rooms and membership | Invite progress and invite-anyway dialogs | proved rule | none yet |
| HM-SUR-051 | rooms and membership | Room topic dialog | proved rule | none yet |
| HM-SUR-054 | rooms and membership | Invite row and decline menu | proved rule | Membership.previewBar |
| HM-CAP-066 | timeline and events | Group and collapse events | not needed | Timeline.collapses |
| HM-CAP-067 | timeline and events | Decide which events are visible | not needed | Timeline.shown |
| HM-CAP-068 | timeline and events | Describe state changes as text | proved rule | none yet |
| HM-CAP-069 | timeline and events | Mention pills | not needed | none yet |
| HM-CAP-070 | timeline and events | Safe rich text rendering | not needed | none yet |
| HM-CAP-079 | timeline and events | Timeline grouping engine | not needed | Timeline.collapses |
| HM-CAP-081 | timeline and events | Virtual timeline items | not needed | Timeline.dividerBefore |
| HM-FEA-074 | timeline and events | Setting: timestamps | not needed | none yet |
| HM-FEA-091 | timeline and events | Copy text, caption, link | not needed | none yet |
| HM-FEA-093 | timeline and events | Collapsed room changes | proved rule | Timeline.collapses |
| HM-FEA-094 | timeline and events | Link safety prompt | not needed | Timeline.asksBeforeOpening |
| HM-SUR-063 | timeline and events | Message action bar | not needed | none yet |
| HM-SUR-064 | timeline and events | Message context menu | not needed | none yet |
| HM-SUR-068 | timeline and events | State and system event tiles | proved rule | none yet |
| HM-SUR-069 | timeline and events | Event summaries | not needed | Timeline.collapses |
| HM-SUR-070 | timeline and events | New room intro | not needed | none yet |
| HM-SUR-071 | timeline and events | Date separator | not needed | Timeline.dividerBefore |
| HM-SUR-078 | timeline and events | Room status bar | proved rule | Timeline.statusBar |
| HM-SUR-088 | timeline and events | Shortcut: timeline scrolling | not needed | none yet |
| HM-SUR-089 | timeline and events | Shortcut: read marker | not needed | none yet |
| HM-SUR-091 | timeline and events | Swipe to reply | not needed | Timeline.startsReply |
| HM-SUR-092 | timeline and events | Double-tap / tap behaviours | not needed | none yet |
| HM-CAP-089 | composer | Draft persistence | not needed | Composer.draftKept |
| HM-CAP-090 | composer | Structured editor model | not needed | none yet |
| HM-CAP-091 | composer | Markdown and HTML serialisation | not needed | none yet |
| HM-CAP-092 | composer | Autocomplete | not needed | none yet |
| HM-FEA-098 | composer | Emoji picker | not needed | none yet |
| HM-FEA-105 | composer | Setting: modifier+Enter to send | not needed | Composer.enterAction |
| HM-FEA-119 | composer | Draft restore | not needed | Composer.draftKept |
| HM-SUR-099 | composer | Plain composer editor | not needed | Composer.sendable |
| HM-SUR-102 | composer | Autocomplete popup | proved rule | none yet |
| HM-SUR-104 | composer | Emoji picker | not needed | none yet |
| HM-SUR-106 | composer | Shortcut: send and new line | not needed | Composer.enterAction |
| HM-SUR-107 | composer | Shortcut: formatting | not needed | none yet |
| HM-SUR-108 | composer | Shortcut: undo and redo | not needed | none yet |
| HM-SUR-109 | composer | Shortcut: composer cursor | not needed | none yet |
| HM-SUR-110 | composer | Shortcut: cancel reply or edit | not needed | Composer.escapeStep |
| HM-SUR-111 | composer | Shortcut: edit previous or next message | not needed | Composer.upEditsPrevious |
| HM-SUR-114 | composer | Shortcut: autocomplete | not needed | Composer.enterAction |
| HM-SUR-116 | composer | Attachment menu | not needed | none yet |
| HM-CAP-119 | encryption and verification | Store encryption | not needed | none yet |
| HM-SUR-137 | encryption and verification | Identity confirmed screen | not needed | none yet |
| HM-CAP-134 | media and attachments | File viewing and export | not needed | none yet |
| HM-SUR-147 | media and attachments | File drop target | not needed | none yet |
| HM-SUR-155 | media and attachments | Shortcut: upload file | not needed | Keys.globalAction |
| HM-SUR-156 | media and attachments | Avatar source sheet | not needed | none yet |
| HM-CAP-148 | search | Local encrypted search index | not needed | none yet |
| HM-FEA-167 | search | Message search | not needed | Search.searchStep |
| HM-FEA-168 | search | Encrypted message search (desktop) | not needed | none yet |
| HM-FEA-169 | search | Quick switcher (spotlight) | not needed | Search.switcherShows |
| HM-FEA-172 | search | Setting: message search index | not needed | none yet |
| HM-FEA-173 | search | Room list search | not needed | none yet |
| HM-JRN-060 | search | Search messages | not needed | Search.searchStep |
| HM-SUR-181 | search | Room list search bar | not needed | none yet |
| HM-SUR-182 | search | Room search view | not needed | Search.searchStep |
| HM-SUR-183 | search | Quick switcher dialog | not needed | Search.switcherShows |
| HM-SUR-184 | search | Search index dialogs | not needed | none yet |
| HM-SUR-185 | search | Shortcut: search in room | not needed | Keys.globalAction |
| HM-SUR-186 | search | Shortcut: quick switcher | not needed | Keys.globalAction |
| HM-CAP-151 | notifications | Evaluate notification rules | not needed | Notify.notifyLevel |
| HM-CAP-154 | notifications | Show desktop notification | not needed | Notify.notifyLevel, Notify.plays |
| HM-CAP-157 | notifications | App badge and title count | not needed | Notify.combine |
| HM-CAP-159 | notifications | Notification level aggregation | not needed | Notify.combine |
| HM-FEA-179 | notifications | Setting: desktop notifications | not needed | Notify.notifyLevel, Notify.plays |
| HM-JRN-063 | notifications | Open a notification | not needed | none yet |
| HM-SUR-191 | notifications | Toast: desktop notifications prompt | not needed | none yet |
| HM-SUR-192 | notifications | Notification badges | not needed | Notify.combine |
| HM-CAP-188 | settings | Themes | not needed | Settings.resolvesDark |
| HM-CAP-189 | settings | Font and language | not needed | Settings.fontSize |
| HM-CAP-192 | settings | App updates | not needed | Settings.activates |
| HM-CAP-195 | settings | Optimistic setting changes | not needed | Settings.changeStep, Settings.shownValue |
| HM-CAP-196 | settings | Setting-change echo context | not needed | Settings.changeStep, Settings.shownValue |
| HM-FEA-207 | settings | Themes and custom themes | not needed | Settings.resolvesDark |
| HM-FEA-211 | settings | Setting: font size and custom size | not needed | Settings.fontSize |
| HM-FEA-213 | settings | Setting: theme and match system | not needed | Settings.resolvesDark |
| HM-FEA-229 | settings | Settings home | not needed | none yet |
| HM-FEA-233 | settings | About and legal | not needed | none yet |
| HM-SUR-223 | settings | User settings dialog | not needed | none yet |
| HM-SUR-226 | settings | Settings tab: Appearance | not needed | Settings.resolvesDark |
| HM-SUR-228 | settings | Settings tab: Preferences | not needed | none yet |
| HM-SUR-229 | settings | Settings tab: Keyboard | not needed | none yet |
| HM-SUR-236 | settings | Settings tab: Help and about | not needed | none yet |
| HM-SUR-237 | settings | Room settings dialog | not needed | none yet |
| HM-SUR-238 | settings | Room settings: General | proved rule | none yet |
| HM-SUR-249 | settings | Toast: update available | not needed | Settings.activates |
| HM-SUR-267 | settings | Licences screens | not needed | none yet |
| HM-CAP-211 | navigation and layout | Sliding sync mode | proved rule | none yet |
| HM-CAP-212 | navigation and layout | Sync state tracking | proved rule | Timeline.statusBar |
| HM-CAP-215 | navigation and layout | Last-message preview | not needed | none yet |
| HM-CAP-217 | navigation and layout | Platform abstraction | not needed | none yet |
| HM-CAP-218 | navigation and layout | Keyboard binding resolution | not needed | Keys.globalAction |
| HM-CAP-219 | navigation and layout | Room list model | proved rule | none yet |
| HM-CAP-221 | navigation and layout | Current room and navigation state | not needed | none yet |
| HM-CAP-222 | navigation and layout | Scroll position memory | not needed | none yet |
| HM-CAP-223 | navigation and layout | Window and layout metrics | not needed | Layout.panes, Layout.listVisible, Layout.timelineVisible |
| HM-CAP-224 | navigation and layout | Store base classes | not needed | none yet |
| HM-CAP-225 | navigation and layout | Right panel state per room | not needed | Layout.rightPanelMode |
| HM-CAP-226 | navigation and layout | Room visibility rules | not needed | Layout.listed |
| HM-CAP-227 | navigation and layout | Deep link routing | not needed | none yet |
| HM-FEA-256 | navigation and layout | Message previews in room list | not needed | none yet |
| HM-FEA-257 | navigation and layout | Keyboard shortcuts | not needed | Keys.globalAction |
| HM-FEA-258 | navigation and layout | Landmark navigation | not needed | none yet |
| HM-FEA-262 | navigation and layout | Setting: room list | not needed | none yet |
| HM-FEA-263 | navigation and layout | Setting: room list display | not needed | none yet |
| HM-FEA-264 | navigation and layout | Internal state: recents | not needed | none yet |
| HM-FEA-265 | navigation and layout | Internal state: room list layout | not needed | none yet |
| HM-FEA-266 | navigation and layout | Internal state: panels and viewers | not needed | none yet |
| HM-FEA-267 | navigation and layout | Offline indicator | proved rule | Timeline.statusBar |
| HM-JRN-075 | navigation and layout | Lose and regain connection | proved rule | Timeline.statusBar |
| HM-SUR-279 | navigation and layout | App root and view switcher | not needed | Session.rootView |
| HM-SUR-280 | navigation and layout | Main layout | not needed | Layout.panes, Layout.listVisible, Layout.timelineVisible |
| HM-SUR-281 | navigation and layout | Left panel | not needed | Layout.panes, Layout.listVisible, Layout.timelineVisible |
| HM-SUR-282 | navigation and layout | User menu | not needed | none yet |
| HM-SUR-283 | navigation and layout | Room list header | not needed | none yet |
| HM-SUR-284 | navigation and layout | Room list | not needed | none yet |
| HM-SUR-285 | navigation and layout | Room list item | not needed | none yet |
| HM-SUR-289 | navigation and layout | Home page | not needed | none yet |
| HM-SUR-290 | navigation and layout | Room header | not needed | none yet |
| HM-SUR-291 | navigation and layout | Right panel container | not needed | Layout.rightPanelMode |
| HM-SUR-292 | navigation and layout | Right panel empty state | not needed | none yet |
| HM-SUR-293 | navigation and layout | Room context menu | not needed | none yet |
| HM-SUR-294 | navigation and layout | Generic menus and base | not needed | none yet |
| HM-SUR-296 | navigation and layout | Server offline dialog | proved rule | none yet |
| HM-SUR-297 | navigation and layout | Generic dialogs | not needed | none yet |
| HM-SUR-298 | navigation and layout | Modal manager | not needed | none yet |
| HM-SUR-300 | navigation and layout | Toast containers | not needed | none yet |
| HM-SUR-301 | navigation and layout | Avatars | not needed | none yet |
| HM-SUR-302 | navigation and layout | Error boundary | not needed | none yet |
| HM-SUR-304 | navigation and layout | Shortcut: room list navigation | not needed | none yet |
| HM-SUR-305 | navigation and layout | Shortcut: room list panel | not needed | none yet |
| HM-SUR-306 | navigation and layout | Shortcut: switch rooms | not needed | Keys.globalAction |
| HM-SUR-307 | navigation and layout | Shortcut: history back and forward | not needed | none yet |
| HM-SUR-308 | navigation and layout | Shortcut: panels and menus | not needed | Keys.globalAction |
| HM-SUR-309 | navigation and layout | Shortcut: landmarks | not needed | none yet |
| HM-SUR-310 | navigation and layout | Shortcut: accessibility keys | not needed | none yet |
| HM-SUR-311 | navigation and layout | Right panel card frame | not needed | none yet |
| HM-SUR-312 | navigation and layout | Small shared structures | not needed | none yet |
| HM-SUR-313 | navigation and layout | Home tab bar | not needed | Layout.bottomTabs |
| HM-SUR-314 | navigation and layout | Home banners | not needed | none yet |
| HM-SUR-316 | navigation and layout | Global indicators | not needed | none yet |
