-- reset track height to minimum

local r = reaper
local c = r.CountTracks(0)
if c == 0 then
	return
end

r.Undo_BeginBlock()
r.PreventUIRefresh(1)

for i = 0, c - 1 do
	r.SetMediaTrackInfo_Value(r.GetTrack(0, i), 'I_HEIGHTOVERRIDE', 0)
end

r.TrackList_AdjustWindows(true)
r.UpdateArrange()

r.PreventUIRefresh(-1)
r.Undo_EndBlock("Reset all TCP tracks to default height", -1)
