sym.hunter.class['B.E.A.S.T.'] = function()
    local target = sym.target
    if not sym.hunter.flags.contingency then
      sym.hunter.send('contingency')
    end
    if not sym.hunter.flags.support and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
      sym.hunter.send('suit support')
    elseif not sym.hunter.flags.backhand then
      sym.hunter.send('suit backhand '..target)
    else
      sym.hunter.send('mwp wristblade '..target)
    end
  end