function nightstalker.ui.info:append(tab)
    local r = nightstalker.ui.info.config.windowcolours.r
    local g = nightstalker.ui.info.config.windowcolours.g
    local b = nightstalker.ui.info.config.windowcolours.b
    selectCurrentLine()
    local ofr, ofg, ofb = getFgColor()
    local obr, obg, obb = getBgColor()
    if nightstalker.ui.info.config.preservebackground then
      setBgColor(r, g, b)
    end
    copy()
    nightstalker.ui.info.windows[tab]:append()
    if nightstalker.ui.info.config.gag then
      deleteLine()
      tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
    end
  end
  
  function nightstalker.ui.info:cecho(tab, message)
    cecho(string.format('infowin%s', tab), message)
  end
  
  function nightstalker.ui.info:decho(tab, message)
    local r = nightstalker.ui.info.config.windowcolours.r
    local g = nightstalker.ui.info.config.windowcolours.g
    local b = nightstalker.ui.info.config.windowcolours.b
  
    if nightstalker.ui.info.config.preservebackground then
      decho(string.format('infowin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message))
    else
      decho(string.format('infowin%s', tab), message)
    end
  end
  
  function nightstalker.ui.info:dechoLink(tab, message, command, hint)
    local r = nightstalker.ui.info.config.windowcolours.r
    local g = nightstalker.ui.info.config.windowcolours.g
    local b = nightstalker.ui.info.config.windowcolours.b
  
    if nightstalker.ui.info.config.preservebackground then
      dechoLink(string.format('infowin%s', tab), string.format('<:%s,%s,%s>%s', r,g,b, message), command, hint, true)
    else
      dechoLink(string.format('infowin%s', tab), message, command, hint, true)
    end
  end
  
  function nightstalker.ui.info:hecho(tab, message)
    hecho(string.format('infowin%s', tab), message)
  end
  
  function nightstalker.ui.info:echo(tab, message)
    local alltab = nightstalker.ui.info.config.AllTab
    local blink = nightstalker.ui.info.config.Blink
    echo(string.format('infowin%s', tab), message)
    if alltab and tab ~= alltab then
      echo(string.format('infowin%s', alltab), message)
    end
  end