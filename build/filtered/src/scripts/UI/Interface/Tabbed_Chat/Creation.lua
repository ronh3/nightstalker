local activecss = CSSMan.new([[
  border-radius: 3px;
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 50, 50, 100);
  margin: 1px;
]])

local inactivecss = CSSMan.new([[
  border-radius: 3px;
  border-style: solid;
  border-width: 1px;
  border-color: rgba(0, 30, 30, 100);
  margin: 1px;
]])

nightstalker.ui.chat.tabstoblink = nightstalker.ui.chat.tabstoblink or {}
nightstalker.ui.chat.tabs = nightstalker.ui.chat.tabs or {}
nightstalker.ui.chat.windows = nightstalker.ui.chat.windows or {}

nightstalker.ui.chat.switch = function(chat)
  local r = nightstalker.ui.chat.config.inactivecolours.r
  local g = nightstalker.ui.chat.config.inactivecolours.g
  local b = nightstalker.ui.chat.config.inactivecolours.b
  local newr = nightstalker.ui.chat.config.activecolours.r
  local newg = nightstalker.ui.chat.config.activecolours.g
  local newb = nightstalker.ui.chat.config.activecolours.b
  local oldchat = nightstalker.ui.chat.currenttab
  if nightstalker.ui.chat.currenttab ~= chat then
    nightstalker.ui.chat.windows[oldchat]:hide()
    nightstalker.ui.chat.tabs[oldchat]:setColor(r, g, b)
    nightstalker.ui.chat.tabs[oldchat]:echo(oldchat, nightstalker.ui.chat.config.inactivetabtext, 'c')
    nightstalker.ui.chat.tabs[oldchat]:setStyleSheet(inactivecss:getCSS())
    if nightstalker.ui.chat.config.blink and nightstalker.ui.chat.tabstoblink[chat] then
      nightstalker.ui.chat.tabstoblink[chat] = nil
    end
    if nightstalker.ui.chat.config.blink and chat == nightstalker.ui.chat.config.alltab then
      nightstalker.ui.chat.tabstoblink = {}
    end
  end
  nightstalker.ui.chat.tabs[chat]:setColor(newr, newg, newb)
  nightstalker.ui.chat.tabs[chat]:echo(chat, nightstalker.ui.chat.config.activetabtext, 'c')
	nightstalker.ui.chat.tabs[chat]:setStyleSheet(activecss:getCSS())
  nightstalker.ui.chat.windows[chat]:show()
  nightstalker.ui.chat.currenttab = chat
end

function nightstalker.ui.chat:resetUI()
  nightstalker.ui.chat.container = nightstalker.ui.topright
  nightstalker.ui.chat.tabbox = Geyser.HBox:new({
    name = 'nightstalker.ui.chat.tabbox',
    x = '5%', y = '4%',
    width = '90%', height = '6%'
  }, nightstalker.ui.chat.container)
end

function nightstalker.ui.chat:create()
  nightstalker.ui.chat:resetUI()

  local r = nightstalker.ui.chat.config.inactivecolours.r
  local g = nightstalker.ui.chat.config.inactivecolours.g
  local b = nightstalker.ui.chat.config.inactivecolours.b
  local winr = nightstalker.ui.chat.config.windowcolours.r
  local wing = nightstalker.ui.chat.config.windowcolours.g
  local winb = nightstalker.ui.chat.config.windowcolours.b

  for i, tab in ipairs(nightstalker.ui.chat.config.channels) do
    nightstalker.ui.chat.tabs[tab] = Geyser.Label:new({ name = string.format('chattab%s', tab) }, nightstalker.ui.chat.tabbox)
    nightstalker.ui.chat.tabs[tab]:echo(tab, nightstalker.ui.chat.config.inactivetabtext, 'c')
    nightstalker.ui.chat.tabs[tab]:setColor(r, g, b)
    nightstalker.ui.chat.tabs[tab]:setClickCallback('nightstalker.ui.chat.switch', tab)
    nightstalker.ui.chat.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    nightstalker.ui.chat.windows[tab] = Geyser.MiniConsole:new({
      name = string.format('chatwin%s', tab),
      x = '5%', y = '12%',
      autoWrap = true,
      fontSize = nightstalker.ui.chat.config.fontsize,
      width = '90%', height = '85%'
    }, nightstalker.ui.chat.container)
    nightstalker.ui.chat.windows[tab]:setColor(winr, wing, winb)
    nightstalker.ui.chat.windows[tab]:hide()
  end

  nightstalker.ui.chat.switch(nightstalker.ui.chat.config.alltab or nightstalker.ui.chat.config.channels[1])
  if nightstalker.ui.chat.config.blink and not nightstalker.ui.chat.blinktimerOn then
    nightstalker.ui.chat:blink()
  end
end