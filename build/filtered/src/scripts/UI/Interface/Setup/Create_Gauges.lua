function sym.ui.create_gauges(class)
    sym.ui.footer = Geyser.HBox:new({ name = "sym.ui.footer", x = 0, y = 0, width = "100%", height = "100%", }, sym.ui.bottom)
  
    sym.ui.leftcolumn = Geyser.VBox:new({ name = "sym.ui.leftcolumn", }, sym.ui.footer)
  
    if class == 'Nanoseer' then
      sym.ui.middlecolumn = Geyser.VBox:new({ name = "sym.ui.middlecolumn", }, sym.ui.footer)
    end
  
    sym.ui.rightcolumn = Geyser.VBox:new({ name = "sym.ui.rightcolumn", }, sym.ui.footer)
  
    local backcss = CSSMan.new([[
      background-color: rgba(0,0,0,0);
      border-style: solid;
      border-color: grey;
      border-width: 1px;
      border-radius: 5px;
      margin: 5px;
    ]])
  
    local frontcss = CSSMan.new([[
      background-color: rgba(0,0,0,0);
      border-style: solid;
      border-color: grey;
      border-width: 1px;
      border-radius: 5px;
      margin: 5px;
    ]])
  
    local function gauge(name, column, bgc)
      sym.ui[name] = Geyser.Gauge:new({ name = 'sym.ui.'..name }, column)
      sym.ui[name].back:setStyleSheet(backcss:getCSS())
      frontcss:set('background-color', bgc)
      sym.ui[name].front:setStyleSheet(frontcss:getCSS())
      sym.ui[name]:setValue(100,100)
    end
  
    gauge('health', sym.ui.leftcolumn, 'brown')
  
    if class == 'Nanoseer' then
      gauge('nanites', sym.ui.middlecolumn, 'navy')
      gauge('sanity', sym.ui.rightcolumn, 'purple')
    elseif class == 'Engineer' then
      gauge('parts', sym.ui.rightcolumn, 'blue')
    elseif class == 'B.E.A.S.T.' then
      gauge('plasma', sym.ui.rightcolumn, 'firebrick')
    elseif class == 'Scoundrel' then
      gauge('bullets', sym.ui.rightcolumn, 'orange')
    elseif class == 'Fury' then
      gauge('rage', sym.ui.rightcolumn, 'red')
    end
  end