nightstalker.hunter.send = function(cmd)
    if debug.traceback():find('Trigger', 1, true) then
      decho(' <51,0,255>(<242,234,233>'..cmd..'<51,0,255>)')
    end
    send(cmd, false)
  end
  
  nightstalker.hunter.triggy = function(class)
    class = class:lower()
  
    local clist = {'b.e.a.s.t.', 'scoundrel', 'nanoseer', 'engineer', 'fury'}
  
    for _, c in ipairs(clist) do
      (c == class and enableTrigger or disableTrigger)('oh-'..c)
    end
  end
  
  nightstalker.hunter.setignore = function(name)
    nightstalker.hunter.ignore[name] = not nightstalker.hunter.ignore[name]
    -- and because my ocd can't handle it
    if not nightstalker.hunter.ignore[name] then nightstalker.hunter.ignore[name] = nil end
    nightstalker.savetable('hunter.ignore')
    nightstalker.ui.update_room()
  end
  
  nightstalker.hunter.setexception = function(name)
    nightstalker.hunter.exceptions[name] = not nightstalker.hunter.exceptions[name]
    -- it's actually necessary here, though
    if not nightstalker.hunter.exceptions[name] then nightstalker.hunter.exceptions[name] = nil end
    nightstalker.savetable('hunter.exceptions')
    nightstalker.ui.update_room()
  end
  
  nightstalker.hunter.checktarget = function()
    local area = gmcp.Room.Info.area
    local prios = nightstalker.hunter.priorities[area]
    local ignore = nightstalker.hunter.ignore
    local exceptions = table.keys(nightstalker.hunter.exceptions)
    local mobs = {}
  
    table.foreach(nightstalker.ui.roommobs, function(i, mob)
      if not mob.attrib:find('x', 1, true) and (not mob.name:find('[A-Z]') or table.contains(exceptions, mob.name)) and not ignore[mob.name] then
        mobs[mob.name] = mob
      end
    end)
  
    if prios then
      for _, mob in ipairs(prios) do
        if mobs[mob] then return mobs[mob] end
      end
    end
  
    if next(mobs) then
      return select(2, next(mobs))
    end
  
    return false
  end
  
  nightstalker.hunter.checkSystems = function()
      local vitals = gmcp.Char.Vitals
      local nightstalker_ww = (vitals.ww == "1" and true or false)
    local efficacy = {"wetwiring_efficacy", "muscular_efficacy", "mind_efficacy", "internal_efficacy", "sensory_efficacy"}
      local systems = {"wetwiring", "muscular", "mind", "internal", "sensory"}
      if not nightstalker_ww then return end
      for _, system in pairs(systems) do
          local value = math.floor(tonumber(vitals[system]))
      local evalue = tonumber(vitals[efficacy[_]])
          if value <= 92.5 and evalue >= 85 then
              send("ww mend "..system,false)
              break
          end
      end
  end