function sym.ui.gmcproominfo()
    if oldnum ~= gmcp.Room.Info.num then
      sym.targetindex = 0
      oldnum = gmcp.Room.Info.num
    end
  end
  
  function sym.ui.gmcpiretargetset()
    sym.target = gmcp.IRE.Target.Set
    sym.ui.update_room()
  
    if sym.checkmodule('Hunting') and gmcp.Char.Vitals.bal == '1' then
      sym.hunter.class[gmcp.Char.Status.class](sym.target)
    end
  end
  
  sym.registerevent('target info', 'gmcp.Room.Info', 'sym.ui.gmcproominfo')
  sym.registerevent('target set', 'gmcp.IRE.Target.Set', 'sym.ui.gmcpiretargetset')