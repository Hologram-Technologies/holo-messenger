# Client-only Phase 1 coverage

Recounted 2026-11-19 against the modules as they are: 161 of 171 items have a rule, 10 have none and say why.

Scope: the 171 Phase 1 items whose engine standing is "not needed" or "proved rule".
A spec item is a definition in `app/src/Messenger/*.lex.tex`; every one named here exists there. A rule often decides part of an item, not all of it.
"no rule" means the item has nothing a rule could decide, for one of three reasons: fixed content (a frame, a text or a list that is always the same, or a report of facts the page found at run time), code structure (how the client is built, not what a person sees), or the engine's to decide (it waits on uor-comms).

| Domain | items | with a rule | no rule, by reason |
|---|---|---|---|
| identity and devices | 4 | 4 | 0 |
| onboarding and recovery | 6 | 5 | 1: fixed content 1 |
| rooms and membership | 21 | 21 | 0 |
| timeline and events | 22 | 22 | 0 |
| composer | 18 | 18 | 0 |
| encryption and verification | 2 | 0 | 2: the engine's to decide 1, fixed content 1 |
| media and attachments | 4 | 4 | 0 |
| search | 13 | 13 | 0 |
| notifications | 8 | 8 | 0 |
| settings | 19 | 16 | 3: fixed content 3 |
| navigation and layout | 54 | 50 | 4: the engine's to decide 1, code structure 3 |
| Total | 171 | 161 | 10: fixed content 5, the engine's to decide 2, code structure 3 |

| HM ID | domain | name | engine standing | spec item |
|---|---|---|---|---|
| HM-CAP-002 | identity and devices | Single active tab lock | not needed | Session.lockStep |
| HM-JRN-003 | identity and devices | Session opened in another tab | not needed | Session.lockStep |
| HM-SUR-002 | identity and devices | Session lock screens | not needed | Session.lockStep |
| HM-SUR-011 | identity and devices | Clear data confirm dialog | not needed | Session.wipeAllowed |
| HM-CAP-023 | onboarding and recovery | Create engine client and start sync | proved rule | Session.startOutcome |
| HM-SUR-015 | onboarding and recovery | Loading and splash screens | not needed | Session.rootView |
| HM-SUR-016 | onboarding and recovery | Fatal error page | not needed | Session.rootView |
| HM-SUR-018 | onboarding and recovery | Auth page frame | not needed | no rule: shared frame, nothing to decide |
| HM-SUR-028 | onboarding and recovery | Session restore error dialog | not needed | Session.startOutcome |
| HM-SUR-029 | onboarding and recovery | Storage evicted dialog | not needed | Session.startOutcome |
| HM-CAP-037 | rooms and membership | Local placeholder room | not needed | Invite.placeholderStep |
| HM-CAP-038 | rooms and membership | Join room | proved rule | Membership.previewBar |
| HM-CAP-041 | rooms and membership | Invite users | proved rule | Invite.inviteOutcome |
| HM-CAP-043 | rooms and membership | Accept or decline invite | proved rule | Membership.previewBar |
| HM-CAP-045 | rooms and membership | Leave and forget room | proved rule | Membership.leaveWarning |
| HM-CAP-046 | rooms and membership | Edit room name, topic, avatar | proved rule | Membership.mayEdit |
| HM-CAP-052 | rooms and membership | Load member list | proved rule | Membership.memberSection |
| HM-FEA-039 | rooms and membership | Invites in the list | proved rule | Membership.previewBar |
| HM-FEA-044 | rooms and membership | Room details | proved rule | Membership.mayEdit |
| HM-FEA-046 | rooms and membership | Member list | proved rule | Membership.memberSection |
| HM-FEA-050 | rooms and membership | Leave room | proved rule | Membership.leaveWarning |
| HM-JRN-027 | rooms and membership | Invite people to a room | proved rule | Invite.inviteOutcome |
| HM-JRN-028 | rooms and membership | Receive and answer an invite | proved rule | Membership.previewBar |
| HM-JRN-032 | rooms and membership | Leave a room | proved rule | Membership.leaveWarning |
| HM-SUR-035 | rooms and membership | Room preview bar | proved rule | Membership.previewBar |
| HM-SUR-040 | rooms and membership | Room info card | proved rule | Membership.mayEdit |
| HM-SUR-041 | rooms and membership | Member list | proved rule | Membership.memberSection |
| HM-SUR-042 | rooms and membership | Member tile | proved rule | Membership.roleLabel |
| HM-SUR-049 | rooms and membership | Invite progress and invite-anyway dialogs | proved rule | Invite.inviteOutcome |
| HM-SUR-051 | rooms and membership | Room topic dialog | proved rule | Membership.mayEdit |
| HM-SUR-054 | rooms and membership | Invite row and decline menu | proved rule | Membership.previewBar |
| HM-CAP-066 | timeline and events | Group and collapse events | not needed | Timeline.collapses |
| HM-CAP-067 | timeline and events | Decide which events are visible | not needed | Timeline.shown |
| HM-CAP-068 | timeline and events | Describe state changes as text | proved rule | Timeline.systemLine |
| HM-CAP-069 | timeline and events | Mention pills | not needed | Render.mentionPill |
| HM-CAP-070 | timeline and events | Safe rich text rendering | not needed | Render.markupAllowed, Render.schemeAllowed |
| HM-CAP-079 | timeline and events | Timeline grouping engine | not needed | Timeline.collapses |
| HM-CAP-081 | timeline and events | Virtual timeline items | not needed | Timeline.dividerBefore |
| HM-FEA-074 | timeline and events | Setting: timestamps | not needed | Timeline.hourShown, Timeline.timestampShown |
| HM-FEA-091 | timeline and events | Copy text, caption, link | not needed | Menu.messageAction |
| HM-FEA-093 | timeline and events | Collapsed room changes | proved rule | Timeline.collapses |
| HM-FEA-094 | timeline and events | Link safety prompt | not needed | Timeline.asksBeforeOpening |
| HM-SUR-063 | timeline and events | Message action bar | not needed | Menu.messageAction |
| HM-SUR-064 | timeline and events | Message context menu | not needed | Menu.messageAction |
| HM-SUR-068 | timeline and events | State and system event tiles | proved rule | Timeline.systemLine |
| HM-SUR-069 | timeline and events | Event summaries | not needed | Timeline.collapses |
| HM-SUR-070 | timeline and events | New room intro | not needed | Timeline.systemLine |
| HM-SUR-071 | timeline and events | Date separator | not needed | Timeline.dividerBefore |
| HM-SUR-078 | timeline and events | Room status bar | proved rule | Timeline.statusBar |
| HM-SUR-088 | timeline and events | Shortcut: timeline scrolling | not needed | Keys.timelineKey |
| HM-SUR-089 | timeline and events | Shortcut: read marker | not needed | Keys.timelineKey |
| HM-SUR-091 | timeline and events | Swipe to reply | not needed | Timeline.startsReply |
| HM-SUR-092 | timeline and events | Double-tap / tap behaviours | not needed | Timeline.tapAction |
| HM-CAP-089 | composer | Draft persistence | not needed | Composer.draftKept |
| HM-CAP-090 | composer | Structured editor model | not needed | Composer.redoAvailable, Composer.lengthAfterEdit |
| HM-CAP-091 | composer | Markdown and HTML serialisation | not needed | Render.formatApplied |
| HM-CAP-092 | composer | Autocomplete | not needed | Composer.suggestKind |
| HM-FEA-098 | composer | Emoji picker | not needed | Composer.pickerSection, Composer.recentsAfterPick, Composer.toneApplied |
| HM-FEA-105 | composer | Setting: modifier+Enter to send | not needed | Composer.enterAction |
| HM-FEA-119 | composer | Draft restore | not needed | Composer.draftKept |
| HM-SUR-099 | composer | Plain composer editor | not needed | Composer.sendable |
| HM-SUR-102 | composer | Autocomplete popup | proved rule | Composer.suggestKind |
| HM-SUR-104 | composer | Emoji picker | not needed | Composer.pickerSection, Composer.recentsAfterPick, Composer.toneApplied |
| HM-SUR-106 | composer | Shortcut: send and new line | not needed | Composer.enterAction |
| HM-SUR-107 | composer | Shortcut: formatting | not needed | Keys.composerKey |
| HM-SUR-108 | composer | Shortcut: undo and redo | not needed | Keys.composerKey |
| HM-SUR-109 | composer | Shortcut: composer cursor | not needed | Keys.composerKey |
| HM-SUR-110 | composer | Shortcut: cancel reply or edit | not needed | Composer.escapeStep |
| HM-SUR-111 | composer | Shortcut: edit previous or next message | not needed | Composer.upEditsPrevious |
| HM-SUR-114 | composer | Shortcut: autocomplete | not needed | Composer.enterAction |
| HM-SUR-116 | composer | Attachment menu | not needed | Composer.attachOffered |
| HM-CAP-119 | encryption and verification | Store encryption | not needed | no rule: waits on the engine's cipher |
| HM-SUR-137 | encryption and verification | Identity confirmed screen | not needed | no rule: one screen, one button; its one sentence names the route taken (kit or other device), which the caller passes in |
| HM-CAP-134 | media and attachments | File viewing and export | not needed | Render.viewerMode |
| HM-SUR-147 | media and attachments | File drop target | not needed | Render.dropOverlay |
| HM-SUR-155 | media and attachments | Shortcut: upload file | not needed | Keys.globalAction |
| HM-SUR-156 | media and attachments | Avatar source sheet | not needed | Render.removeAvatarOffered |
| HM-CAP-148 | search | Local encrypted search index | not needed | Search.indexStep, Search.indexSearchable |
| HM-FEA-167 | search | Message search | not needed | Search.searchStep |
| HM-FEA-168 | search | Encrypted message search (desktop) | not needed | Search.indexStep, Search.indexSearchable |
| HM-FEA-169 | search | Quick switcher (spotlight) | not needed | Search.switcherShows |
| HM-FEA-172 | search | Setting: message search index | not needed | Search.indexStep, Search.indexSearchable |
| HM-FEA-173 | search | Room list search | not needed | RoomList.filterMatch |
| HM-JRN-060 | search | Search messages | not needed | Search.searchStep |
| HM-SUR-181 | search | Room list search bar | not needed | RoomList.filterMatch, Keys.globalAction |
| HM-SUR-182 | search | Room search view | not needed | Search.searchStep |
| HM-SUR-183 | search | Quick switcher dialog | not needed | Search.switcherShows |
| HM-SUR-184 | search | Search index dialogs | not needed | Search.indexStep, Search.indexSearchable |
| HM-SUR-185 | search | Shortcut: search in room | not needed | Keys.globalAction |
| HM-SUR-186 | search | Shortcut: quick switcher | not needed | Keys.globalAction |
| HM-CAP-151 | notifications | Evaluate notification rules | not needed | Notify.notifyLevel |
| HM-CAP-154 | notifications | Show desktop notification | not needed | Notify.notifyLevel, Notify.plays |
| HM-CAP-157 | notifications | App badge and title count | not needed | Notify.combine |
| HM-CAP-159 | notifications | Notification level aggregation | not needed | Notify.combine |
| HM-FEA-179 | notifications | Setting: desktop notifications | not needed | Notify.notifyLevel, Notify.plays |
| HM-JRN-063 | notifications | Open a notification | not needed | Navigation.routeTarget |
| HM-SUR-191 | notifications | Toast: desktop notifications prompt | not needed | Notify.promptShown |
| HM-SUR-192 | notifications | Notification badges | not needed | Notify.combine |
| HM-CAP-188 | settings | Themes | not needed | Settings.resolvesDark |
| HM-CAP-189 | settings | Font and language | not needed | Settings.fontSize |
| HM-CAP-192 | settings | App updates | not needed | Settings.activates |
| HM-CAP-195 | settings | Optimistic setting changes | not needed | Settings.changeStep, Settings.shownValue |
| HM-CAP-196 | settings | Setting-change echo context | not needed | Settings.changeStep, Settings.shownValue |
| HM-FEA-207 | settings | Themes and custom themes | not needed | Settings.resolvesDark |
| HM-FEA-211 | settings | Setting: font size and custom size | not needed | Settings.fontSize |
| HM-FEA-213 | settings | Setting: theme and match system | not needed | Settings.resolvesDark |
| HM-FEA-229 | settings | Settings home | not needed | Settings.rowShown |
| HM-FEA-233 | settings | About and legal | not needed | no rule: fixed text, and a report of what the page found at run time (whether the verified holo answers, how many answers matched, timings, the page's sha256); which report shows follows the holo's load and is not modelled |
| HM-SUR-223 | settings | User settings dialog | not needed | Settings.rowShown, Settings.settingsBack |
| HM-SUR-226 | settings | Settings tab: Appearance | not needed | Settings.resolvesDark |
| HM-SUR-228 | settings | Settings tab: Preferences | not needed | Settings.changeStep, Settings.shownValue |
| HM-SUR-229 | settings | Settings tab: Keyboard | not needed | Settings.rowShown |
| HM-SUR-236 | settings | Settings tab: Help and about | not needed | no rule: fixed text, and a report of what the page found at run time (whether the verified holo answers, how many answers matched, timings, the page's sha256); which report shows follows the holo's load and is not modelled |
| HM-SUR-237 | settings | Room settings dialog | not needed | Menu.roomMenuItem, Membership.mayEdit |
| HM-SUR-238 | settings | Room settings: General | proved rule | Membership.mayEdit |
| HM-SUR-249 | settings | Toast: update available | not needed | Settings.activates |
| HM-SUR-267 | settings | Licences screens | not needed | no rule: a fixed list to read |
| HM-CAP-211 | navigation and layout | Sliding sync mode | proved rule | no rule: adapted away; sync is the engine's |
| HM-CAP-212 | navigation and layout | Sync state tracking | proved rule | Timeline.statusBar |
| HM-CAP-215 | navigation and layout | Last-message preview | not needed | RoomList.previewShown |
| HM-CAP-217 | navigation and layout | Platform abstraction | not needed | no rule: code structure, not observable behaviour |
| HM-CAP-218 | navigation and layout | Keyboard binding resolution | not needed | Keys.globalAction |
| HM-CAP-219 | navigation and layout | Room list model | proved rule | RoomList.sortsBefore, RoomList.listState |
| HM-CAP-221 | navigation and layout | Current room and navigation state | not needed | Navigation.goForward, Navigation.canGoBack, Navigation.canGoForward |
| HM-CAP-222 | navigation and layout | Scroll position memory | not needed | Navigation.restoredScroll |
| HM-CAP-223 | navigation and layout | Window and layout metrics | not needed | Layout.panes, Layout.listVisible, Layout.timelineVisible |
| HM-CAP-224 | navigation and layout | Store base classes | not needed | no rule: code structure, not observable behaviour |
| HM-CAP-225 | navigation and layout | Right panel state per room | not needed | Layout.rightPanelMode |
| HM-CAP-226 | navigation and layout | Room visibility rules | not needed | Layout.listed |
| HM-CAP-227 | navigation and layout | Deep link routing | not needed | Navigation.routeTarget |
| HM-FEA-256 | navigation and layout | Message previews in room list | not needed | RoomList.previewShown |
| HM-FEA-257 | navigation and layout | Keyboard shortcuts | not needed | Keys.globalAction |
| HM-FEA-258 | navigation and layout | Landmark navigation | not needed | Navigation.nextLandmark, Navigation.previousLandmark |
| HM-FEA-262 | navigation and layout | Setting: room list | not needed | RoomList.previewShown |
| HM-FEA-263 | navigation and layout | Setting: room list display | not needed | RoomList.previewShown |
| HM-FEA-264 | navigation and layout | Internal state: recents | not needed | Search.switcherShows, Composer.recentsAfterPick |
| HM-FEA-265 | navigation and layout | Internal state: room list layout | not needed | RoomList.sortsBefore, RoomList.restoredChip, Layout.listAfterResize |
| HM-FEA-266 | navigation and layout | Internal state: panels and viewers | not needed | Layout.rightPanelMode, Layout.panelShows |
| HM-FEA-267 | navigation and layout | Offline indicator | proved rule | Timeline.statusBar |
| HM-JRN-075 | navigation and layout | Lose and regain connection | proved rule | Timeline.statusBar |
| HM-SUR-279 | navigation and layout | App root and view switcher | not needed | Session.rootView |
| HM-SUR-280 | navigation and layout | Main layout | not needed | Layout.panes, Layout.listVisible, Layout.timelineVisible |
| HM-SUR-281 | navigation and layout | Left panel | not needed | Layout.panes, Layout.listVisible, Layout.timelineVisible |
| HM-SUR-282 | navigation and layout | User menu | not needed | Layout.overflowItem, Layout.tabShown |
| HM-SUR-283 | navigation and layout | Room list header | not needed | Layout.overflowItem, RoomList.chipMatches |
| HM-SUR-284 | navigation and layout | Room list | not needed | RoomList.sortsBefore, RoomList.listState |
| HM-SUR-285 | navigation and layout | Room list item | not needed | RoomList.itemBadge |
| HM-SUR-289 | navigation and layout | Home page | not needed | Navigation.centreView |
| HM-SUR-290 | navigation and layout | Room header | not needed | Layout.headerLine, Layout.callButtonsShown |
| HM-SUR-291 | navigation and layout | Right panel container | not needed | Layout.rightPanelMode |
| HM-SUR-292 | navigation and layout | Right panel empty state | not needed | Layout.panelShows |
| HM-SUR-293 | navigation and layout | Room context menu | not needed | Menu.roomMenuItem |
| HM-SUR-294 | navigation and layout | Generic menus and base | not needed | Overlay.escapeCloses |
| HM-SUR-296 | navigation and layout | Server offline dialog | proved rule | Timeline.offlineDialog, Timeline.statusBar |
| HM-SUR-297 | navigation and layout | Generic dialogs | not needed | Overlay.modalShown, Overlay.focusTrapped |
| HM-SUR-298 | navigation and layout | Modal manager | not needed | Overlay.modalShown, Overlay.focusTrapped |
| HM-SUR-300 | navigation and layout | Toast containers | not needed | Overlay.topToast |
| HM-SUR-301 | navigation and layout | Avatars | not needed | Render.avatarFallback |
| HM-SUR-302 | navigation and layout | Error boundary | not needed | Session.failureView |
| HM-SUR-304 | navigation and layout | Shortcut: room list navigation | not needed | Navigation.moveDown, Navigation.canMoveUp |
| HM-SUR-305 | navigation and layout | Shortcut: room list panel | not needed | Keys.listPanelKey, Layout.listAfterResize |
| HM-SUR-306 | navigation and layout | Shortcut: switch rooms | not needed | Keys.globalAction |
| HM-SUR-307 | navigation and layout | Shortcut: history back and forward | not needed | Navigation.goForward, Navigation.canGoBack, Navigation.canGoForward |
| HM-SUR-308 | navigation and layout | Shortcut: panels and menus | not needed | Keys.globalAction |
| HM-SUR-309 | navigation and layout | Shortcut: landmarks | not needed | Navigation.nextLandmark, Navigation.previousLandmark |
| HM-SUR-310 | navigation and layout | Shortcut: accessibility keys | not needed | Keys.controlKey |
| HM-SUR-311 | navigation and layout | Right panel card frame | not needed | Layout.panelBack, Layout.panelClose |
| HM-SUR-312 | navigation and layout | Small shared structures | not needed | no rule: shared parts, each decided elsewhere |
| HM-SUR-313 | navigation and layout | Home tab bar | not needed | Layout.bottomTabs |
| HM-SUR-314 | navigation and layout | Home banners | not needed | Session.homeBanner, Session.recoveryBanner |
| HM-SUR-316 | navigation and layout | Global indicators | not needed | Overlay.topToast |
