function nightstalker.ui.gmcpcharitemslist()
    local list = gmcp.Char.Items.List
    if list.location == 'room' then
      nightstalker.ui.roomitems = list.items
      nightstalker.ui.update_room()
    end
  end
  
  function nightstalker.ui.gmcpcharitemsadd()
    local list = gmcp.Char.Items.Add
    if list.location == 'room' then
      table.insert(nightstalker.ui.roomitems, list.item)
      nightstalker.ui.update_room()
    end
  end
  
  function nightstalker.ui.gmcpcharitemsremove()
    local list = gmcp.Char.Items.Remove
    if list.location == 'room' then
      for key, item in ipairs(nightstalker.ui.roomitems) do
        if item.id == list.item.id then
          table.remove(nightstalker.ui.roomitems, key)
          if item.id == nightstalker.target then
            nightstalker.targetindex = 0
          end
          break
        end
      end
      nightstalker.ui.update_room()
      if nightstalker.checkmodule('Hunting') then raiseEvent('room_updated') end
    end
  end
  
  nightstalker.registerevent('items list', 'gmcp.Char.Items.List', 'nightstalker.ui.gmcpcharitemslist')
  nightstalker.registerevent('items add', 'gmcp.Char.Items.Add', 'nightstalker.ui.gmcpcharitemsadd')
  nightstalker.registerevent('items remove', 'gmcp.Char.Items.Remove', 'nightstalker.ui.gmcpcharitemsremove')