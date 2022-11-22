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

nightstalker.ui.mapper.tabs = nightstalker.ui.mapper.tabs or {}
nightstalker.ui.mapper.windows = nightstalker.ui.mapper.windows or {}

nightstalker.ui.mapper.switch = function(map)
  local r = nightstalker.ui.mapper.config.inactivecolours.r
  local g = nightstalker.ui.mapper.config.inactivecolours.g
  local b = nightstalker.ui.mapper.config.inactivecolours.b
  local newr = nightstalker.ui.mapper.config.activecolours.r
  local newg = nightstalker.ui.mapper.config.activecolours.g
  local newb = nightstalker.ui.mapper.config.activecolours.b
  local oldmap = nightstalker.ui.mapper.currenttab
  if nightstalker.ui.mapper.currenttab ~= map then
    nightstalker.ui.mapper.windows[oldmap]:hide()
    nightstalker.ui.mapper.tabs[oldmap]:setColor(r, g, b)
    nightstalker.ui.mapper.tabs[oldmap]:echo(oldmap, nightstalker.ui.mapper.config.inactivetabtext, 'c')
    nightstalker.ui.mapper.tabs[oldmap]:setStyleSheet(inactivecss:getCSS())
  end
  nightstalker.ui.mapper.tabs[map]:setColor(newr, newg, newb)
  nightstalker.ui.mapper.tabs[map]:echo(map, nightstalker.ui.mapper.config.activetabtext, 'c')
	nightstalker.ui.mapper.tabs[map]:setStyleSheet(activecss:getCSS())
  nightstalker.ui.mapper.windows[map]:show()
  nightstalker.ui.mapper.currenttab = map
end

function nightstalker.ui.mapper:resetUI()
  nightstalker.ui.mapper.container = nightstalker.ui.topleft
  nightstalker.ui.mapper.tabbox = Geyser.HBox:new({
    name = 'nightstalker.ui.mapper.tabbox',
    x = '5%', y = '3%',
    width = '90%', height = '5%'
  }, nightstalker.ui.mapper.container)
end

function nightstalker.ui.mapper:create()
  nightstalker.ui.mapper:resetUI()

  local r = nightstalker.ui.mapper.config.inactivecolours.r
  local g = nightstalker.ui.mapper.config.inactivecolours.g
  local b = nightstalker.ui.mapper.config.inactivecolours.b
  local winr = nightstalker.ui.mapper.config.windowcolours.r
  local wing = nightstalker.ui.mapper.config.windowcolours.g
  local winb = nightstalker.ui.mapper.config.windowcolours.b

  for i, tab in ipairs(nightstalker.ui.mapper.config.maps) do
    nightstalker.ui.mapper.tabs[tab] = Geyser.Label:new({ name = string.format('maptab%s', tab) }, nightstalker.ui.mapper.tabbox)
    nightstalker.ui.mapper.tabs[tab]:echo(tab, nightstalker.ui.mapper.config.inactivetabtext, 'c')
    nightstalker.ui.mapper.tabs[tab]:setColor(r, g, b)
    nightstalker.ui.mapper.tabs[tab]:setClickCallback('nightstalker.ui.mapper.switch', tab)
    nightstalker.ui.mapper.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    if tab == 'Mudlet' then
      nightstalker.ui.mapper.windows[tab] = Geyser.Mapper:new({
        name = string.format('mapwin%s', tab),
        x = '5%', y = '9%',
        width = '90%', height = '89%'
      }, nightstalker.ui.mapper.container)
    else
      nightstalker.ui.mapper.windows[tab] = Geyser.MiniConsole:new({
        name = string.format('mapwin%s', tab),
        x = '5%', y = '9%',
        fontSize = nightstalker.ui.mapper.config.fontsize,
        width = '90%', height = '89%'
      }, nightstalker.ui.mapper.container)
      if not (tab == 'Space') then
        nightstalker.ui.mapper.windows[tab]:setColor(winr, wing, winb)
      else
        nightstalker.ui.mapper.windows[tab]:setColor(0, 0, 0)
      end
    end
    nightstalker.ui.mapper.windows[tab]:hide()
  end

  nightstalker.ui.mapper.switch(nightstalker.ui.mapper.config.maps[1])
end