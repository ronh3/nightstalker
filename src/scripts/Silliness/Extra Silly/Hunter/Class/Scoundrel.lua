sym.hunter.class['Scoundrel'] = function()
    local target = sym.target
    local bullets = tonumber(gmcp.Char.Vitals.bl)
    if not sym.hunter.flags.stimmed and sym.haveskill('Stim', 'Guile') and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
      sym.hunter.send('guile stim')
    elseif bullets == 0 then
      if sym.haveskill ('Fling', 'Improvisation') then
        sym.hunter.send('ied fling shrapnel ripper at '..target)
      elseif sym.haveskill ('Pocketsand', 'Guile') then
        sym.hunter.send('guile pocketsand '..target)
      elseif sym.haveskill ('Spin', 'Gunslinging') then
        sym.hunter.send('gun spin '..target)
      else
        sym.hunter.send('gun quickload')
      end
    elseif not sym.hunter.flags.ambushed and sym.haveskill('Ambush', 'Gunslinging') then
      sym.hunter.send('gun ambush '..target)
    elseif not sym.hunter.flags.dualshot and sym.haveskill('Rapidfire', 'Gunslinging') and bullets >= 2 then
      sym.hunter.send('gun rapidfire '..target)
    else
      sym.hunter.send('gun crackshot '..target)
    end
  end