if matches[3] ~= "No" and (tonumber(gmcp.Char.Vitals.ship_shield) > 0) then
    send("ship restart "..matches[2])
  end
  if matches[2] == "Engine" then
    engine_bf = matches[3]
  elseif matches[2] == "Shield" then
    shield_bf = matches[3]
  elseif matches[2] == "Capacitor" then
    capacitor_bf = matches[3]
  elseif matches[2] == "Sensor" then
    sensor_bf = matches[3]
  elseif matches[2] == "Shipsim" then
    sim_bf = matches[3]
  else
  end