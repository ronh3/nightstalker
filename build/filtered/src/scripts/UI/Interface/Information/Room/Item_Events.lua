function sym.ui.gmcpcharitemslist()
    local list = gmcp.Char.Items.List
    if list.location == 'room' then
      sym.ui.roomitems = list.items
      sym.ui.update_room()
    end
  end
  
  function sym.ui.gmcpcharitemsadd()
    local list = gmcp.Char.Items.Add
    if list.location == 'room' then
      table.insert(sym.ui.roomitems, list.item)
      sym.ui.update_room()
    end
  end
  
  function sym.ui.gmcpcharitemsremove()
    local list = gmcp.Char.Items.Remove
    if list.location == 'room' then
      for key, item in ipairs(sym.ui.roomitems) do
        if item.id == list.item.id then
          table.remove(sym.ui.roomitems, key)
          if item.id == sym.target then
            sym.targetindex = 0
          end
          break
        end
      end
      sym.ui.update_room()
      if sym.checkmodule('Hunting') then raiseEvent('room_updated') end
    end
  end
  
  sym.registerevent('items list', 'gmcp.Char.Items.List', 'sym.ui.gmcpcharitemslist')
  sym.registerevent('items add', 'gmcp.Char.Items.Add', 'sym.ui.gmcpcharitemsadd')
  sym.registerevent('items remove', 'gmcp.Char.Items.Remove', 'sym.ui.gmcpcharitemsremove')