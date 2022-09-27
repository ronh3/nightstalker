function sym.ui.create_modules()
    sym.ui.header = Geyser.HBox:new({ name = 'sym.ui.header', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.top)
  
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
  
    table.foreach(sym.ui.modulelist, function(key, module)
      sym.ui['module'..module] = Geyser.Label:new({ name = 'sym.ui.module.'..module }, sym.ui.header)
      sym.ui['module'..module]:setClickCallback('sym.setmodule', module)
      sym.ui['module'..module]:setStyleSheet(inactivecss:getCSS())
      sym.ui['module'..module]:echo('<center>F'..key..': '..module)
      sym.ui.modulestatus[module] = false
    end)
  
    function sym.setmodule(module, status)
      if type(status) == 'boolean' then
        sym.ui.modulestatus[module] = status
      else
        sym.ui.modulestatus[module] = not sym.ui.modulestatus[module]
      end
      raiseEvent('sym.ui.module', module)
      local css = (sym.ui.modulestatus[module] and activecss or inactivecss):getCSS()
      sym.ui['module'..module]:setStyleSheet(css)
    end
  
    function sym.checkmodule(module)
      return sym.ui.modulestatus[module]
    end
  end