sym.hunter.class['Nanoseer'] = function(target)
    if not sym.hunter.flags.repaired and sym.haveskill('Embrace', 'Voidism') and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
      sym.hunter.send('void embrace')
    elseif not sym.hunter.flags.multistrike and sym.haveskill('Multistrike', 'Nanotech') then
      sym.hunter.send('nano multistrike '..target)
    elseif not sym.hunter.flags.frozen and sym.haveskill('Freeze', 'Voidism') then
      sym.hunter.send('void freeze '..target)
    else
      sym.hunter.send('nano swarm '..target)
    end
  end