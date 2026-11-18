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

  @MR-02 @build
  Scenario: A muted room, an own message and the room being viewed never notify
    Given the notification rules in app/src/Messenger/Notify.lex.tex
    When the Lean kernel checks the theorems of NotifyProofs during prismpm verify
    Then mutedNeverNotifies in Messenger/NotifyProofs.lex.tex states ((Messenger.Notify::notifyLevel enabled 2 mention viewing isOwn) = 0)
    And ownMessageNeverNotifies in Messenger/NotifyProofs.lex.tex states ((Messenger.Notify::notifyLevel enabled mode mention viewing 1) = 0)
    And viewedRoomNeverNotifies in Messenger/NotifyProofs.lex.tex states ((Messenger.Notify::notifyLevel enabled mode mention 1 isOwn) = 0)

  @MR-03 @build
  Scenario: A non-member is offered only copy, and edit is offered only on an own message
    Given the menu rules in app/src/Messenger/Menu.lex.tex
    When the Lean kernel checks the theorems of MenuProofs during prismpm verify
    Then nonMemberOnlyCopies in Messenger/MenuProofs.lex.tex states ((((status <? 2) || (2 <? status)) && ((1 <=? (Messenger.Menu::messageAction action isOwn status moderator failed)) && ((action <? 3) || (3 <? action)))) = false)
    And editOnlyOwnMessage in Messenger/MenuProofs.lex.tex states ((Messenger.Menu::messageAction 2 0 status moderator failed) = 0)

  @MR-04 @build
  Scenario: A link never lands a non-member in a timeline, and an unknown link goes home
    Given the navigation rules in app/src/Messenger/Navigation.lex.tex
    When the Lean kernel checks the theorems of NavigationProofs during prismpm verify
    Then nonMemberNeverLandsInTimeline in Messenger/NavigationProofs.lex.tex states ((((status <? 2) || (2 <? status)) && ((Messenger.Navigation::routeTarget kind known status) =? 1)) = false)
    And unknownLinkGoesHome in Messenger/NavigationProofs.lex.tex states ((Messenger.Navigation::routeTarget kind 0 status) = 0)

  @MR-05 @build
  Scenario: Shift and Enter never sends, and Enter completes a suggestion while the popup is open
    Given the composer rules in app/src/Messenger/Composer.lex.tex
    When the Lean kernel checks the theorems of ComposerProofs during prismpm verify
    Then shiftEnterNeverSends in Messenger/ComposerProofs.lex.tex states (((Messenger.Composer::enterAction 1 modifier requireModifier popupOpen) =? 1) = false)
    And openPopupEnterCompletes in Messenger/ComposerProofs.lex.tex states ((Messenger.Composer::enterAction shift modifier requireModifier 1) = 3)

  @MR-06 @build
  Scenario: Unknown markup never renders and an unsafe link scheme never opens
    Given the rendering rules in app/src/Messenger/Render.lex.tex
    When the Lean kernel checks the theorems of RenderProofs during prismpm verify
    Then unknownMarkupNeverRenders in Messenger/RenderProofs.lex.tex states (((4 <=? kind) && (1 <=? (Messenger.Render::markupAllowed kind))) = false)
    And unsafeSchemeNeverOpens in Messenger/RenderProofs.lex.tex states (((3 <=? scheme) && (1 <=? (Messenger.Render::schemeAllowed scheme))) = false)

  @MR-07 @build
  Scenario: The layout has one to three panes, and a phone never shows the list and the timeline together
    Given the layout rules in app/src/Messenger/Layout.lex.tex
    When the Lean kernel checks the theorems of LayoutProofs during prismpm verify
    Then atLeastOnePane in Messenger/LayoutProofs.lex.tex states ((1 <=? (Messenger.Layout::panes width)) = true)
    And atMostThreePanes in Messenger/LayoutProofs.lex.tex states (((Messenger.Layout::panes width) <=? 3) = true)
    And phoneNeverShowsListAndTimeline in Messenger/LayoutProofs.lex.tex states (((width <? 768) && (2 <=? ((Messenger.Layout::listVisible width roomOpen) + (Messenger.Layout::timelineVisible width roomOpen)))) = false)

  @MR-08 @build
  Scenario: The application answers each of its seven questions with the function the theorems are about, and invalid request for anything else
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
