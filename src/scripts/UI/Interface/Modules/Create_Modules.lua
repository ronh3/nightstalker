function nightstalker.ui.create_modules()
    nightstalker.ui.header = Geyser.HBox:new({ name = 'nightstalker.ui.header', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.top)
  
    local activecss = CSSMan.new([[
      background-color: rgba(0,0,0,100);
      border-style: solid;
      border-width: 1px;
      border-color: rgb(0,80,40);
      border-radius: 5px;
      margin: 5px;
      qproperty-wordWrap: true;
    ]])
  
    local inactivecss = CSSMan.new([[
      background-color: rgba(0,0,0,100);
      border-style: solid;
      border-width: 1px;
      border-color: rgb(0,40,40);
      border-radius: 5px;
      margin: 5px;
      qproperty-wordWrap: true;
    ]])
  
    table.foreach(nightstalker.ui.modulelist, function(key, module)
      nightstalker.ui['module'..module] = Geyser.Label:new({ name = 'nightstalker.ui.module.'..module }, nightstalker.ui.header)
      nightstalker.ui['module'..module]:setClickCallback('nightstalker.setmodule', module)
      nightstalker.ui['module'..module]:setStyleSheet(inactivecss:getCSS())
      nightstalker.ui['module'..module]:echo('<center>F'..key..': '..module)
      nightstalker.ui.modulestatus[module] = false
    end)
  
    function nightstalker.setmodule(module, status)
      if type(status) == 'boolean' then
        nightstalker.ui.modulestatus[module] = status
      else
        nightstalker.ui.modulestatus[module] = not nightstalker.ui.modulestatus[module]
      end
      raiseEvent('nightstalker.ui.module', module)
      local css = (nightstalker.ui.modulestatus[module] and activecss or inactivecss):getCSS()
      nightstalker.ui['module'..module]:setStyleSheet(css)
    end
  
    function nightstalker.checkmodule(module)
      return nightstalker.ui.modulestatus[module]
    end
  end