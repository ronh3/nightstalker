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

sym.ui.mapper.tabs = sym.ui.mapper.tabs or {}
sym.ui.mapper.windows = sym.ui.mapper.windows or {}

sym.ui.mapper.switch = function(map)
  local r = sym.ui.mapper.config.inactivecolours.r
  local g = sym.ui.mapper.config.inactivecolours.g
  local b = sym.ui.mapper.config.inactivecolours.b
  local newr = sym.ui.mapper.config.activecolours.r
  local newg = sym.ui.mapper.config.activecolours.g
  local newb = sym.ui.mapper.config.activecolours.b
  local oldmap = sym.ui.mapper.currenttab
  if sym.ui.mapper.currenttab ~= map then
    sym.ui.mapper.windows[oldmap]:hide()
    sym.ui.mapper.tabs[oldmap]:setColor(r, g, b)
    sym.ui.mapper.tabs[oldmap]:echo(oldmap, sym.ui.mapper.config.inactivetabtext, 'c')
    sym.ui.mapper.tabs[oldmap]:setStyleSheet(inactivecss:getCSS())
  end
  sym.ui.mapper.tabs[map]:setColor(newr, newg, newb)
  sym.ui.mapper.tabs[map]:echo(map, sym.ui.mapper.config.activetabtext, 'c')
	sym.ui.mapper.tabs[map]:setStyleSheet(activecss:getCSS())
  sym.ui.mapper.windows[map]:show()
  sym.ui.mapper.currenttab = map
end

function sym.ui.mapper:resetUI()
  sym.ui.mapper.container = sym.ui.topleft
  sym.ui.mapper.tabbox = Geyser.HBox:new({
    name = 'sym.ui.mapper.tabbox',
    x = '5%', y = '3%',
    width = '90%', height = '5%'
  }, sym.ui.mapper.container)
end

function sym.ui.mapper:create()
  sym.ui.mapper:resetUI()

  local r = sym.ui.mapper.config.inactivecolours.r
  local g = sym.ui.mapper.config.inactivecolours.g
  local b = sym.ui.mapper.config.inactivecolours.b
  local winr = sym.ui.mapper.config.windowcolours.r
  local wing = sym.ui.mapper.config.windowcolours.g
  local winb = sym.ui.mapper.config.windowcolours.b

  for i, tab in ipairs(sym.ui.mapper.config.maps) do
    sym.ui.mapper.tabs[tab] = Geyser.Label:new({ name = string.format('maptab%s', tab) }, sym.ui.mapper.tabbox)
    sym.ui.mapper.tabs[tab]:echo(tab, sym.ui.mapper.config.inactivetabtext, 'c')
    sym.ui.mapper.tabs[tab]:setColor(r, g, b)
    sym.ui.mapper.tabs[tab]:setClickCallback('sym.ui.mapper.switch', tab)
    sym.ui.mapper.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    if tab == 'Mudlet' then
      sym.ui.mapper.windows[tab] = Geyser.Mapper:new({
        name = string.format('mapwin%s', tab),
        x = '5%', y = '9%',
        width = '90%', height = '89%'
      }, sym.ui.mapper.container)
    else
      sym.ui.mapper.windows[tab] = Geyser.MiniConsole:new({
        name = string.format('mapwin%s', tab),
        x = '5%', y = '9%',
        fontSize = sym.ui.mapper.config.fontsize,
        width = '90%', height = '89%'
      }, sym.ui.mapper.container)
      if not (tab == 'Space') then
        sym.ui.mapper.windows[tab]:setColor(winr, wing, winb)
      else
        sym.ui.mapper.windows[tab]:setColor(0, 0, 0)
      end
    end
    sym.ui.mapper.windows[tab]:hide()
  end

  sym.ui.mapper.switch(sym.ui.mapper.config.maps[1])
end