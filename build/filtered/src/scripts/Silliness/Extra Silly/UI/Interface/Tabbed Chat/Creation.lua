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

sym.ui.chat.tabstoblink = sym.ui.chat.tabstoblink or {}
sym.ui.chat.tabs = sym.ui.chat.tabs or {}
sym.ui.chat.windows = sym.ui.chat.windows or {}

sym.ui.chat.switch = function(chat)
  local r = sym.ui.chat.config.inactivecolours.r
  local g = sym.ui.chat.config.inactivecolours.g
  local b = sym.ui.chat.config.inactivecolours.b
  local newr = sym.ui.chat.config.activecolours.r
  local newg = sym.ui.chat.config.activecolours.g
  local newb = sym.ui.chat.config.activecolours.b
  local oldchat = sym.ui.chat.currenttab
  if sym.ui.chat.currenttab ~= chat then
    sym.ui.chat.windows[oldchat]:hide()
    sym.ui.chat.tabs[oldchat]:setColor(r, g, b)
    sym.ui.chat.tabs[oldchat]:echo(oldchat, sym.ui.chat.config.inactivetabtext, 'c')
    sym.ui.chat.tabs[oldchat]:setStyleSheet(inactivecss:getCSS())
    if sym.ui.chat.config.blink and sym.ui.chat.tabstoblink[chat] then
      sym.ui.chat.tabstoblink[chat] = nil
    end
    if sym.ui.chat.config.blink and chat == sym.ui.chat.config.alltab then
      sym.ui.chat.tabstoblink = {}
    end
  end
  sym.ui.chat.tabs[chat]:setColor(newr, newg, newb)
  sym.ui.chat.tabs[chat]:echo(chat, sym.ui.chat.config.activetabtext, 'c')
	sym.ui.chat.tabs[chat]:setStyleSheet(activecss:getCSS())
  sym.ui.chat.windows[chat]:show()
  sym.ui.chat.currenttab = chat
end

function sym.ui.chat:resetUI()
  sym.ui.chat.container = sym.ui.topright
  sym.ui.chat.tabbox = Geyser.HBox:new({
    name = 'sym.ui.chat.tabbox',
    x = '5%', y = '4%',
    width = '90%', height = '6%'
  }, sym.ui.chat.container)
end

function sym.ui.chat:create()
  sym.ui.chat:resetUI()

  local r = sym.ui.chat.config.inactivecolours.r
  local g = sym.ui.chat.config.inactivecolours.g
  local b = sym.ui.chat.config.inactivecolours.b
  local winr = sym.ui.chat.config.windowcolours.r
  local wing = sym.ui.chat.config.windowcolours.g
  local winb = sym.ui.chat.config.windowcolours.b

  for i, tab in ipairs(sym.ui.chat.config.channels) do
    sym.ui.chat.tabs[tab] = Geyser.Label:new({ name = string.format('chattab%s', tab) }, sym.ui.chat.tabbox)
    sym.ui.chat.tabs[tab]:echo(tab, sym.ui.chat.config.inactivetabtext, 'c')
    sym.ui.chat.tabs[tab]:setColor(r, g, b)
    sym.ui.chat.tabs[tab]:setClickCallback('sym.ui.chat.switch', tab)
    sym.ui.chat.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    sym.ui.chat.windows[tab] = Geyser.MiniConsole:new({
      name = string.format('chatwin%s', tab),
      x = '5%', y = '12%',
      autoWrap = true,
      fontSize = sym.ui.chat.config.fontsize,
      width = '90%', height = '85%'
    }, sym.ui.chat.container)
    sym.ui.chat.windows[tab]:setColor(winr, wing, winb)
    sym.ui.chat.windows[tab]:hide()
  end

  sym.ui.chat.switch(sym.ui.chat.config.alltab or sym.ui.chat.config.channels[1])
  if sym.ui.chat.config.blink and not sym.ui.chat.blinktimerOn then
    sym.ui.chat:blink()
  end
end