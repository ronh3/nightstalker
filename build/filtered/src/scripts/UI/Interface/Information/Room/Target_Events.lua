function nightstalker.ui.gmcproominfo()
    if oldnum ~= gmcp.Room.Info.num then
      nightstalker.targetindex = 0
      oldnum = gmcp.Room.Info.num
    end
  end
  
  function nightstalker.ui.gmcpiretargetset()
    nightstalker.target = gmcp.IRE.Target.Set
    nightstalker.ui.update_room()
  
    if nightstalker.checkmodule('Hunting') and gmcp.Char.Vitals.bal == '1' then
      nightstalker.hunter.class[gmcp.Char.Status.class](nightstalker.target)
    end
  end
  
  nightstalker.registerevent('target info', 'gmcp.Room.Info', 'nightstalker.ui.gmcproominfo')
  nightstalker.registerevent('target set', 'gmcp.IRE.Target.Set', 'nightstalker.ui.gmcpiretargetset')