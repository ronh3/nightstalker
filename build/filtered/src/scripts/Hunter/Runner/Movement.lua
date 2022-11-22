function nightstalker.hunter.movement()
    if not nightstalker.checkmodule('Hunting') then return end
    if nightstalker.hunter.runner.enabled then
      if nightstalker.hunter.runner.enabled and gmcp.Room.Info.num == nightstalker.hunter.runner.walkingTo then
        nightstalker.hunter.runner.roomsLeft[gmcp.Room.Info.num] = nil
      end
    end
    if nightstalker.hunter.runner.moving_timer then killTimer(nightstalker.hunter.runner.moving_timer) end
    nightstalker.hunter.runner.moving_timer = tempTimer(0.5 + getNetworkLatency(), function()
      if #gmcp.Room.Players > nightstalker.hunter.runner.config.party then
        decho('\n<0,128,128>Skipping room. Another player is here! <128,128,0>'..#gmcp.Room.Players..'\n')
        raiseEvent('empty_room')
      elseif not room_updated then
        timeframe('room_updated', 0, 0.5)
        raiseEvent('room_updated')
      end
    end)
  end
  
  nightstalker.registerevent('runner movement', 'gmcp.Room.Info', 'nightstalker.hunter.movement')