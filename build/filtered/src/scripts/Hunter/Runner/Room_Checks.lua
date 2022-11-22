function nightstalker.hunter.checkroom()
    if not nightstalker.hunter.nextroom() then
      nightstalker.hunter.previousroom()
    end
  end
  
  function nightstalker.hunter.nextroom()
      if not nightstalker.hunter.runner.enabled then return false end
  
      if nightstalker.hunter.runner.walkingTo ~= gmcp.Room.Info.num then return false end
  
      for vnum, roomInfo in pairs(nightstalker.hunter.runner.rooms[gmcp.Room.Info.num]) do
          if nightstalker.hunter.runner.roomsLeft[vnum] then
              nightstalker.hunter.runner.walkingTo = vnum
              table.insert(nightstalker.hunter.runner.reverse, gmcp.Room.Info.num)
        expandAlias('goto '..vnum)
              return true
          end
      end
  
    return false
  end
  
  function nightstalker.hunter.previousroom()
      nightstalker.hunter.runner.backracking = true
      if #nightstalker.hunter.runner.reverse > 0 then
          nightstalker.hunter.runner.walkingTo = table.remove(nightstalker.hunter.runner.reverse)
          expandAlias('goto '..nightstalker.hunter.runner.walkingTo)
      else
          nightstalker.hunter.runner.enabled = false
      nightstalker.hunter.system.stop()
          decho('<0,128,128>Hunting completed!\n')
      end
  end
  
  nightstalker.registerevent('runner check', 'empty_room', 'nightstalker.hunter.checkroom')