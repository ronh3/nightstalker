sym.hunter.send = function(cmd)
    if debug.traceback():find('Trigger', 1, true) then
      decho(' <51,0,255>(<242,234,233>'..cmd..'<51,0,255>)')
    end
    send(cmd, false)
  end
  
  sym.hunter.triggy = function(class)
    class = class:lower()
  
    local clist = {'b.e.a.s.t.', 'scoundrel', 'nanoseer', 'engineer', 'fury'}
  
    for _, c in ipairs(clist) do
      (c == class and enableTrigger or disableTrigger)('oh-'..c)
    end
  end
  
  sym.hunter.setignore = function(name)
    sym.hunter.ignore[name] = not sym.hunter.ignore[name]
    -- and because my ocd can't handle it
    if not sym.hunter.ignore[name] then sym.hunter.ignore[name] = nil end
    sym.savetable('hunter.ignore')
    sym.ui.update_room()
  end
  
  sym.hunter.setexception = function(name)
    sym.hunter.exceptions[name] = not sym.hunter.exceptions[name]
    -- it's actually necessary here, though
    if not sym.hunter.exceptions[name] then sym.hunter.exceptions[name] = nil end
    sym.savetable('hunter.exceptions')
    sym.ui.update_room()
  end
  
  sym.hunter.checktarget = function()
    local area = gmcp.Room.Info.area
    local prios = sym.hunter.priorities[area]
    local ignore = sym.hunter.ignore
    local exceptions = table.keys(sym.hunter.exceptions)
    local mobs = {}
  
    table.foreach(sym.ui.roommobs, function(i, mob)
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
  
  function checkSystems()
      local vitals = gmcp.Char.Vitals
      local sym_ww = (vitals.ww == "1" and true or false)
    local efficacy = {"wetwiring_efficacy", "muscular_efficacy", "mind_efficacy", "internal_efficacy", "sensory_efficacy"}
      local systems = {"wetwiring", "muscular", "mind", "internal", "sensory"}
      if not sym_ww then return end
      for _, system in pairs(systems) do
          local value = math.floor(tonumber(vitals[system]))
      local evalue = tonumber(vitals[efficacy[_]])
          if value <= 92.5 and evalue >= 85 then
              send("ww mend "..system,false)
              break
          end
      end
  end