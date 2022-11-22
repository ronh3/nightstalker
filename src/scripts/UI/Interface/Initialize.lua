function nightstalker.ui.loadthisbitch(event, package)
    if event == 'sysInstall' then
      return
    end
    if nightstalker.loadtimer then
      killTimer(nightstalker.loadtimer)
    end
    nightstalker.loadtimer =
      tempTimer(
        0,
        function()
          nightstalker.ui.update_stylesheet()
          nightstalker.ui.set_borders()
          nightstalker.ui.create_background()
          nightstalker.ui.create_boxes()
          nightstalker.ui.create_modules()
          nightstalker.ui.adj.top:show()
          nightstalker.ui.adj.bottom:show()
          nightstalker.ui.adj.topright:show()
          nightstalker.ui.adj.bottomright:show()
          nightstalker.ui.adj.topleft:show()
          nightstalker.ui.adj.bottomleft:show()
          OnShip = false
          capacitor_bf = "No"
          engine_bf = "No"
          sensor_bf = "No"
          shield_bf = "No"
          sim_bf = "No"
          if nightstalker.ui.chat.use then
            nightstalker.ui.chat:create()
          end
          if nightstalker.ui.mapper.use then
            nightstalker.ui.mapper:create()
          end
          if nightstalker.ui.info.use then
            nightstalker.ui.info:create()
          end
          raiseEvent('nightstalker.ui.loaded')
        end
      )
  end
  
  nightstalker.registerevent('ui installed', 'sysInstall', 'nightstalker.ui.loadthisbitch', 'sysLuaInstallModule')
  nightstalker.registerevent('ui loaded', 'sysLoadEvent', 'nightstalker.ui.loadthisbitch', 'sysLuaInstallModule')