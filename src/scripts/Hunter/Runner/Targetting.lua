function nightstalker.hunter.targetting()
    if nightstalker.hunter.runner.enabled and nightstalker.hunter.runner.walkingTo ~= gmcp.Room.Info.num then
      return false
    end
  
    local mob = nightstalker.hunter.checktarget()
  
    if mob then
      local target = gmcp.Char.Status.target:match('%d+')
      if target and mob.id == target then return end
      nightstalker.echo('<0,128,128>Next Target: <128,128,0>'..mob.name..'<0,128,128> (<128,128,0>'..mob.id..'<0,128,128>)\n')
      enableTrigger('hunting balance')
      send('st '..mob.id, false)
      if nightstalker.hunter.runner.config.calling then
        send('crt Target: '..mob.id, false)
      end
    else
      nightstalker.echo('<156,0,0>There are no suitable targets left.\n')
      disableTrigger('hunting balance')
      if nightstalker.hunter.runner.enabled then
        if nightstalker.hunter.runner.empty_timer then killTimer(nightstalker.hunter.runner.empty_timer) end
        nightstalker.hunter.runner.empty_timer = tempTimer(3 + getNetworkLatency(), [[raiseEvent('empty_room')]])
      end
    end
  end
  
  nightstalker.registerevent('hunter targetting', 'room_updated', 'nightstalker.hunter.targetting')