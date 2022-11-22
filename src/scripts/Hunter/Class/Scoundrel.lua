nightstalker.hunter.class['Scoundrel'] = function()
  local target = nightstalker.target
  local bullets = tonumber(gmcp.Char.Vitals.bl)
  if nightstalker.windupcheck == true then
    if bullets == 0 then
      nightstalker.hunter.send('guile pocketsand '..target)
    else
      nightstalker.hunter.send('gun pointblank '..target)
    end
  elseif not nightstalker.hunter.flags.stimmed and nightstalker.haveskill('Stim', 'Guile') and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
    nightstalker.hunter.send('guile stim')
  elseif bullets == 0 then
    if nightstalker.haveskill ('Fling', 'Improvisation') then
      nightstalker.hunter.send('ied fling shrapnel ripper at '..target)
    elseif nightstalker.haveskill ('Pocketsand', 'Guile') then
      nightstalker.hunter.send('guile pocketsand '..target)
    elseif nightstalker.haveskill ('Spin', 'Gunslinging') then
      nightstalker.hunter.send('gun spin '..target)
    else
      nightstalker.hunter.send('gun quickload')
    end
  elseif not nightstalker.hunter.flags.ambushed and nightstalker.haveskill('Ambush', 'Gunslinging') then
    nightstalker.hunter.send('gun ambush '..target)
  elseif not nightstalker.hunter.flags.dualshot and nightstalker.haveskill('Rapidfire', 'Gunslinging') and bullets >= 2 then
    nightstalker.hunter.send('gun rapidfire '..target)
  else
    nightstalker.hunter.send('gun crackshot '..target)
  end
end