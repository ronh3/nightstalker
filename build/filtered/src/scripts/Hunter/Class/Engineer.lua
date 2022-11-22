nightstalker.hunter.class['Engineer'] = function()
    local target = nightstalker.target
    local nightstalker_name = gmcp.Char.Name.name
    if nightstalker.windupcheck == true then
      nightstalker.hunter.send('operate shock '..target)
    elseif not nightstalker.hunter.flags.stimjected and not nightstalker.hunter.flags.autoheal and nightstalker.haveskill('Stimjectors', 'Gadgets') and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
      nightstalker.hunter.send('stimjector '..nightstalker_name)
    elseif not nightstalker.hunter.flags.repeated and nightstalker.haveskill('Repeat', 'Bots') and tonumber(string.match(gmcp.IRE.Target.Info.hpperc, '%d+')) > 75 then
      nightstalker.hunter.send('bot repeat claw '..target)
    elseif not nightstalker.hunter.flags.harassed and nightstalker.haveskill('Harass', 'Bots') then
      nightstalker.hunter.send('bot harass '..target)
    elseif nightstalker.hunter.flags.repeating and nightstalker.haveskill('Shock', 'Gadgets') then
      nightstalker.hunter.send('gadget shock '..target)
    else
      nightstalker.hunter.send('bot claw '..target)
    end
  end