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

sym.ui.info.tabs = sym.ui.info.tabs or {}
sym.ui.info.windows = sym.ui.info.windows or {}

sym.ui.info.switch = function(tab)
  local r = sym.ui.info.config.inactivecolours.r
  local g = sym.ui.info.config.inactivecolours.g
  local b = sym.ui.info.config.inactivecolours.b
  local newr = sym.ui.info.config.activecolours.r
  local newg = sym.ui.info.config.activecolours.g
  local newb = sym.ui.info.config.activecolours.b
  local oldtab = sym.ui.info.currenttab
  if sym.ui.info.currenttab ~= tab then
    sym.ui.info.windows[oldtab]:hide()
    sym.ui.info.tabs[oldtab]:setColor(r, g, b)
    sym.ui.info.tabs[oldtab]:echo(oldtab, sym.ui.info.config.inactivetabtext, 'c')
    sym.ui.info.tabs[oldtab]:setStyleSheet(inactivecss:getCSS())
  end
  sym.ui.info.tabs[tab]:setColor(newr, newg, newb)
  sym.ui.info.tabs[tab]:echo(tab, sym.ui.info.config.activetabtext, 'c')
	sym.ui.info.tabs[tab]:setStyleSheet(activecss:getCSS())
  sym.ui.info.windows[tab]:show()
  sym.ui.info.currenttab = tab
end

function sym.ui.info:resetUI()
  sym.ui.info.container = sym.ui.bottomright
  sym.ui.info.tabbox = Geyser.HBox:new({
    name = 'sym.ui.info.tabbox',
    x = '5%', y = '4%',
    width = '90%', height = '6%'
  }, sym.ui.info.container)
end

function sym.ui.info:create()
  sym.ui.info:resetUI()

  local r = sym.ui.info.config.inactivecolours.r
  local g = sym.ui.info.config.inactivecolours.g
  local b = sym.ui.info.config.inactivecolours.b
  local winr = sym.ui.info.config.windowcolours.r
  local wing = sym.ui.info.config.windowcolours.g
  local winb = sym.ui.info.config.windowcolours.b

  for i, tab in ipairs(sym.ui.info.config.types) do
    sym.ui.info.tabs[tab] = Geyser.Label:new({ name = string.format('infotab%s', tab) }, sym.ui.info.tabbox)
    sym.ui.info.tabs[tab]:echo(tab, sym.ui.info.config.inactivetabtext, 'c')
    sym.ui.info.tabs[tab]:setColor(r, g, b)
    sym.ui.info.tabs[tab]:setClickCallback('sym.ui.info.switch', tab)
    sym.ui.info.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    sym.ui.info.windows[tab] = Geyser.MiniConsole:new({
      name = string.format('infowin%s', tab),
      x = '5%', y = '12%',
      autoWrap = true,
      fontSize = sym.ui.info.config.fontsize,
      width = '90%', height = '85%'
    }, sym.ui.info.container)
    sym.ui.info.windows[tab]:setColor(winr, wing, winb)
    sym.ui.info.windows[tab]:hide()
  end

  sym.ui.info.switch(sym.ui.info.config.types[1])
end