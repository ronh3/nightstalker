function sym.ui.loadthisbitch(event, package)
    if event == 'sysInstall' then
      return
    end
    if sym.loadtimer then
      killTimer(sym.loadtimer)
    end
    sym.loadtimer =
      tempTimer(
        0,
        function()
          sym.ui.update_stylesheet()
          sym.ui.set_borders()
          sym.ui.create_background()
          sym.ui.create_boxes()
          sym.ui.create_modules()
          sym.ui.adj.top:show()
          sym.ui.adj.bottom:show()
          sym.ui.adj.topright:show()
          sym.ui.adj.bottomright:show()
          sym.ui.adj.topleft:show()
          sym.ui.adj.bottomleft:show()
          OnShip = false
          capacitor_bf = "No"
          engine_bf = "No"
          sensor_bf = "No"
          shield_bf = "No"
          sim_bf = "No"
          if sym.ui.chat.use then
            sym.ui.chat:create()
          end
          if sym.ui.mapper.use then
            sym.ui.mapper:create()
          end
          if sym.ui.info.use then
            sym.ui.info:create()
          end
          raiseEvent('sym.ui.loaded')
        end
      )
  end
  
  sym.registerevent('ui installed', 'sysInstall', 'sym.ui.loadthisbitch', 'sysLuaInstallModule')
  sym.registerevent('ui loaded', 'sysLoadEvent', 'sym.ui.loadthisbitch', 'sysLuaInstallModule')