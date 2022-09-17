function sym.hunter.checkroom()
    if not sym.hunter.nextroom() then
      sym.hunter.previousroom()
    end
  end
  
  function sym.hunter.nextroom()
      if not sym.hunter.runner.enabled then return false end
  
      if sym.hunter.runner.walkingTo ~= gmcp.Room.Info.num then return false end
  
      for vnum, roomInfo in pairs(sym.hunter.runner.rooms[gmcp.Room.Info.num]) do
          if sym.hunter.runner.roomsLeft[vnum] then
              sym.hunter.runner.walkingTo = vnum
              table.insert(sym.hunter.runner.reverse, gmcp.Room.Info.num)
        expandAlias('goto ' .. vnum)
              return true
          end
      end
  
    return false
  end
  
  function sym.hunter.previousroom()
      sym.hunter.runner.backracking = true
      if #sym.hunter.runner.reverse > 0 then
          sym.hunter.runner.walkingTo = table.remove(sym.hunter.runner.reverse)
          expandAlias('goto '..sym.hunter.runner.walkingTo)
      else
          sym.hunter.runner.enabled = false
      sym.hunter.system.stop()
          decho('<0,128,128>Hunting completed!\n')
      end
  end
  
  sym.registerevent('runner check', 'empty_room', 'sym.hunter.checkroom')