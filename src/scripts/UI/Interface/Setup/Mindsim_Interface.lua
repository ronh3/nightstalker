local function getSystemColour(amount)
    amount = tonumber(amount)
    if amount > 92.5 then
      return 'MistyRose'
    elseif amount > 70 then
      return 'yellow'
    elseif amount > 30 then
      return 'Orange'
    else
      return 'red'
    end
  end
  
  function sym.ui.update_mindsim()
    if not gmcp.Char.Vitals then return end
  
    local class = gmcp.Char.Status.class
  
    if not sym.ui.footer then sym.ui.create_gauges(class) end
  
    sym.ui.health:setValue(tonumber(gmcp.Char.Vitals.hp), tonumber(gmcp.Char.Vitals.maxhp), '<center><font color="LightGrey"><font color="LightGrey">Health: ' .. string.format('%s / %s', gmcp.Char.Vitals.hp, gmcp.Char.Vitals.maxhp))
  
    if class == 'Nanoseer' then
      sym.ui.nanites:setValue(tonumber(gmcp.Char.Vitals.nn), tonumber(gmcp.Char.Vitals.maxnn), '<center><font color="LightGrey">Nanites: ' .. gmcp.Char.Vitals.formatnn)
      sym.ui.sanity:setValue(tonumber(gmcp.Char.Vitals.sa), tonumber(gmcp.Char.Vitals.maxsa), '<center><font color="LightGrey">Sanity: ' .. gmcp.Char.Vitals.formatsa)
    elseif class == 'Engineer' then
      sym.ui.parts:setValue(tonumber(gmcp.Char.Vitals.pt), tonumber(gmcp.Char.Vitals.maxpt), '<center><font color="LightGrey">Parts: ' .. gmcp.Char.Vitals.formatpt)
    elseif class == 'B.E.A.S.T.' then
      sym.ui.plasma:setValue(tonumber(gmcp.Char.Vitals.pl), tonumber(gmcp.Char.Vitals.maxpl), '<center><font color="LightGrey">Plasma: ' .. gmcp.Char.Vitals.formatpl)
    elseif class == 'Scoundrel' then
      sym.ui.bullets:setValue(tonumber(gmcp.Char.Vitals.bl), tonumber(gmcp.Char.Vitals.maxbl or 8), '<center><font color="LightGrey">Bullets: ' .. gmcp.Char.Vitals.formatbl)
    elseif class == 'Fury' then
      sym.ui.rage:setValue(tonumber(gmcp.Char.Vitals.rg), 1000, '<center><font color="LightGrey">Rage: ' .. gmcp.Char.Vitals.formatrg)
    end
  
  if not (gmcp.Char.Vitals.ship_bearing == nil) then
  local vitals = gmcp.Char.Vitals
  local ship_dmg_cap = 100 - tonumber(vitals.ship_dmg_cap)
  local ship_dmg_engine = 100 - tonumber(vitals.ship_dmg_engine)
  local ship_dmg_sensor = 100 - tonumber(vitals.ship_dmg_sensor)
  local ship_dmg_shield = 100 - tonumber(vitals.ship_dmg_shield)
  local ship_dmg_sim = 100 - tonumber(vitals.ship_dmg_sim)
  local shields_perc = round(gmcp.Char.Vitals.ship_shield / gmcp.Char.Vitals.ship_shield_max * 100)
  local hull_perc = round(gmcp.Char.Vitals.ship_hull / gmcp.Char.Vitals.ship_hull_max * 100)
  if shields_perc >= 100 then spacer1 = 3 elseif shields_perc < 10 then spacer1 = 1 else spacer1 = 2 end
  if hull_perc >= 100 then spacer2 = 3 elseif hull_perc < 10 then spacer2 = 1 else spacer2 = 2 end
  sym.ui.bottomleft:echo([[
      <p align="left" style="font-family:'Consolas'">
        ]]..string.rep('&nbsp;', 2)..[[<font color="grey">ShipSim Interface:<font color="gold"> ]]..gmcp.Char.Vitals.ship_name..[[</font>
      </p>
      <p style="font-family:'Consolas'">
        ]]..string.rep('&nbsp;', 2)..[[&nbsp;<font color="gray">Name:</font>&nbsp;<font color="white">]]..gmcp.Char.Name.name..[[</font> ]]..string.rep('&nbsp;', 10 - #gmcp.Char.Name.name)..[[ <font color="grey">Capacitor:</font>&nbsp;<font color="]]..getSystemColour(ship_dmg_cap)..[[">]]..ship_dmg_cap..[[</font>&nbsp;(]]..capacitor_bf..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 2)..[[<font color="gray">Level:</font>&nbsp;<font color="white">]]..gmcp.Char.Status.level..[[</font> ]]..string.rep('&nbsp;', 13 - #gmcp.Char.Status.level)..[[ <font color="gray">Engine:</font>&nbsp;<font color="]]..getSystemColour(ship_dmg_engine)..[[">]]..ship_dmg_engine..[[</font>&nbsp;(]]..engine_bf..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 2)..[[<font color="gray">Class:</font>&nbsp;<font color="white">]]..class..[[</font> ]]..string.rep('&nbsp;', 13 - #class)..[[ <font color="gray">Sensor:</font>&nbsp;<font color="]]..getSystemColour(ship_dmg_sensor)..[[">]]..ship_dmg_sensor..[[</font>&nbsp;(]]..sensor_bf..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 2)..[[<font color="moccasin">Marks</font><font color="gray">:</font>&nbsp;<font color="white">]]..gmcp.Char.Status.marks..[[</font> ]]..string.rep('&nbsp;', 13 - #gmcp.Char.Status.marks)..[[ <font color="gray">Shield:</font>&nbsp;<font color="]]..getSystemColour(ship_dmg_shield)..[[">]]..ship_dmg_shield..[[</font>&nbsp;(]]..shield_bf..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 1)..[[<font color="gray">Health</font><font color="gray">:</font>&nbsp;<font color="]]..getSystemColour(hull_perc)..[[">]]..hull_perc..[[</font> ]]..[[<font color = "cyan">(</font><font color="]]..getSystemColour(shields_perc)..[[">]]..shields_perc..[[</font><font color = "cyan">)</font>]]..string.rep('&nbsp;', 5 - spacer1 + spacer2)..[[<font color="gray">ShipSim:</font>&nbsp;<font color="]]..getSystemColour(ship_dmg_sim)..[[">]]..ship_dmg_sim..[[</font>&nbsp;(]]..sim_bf..[[</font>)]]..[[<br>
      </p>
      <p style="font-family:'Consolas'">
        ]]..string.rep('&nbsp;', 4)..[[<font color="gray">Your target is: <font color="turquoise">]]..gmcp.Char.Status.target..(gmcp.IRE and gmcp.IRE.Target and type(gmcp.IRE.Target.Info) == 'table' and gmcp.IRE.Target.Info.hpperc ~= '' and  [[ <font color="gray">HP:</font>&nbsp;<font color="]]..getSystemColour(gmcp.IRE.Target.Info.hpperc:gsub("%%", ""))..[[">]]..gmcp.IRE.Target.Info.hpperc or '')..[[</font>
      </p>
      ]]
      )
  else
  sym.ui.bottomleft:echo([[
      <p align="left" style="font-family:'Consolas'">
        ]]..string.rep('&nbsp;', 13)..[[<font color="grey">MindSim Interface</font>
      </p>
      <p style="font-family:'Consolas'">
        ]]..string.rep('&nbsp;', 2)..[[&nbsp;<font color="gray">Name:</font>&nbsp;<font color="white">]]..gmcp.Char.Name.name..[[</font> ]]..string.rep('&nbsp;', 11 - #gmcp.Char.Name.name)..[[ <font color="grey">Wetwiring:</font>&nbsp;<font color="]]..getSystemColour(gmcp.Char.Vitals.wetwiring)..[[">]]..gmcp.Char.Vitals.wetwiring..[[</font>&nbsp;(<font color="]]..getSystemColour(gmcp.Char.Vitals.wetwiring_efficacy)..[[">]]..gmcp.Char.Vitals.wetwiring_efficacy..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 2)..[[<font color="gray">Level:</font>&nbsp;<font color="white">]]..gmcp.Char.Status.level..[[</font> ]]..string.rep('&nbsp;', 12 - #gmcp.Char.Status.level)..[[ <font color="gray">Muscular:</font>&nbsp;<font color="]]..getSystemColour(gmcp.Char.Vitals.muscular)..[[">]]..gmcp.Char.Vitals.muscular..[[</font>&nbsp;(<font color="]]..getSystemColour(gmcp.Char.Vitals.muscular_efficacy)..[[">]]..gmcp.Char.Vitals.muscular_efficacy..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 2)..[[<font color="gray">Class:</font>&nbsp;<font color="white">]]..class..[[</font> ]]..string.rep('&nbsp;', 12 - #class)..[[ <font color="gray">Internal:</font>&nbsp;<font color="]]..getSystemColour(gmcp.Char.Vitals.internal)..[[">]]..gmcp.Char.Vitals.internal..[[</font>&nbsp;(<font color="]]..getSystemColour(gmcp.Char.Vitals.internal_efficacy)..[[">]]..gmcp.Char.Vitals.internal_efficacy..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 2)..[[<font color="moccasin">Marks</font><font color="gray">:</font>&nbsp;<font color="white">]]..gmcp.Char.Status.marks..[[</font> ]]..string.rep('&nbsp;', 13 - #gmcp.Char.Status.marks)..[[ <font color="gray">Sensory:</font>&nbsp;<font color="]]..getSystemColour(gmcp.Char.Vitals.sensory)..[[">]]..gmcp.Char.Vitals.sensory..[[</font>&nbsp;(<font color="]]..getSystemColour(gmcp.Char.Vitals.sensory_efficacy)..[[">]]..gmcp.Char.Vitals.sensory_efficacy..[[</font>)]]..[[<br>
        ]]..string.rep('&nbsp;', 27)..[[<font color="gray">Mind:</font>&nbsp;<font color="]]..getSystemColour(gmcp.Char.Vitals.mind)..[[">]]..gmcp.Char.Vitals.mind..[[</font>&nbsp;(<font color="]]..getSystemColour(gmcp.Char.Vitals.mind_efficacy)..[[">]]..gmcp.Char.Vitals.mind_efficacy..[[</font>)]]..[[<br>
      </p>
      <p style="font-family:'Consolas'">
        ]]..string.rep('&nbsp;', 4)..[[<font color="gray">Your target is: <font color="turquoise">]]..gmcp.Char.Status.target..(gmcp.IRE and gmcp.IRE.Target and type(gmcp.IRE.Target.Info) == 'table' and gmcp.IRE.Target.Info.hpperc ~= '' and  [[ <font color="gray">HP:</font>&nbsp;<font color="]]..getSystemColour(gmcp.IRE.Target.Info.hpperc:gsub("%%", ""))..[[">]]..gmcp.IRE.Target.Info.hpperc or '')..[[</font>
      </p>
    ]]
    )
   end
  end
  sym.registerevent('mindsim vitals', 'gmcp.Char.Vitals', 'sym.ui.update_mindsim')
  sym.registerevent('mindsim status', 'gmcp.Char.Status', 'sym.ui.update_mindsim')