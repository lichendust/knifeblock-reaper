# Knifeblock for Reaper

The humble beginnings of a library of scripts for scoring and producing in Reaper.

## Contents

<!-- MarkdownTOC autolink=true -->

- [Installing](#installing)
- [Scripts](#scripts)
	- [Markers](#markers)
	- [Copy Timecode](#copy-timecode)
	- [Toggle Empty TCP Items](#toggle-empty-tcp-items)
	- [Move by Measure Left/Right](#move-by-measure-leftright)

<!-- /MarkdownTOC -->

## Installing

Copy the *contents* of the script directory (or individual files) to `/REAPER/Scripts/` on your system; you can open the location with the 'Show REAPER resource path in explorer/finder' button under the Options menu.

Within the Action > Action List popup, hit the New Action button and press 'Load ReaScript'.

This registers any individual script as a new Action, which can then be bound to a keybinding or a button.

## Scripts

### Markers

	knifeblock_markers.lua

Exports a TSV (tabs rather than commas) file of the SMPTE timestamps of all markers and regions in the project — *not* including time signature changes because Reaper feels these should somehow be separate — and saves them as `markers.csv` in the project directory.

With markers set to follow time instead of beats, the markers can be used to spot cues and events, while exported durations can be used in calculations for tempo and time signature.

### Copy Timecode

	knifeblock_copy_timecode.lua

Copies the edit cursor's current SMPTE timecode to the clipboard.

### Toggle Empty TCP Items

	knifeblock_toggle_empty_tcp.lua

Toggles the visibility of all TCP tracks that do not have any child tracks or media items.  Created to quickly collapse big templates down to just the tracks that are in use in the current project.

> This script is opinionated in that it ignores tracks with `FX` or `Separator` in the name, which are tracks only shown on the MCP in my template.

### Move by Measure Left/Right

	knifeblock_move_by_measure_left.lua
	knifeblock_move_by_measure_right.lua

Moves all selected items left or right by one measure.
