function nightstalker.ui.update_room()
    clearWindow('infowinRoom')
  
    local r = nightstalker.ui.info.config.windowcolours.r
    local g = nightstalker.ui.info.config.windowcolours.g
    local b = nightstalker.ui.info.config.windowcolours.b
  
    local function colour(col)
      return '<'..table.concat(color_table[col] or col, ',')..'>'
    end
  
    nightstalker.ui.info:decho('Room', string.format('\n%sPlayers', colour('SlateBlue')))
    local c = 0
    for _, player in ipairs(nightstalker.ui.roomplayers) do
      if c % 3 == 0 then nightstalker.ui.info:decho('Room', string.format('\n %s- ', colour('SlateBlue'))) end
      nightstalker.ui.info:decho('Room', string.format('%s%-12s', colour('CornflowerBlue'), player.name))
      c = c + 1
    end
  
    nightstalker.ui.roommobs = {}
  
    local roomItems = {mobs = {}, items = {}, itemIDs = {}}
  
    for _, item in ipairs(nightstalker.ui.roomitems) do
      if item.attrib and item.attrib:find('m', 1, true) then
        nightstalker.ui.roommobs[#nightstalker.ui.roommobs + 1] = item
      else
        roomItems.items[item.name] = roomItems.items[item.name] or {}
        roomItems.items[item.name].count = (roomItems.items[item.name].count or 0) + 1
        roomItems.items[item.name].id = item.id
      end
    end
  
    for filter, func in pairs(nightstalker.ui.roomfilters) do
      nightstalker.ui.roommobs = func(nightstalker.ui.roommobs)
    end
  
    nightstalker.ui.info:decho('Room', string.format('\n\n%sMobs', colour('SlateBlue')))
    for _, entity in pairs(nightstalker.ui.roommobs)  do
      local isTarget = (entity.id == nightstalker.target)
      local noTarget = entity.attrib:find('x', 1, true)
      local ignoring = nightstalker.hunter.ignore[entity.name]
      local exception = nightstalker.hunter.exceptions[entity.name]
      local colours = isTarget and {'maroon', 'MediumVioletRed'} or {'SlateBlue', noTarget and 'CornflowerBlue' or 'LightBlue'}
  
      nightstalker.ui.info:decho('Room', string.format('\n %s-%s %s',
        colour(colours[1]),
        isTarget and '>' or '',
        nightstalker.ui.info.config.displayIDs and string.format('%s%d ', colour(isTarget and 'IndianRed' or 'MediumSlateBlue'), entity.id) or ''
      ))
  
      setFgColor('infowinRoom', unpack(color_table[colours[2]]))
      setBgColor('infowinRoom', r, g, b)
      if ignoring then setStrikeOut('infowinRoom', true) end
      echoPopup('infowinRoom', entity.name, {
        [[send('st ]]..entity.id..[[', false)]],
        [[send('probe ]]..entity.id..[[', false)]],
        [[nightstalker.hunter.setignore(']]..entity.name..[[')]],
        [[nightstalker.hunter.setexception(']]..entity.name..[[')]]
      }, {'target', 'probe', ignoring and 'unignore' or 'ignore', exception and 'remove exception' or 'add exception'}, true)
    end
  
    resetFormat()
  
    nightstalker.ui.info:decho('Room', string.format('\n\n%sItems', colour('SlateBlue')))
    for entity, data in pairs(roomItems.items) do
      nightstalker.ui.info:decho('Room', string.format('\n %s- %s%s%s%s',
        colour('SlateBlue'),
        nightstalker.ui.info.config.displayIDs and string.format('%s%d ', colour('MediumSlateBlue'), data.id) or '',
        colour('CornflowerBlue'), entity,
        data.count > 1 and string.format(' (x%d)', data.count) or ''
      ))
    end
  end