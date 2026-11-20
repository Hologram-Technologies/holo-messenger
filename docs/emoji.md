# Emoji

Why: emoji look different on every system, and some systems lack the newest ones, so the same message reads differently on two people's screens. One pinned set of graphics makes a message look the same everywhere, as it does in WhatsApp, which draws its own.
How: Holo Messenger draws every emoji from the Twemoji graphics, served by its own site and checked by hash before use, and falls back to the system's emoji when a graphic is missing or fails its check. The text stays text.
Use: the requirements below bind the build. The choice of release is Ilya's (last section). Read on 2026-11-20; nothing here is built yet.

## Where emoji appear, and at what size

The sizes are wa-ui's (`docs/whatsapp-study.md`, section 12) unless the row says otherwise; `Budget` holds them.

| Place | Size | Source |
|---|---|---|
| Message text | the text's own size: 14.2 px wide, 16 px on a phone (`Budget.wideMessageTenths`, `Budget.messageSize`) | wa-ui `chat-bubble.tsx` |
| A message of one to three emoji and nothing else | 32 px (`Budget.emojiOnlySize`); four or more stay at text size (`Render.emojiOnlyLarge`) | the threshold is study C-78 (unverified); 32 px is this specification's own value |
| Reaction pill, one emoji | 13 px (`Budget.pillEmojiSize`) in a 24 px pill | wa-ui `reaction-pill.tsx` |
| Reaction pill, several emoji | 12 px in 20 px circles overlapping by 5 px (`Budget.stackedEmojiSize`, `Budget.stackedEmojiCircle`) | wa-ui `reaction.tsx` |
| Quick-reaction row | 24 px in 38 px cells, six of them (`Budget.quickReactionSize`, `Budget.quickReactionCell`, `Menu.quickReactions`) | wa-ui `message-actions.tsx` |
| More-reactions grid | 20 px in 34 px cells, 8 columns (`Budget.moreReactionSize`, `Budget.moreReactionCell`) | wa-ui `message-actions.tsx` |
| Emoji picker | 22 px in 36 px cells, 8 columns (`Budget.pickerEmojiSize`, `Budget.pickerCellSize`, `Budget.pickerColumns`) | wa-ui `emoji-picker.tsx` |
| Chat-list preview | the preview's size: 13 px wide, 15 px on a phone | wa-ui `chat-list-item.tsx`; `Budget.previewSize` |
| Names (list, header, sender) | the name's size | wa-ui `chat-list-item.tsx`, `chat-header.tsx` |
| The composer field | the system's emoji, at 15 px | a plain text field cannot hold pictures; drawing them there needs a rich editor (HM-CAP-090), which is not planned |

## Which characters become a graphic

`Render.emojiForm selector presentation graphic hashOk` decides, for one whole emoji sequence (a skin tone, a flag, a keycap or a sequence joined by zero-width joiners counts as one):

- the graphic, only when a graphic exists for the whole sequence and its bytes passed their hash check, and the character asks for emoji: it carries the emoji selector U+FE0F, or it has no selector and Unicode presents it as emoji by default;
- the system's text otherwise. A character followed by the text selector U+FE0E always stays text, and so do characters that default to text, such as the copyright sign and the digits.

A sequence with no graphic of its own is drawn whole by the system, never as its parts: a family or a profession shown as separate people would change what it says. `failedHashNeverDrawn`, `missingGraphicFallsToText`, `textSelectorStaysText`, `textDefaultStaysText` and `checkedGraphicDrawn` are the theorems.

## Which set to pin

| | twitter/twemoji | jdecked/twemoji |
|---|---|---|
| Latest release | v14.0.2, 2022-03-31 | v17.0.3, 2026-06-01 |
| Emoji version covered | Emoji 14.0 (README) | Emoji 17.0 (README) |
| SVG graphics at that release | 3,689 files, 8,587,641 bytes, 2,327 bytes on average | 4,009 files, 10,121,593 bytes, 2,524 bytes on average, 52,105 at most |
| Maintained | no release since 2022; the repository is not archived | the maintained continuation, same files and names |
| Licences | code MIT; graphics CC-BY 4.0 (`LICENSE-GRAPHICS`) | the same |
| Attribution asked for | a mention in a README, an About section or a site footer (README, "Attribution Requirements") | the same |

Counted with the GitHub API from each release's `assets/svg` tree. With v14.0.2, every emoji added in Emoji 15.0 to 17.0 falls back to the system's.

Recommended: jdecked/twemoji v17.0.3, for current Unicode coverage with the same design and licence. twitter/twemoji v14.0.2 is the original if that matters more than coverage. The choice is Ilya's.

## Delivery: what the build must meet

| ID | Requirement |
|---|---|
| E-01 | The graphics are served from Holo Messenger's own Pages site at a path named by the release, for example `messenger/emoji/twemoji-17.0.3/`. Nothing is fetched from a third-party server or content network: that would tell it who uses which emoji, and when. |
| E-02 | Every file is pinned by its BLAKE3, as the engine's files are. The page holds the release name and the BLAKE3 of a small index; the index names shards of the file list, each with its BLAKE3, and each shard names its files with theirs. A file is used only after its bytes match. The index and shards are fetched only when an emoji is first drawn. |
| E-03 | None of it is in the 150 KB first load (`Budget.firstLoadBytes`). A graphic is fetched only when an emoji is shown, and kept in the browser's cache for that release path. |
| E-04 | A graphic that is missing, fails to load or fails its hash shows the system's emoji in its place (`Render.emojiForm`). A failed check is not retried from another source. |
| E-05 | Text stays text: the message's bytes, copying, search, notifications and the accessibility tree carry the Unicode characters, never a picture. Each picture carries the emoji's name as its `alt` and `aria-label`. |
| E-06 | The page writes its own mapping from a sequence to a file name: the lowercase hexadecimal code points joined by hyphens, with U+FE0F left out of a sequence that has no zero-width joiner, as the release names its files (`2764.svg` for a red heart), and looks the name up in the pinned list; a name not in the list is a missing graphic (E-04). Sequences are found with the browser's own Unicode emoji property (`\p{RGI_Emoji}`), not with Twemoji's parser, under the rule that no code is copied in. Twemoji's MIT parser is not needed for this. |
| E-07 | CC-BY 4.0 attribution shows in Help and about in the page and in the README: the set's name, its copyright holders as `LICENSE-GRAPHICS` names them, the licence and a link to it, and that the graphics are unchanged. |
| E-08 | No Twitter or X logo, bird mark, colour or name used as branding appears anywhere. The attribution's plain-text credit, which the licence requires, is the only mention. |
| E-09 | The graphics are not changed, recoloured or merged into a sprite, so the hashes stay the release's and the attribution can say "unchanged". |

## Inventory

HM-CAP-228 (Emoji drawn as pinned graphics, Phase 1) holds these requirements; HM-FEA-098 and HM-SUR-104 (the picker) and HM-CAP-070 (emoji-only enlargement) name it in their acceptance checks. `docs/wa-ui-gap.md` places it in the build order.

## Decisions for Ilya

- Which release to pin: jdecked/twemoji v17.0.3 (recommended) or twitter/twemoji v14.0.2.
- Whether 32 px is the emoji-only size; it is this specification's value, not a measurement.
- Whether the composer field should draw the graphics too, which needs a rich editor; this specification leaves it on the system's emoji.
