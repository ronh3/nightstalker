function sym.hunter.movement()
    if not sym.checkmodule('Hunting') then return end
    if sym.hunter.runner.enabled then
      if sym.hunter.runner.enabled and gmcp.Room.Info.num == sym.hunter.runner.walkingTo then
        sym.hunter.runner.roomsLeft[gmcp.Room.Info.num] = nil
      end
    end
    if sym.hunter.runner.moving_timer then killTimer(sym.hunter.runner.moving_timer) end
    sym.hunter.runner.moving_timer = tempTimer(0.5 + getNetworkLatency(), function()
      if #gmcp.Room.Players > sym.hunter.runner.config.party then
        decho('\n<0,128,128>Skipping room. Another player is here! <128,128,0>'..#gmcp.Room.Players..'\n')
        raiseEvent('empty_room')
      elseif not room_updated then
        timeframe('room_updated', 0, 0.5)
        raiseEvent('room_updated')
      end
    end)
  end
  
  sym.registerevent('runner movement', 'gmcp.Room.Info', 'sym.hunter.movement')