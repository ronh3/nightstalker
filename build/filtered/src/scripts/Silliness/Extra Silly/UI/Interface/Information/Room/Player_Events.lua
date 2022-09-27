function sym.ui.gmcproomplayers()
    local list = gmcp.Room.Players
    sym.ui.roomplayers = list
    sym.ui.update_room()
  end
  
  function sym.ui.gmcproomaddplayer()
    local player = gmcp.Room.AddPlayer
    table.insert(sym.ui.roomplayers, player)
    sym.ui.update_room()
  end
  
  function sym.ui.gmcproomremoveplayer()
    local removed = gmcp.Room.RemovePlayer
    for key, player in ipairs(sym.ui.roomplayers) do
      if player.name == removed then
        table.remove(sym.ui.roomplayers, key)
        break
      end
    end
    sym.ui.update_room()
  end
  
  sym.registerevent('room players', 'gmcp.Room.Players', 'sym.ui.gmcproomplayers')
  sym.registerevent('room addplayer', 'gmcp.Room.AddPlayer', 'sym.ui.gmcproomaddplayer')
  sym.registerevent('room removeplayer', 'gmcp.Room.RemovePlayer', 'sym.ui.gmcproomremoveplayer')