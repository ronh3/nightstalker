function sym.ui.mapper:append(map)
    local r = sym.ui.mapper.config.windowcolours.r
    local g = sym.ui.mapper.config.windowcolours.g
    local b = sym.ui.mapper.config.windowcolours.b
    selectCurrentLine()
    local ofr, ofg, ofb = getFgColor()
    local obr, obg, obb = getBgColor()
    if sym.ui.mapper.config.preservebackground and not (map == 'Space') then
      setBgColor(r, g, b)
    end
    copy()
    sym.ui.mapper.windows[map]:append()
    if sym.ui.mapper.config.gag then
      deleteLine()
      tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
    end
  end
  
  function sym.ui.mapper:decho(tab, message)
    local r = sym.ui.mapper.config.windowcolours.r
    local g = sym.ui.mapper.config.windowcolours.g
    local b = sym.ui.mapper.config.windowcolours.b
  
    if sym.ui.mapper.config.preservebackground and not (tab == 'Space') then
      decho(string.format('mapwin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message))
    else
      decho(string.format('mapwin%s', tab), message)
    end
  end