nightstalker.hunter.class['Fury'] = function()
  local target = nightstalker.target
  local stance = gmcp.Char.Vitals.st:lower()
  local rage = tonumber(gmcp.Char.Vitals.rg)
  
  if nightstalker.windupcheck == true then
    nightstalker.hunter.send("kith fever "..target)
  elseif not nightstalker.hunter.flags.suffused and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
    nightstalker.hunter.send("suffuse")
   elseif nightstalker.haveskill('Burn', 'Fulmination') then
    nightstalker.hunter.send("kith burn "..target)
   else
     nightstalker.hunter.send("kill "..target)
  end
          
    -- for later when you have all yours skills, one way to do a bashing route for fury
    
   --     if
   --       not nightstalker.hunter.flags.suffused and
   --       ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 71 then
   --       nightstalker.hunter.send("suffuse")
   --     elseif nightstalker.hunter.flags.unstoppable == true and nightstalker.hunter.flags.overpower == false then
   --       local to_combo =
   --         {
   --           ['symmetry'] = 'combo gutrend overpower',
   --           ['flare'] = 'combo wound overpower',
   --           ['eruption'] = 'combo rupture overpower',
   --         }
   --       nightstalker.hunter.send(to_combo[stance]..' '..target)
   --     else
   --       if nightstalker.hunter.flags.unstoppable == true then
   --         local to_combo =
   --           {
   --             ['symmetry'] = 'combo gutrend slice',
   --             ['flare'] = 'combo wound slice',
   --             ['eruption'] = 'combo rupture slice',
   --           }
   --         nightstalker.hunter.send(to_combo[stance]..' '..target)
   --       else
   --         if nightstalker.hunter.flags.unstoppableready == true then
   --           local to_combo =
   --             {
   --               ['symmetry'] = 'combo gutrend unstoppable',
   --               ['flare'] = 'combo wound unstoppable',
   --               ['eruption'] = 'combo hypertension unstoppable',
   --             }
   --           nightstalker.hunter.send(to_combo[stance]..' '..target)
   --         else
   --           if not nightstalker.hunter.flags.berserk and rage > 10 then
   --             local to_combo =
   --               {
   --                 ['symmetry'] = 'combo gutrend berserk',
   --                 ['flare'] = 'combo wound deepstrike',
   --                 ['eruption'] = 'combo rupture berserk',
   --               }
   --             nightstalker.hunter.send(to_combo[stance]..' '..target)
   --           else
   --             local to_combo =
   --               {
   --                 ['symmetry'] = 'combo gutrend flyinglash',
   --                 ['flare'] = 'combo wound deepstrike',
   --                 ['eruption'] = 'combo rupture flyinglash',
   --               }
   --             nightstalker.hunter.send(to_combo[stance]..' '..target)
   --           end
   --         end
   --       end
   --     end
  
end