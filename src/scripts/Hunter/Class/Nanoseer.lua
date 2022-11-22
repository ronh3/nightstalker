nightstalker.hunter.class['Nanoseer'] = function(target)
if nightstalker.windupcheck == true then
  nightstalker.hunter.send('nano eyestrike'..target)  
elseif not nightstalker.hunter.flags.embraced and nightstalker.haveskill('Embrace', 'Voidism') and ((gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp) * 100) < 75 then
    nightstalker.hunter.send('void embrace')

--    The below is commented out since I've been told it's more efficient to just spam freeze against pretty much all mobs. Feel free to change this if you like.
--    elseif not nightstalker.hunter.flags.multistrike and nightstalker.haveskill('Multistrike', 'Nanotech') then
--      nightstalker.hunter.send('nano multistrike '..target)

  elseif not nightstalker.hunter.flags.frozen and nightstalker.haveskill('Freeze', 'Voidism') then
    nightstalker.hunter.send('void freeze '..target)
  else
    nightstalker.hunter.send('nano swarm '..target)
  end
end