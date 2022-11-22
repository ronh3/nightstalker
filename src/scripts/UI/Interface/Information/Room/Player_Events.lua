function nightstalker.ui.gmcproomplayers()
    local list = gmcp.Room.Players
    nightstalker.ui.roomplayers = list
    nightstalker.ui.update_room()
  end
  
  function nightstalker.ui.gmcproomaddplayer()
    local player = gmcp.Room.AddPlayer
    table.insert(nightstalker.ui.roomplayers, player)
    nightstalker.ui.update_room()
  end
  
  function nightstalker.ui.gmcproomremoveplayer()
    local removed = gmcp.Room.RemovePlayer
    for key, player in ipairs(nightstalker.ui.roomplayers) do
      if player.name == removed then
        table.remove(nightstalker.ui.roomplayers, key)
        break
      end
    end
    nightstalker.ui.update_room()
  end
  
  nightstalker.registerevent('room players', 'gmcp.Room.Players', 'nightstalker.ui.gmcproomplayers')
  nightstalker.registerevent('room addplayer', 'gmcp.Room.AddPlayer', 'nightstalker.ui.gmcproomaddplayer')
  nightstalker.registerevent('room removeplayer', 'gmcp.Room.RemovePlayer', 'nightstalker.ui.gmcproomremoveplayer')