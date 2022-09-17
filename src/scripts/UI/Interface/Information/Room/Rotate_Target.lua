function sym.ui.rotateroomtarget()
    local ignore = sym.hunter.ignore
  
    if sym.targetindex == #sym.ui.roommobs then
      sym.targetindex = 0
    end
  
    while sym.targetindex < #sym.ui.roommobs do
      sym.targetindex = sym.targetindex + 1
  
      local mob = sym.ui.roommobs[sym.targetindex]
      if not mob.attrib:find('x', 1, true) and not ignore[mob.name] then
        send('st '..mob.id, false)
        return
      end
    end
  
    cecho("<red>There's nothing here, mate.\n")
  end