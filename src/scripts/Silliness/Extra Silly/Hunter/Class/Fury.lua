sym.hunter.class['Fury'] = function()
    local target = sym.target
    local stance = gmcp.Char.Vitals.st:lower()
    local rage = tonumber(gmcp.Char.Vitals.rg)
    
  if not sym.hunter.flags.suffused and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
    sym.hunter.send("suffuse")
   elseif sym.haveskill('Burn', 'Fulmination') then
    sym.hunter.send("kith burn " .. target)
   else
     sym.hunter.send("kill " .. target)
  end
          
    -- for later when you have all yours skills, one way to do a bashing route for fury
    
   --     if
   --       not sym.hunter.flags.suffused and
   --       ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 71 then
   --       sym.hunter.send("suffuse")
   --     elseif sym.hunter.flags.unstoppable == true and sym.hunter.flags.overpower == false then
   --       local to_combo =
   --         {
   --           ['symmetry'] = 'combo gutrend overpower',
   --           ['flare'] = 'combo wound overpower',
   --           ['eruption'] = 'combo rupture overpower',
   --         }
   --       sym.hunter.send(to_combo[stance] .. ' ' .. target)
   --     else
   --       if sym.hunter.flags.unstoppable == true then
   --         local to_combo =
   --           {
   --             ['symmetry'] = 'combo gutrend slice',
   --             ['flare'] = 'combo wound slice',
   --             ['eruption'] = 'combo rupture slice',
   --           }
   --         sym.hunter.send(to_combo[stance] .. ' ' .. target)
   --       else
   --         if sym.hunter.flags.unstoppableready == true then
   --           local to_combo =
   --             {
   --               ['symmetry'] = 'combo gutrend unstoppable',
   --               ['flare'] = 'combo wound unstoppable',
   --               ['eruption'] = 'combo hypertension unstoppable',
   --             }
   --           sym.hunter.send(to_combo[stance] .. ' ' .. target)
   --         else
   --           if not sym.hunter.flags.berserk and rage > 10 then
   --             local to_combo =
   --               {
   --                 ['symmetry'] = 'combo gutrend berserk',
   --                 ['flare'] = 'combo wound deepstrike',
   --                 ['eruption'] = 'combo rupture berserk',
   --               }
   --             sym.hunter.send(to_combo[stance] .. ' ' .. target)
   --           else
   --             local to_combo =
   --               {
   --                 ['symmetry'] = 'combo gutrend flyinglash',
   --                 ['flare'] = 'combo wound deepstrike',
   --                 ['eruption'] = 'combo rupture flyinglash',
   --               }
   --             sym.hunter.send(to_combo[stance] .. ' ' .. target)
   --           end
   --         end
   --       end
   --     end
  
  end