-- copies the edit cursor position to the clipboard
-- as an SMPTE timestamp

local r = reaper
local pos = r.GetCursorPosition()
r.CF_SetClipboard(r.format_timestr_pos(pos, "", 5))
