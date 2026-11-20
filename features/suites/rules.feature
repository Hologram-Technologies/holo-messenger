Feature: rules

  The messenger rules in app/: client decisions that need no engine, each a
  function in the LexLean model, and the theorems the Lean kernel checks
  about each. A step of the form "<name> in <file> states <statement>" or
  "<name> in <file> contains <text>" is a pin: the test for the scenario's ID
  checks it against the model, to the end of the line.

  @MR-01 @build
  Scenario: The main screen shows only with an identity and the tab lock, and an unsupported browser always gets the fatal page
    Given the session rules in app/src/Messenger/Session.lex.tex
    When the Lean kernel checks the theorems of SessionProofs during prismpm verify
    Then mainNeedsIdentity in Messenger/SessionProofs.lex.tex states (((Messenger.Session::rootView supported started 0 holdsLock) =? 2) = false)
    And mainNeedsLock in Messenger/SessionProofs.lex.tex states (((Messenger.Session::rootView supported started hasIdentity 0) =? 2) = false)
    And unsupportedIsFatal in Messenger/SessionProofs.lex.tex states ((Messenger.Session::rootView 0 started hasIdentity holdsLock) = 4)
    And recoveryBeforeVerify in Messenger/SessionProofs.lex.tex states ((Messenger.Session::homeBanner 0 0 unverified verifyDismissed) = 1)
    And dismissedRecoveryStaysHidden in Messenger/SessionProofs.lex.tex states (((1 <=? recoveryDismissed) && ((Messenger.Session::homeBanner recoverySet recoveryDismissed unverified verifyDismissed) =? 1)) = false)
    And dismissedVerifyStaysHidden in Messenger/SessionProofs.lex.tex states (((1 <=? verifyDismissed) && ((Messenger.Session::homeBanner recoverySet recoveryDismissed unverified verifyDismissed) =? 2)) = false)
    And verifiedDevicesNeverAsked in Messenger/SessionProofs.lex.tex states (((Messenger.Session::homeBanner recoverySet recoveryDismissed 0 verifyDismissed) =? 2) = false)
    And failureAlwaysOffersReload in Messenger/SessionProofs.lex.tex states (((1 <=? (rootFailed + partFailed)) && ((Messenger.Session::failureView rootFailed partFailed) =? 0)) = false)

  @MR-02 @build
  Scenario: A muted room, an own message and the room being viewed never notify
    Given the notification rules in app/src/Messenger/Notify.lex.tex
    When the Lean kernel checks the theorems of NotifyProofs during prismpm verify
    Then mutedNeverNotifies in Messenger/NotifyProofs.lex.tex states ((Messenger.Notify::notifyLevel enabled 2 mention viewing isOwn) = 0)
    And ownMessageNeverNotifies in Messenger/NotifyProofs.lex.tex states ((Messenger.Notify::notifyLevel enabled mode mention viewing 1) = 0)
    And viewedRoomNeverNotifies in Messenger/NotifyProofs.lex.tex states ((Messenger.Notify::notifyLevel enabled mode mention 1 isOwn) = 0)

  @MR-03 @build
  Scenario: A non-member is offered only copy, edit is offered only on an own message, and picking your own reaction again takes it back
    Given the menu rules in app/src/Messenger/Menu.lex.tex
    When the Lean kernel checks the theorems of MenuProofs during prismpm verify
    Then nonMemberOnlyCopies in Messenger/MenuProofs.lex.tex states ((((status <? 2) || (2 <? status)) && ((1 <=? (Messenger.Menu::messageAction action isOwn status moderator failed)) && ((action <? 3) || (3 <? action)))) = false)
    And editOnlyOwnMessage in Messenger/MenuProofs.lex.tex states ((Messenger.Menu::messageAction 2 0 status moderator failed) = 0)
    And samePickTakesBack in Messenger/MenuProofs.lex.tex states ((Messenger.Menu::reactionAfterPick picked picked) = 0)
    And atMostOneReaction in Messenger/MenuProofs.lex.tex states (((1 <=? (Messenger.Menu::reactionAfterPick current picked)) && (((Messenger.Menu::reactionAfterPick current picked) <? picked) || (picked <? (Messenger.Menu::reactionAfterPick current picked)))) = false)

  @MR-04 @build
  Scenario: A link never lands a non-member in a timeline, and an unknown link goes home
    Given the navigation rules in app/src/Messenger/Navigation.lex.tex
    When the Lean kernel checks the theorems of NavigationProofs during prismpm verify
    Then nonMemberNeverLandsInTimeline in Messenger/NavigationProofs.lex.tex states ((((status <? 2) || (2 <? status)) && ((Messenger.Navigation::routeTarget kind known status) =? 1)) = false)
    And unknownLinkGoesHome in Messenger/NavigationProofs.lex.tex states ((Messenger.Navigation::routeTarget kind 0 status) = 0)

  @MR-05 @build
  Scenario: Shift and Enter never sends, Enter completes a suggestion while the popup is open, and Enter never sends while an input method is composing or on a touch screen
    Given the composer rules in app/src/Messenger/Composer.lex.tex
    When the Lean kernel checks the theorems of ComposerProofs during prismpm verify
    Then shiftEnterNeverSends in Messenger/ComposerProofs.lex.tex states (((Messenger.Composer::enterAction 1 modifier requireModifier popupOpen) =? 1) = false)
    And openPopupEnterCompletes in Messenger/ComposerProofs.lex.tex states ((Messenger.Composer::enterAction shift modifier requireModifier 1) = 3)
    And textAlwaysGivesSend in Messenger/ComposerProofs.lex.tex states (((1 <=? hasText) && (1 <=? (Messenger.Composer::mainButton hasText voiceBuilt))) = false)
    And withoutVoiceAlwaysSend in Messenger/ComposerProofs.lex.tex states ((Messenger.Composer::mainButton hasText 0) = 0)
    And pickerNeverBlank in Messenger/ComposerProofs.lex.tex states ((1 <=? (Messenger.Composer::pickerSection queryLength recentCount hits)) = true)
    And searchHidesRecents in Messenger/ComposerProofs.lex.tex states (((1 <=? queryLength) && ((Messenger.Composer::pickerSection queryLength recentCount hits) <=? 2)) = false)
    And recentsNeverAboveCap in Messenger/ComposerProofs.lex.tex states (((Messenger.Composer::recentsAfterPick count wasRecent) <=? 8) = true)
    And toneOnlyOnHands in Messenger/ComposerProofs.lex.tex states ((Messenger.Composer::toneApplied 0 tone) = 0)
    And composingNeverSends in Messenger/ComposerProofs.lex.tex states ((Messenger.Composer::enterWith 1 coarse shift modifier requireModifier popupOpen) = 0)
    And touchEnterNeverSends in Messenger/ComposerProofs.lex.tex states (((Messenger.Composer::enterWith 0 1 shift modifier requireModifier popupOpen) =? 1) = false)
    And keyboardEnterUnchanged in Messenger/ComposerProofs.lex.tex states ((Messenger.Composer::enterWith 0 0 shift modifier requireModifier popupOpen) = (Messenger.Composer::enterAction shift modifier requireModifier popupOpen))
    And shortTextNeverScrolls in Messenger/ComposerProofs.lex.tex states (((1 <=? lines) && ((lines <=? 5) && (((Messenger.Composer::composerRows lines) <? lines) || (lines <? (Messenger.Composer::composerRows lines))))) = false)
    And reactionPickCloses in Messenger/ComposerProofs.lex.tex states (((1 <=? target) && (1 <=? (Messenger.Composer::pickerStaysOpen target))) = false)
    And pickerFullOnlyWithMargin in Messenger/ComposerProofs.lex.tex states (((screen <? ((Messenger.Composer::pickerMostWidth) + 16)) && (1 <=? (Messenger.Composer::pickerFull screen))) = false)

  @MR-06 @build
  Scenario: Unknown markup never renders, an unsafe link scheme never opens, and an emoji is drawn as a graphic only when its pinned graphic passed its hash check
    Given the rendering rules in app/src/Messenger/Render.lex.tex
    When the Lean kernel checks the theorems of RenderProofs during prismpm verify
    Then unknownMarkupNeverRenders in Messenger/RenderProofs.lex.tex states (((4 <=? kind) && (1 <=? (Messenger.Render::markupAllowed kind))) = false)
    And unsafeSchemeNeverOpens in Messenger/RenderProofs.lex.tex states (((3 <=? scheme) && (1 <=? (Messenger.Render::schemeAllowed scheme))) = false)
    And unresolvedNameStaysText in Messenger/RenderProofs.lex.tex states ((Messenger.Render::mentionPill 0 0 isDirect) = 0)
    And roomWordNeverPillsInDirect in Messenger/RenderProofs.lex.tex states (((1 <=? isDirect) && (1 <=? (Messenger.Render::mentionPill 0 isRoomWord isDirect))) = false)
    And unclosedMarkStaysText in Messenger/RenderProofs.lex.tex states (((mark <=? 5) && (1 <=? (Messenger.Render::formatApplied mark 0))) = false)
    And unknownMarkStaysText in Messenger/RenderProofs.lex.tex states (((8 <=? mark) && (1 <=? (Messenger.Render::formatApplied mark closed))) = false)
    And failedHashNeverDrawn in Messenger/RenderProofs.lex.tex states ((Messenger.Render::emojiForm selector presentation graphic 0) = 0)
    And missingGraphicFallsToText in Messenger/RenderProofs.lex.tex states ((Messenger.Render::emojiForm selector presentation 0 hashOk) = 0)
    And textSelectorStaysText in Messenger/RenderProofs.lex.tex states ((Messenger.Render::emojiForm 1 presentation graphic hashOk) = 0)
    And textDefaultStaysText in Messenger/RenderProofs.lex.tex states ((Messenger.Render::emojiForm 0 0 graphic hashOk) = 0)
    And textNeverEnlarged in Messenger/RenderProofs.lex.tex states (((1 <=? otherCharacters) && (1 <=? (Messenger.Render::emojiOnlyLarge emojiCount otherCharacters))) = false)
    And manyEmojiStayNormal in Messenger/RenderProofs.lex.tex states (((4 <=? emojiCount) && (1 <=? (Messenger.Render::emojiOnlyLarge emojiCount otherCharacters))) = false)
    And nextStaysInside in Messenger/RenderProofs.lex.tex states (((1 <=? count) && (count <=? (Messenger.Render::viewerNext index count))) = false)
    And previousWrapsOnlyFromFirst in Messenger/RenderProofs.lex.tex states (((1 <=? index) && (1 <=? (Messenger.Render::viewerPreviousWraps index))) = false)

  @MR-07 @build
  Scenario: The layout has one to three panes, a phone never shows the list and the timeline together, and nobody is shown online unless the engine reports it
    Given the layout rules in app/src/Messenger/Layout.lex.tex
    When the Lean kernel checks the theorems of LayoutProofs during prismpm verify
    Then atLeastOnePane in Messenger/LayoutProofs.lex.tex states ((1 <=? (Messenger.Layout::panes width)) = true)
    And atMostThreePanes in Messenger/LayoutProofs.lex.tex states (((Messenger.Layout::panes width) <=? 3) = true)
    And phoneNeverShowsListAndTimeline in Messenger/LayoutProofs.lex.tex states (((width <? 768) && (2 <=? ((Messenger.Layout::listVisible width roomOpen) + (Messenger.Layout::timelineVisible width roomOpen)))) = false)
    And unbuiltUpdatesNeverShown in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::tabShown 1 callsBuilt spacesBuilt 0) = 0)
    And unbuiltSpacesNeverShown in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::tabShown 2 callsBuilt 0 statusBuilt) = 0)
    And unbuiltCallsNeverShown in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::tabShown 3 0 spacesBuilt statusBuilt) = 0)
    And chatsAlwaysShown in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::tabShown 0 callsBuilt spacesBuilt statusBuilt) = 1)
    And youAlwaysShown in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::tabShown 4 callsBuilt spacesBuilt statusBuilt) = 1)
    And unknownTabNeverShown in Messenger/LayoutProofs.lex.tex states (((5 <=? tab) && (1 <=? (Messenger.Layout::tabShown tab callsBuilt spacesBuilt statusBuilt))) = false)
    And atLeastTwoTabs in Messenger/LayoutProofs.lex.tex states ((2 <=? (Messenger.Layout::tabCount callsBuilt spacesBuilt statusBuilt)) = true)
    And atMostFiveTabs in Messenger/LayoutProofs.lex.tex states (((Messenger.Layout::tabCount callsBuilt spacesBuilt statusBuilt) <=? 5) = true)
    And callButtonsNeedCalls in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::callButtonsShown 0 joined) = 0)
    And callButtonsNeedMembership in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::callButtonsShown callsBuilt 0) = 0)
    And unbuiltGroupsNeverOffered in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::overflowItem 0 0 devicesBuilt starredBuilt unreadCount) = 0)
    And unbuiltDevicesNeverOffered in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::overflowItem 1 groupsBuilt 0 starredBuilt unreadCount) = 0)
    And unbuiltStarredNeverOffered in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::overflowItem 2 groupsBuilt devicesBuilt 0 unreadCount) = 0)
    And readAllNeedsUnread in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::overflowItem 3 groupsBuilt devicesBuilt starredBuilt 0) = 0)
    And allShowsEveryChat in Messenger/RoomListProofs.lex.tex states ((Messenger.RoomList::chipMatches 0 unread favourite group invite) = 1)
    And readChatNeverUnderUnread in Messenger/RoomListProofs.lex.tex states ((Messenger.RoomList::chipMatches 1 0 favourite group invite) = 0)
    And inviteOnlyUnderAll in Messenger/RoomListProofs.lex.tex states (((1 <=? chip) && ((1 <=? invite) && (1 <=? (Messenger.RoomList::chipMatches chip unread favourite group invite)))) = false)
    And mutedTimeNeverAccented in Messenger/RoomListProofs.lex.tex states (((1 <=? muted) && (1 <=? (Messenger.RoomList::timeAccented unread muted))) = false)
    And mutedRowShowsNoMark in Messenger/RoomListProofs.lex.tex states (((1 <=? muted) && (1 <=? (Messenger.RoomList::rowMark unread muted mentionsOnly mention))) = false)
    And mentionShowsMentionMark in Messenger/RoomListProofs.lex.tex states (((1 <=? mention) && (((Messenger.RoomList::rowMark unread 0 mentionsOnly mention) <? 3) || (3 <? (Messenger.RoomList::rowMark unread 0 mentionsOnly mention)))) = false)
    And neverBothPinnedFirst in Messenger/RoomListProofs.lex.tex states ((((aNewer =? 0) || (bNewer =? 0)) && (2 <=? ((Messenger.RoomList::pinnedFirst aPinned bPinned aNewer) + (Messenger.RoomList::pinnedFirst bPinned aPinned bNewer)))) = false)
    And pinnedPrecedesUnpinned in Messenger/RoomListProofs.lex.tex states (((1 <=? aPinned) && ((Messenger.RoomList::pinnedFirst aPinned 0 aNewer) =? 0)) = false)
    And unknownPreviewFallsToText in Messenger/RoomListProofs.lex.tex states (((7 <=? kind) && (1 <=? (Messenger.RoomList::previewKind kind))) = false)
    And ownOnRight in Messenger/TimelineProofs.lex.tex states (((1 <=? own) && (((Messenger.Timeline::bubbleSide own) <? 1) || (1 <? (Messenger.Timeline::bubbleSide own)))) = false)
    And firstOfGroupHasTail in Messenger/TimelineProofs.lex.tex states (((1 <=? firstOfGroup) && (((Messenger.Timeline::tailShown firstOfGroup) <? 1) || (1 <? (Messenger.Timeline::tailShown firstOfGroup)))) = false)
    And differentSenderNeverGroups in Messenger/TimelineProofs.lex.tex states ((Messenger.Timeline::groupsWith 0 sameDay minutesApart previousIsMessage) = 0)
    And differentDayNeverGroups in Messenger/TimelineProofs.lex.tex states ((Messenger.Timeline::groupsWith sameSender 0 minutesApart previousIsMessage) = 0)
    And dayLabelNeverGoesBack in Messenger/TimelineProofs.lex.tex states (((earlier <=? later) && ((Messenger.Timeline::dayLabel later) <? (Messenger.Timeline::dayLabel earlier))) = false)
    And missedCallNameAccented in Messenger/TimelineProofs.lex.tex states (((1 <=? missed) && (((Messenger.Timeline::callNameAccent missed) <? 1) || (1 <? (Messenger.Timeline::callNameAccent missed)))) = false)
    And outgoingNeverMarkedMissed in Messenger/TimelineProofs.lex.tex states (((1 <=? outgoing) && (1 <=? (Messenger.Timeline::callMark outgoing missed))) = false)
    And blockingAlwaysCentred in Messenger/OverlayProofs.lex.tex states ((Messenger.Overlay::surfaceFor 2 panes) = 2)
    And sheetOnlyOnOnePane in Messenger/OverlayProofs.lex.tex states (((2 <=? panes) && ((Messenger.Overlay::surfaceFor kind panes) =? 1)) = false)
    And anyOtherOrderRefused in Messenger/OverlayProofs.lex.tex states ((((1 <=? opening) || (((middle <? 1) || (1 <? middle)) || ((closing <? 2) || (2 <? closing)))) && (1 <=? (Messenger.Overlay::explainOrdered opening middle closing))) = false)
    And textNeverSmallerThanMeta in Messenger/BudgetProofs.lex.tex states ((((Messenger.Budget::metaSize) <=? (Messenger.Budget::titleSize)) && (((Messenger.Budget::metaSize) <=? (Messenger.Budget::nameSize)) && (((Messenger.Budget::metaSize) <=? (Messenger.Budget::previewSize)) && ((Messenger.Budget::metaSize) <=? (Messenger.Budget::messageSize))))) = true)
    And metaSizeReadable in Messenger/BudgetProofs.lex.tex states ((11 <=? (Messenger.Budget::metaSize)) = true)
    And touchTargetLargeEnough in Messenger/BudgetProofs.lex.tex states ((48 <=? (Messenger.Budget::touchTarget)) = true)
    And rowFitsTouchTarget in Messenger/BudgetProofs.lex.tex states (((Messenger.Budget::touchTarget) <=? (Messenger.Budget::rowHeight)) = true)
    And heightsOnGrid in Messenger/BudgetProofs.lex.tex states ((((prim remainder (Messenger.Budget::rowHeight) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && (((prim remainder (Messenger.Budget::pictureSize) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && (((prim remainder (Messenger.Budget::tabBarHeight) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && (((prim remainder (Messenger.Budget::searchHeight) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && (((prim remainder (Messenger.Budget::chipHeight) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && (((prim remainder (Messenger.Budget::composerHeight) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && (((prim remainder (Messenger.Budget::roundButtonSize) (Messenger.Budget::gridStep) 0 : Nat) =? 0) && ((prim remainder (Messenger.Budget::touchTarget) (Messenger.Budget::gridStep) 0 : Nat) =? 0)))))))) = true)
    And bubbleFitsWidth in Messenger/BudgetProofs.lex.tex states (((Messenger.Budget::bubbleMaxPercent) <=? 100) = true)
    And sizeExamples in Messenger/BudgetProofs.lex.tex states ((((Messenger.Budget::titleSize) =? 20) && (((Messenger.Budget::nameSize) =? 16) && (((Messenger.Budget::previewSize) =? 15) && (((Messenger.Budget::messageSize) =? 16) && (((Messenger.Budget::metaSize) =? 12) && (((Messenger.Budget::rowHeight) =? 72) && (((Messenger.Budget::pictureSize) =? 52) && (((Messenger.Budget::tabBarHeight) =? 84) && (((Messenger.Budget::searchHeight) =? 52) && (((Messenger.Budget::chipHeight) =? 32) && (((Messenger.Budget::composerHeight) =? 52) && (((Messenger.Budget::roundButtonSize) =? 52) && (((Messenger.Budget::touchTarget) =? 48) && (((Messenger.Budget::gridStep) =? 4) && (((Messenger.Budget::bubbleMaxPercent) =? 80) && ((Messenger.Budget::textScaleNoted) =? 130)))))))))))))))) = true)
    And ownTypingNeverShows in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::headerLine isDirect othersTyping selfTyping typingShown) = (Messenger.Layout::headerLine isDirect othersTyping 0 typingShown))
    And directNeverNamesTyper in Messenger/LayoutProofs.lex.tex states (((1 <=? isDirect) && (3 <=? (Messenger.Layout::headerLine isDirect othersTyping selfTyping typingShown))) = false)
    And typingOffNeverShowsTyping in Messenger/LayoutProofs.lex.tex states ((2 <=? (Messenger.Layout::headerLine isDirect othersTyping selfTyping 0)) = false)
    And emptyCardShowsPlaceholder in Messenger/LayoutProofs.lex.tex states (((1 <=? isOpen) && ((1 <=? roomOpen) && ((1 <=? depth) && (((Messenger.Layout::panelShows isOpen roomOpen depth 0) <? 3) || (3 <? (Messenger.Layout::panelShows isOpen roomOpen depth 0)))))) = false)
    And panelAlwaysHasWayOut in Messenger/LayoutProofs.lex.tex states ((1 <=? ((Messenger.Layout::panelBack depth paneCount) + (Messenger.Layout::panelClose paneCount))) = true)
    And listStepInRange in Messenger/LayoutProofs.lex.tex states (((Messenger.Layout::listAfterResize step grow) <=? 3) = true)
    And unknownChipFallsToAll in Messenger/RoomListProofs.lex.tex states (((4 <=? saved) && (1 <=? (Messenger.RoomList::restoredChip saved))) = false)
    And systemLineNeverEmpty in Messenger/TimelineProofs.lex.tex states ((1 <=? (Messenger.Timeline::systemLine kind)) = true)
    And unknownChangeIsNeutral in Messenger/TimelineProofs.lex.tex states (((9 <=? kind) && (((Messenger.Timeline::systemLine kind) <? 10) || (10 <? (Messenger.Timeline::systemLine kind)))) = false)
    And connectedNeverShowsOfflineDialog in Messenger/TimelineProofs.lex.tex states (((1 <=? connected) && (1 <=? (Messenger.Timeline::offlineDialog connected tried))) = false)
    And retryAlwaysAnswered in Messenger/TimelineProofs.lex.tex states (((1 <=? tried) && (((Messenger.Timeline::offlineDialog 0 tried) <? 2) || (2 <? (Messenger.Timeline::offlineDialog 0 tried)))) = false)
    And unshiftedKeyNeverMovesList in Messenger/KeysProofs.lex.tex states ((Messenger.Keys::listPanelKey key modifier 0 alt overlayOpen) = 0)
    And openOverlayBlocksListKeys in Messenger/KeysProofs.lex.tex states (((1 <=? overlayOpen) && (1 <=? (Messenger.Keys::listPanelKey key modifier shift alt overlayOpen))) = false)
    And escapeAlwaysCloses in Messenger/KeysProofs.lex.tex states ((Messenger.Keys::controlKey 11 0 shift) = 6)
    And saveNeedsModifier in Messenger/KeysProofs.lex.tex states (((Messenger.Keys::controlKey key 0 shift) =? 7) = false)
    And keyboardRowWideOnly in Messenger/SettingsProofs.lex.tex states (((panes <=? 1) && (1 <=? (Messenger.Settings::rowShown 7 panes))) = false)
    And unknownRowNeverShown in Messenger/SettingsProofs.lex.tex states (((9 <=? row) && (1 <=? (Messenger.Settings::rowShown row panes))) = false)
    And subScreenAlwaysHasBack in Messenger/SettingsProofs.lex.tex states (((1 <=? onSubScreen) && ((Messenger.Settings::settingsBack onSubScreen openedFromChats) =? 0)) = false)
    And neverOnlineWithoutEngine in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::onlineShown 0 sharesPresence online) = 0)
    And neverOnlineWithoutConsent in Messenger/LayoutProofs.lex.tex states ((Messenger.Layout::onlineShown engineReportsPresence 0 online) = 0)
    And reactionsNeverCrowded in Messenger/TimelineProofs.lex.tex states (((1 <=? hasReactions) && ((Messenger.Timeline::gapAfter nextStartsGroup hasReactions) <? 24)) = false)
    And typingOffNeverShowsBubble in Messenger/TimelineProofs.lex.tex states ((Messenger.Timeline::typingBubble isDirect othersTyping 0) = 0)
    And directBubbleNeverNamed in Messenger/TimelineProofs.lex.tex states (((1 <=? isDirect) && (2 <=? (Messenger.Timeline::typingBubble isDirect othersTyping typingShown))) = false)
    And knownNeverPlaceholder in Messenger/TimelineProofs.lex.tex states (((1 <=? known) && (1 <=? (Messenger.Timeline::unsupportedShown known isMessage))) = false)
    And unknownMessageNeverVanishes in Messenger/TimelineProofs.lex.tex states (((1 <=? isMessage) && ((Messenger.Timeline::unsupportedShown 0 isMessage) =? 0)) = false)
    And captionKeepsTimeBelow in Messenger/TimelineProofs.lex.tex states (((1 <=? hasCaption) && (1 <=? (Messenger.Timeline::timeOnMedia isMedia hasCaption))) = false)
    And fullAlbumBeforeMore in Messenger/TimelineProofs.lex.tex states (((1 <=? (Messenger.Timeline::albumMoreShown count)) && ((Messenger.Timeline::albumCells count) <? 4)) = false)
    And singleReactionNoCount in Messenger/TimelineProofs.lex.tex states (((total <=? 1) && (1 <=? (Messenger.Timeline::reactionCountShown total))) = false)
    And badgeNeverAboveCap in Messenger/RoomListProofs.lex.tex states (((Messenger.RoomList::badgeNumber count) <=? 999) = true)
    And cappedBadgeSaysPlus in Messenger/RoomListProofs.lex.tex states (((999 <? count) && ((Messenger.RoomList::badgePlus count earlierUnknown) =? 0)) = false)
    And unreadHidesTicks in Messenger/RoomListProofs.lex.tex states (((1 <=? unread) && (1 <=? (Messenger.RoomList::previewTicks lastIsOwn unread))) = false)
    And wideMetaReadable in Messenger/BudgetProofs.lex.tex states ((11 <=? (Messenger.Budget::wideMetaSize)) = true)
    And wideBubbleNarrowerThanPhone in Messenger/BudgetProofs.lex.tex states (((Messenger.Budget::wideBubbleMaxPercent) <=? (Messenger.Budget::bubbleMaxPercent)) = true)
    And albumFitsMedia in Messenger/BudgetProofs.lex.tex states ((((Messenger.Budget::albumCell) + ((Messenger.Budget::albumGap) + (Messenger.Budget::albumCell))) <=? (Messenger.Budget::mediaMaxWidth)) = true)
    And emojiCellsHoldEmoji in Messenger/BudgetProofs.lex.tex states ((((Messenger.Budget::pickerEmojiSize) <? (Messenger.Budget::pickerCellSize)) && (((Messenger.Budget::quickReactionSize) <? (Messenger.Budget::quickReactionCell)) && (((Messenger.Budget::moreReactionSize) <? (Messenger.Budget::moreReactionCell)) && (((Messenger.Budget::stackedEmojiSize) <? (Messenger.Budget::stackedEmojiCircle)) && ((Messenger.Budget::pillEmojiSize) <? (Messenger.Budget::reactionPillHeight)))))) = true)
    And wideSizeExamples in Messenger/BudgetProofs.lex.tex states ((((Messenger.Budget::wideHeaderHeight) =? 59) && (((Messenger.Budget::wideHeaderPicture) =? 40) && (((Messenger.Budget::wideRowPicture) =? 49) && (((Messenger.Budget::wideRowPadding) =? 10) && (((Messenger.Budget::wideNameSize) =? 17) && (((Messenger.Budget::widePreviewSize) =? 13) && (((Messenger.Budget::wideListTimeSize) =? 12) && (((Messenger.Budget::wideHeaderNameSize) =? 16) && (((Messenger.Budget::wideMessageTenths) =? 142) && (((Messenger.Budget::wideMetaSize) =? 11) && (((Messenger.Budget::wideBubbleMaxPercent) =? 60) && (((Messenger.Budget::wideBubbleCorner) =? 8) && (((Messenger.Budget::tailWidth) =? 8) && (((Messenger.Budget::tailHeight) =? 13) && (((Messenger.Budget::mediaMaxWidth) =? 336) && (((Messenger.Budget::mediaMaxHeight) =? 330) && (((Messenger.Budget::albumCell) =? 165) && (((Messenger.Budget::albumGap) =? 2) && (((Messenger.Budget::composerTextSize) =? 15) && (((Messenger.Budget::composerLineHeight) =? 24) && (((Messenger.Budget::composerMaxHeight) =? 120) && (((Messenger.Budget::unreadBadgeHeight) =? 20) && ((Messenger.Budget::reactionPillHeight) =? 24))))))))))))))))))))))) = true)

  @MR-08 @build
  Scenario: The application answers each of its eleven questions with the function the theorems are about, and invalid request for anything else
    Given the application in app/src/MessengerRules.lex.tex
    When prismpm verify replays the acceptance vectors in the compiled guest
    Then viewAnswer in MessengerRules.lex.tex contains (viewName (Messenger.Session::rootView (natAt value 1 1 0)
    And notifyAnswer in MessengerRules.lex.tex contains (levelName (Messenger.Notify::notifyLevel (natAt value 1 1 0)
    And actionAnswer in MessengerRules.lex.tex contains (if ((Messenger.Menu::messageAction (natAt value 1 1 0)
    And linkAnswer in MessengerRules.lex.tex contains (targetName (Messenger.Navigation::routeTarget (natAt value 1 1 0)
    And enterAnswer in MessengerRules.lex.tex contains (enterName (Messenger.Composer::enterAction (natAt value 1 1 0)
    And schemeAnswer in MessengerRules.lex.tex contains (if ((Messenger.Render::schemeAllowed (natAt value 1 1 0)) =? 1)
    And panesAnswer in MessengerRules.lex.tex contains (panesName (Messenger.Layout::panes (natAt value 1 2 0)))
    And route in MessengerRules.lex.tex contains (if ((operation =? 1) && (length =? 5)) then (viewAnswer value)
    And dispatch in MessengerRules.lex.tex contains (route (natAt value 0 1 0) (Foundation.Bytes::byteLength value) value)
    And tabsAnswer in MessengerRules.lex.tex contains (tabsName (Messenger.Layout::tabShown 1 (natAt value 1 1 0) (natAt value 2 1 0) (natAt value 3 1 0)) (Messenger.Layout::tabShown 2 (natAt value 1 1 0) (natAt value 2 1 0) (natAt value 3 1 0)) (Messenger.Layout::tabShown 3 (natAt value 1 1 0) (natAt value 2 1 0) (natAt value 3 1 0)))
    And buttonAnswer in MessengerRules.lex.tex contains (if ((Messenger.Composer::mainButton (natAt value 1 1 0) (natAt value 2 1 0)) =? 1)
    And tickAnswer in MessengerRules.lex.tex contains (tickName (Messenger.Timeline::tickShown (natAt value 1 1 0) (natAt value 2 1 0) (natAt value 3 1 0)))
    And dayAnswer in MessengerRules.lex.tex contains (dayName (Messenger.Timeline::dayLabel (natAt value 1 1 0)))
    And route in MessengerRules.lex.tex contains (if ((operation =? 8) && (length =? 4)) then (tabsAnswer value)
    And route in MessengerRules.lex.tex contains (if ((operation =? 10) && (length =? 3)) then (buttonAnswer value)
    And route in MessengerRules.lex.tex contains (if ((operation =? 11) && (length =? 4)) then (tickAnswer value)
    And route in MessengerRules.lex.tex contains (if ((operation =? 12) && (length =? 2)) then (dayAnswer value)
    And tabShown in Messenger/Layout.lex.tex contains body: (if (tab =? 0) then 1 else (if (tab =? 1) then (if (1 <=? statusBuilt) then 1 else 0) else (if (tab =? 2) then (if (1 <=? spacesBuilt) then 1 else 0) else (if (tab =? 3) then (if (1 <=? callsBuilt) then 1 else 0) else (if (tab =? 4) then 1 else 0)))))
    And mainButton in Messenger/Composer.lex.tex contains body: (if (1 <=? hasText) then 0 else (if (1 <=? voiceBuilt) then 1 else 0))
    And tickShown in Messenger/Timeline.lex.tex contains body: (if (state =? 1) then 1 else (if (state =? 2) then 2 else (if (state =? 3) then (if (1 <=? engineKnowsDelivery) then 3 else 2) else (if (state =? 4) then (if (1 <=? engineKnowsDelivery) then (if (1 <=? engineKnowsRead) then 4 else 3) else 2) else 0))))
    And dayLabel in Messenger/Timeline.lex.tex contains body: (if (daysAgo =? 0) then 0 else (if (daysAgo =? 1) then 1 else (if (daysAgo <? 7) then 2 else 3)))
    And noDoubleTickWithoutDelivery in Messenger/TimelineProofs.lex.tex states ((3 <=? (Messenger.Timeline::tickShown state 0 engineKnowsRead)) = false)
    And noAccentWithoutRead in Messenger/TimelineProofs.lex.tex states ((4 <=? (Messenger.Timeline::tickShown state engineKnowsDelivery 0)) = false)
    And queuedShowsClock in Messenger/TimelineProofs.lex.tex states ((Messenger.Timeline::tickShown 1 engineKnowsDelivery engineKnowsRead) = 1)
    And dayLabelInRange in Messenger/TimelineProofs.lex.tex states (((Messenger.Timeline::dayLabel daysAgo) <=? 3) = true)
