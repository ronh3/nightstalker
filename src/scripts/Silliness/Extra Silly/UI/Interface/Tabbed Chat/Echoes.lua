function sym.ui.chat:append(chat)
  local r = sym.ui.chat.config.windowcolours.r
  local g = sym.ui.chat.config.windowcolours.g
  local b = sym.ui.chat.config.windowcolours.b
  selectCurrentLine()
  local ofr, ofg, ofb = getFgColor()
  local obr, obg, obb = getBgColor()
  if sym.ui.chat.config.preservebackground then
    setBgColor(r, g, b)
  end
  copy()
  if sym.ui.chat.config.timestamp then
    local timestamp = getTime(true, sym.ui.chat.config.timestamp)
    local tsfg = {}
    local tsbg = {}
    local colourLeader = ''
    if sym.ui.chat.config.timestampcustomcolour then
      if type(sym.ui.chat.config.timestampfg) == 'string' then
        tsfg = color_table[sym.ui.chat.config.timestampfg]
      else
        tsfg = sym.ui.chat.config.timestampfg
      end
      if type(sym.ui.chat.config.timestampbg) == 'string' then
        tsbg = color_table[sym.ui.chat.config.timestampbg]
      else
        tsbg = sym.ui.chat.config.timestampbg
      end
      colourLeader = string.format('<%s,%s,%s:%s,%s,%s>', tsfg[1], tsfg[2], tsfg[3], tsbg[1], tsbg[2], tsbg[3])
    else
      colourLeader = string.format('<%s,%s,%s:%s,%s,%s>', ofr, ofg, ofb, obr, obg, obb)
    end
    local fullstamp = string.format('%s%s', colourLeader, timestamp)
    sym.ui.chat.windows[chat]:decho(fullstamp)
    sym.ui.chat.windows[chat]:echo(' ')
    if sym.ui.chat.config.alltab then
      sym.ui.chat.windows[sym.ui.chat.config.alltab]:decho(fullstamp)
      sym.ui.chat.windows[sym.ui.chat.config.alltab]:echo(' ')
    end
  end
  sym.ui.chat.windows[chat]:append()
  if sym.ui.chat.config.gag then
    deleteLine()
    tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
  end
  if sym.ui.chat.config.alltab then
    appendBuffer(string.format('chatwin%s', sym.ui.chat.config.alltab))
  end
  if sym.ui.chat.config.blink and chat ~= sym.ui.chat.currenttab then
    if (sym.ui.chat.config.alltab == sym.ui.chat.currenttab) and not sym.ui.chat.config.blinkonall then
      return
    else
      sym.ui.chat.tabstoblink[chat] = true
    end
  end
end

function sym.ui.chat:blink()
  if sym.ui.chat.blinkID then killTimer(sym.ui.chat.blinkID) end
  if not sym.ui.chat.config.blink then
    sym.ui.chat.blinktimerOn = false
    return
  end
  if not sym.ui.chat.container.hidden then
    for tab, _ in pairs(sym.ui.chat.tabstoblink) do
      sym.ui.chat.tabs[tab]:flash()
    end
  end
  sym.ui.chat.blinkID = tempTimer(sym.ui.chat.config.blinktime, function() sym.ui.chat:blink() end)
end


function sym.ui.chat:cecho(chat, message)
  local alltab = sym.ui.chat.config.alltab
  local blink = sym.ui.chat.config.blink
  cecho(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    cecho(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= sym.ui.chat.currenttab then
    if (alltab == sym.ui.chat.currenttab) and not sym.ui.chat.config.blinkonall then
      return
    else
      sym.ui.chat.tabstoblink[chat] = true
    end
  end
end

function sym.ui.chat:decho(chat, message)
  local alltab = sym.ui.chat.config.alltab
  local blink = sym.ui.chat.config.blink
  decho(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    decho(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= sym.ui.chat.currenttab then
    if (alltab == sym.ui.chat.currenttab) and not sym.ui.chat.config.blinkonall then
      return
    else
      sym.ui.chat.tabstoblink[chat] = true
    end
  end
end

function sym.ui.chat:hecho(chat, message)
  local alltab = sym.ui.chat.config.alltab
  local blink = sym.ui.chat.config.blink
  hecho(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    hecho(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= sym.ui.chat.currenttab then
    if (alltab == sym.ui.chat.currenttab) and not sym.ui.chat.config.blinkonall then
      return
    else
      sym.ui.chat.tabstoblink[chat] = true
    end
  end
end

function sym.ui.chat:echo(chat, message)
  local alltab = sym.ui.chat.config.alltab
  local blink = sym.ui.chat.config.blink
  echo(string.format('chatwin%s', chat), message)
  if alltab and chat ~= alltab then
    echo(string.format('chatwin%s', alltab), message)
  end
  if blink and chat ~= sym.ui.chat.currenttab then
    if (alltab == sym.ui.chat.currenttab) and not sym.ui.chat.config.blinkonall then
      return
    else
      sym.ui.chat.tabstoblink[chat] = true
    end
  end
end