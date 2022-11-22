function nightstalker.ui.create_gauges(class)
    nightstalker.ui.footer = Geyser.HBox:new({ name = "nightstalker.ui.footer", x = 0, y = 0, width = "100%", height = "100%", }, nightstalker.ui.bottom)
  
    nightstalker.ui.leftcolumn = Geyser.VBox:new({ name = "nightstalker.ui.leftcolumn", }, nightstalker.ui.footer)
  
    if class == 'Nanoseer' then
      nightstalker.ui.middlecolumn = Geyser.VBox:new({ name = "nightstalker.ui.middlecolumn", }, nightstalker.ui.footer)
    end
  
    nightstalker.ui.rightcolumn = Geyser.VBox:new({ name = "nightstalker.ui.rightcolumn", }, nightstalker.ui.footer)
  
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
      nightstalker.ui[name] = Geyser.Gauge:new({ name = 'nightstalker.ui.'..name }, column)
      nightstalker.ui[name].back:setStyleSheet(backcss:getCSS())
      frontcss:set('background-color', bgc)
      nightstalker.ui[name].front:setStyleSheet(frontcss:getCSS())
      nightstalker.ui[name]:setValue(100,100)
    end
  
    gauge('health', nightstalker.ui.leftcolumn, 'brown')
  
    if class == 'Nanoseer' then
      gauge('nanites', nightstalker.ui.middlecolumn, 'navy')
      gauge('sanity', nightstalker.ui.rightcolumn, 'purple')
    elseif class == 'Engineer' then
      gauge('parts', nightstalker.ui.rightcolumn, 'blue')
    elseif class == 'B.E.A.S.T.' then
      gauge('plasma', nightstalker.ui.rightcolumn, 'firebrick')
    elseif class == 'Scoundrel' then
      gauge('bullets', nightstalker.ui.rightcolumn, 'orange')
    elseif class == 'Fury' then
      gauge('rage', nightstalker.ui.rightcolumn, 'red')
    end
  end