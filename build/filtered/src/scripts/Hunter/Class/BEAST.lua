nightstalker.hunter.class['B.E.A.S.T.'] = function()
    local target = nightstalker.target
    if not nightstalker.hunter.flags.contingency then
      nightstalker.hunter.send('contingency')
    end
    if nightstalker.windupcheck == true then
      if tonumber(gmcp.Char.Vitals.pl) > 50 then
        nightstalker.hunter.send('plasma flash '..target)
      else
        nightstalker.hunter.send('mwp netlaunch '..target)
      end
    elseif not nightstalker.hunter.flags.support and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
      nightstalker.hunter.send('suit support')
    elseif not nightstalker.hunter.flags.backhand then
      nightstalker.hunter.send('suit backhand '..target)
    else
      nightstalker.hunter.send('mwp wristblade '..target)
    end
  end