-- shows and hides TCP items by whether they have
-- children or media items

-- opinionated: it will skip tracks with 'FX' or
-- 'Separator' in the name, because these are only
-- relevant to the MCP in my template

local r = reaper

local t = {}
local everything_is_hidden = true

r.Undo_BeginBlock()

for i = 0, r.CountTracks(0) - 1 do
	local track = r.GetTrack(0, i)

	local name, flags = r.GetTrackState(track)
	local count       = r.GetTrackNumMediaItems(track)

	-- is a parent folder
	if flags & 1 ~= 0 then
		goto hide_next_loop
	end

	-- has media items
	if count ~= 0 then
		goto hide_next_loop
	end

	-- is a reserved name
	if name:match('Separator') or name:match('FX') then
		goto hide_next_loop
	end

	-- isn't hidden
	if flags & 512 == 0 then
		everything_is_hidden = false
	end

	t[#t + 1] = track

	::hide_next_loop::
end

local x = everything_is_hidden and 1 or 0
for _, track in ipairs(t) do
	r.SetMediaTrackInfo_Value(track, 'B_SHOWINTCP', x)
end

r.TrackList_AdjustWindows(false)
r.Undo_EndBlock('show/hide empty TCP tracks/folders', -1)
