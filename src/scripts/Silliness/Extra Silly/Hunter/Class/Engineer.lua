sym.hunter.class['Engineer'] = function()
    local target = sym.target
    local sym_name = gmcp.Char.Name.name
    if not sym.hunter.flags.stimjected and not sym.hunter.flags.autoheal and sym.haveskill('Stimjectors', 'Gadgets') and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
      sym.hunter.send('stimjector ' .. sym_name)
    elseif not sym.hunter.flags.repeated and sym.haveskill('Repeat', 'Bots') and tonumber(string.match(gmcp.IRE.Target.Info.hpperc, '%d+')) > 75 then
      sym.hunter.send('bot repeat claw '..target)
    elseif not sym.hunter.flags.harassed and sym.haveskill('Harass', 'Bots') then
      sym.hunter.send('bot harass '..target)
    elseif sym.hunter.flags.repeating and sym.haveskill('Shock', 'Gadgets') then
      sym.hunter.send('gadget shock '..target)
    else
      sym.hunter.send('bot claw '..target)
    end
  end