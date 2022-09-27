function sym.ui.info:append(tab)
    local r = sym.ui.info.config.windowcolours.r
    local g = sym.ui.info.config.windowcolours.g
    local b = sym.ui.info.config.windowcolours.b
    selectCurrentLine()
    local ofr, ofg, ofb = getFgColor()
    local obr, obg, obb = getBgColor()
    if sym.ui.info.config.preservebackground then
      setBgColor(r, g, b)
    end
    copy()
    sym.ui.info.windows[tab]:append()
    if sym.ui.info.config.gag then
      deleteLine()
      tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
    end
  end
  
  function sym.ui.info:cecho(tab, message)
    cecho(string.format('infowin%s', tab), message)
  end
  
  function sym.ui.info:decho(tab, message)
    local r = sym.ui.info.config.windowcolours.r
    local g = sym.ui.info.config.windowcolours.g
    local b = sym.ui.info.config.windowcolours.b
  
    if sym.ui.info.config.preservebackground then
      decho(string.format('infowin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message))
    else
      decho(string.format('infowin%s', tab), message)
    end
  end
  
  function sym.ui.info:dechoLink(tab, message, command, hint)
    local r = sym.ui.info.config.windowcolours.r
    local g = sym.ui.info.config.windowcolours.g
    local b = sym.ui.info.config.windowcolours.b
  
    if sym.ui.info.config.preservebackground then
      dechoLink(string.format('infowin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message), command, hint, true)
    else
      dechoLink(string.format('infowin%s', tab), message, command, hint, true)
    end
  end
  
  function sym.ui.info:hecho(tab, message)
    hecho(string.format('infowin%s', tab), message)
  end
  
  function sym.ui.info:echo(tab, message)
    local alltab = sym.ui.info.config.AllTab
    local blink = sym.ui.info.config.Blink
    echo(string.format('infowin%s', tab), message)
    if alltab and tab ~= alltab then
      echo(string.format('infowin%s', alltab), message)
    end
  end