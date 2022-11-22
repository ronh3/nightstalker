function nightstalker.ui.rotateroomtarget()
    local ignore = nightstalker.hunter.ignore
  
    if nightstalker.targetindex == #nightstalker.ui.roommobs then
      nightstalker.targetindex = 0
    end
  
    while nightstalker.targetindex < #nightstalker.ui.roommobs do
      nightstalker.targetindex = nightstalker.targetindex + 1
  
      local mob = nightstalker.ui.roommobs[nightstalker.targetindex]
      if not mob.attrib:find('x', 1, true) and not ignore[mob.name] then
        send('st '..mob.id, false)
        return
      end
    end
  
    cecho("<red>There's nothing here, mate.\n")
  end