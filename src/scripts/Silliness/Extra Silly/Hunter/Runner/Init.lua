function sym.hunter.runner:init()
	decho('<0,128,128>Genrunner mapping area from: <128,128,0>' .. getRoomAreaName(getRoomArea(gmcp.Room.Info.num))..'\n')
	local rooms = getAreaRooms(getRoomArea(gmcp.Room.Info.num))
	sym.hunter.runner.rooms = {}
	sym.hunter.runner.reverse = {}
	for _,vnum in pairs(rooms) do
		if getPath(gmcp.Room.Info.num, vnum) then
			sym.hunter.runner.rooms[vnum] = {}
			local exits = getRoomExits(vnum)
			for dir, toRoom in pairs(exits) do
				sym.hunter.runner.rooms[vnum][toRoom] = {
					dir = dir,
				}
			end
		end
	end
	sym.hunter.runner.rooms[gmcp.Room.Info.num] = {}
	local exits = getRoomExits(gmcp.Room.Info.num)
	for dir, toRoom in pairs(exits) do
		sym.hunter.runner.rooms[gmcp.Room.Info.num][toRoom] = {
			dir = dir,
		}
	end
	sym.hunter.runner.roomsLeft = {}
	sym.hunter.runner.startRoom = gmcp.Room.Info.num
	for vnum, exits in pairs(sym.hunter.runner.rooms) do
		if vnum ~= sym.hunter.runner.startRoom then
			sym.hunter.runner.roomsLeft[vnum] = true
		end
	end

	sym.hunter.runner.walkingTo = gmcp.Room.Info.num

	decho('<128,128,0>'..table.size(sym.hunter.runner.roomsLeft)..'<0,128,128> rooms mapped!\n')
end