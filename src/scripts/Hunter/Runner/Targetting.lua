function sym.hunter.targetting()
    if sym.hunter.runner.enabled and sym.hunter.runner.walkingTo ~= gmcp.Room.Info.num then
      return false
    end
  
    local mob = sym.hunter.checktarget()
  
    if mob then
      local target = gmcp.Char.Status.target:match('%d+')
      if target and mob.id == target then return end
      sym.echo('<0,128,128>Next Target: <128,128,0>' .. mob.name .. '<0,128,128> (<128,128,0>' .. mob.id .. '<0,128,128>)\n')
      enableTrigger('hunting balance')
      send('st ' .. mob.id, false)
      if sym.hunter.runner.config.calling then
        send('crt Target: '..mob.id, false)
      end
    else
      sym.echo('<156,0,0>There are no suitable targets left.\n')
      disableTrigger('hunting balance')
      if sym.hunter.runner.enabled then
        if sym.hunter.runner.empty_timer then killTimer(sym.hunter.runner.empty_timer) end
        sym.hunter.runner.empty_timer = tempTimer(3 + getNetworkLatency(), [[raiseEvent('empty_room')]])
      end
    end
  end
  
  sym.registerevent('hunter targetting', 'room_updated', 'sym.hunter.targetting')