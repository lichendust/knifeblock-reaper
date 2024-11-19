-- move selected items one measure to the right

local r = reaper
local items = r.CountSelectedMediaItems()
if items == 0 then
	return
end

r.Undo_BeginBlock()
r.ApplyNudge(0, 0, 0, 16, 1, 0, 0)
r.Undo_EndBlock('move time selection right one measure', -1)