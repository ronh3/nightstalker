function nightstalker.ui.chat:append(chat)
  local r = nightstalker.ui.chat.config.windowcolours.r
  local g = nightstalker.ui.chat.config.windowcolours.g
  local b = nightstalker.ui.chat.config.windowcolours.b
  selectCurrentLine()
  local ofr, ofg, ofb = getFgColor()
  local obr, obg, obb = getBgColor()
  if nightstalker.ui.chat.config.preservebackground then
    setBgColor(r, g, b)
  end
  copy()
  if nightstalker.ui.chat.config.timestamp then
    local timestamp = getTime(true, nightstalker.ui.chat.config.timestamp)
    local tsfg = {}
    local tsbg = {}
    local colourLeader = ''
    if nightstalker.ui.chat.config.timestampcustomcolour then
      if type(nightstalker.ui.chat.config.timestampfg) == 'string' then
        tsfg = color_table[nightstalker.ui.chat.config.timestampfg]
      else
        tsfg = nightstalker.ui.chat.config.timestampfg
      end
      if type(nightstalker.ui.chat.config.timestampbg) == 'string' then
        tsbg = color_table[nightstalker.ui.chat.config.timestampbg]
      else
        tsbg = nightstalker.ui.chat.config.timestampbg
      end
      colourLeader = string.format('<%s,%s,%s:%s,%s,%s>', tsfg[1], tsfg[2], tsfg[3], tsbg[1], tsbg[2], tsbg[3])
    else
      colourLeader = string.format('<%s,%s,%s:%s,%s,%s>', ofr, ofg, ofb, obr, obg, obb)
    end
    local fullstamp = string.format('%s%s', colourLeader, timestamp)
    nightstalker.ui.chat.windows[chat]:decho(fullstamp)
    nightstalker.ui.chat.windows[chat]:echo(' ')
    if nightstalker.ui.chat.config.alltab then
      nightstalker.ui.chat.windows[nightstalker.ui.chat.config.alltab]:decho(fullstamp)
      nightstalker.ui.chat.windows[nightstalker.ui.chat.config.alltab]:echo(' ')
    end
  end
  nightstalker.ui.chat.windows[chat]:append()
  if nightstalker.ui.chat.config.gag then
    deleteLine()
    tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
  end
  if nightstalker.ui.chat.config.alltab then
    appendBuffer(string.format('chatwin%s', nightstalker.ui.chat.config.alltab))
  end
  if nightstalker.ui.chat.config.blink and chat ~= nightstalker.ui.chat.currenttab then
    if (nightstalker.ui.chat.config.alltab == nightstalker.ui.chat.currenttab) and not nightstalker.ui.chat.config.blinkonall then
      return
    else
      nightstalker.ui.chat.tabstoblink[chat] = true
    end
  end
end

function nightstalker.ui.chat:blink()
  if nightstalker.ui.chat.blinkID then killTimer(nightstalker.ui.chat.blinkID) end
  if not nightstalker.ui.chat.config.blink then
    nightstalker.ui.chat.blinktimerOn = false
    return
  end
  if not nightstalker.ui.chat.container.hidden then
    for tab, _ in pairs(nightstalker.ui.chat.tabstoblink) do
      nightstalker.ui.chat.tabs[tab]:flash()
    end
  end
  nightstalker.ui.chat.blinkID = tempTimer(nightstalker.ui.chat.config.blinktime, function() nightstalker.ui.chat:blink() end)
end


function nightstalker.ui.chat:cecho(chat, message)
  local alltab = nightstalker.ui.chat.config.alltab
  local blink = nightstalker.ui.chat.config.blink
  cecho(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    cecho(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= nightstalker.ui.chat.currenttab then
    if (alltab == nightstalker.ui.chat.currenttab) and not nightstalker.ui.chat.config.blinkonall then
      return
    else
      nightstalker.ui.chat.tabstoblink[chat] = true
    end
  end
end

function nightstalker.ui.chat:decho(chat, message)
  local alltab = nightstalker.ui.chat.config.alltab
  local blink = nightstalker.ui.chat.config.blink
  decho(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    decho(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= nightstalker.ui.chat.currenttab then
    if (alltab == nightstalker.ui.chat.currenttab) and not nightstalker.ui.chat.config.blinkonall then
      return
    else
      nightstalker.ui.chat.tabstoblink[chat] = true
    end
  end
end

function nightstalker.ui.chat:hecho(chat, message)
  local alltab = nightstalker.ui.chat.config.alltab
  local blink = nightstalker.ui.chat.config.blink
  hecho(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    hecho(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= nightstalker.ui.chat.currenttab then
    if (alltab == nightstalker.ui.chat.currenttab) and not nightstalker.ui.chat.config.blinkonall then
      return
    else
      nightstalker.ui.chat.tabstoblink[chat] = true
    end
  end
end

function nightstalker.ui.chat:echo(chat, message)
  local alltab = nightstalker.ui.chat.config.alltab
  local blink = nightstalker.ui.chat.config.blink
  echo(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    echo(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= nightstalker.ui.chat.currenttab then
    if (alltab == nightstalker.ui.chat.currenttab) and not nightstalker.ui.chat.config.blinkonall then
      return
    else
      nightstalker.ui.chat.tabstoblink[chat] = true
    end
  end
end