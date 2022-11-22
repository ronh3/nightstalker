function nightstalker.hunter.runner:init()
	decho('<0,128,128>Genrunner mapping area from: <128,128,0>'..getRoomAreaName(getRoomArea(gmcp.Room.Info.num))..'\n')
	local rooms = getAreaRooms(getRoomArea(gmcp.Room.Info.num))
	nightstalker.hunter.runner.rooms = {}
	nightstalker.hunter.runner.reverse = {}
	for _,vnum in pairs(rooms) do
		if getPath(gmcp.Room.Info.num, vnum) then
			nightstalker.hunter.runner.rooms[vnum] = {}
			local exits = getRoomExits(vnum)
			for dir, toRoom in pairs(exits) do
				nightstalker.hunter.runner.rooms[vnum][toRoom] = {
					dir = dir,
				}
			end
		end
	end
	nightstalker.hunter.runner.rooms[gmcp.Room.Info.num] = {}
	local exits = getRoomExits(gmcp.Room.Info.num)
	for dir, toRoom in pairs(exits) do
		nightstalker.hunter.runner.rooms[gmcp.Room.Info.num][toRoom] = {
			dir = dir,
		}
	end
	nightstalker.hunter.runner.roomsLeft = {}
	nightstalker.hunter.runner.startRoom = gmcp.Room.Info.num
	for vnum, exits in pairs(nightstalker.hunter.runner.rooms) do
		if vnum ~= nightstalker.hunter.runner.startRoom then
			nightstalker.hunter.runner.roomsLeft[vnum] = true
		end
	end

	nightstalker.hunter.runner.walkingTo = gmcp.Room.Info.num

	decho('<128,128,0>'..table.size(nightstalker.hunter.runner.roomsLeft)..'<0,128,128> rooms mapped!\n')
end