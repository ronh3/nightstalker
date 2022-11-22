groundMapCount = groundMapCount + 1

if groundMapCount == 1 then
  nightstalker.ui.mapper:decho('Ground', '\n <0,128,128>Room: <128,128,0>'..gmcp.Room.Info.name..'\n')
  nightstalker.ui.mapper:decho('Ground', '\n <0,128,128>Area: <128,128,0>'..gmcp.Room.Info.area..'\n')
  nightstalker.ui.mapper:decho('Ground', '\n <0,128,128>Environment: <128,128,0>'..gmcp.Room.Info.environment..'\n')
  nightstalker.ui.mapper:decho('Ground', '\n <0,128,128>Coords: <128,128,0>'..gmcp.Room.Info.coords..'\n')
  nightstalker.ui.mapper:decho('Ground', '\n <0,128,128>Exits: <128,128,0>'..table.concat(table.keys(gmcp.Room.Info.exits), ' ')..'\n')
  nightstalker.ui.mapper:decho('Ground', '\n<0,0,128>'..string.rep('-', 45))
end

if groundMapCount > 1 and groundMapCount < 25 then
  nightstalker.ui.mapper:append('Ground')
else
  deleteLine()
end

if groundMapCount == 25 then
  nightstalker.ui.mapper:decho('Ground', '<0,0,128>'..string.rep('-', 45))
end