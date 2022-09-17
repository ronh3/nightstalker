function sym.ui.update_room()
    clearWindow('infowinRoom')
  
    local r = sym.ui.info.config.windowcolours.r
    local g = sym.ui.info.config.windowcolours.g
    local b = sym.ui.info.config.windowcolours.b
  
    local function colour(col)
      return '<'..table.concat(color_table[col] or col, ',')..'>'
    end
  
    sym.ui.info:decho('Room', string.format('\n%sPlayers', colour('SlateBlue')))
    local c = 0
    for _, player in ipairs(sym.ui.roomplayers) do
      if c % 3 == 0 then sym.ui.info:decho('Room', string.format('\n %s- ', colour('SlateBlue'))) end
      sym.ui.info:decho('Room', string.format('%s%-12s', colour('CornflowerBlue'), player.name))
      c = c + 1
    end
  
    sym.ui.roommobs = {}
  
    local roomItems = {mobs = {}, items = {}, itemIDs = {}}
  
    for _, item in ipairs(sym.ui.roomitems) do
      if item.attrib and item.attrib:find('m', 1, true) then
        sym.ui.roommobs[#sym.ui.roommobs + 1] = item
      else
        roomItems.items[item.name] = roomItems.items[item.name] or {}
        roomItems.items[item.name].count = (roomItems.items[item.name].count or 0) + 1
        roomItems.items[item.name].id = item.id
      end
    end
  
    for filter, func in pairs(sym.ui.roomfilters) do
      sym.ui.roommobs = func(sym.ui.roommobs)
    end
  
    sym.ui.info:decho('Room', string.format('\n\n%sMobs', colour('SlateBlue')))
    for _, entity in pairs(sym.ui.roommobs)  do
      local isTarget = (entity.id == sym.target)
      local noTarget = entity.attrib:find('x', 1, true)
      local ignoring = sym.hunter.ignore[entity.name]
      local exception = sym.hunter.exceptions[entity.name]
      local colours = isTarget and {'maroon', 'MediumVioletRed'} or {'SlateBlue', noTarget and 'CornflowerBlue' or 'LightBlue'}
  
      sym.ui.info:decho('Room', string.format('\n %s-%s %s',
        colour(colours[1]),
        isTarget and '>' or '',
        sym.ui.info.config.displayIDs and string.format('%s%d ', colour(isTarget and 'IndianRed' or 'MediumSlateBlue'), entity.id) or ''
      ))
  
      setFgColor('infowinRoom', unpack(color_table[colours[2]]))
      setBgColor('infowinRoom', r, g, b)
      if ignoring then setStrikeOut('infowinRoom', true) end
      echoPopup('infowinRoom', entity.name, {
        [[send('st ]]..entity.id..[[', false)]],
        [[send('probe ]]..entity.id..[[', false)]],
        [[sym.hunter.setignore(']]..entity.name..[[')]],
        [[sym.hunter.setexception(']]..entity.name..[[')]]
      }, {'target', 'probe', ignoring and 'unignore' or 'ignore', exception and 'remove exception' or 'add exception'}, true)
    end
  
    resetFormat()
  
    sym.ui.info:decho('Room', string.format('\n\n%sItems', colour('SlateBlue')))
    for entity, data in pairs(roomItems.items) do
      sym.ui.info:decho('Room', string.format('\n %s- %s%s%s%s',
        colour('SlateBlue'),
        sym.ui.info.config.displayIDs and string.format('%s%d ', colour('MediumSlateBlue'), data.id) or '',
        colour('CornflowerBlue'), entity,
        data.count > 1 and string.format(' (x%d)', data.count) or ''
      ))
    end
  end