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

nightstalker.ui.info.tabs = nightstalker.ui.info.tabs or {}
nightstalker.ui.info.windows = nightstalker.ui.info.windows or {}

nightstalker.ui.info.switch = function(tab)
  local r = nightstalker.ui.info.config.inactivecolours.r
  local g = nightstalker.ui.info.config.inactivecolours.g
  local b = nightstalker.ui.info.config.inactivecolours.b
  local newr = nightstalker.ui.info.config.activecolours.r
  local newg = nightstalker.ui.info.config.activecolours.g
  local newb = nightstalker.ui.info.config.activecolours.b
  local oldtab = nightstalker.ui.info.currenttab
  if nightstalker.ui.info.currenttab ~= tab then
    nightstalker.ui.info.windows[oldtab]:hide()
    nightstalker.ui.info.tabs[oldtab]:setColor(r, g, b)
    nightstalker.ui.info.tabs[oldtab]:echo(oldtab, nightstalker.ui.info.config.inactivetabtext, 'c')
    nightstalker.ui.info.tabs[oldtab]:setStyleSheet(inactivecss:getCSS())
  end
  nightstalker.ui.info.tabs[tab]:setColor(newr, newg, newb)
  nightstalker.ui.info.tabs[tab]:echo(tab, nightstalker.ui.info.config.activetabtext, 'c')
	nightstalker.ui.info.tabs[tab]:setStyleSheet(activecss:getCSS())
  nightstalker.ui.info.windows[tab]:show()
  nightstalker.ui.info.currenttab = tab
end

function nightstalker.ui.info:resetUI()
  nightstalker.ui.info.container = nightstalker.ui.bottomright
  nightstalker.ui.info.tabbox = Geyser.HBox:new({
    name = 'nightstalker.ui.info.tabbox',
    x = '5%', y = '4%',
    width = '90%', height = '6%'
  }, nightstalker.ui.info.container)
end

function nightstalker.ui.info:create()
  nightstalker.ui.info:resetUI()

  local r = nightstalker.ui.info.config.inactivecolours.r
  local g = nightstalker.ui.info.config.inactivecolours.g
  local b = nightstalker.ui.info.config.inactivecolours.b
  local winr = nightstalker.ui.info.config.windowcolours.r
  local wing = nightstalker.ui.info.config.windowcolours.g
  local winb = nightstalker.ui.info.config.windowcolours.b

  for i, tab in ipairs(nightstalker.ui.info.config.types) do
    nightstalker.ui.info.tabs[tab] = Geyser.Label:new({ name = string.format('infotab%s', tab) }, nightstalker.ui.info.tabbox)
    nightstalker.ui.info.tabs[tab]:echo(tab, nightstalker.ui.info.config.inactivetabtext, 'c')
    nightstalker.ui.info.tabs[tab]:setColor(r, g, b)
    nightstalker.ui.info.tabs[tab]:setClickCallback('nightstalker.ui.info.switch', tab)
    nightstalker.ui.info.tabs[tab]:setStyleSheet(inactivecss:getCSS())
    nightstalker.ui.info.windows[tab] = Geyser.MiniConsole:new({
      name = string.format('infowin%s', tab),
      x = '5%', y = '12%',
      autoWrap = true,
      fontSize = nightstalker.ui.info.config.fontsize,
      width = '90%', height = '85%'
    }, nightstalker.ui.info.container)
    nightstalker.ui.info.windows[tab]:setColor(winr, wing, winb)
    nightstalker.ui.info.windows[tab]:hide()
  end

  nightstalker.ui.info.switch(nightstalker.ui.info.config.types[1])
end