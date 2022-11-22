function nightstalker.ui.create_boxes()
    local boxcss = CSSMan.new([[
      background-color: rgba(0,0,0,100);
      border-style: solid;
      border-width: 1px;
      border-radius: 10px;
      border-color: rgb(0,40,40);
      margin: 2px;
    ]])
    nightstalker.ui.adj = nightstalker.ui.adj or {}  
    nightstalker.ui.adj.topright = Adjustable.Container:new({name = 'Chat', x = '75%', y = 0, width = '25%', height = '50%', }) 
    nightstalker.ui.adj.bottomright = Adjustable.Container:new({name = 'Room Info', x = '75%', y = '50%', width = '25%', height = '50%',}) 
    nightstalker.ui.adj.topleft = Adjustable.Container:new({name = 'Map', x = '0%', y = '0%', width = '25%', height = '75%', }) 
    nightstalker.ui.adj.bottomleft = Adjustable.Container:new({name = 'Mindsim', x = '0%', y = '75%', width = '25%', height = '25%', fontSize = 12}) 
      
      
  
    nightstalker.ui.topright = Geyser.Label:new({ name = 'nightstalker.ui.topright', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.adj.topright)
    nightstalker.ui.topright:setStyleSheet(boxcss:getCSS())
  
    nightstalker.ui.bottomright = Geyser.Label:new({ name = 'nightstalker.ui.bottomright', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.adj.bottomright)
    nightstalker.ui.bottomright:setStyleSheet(boxcss:getCSS())
  
    nightstalker.ui.topleft = Geyser.Label:new({ name = 'nightstalker.ui.topleft',  x = 0, y = 0, width = '100%', height = '100%',  fontSize = 11 }, nightstalker.ui.adj.topleft)
    nightstalker.ui.topleft:setStyleSheet(boxcss:getCSS())
  
    nightstalker.ui.bottomleft = Geyser.Label:new({ name = 'nightstalker.ui.bottomleft',  x = 0, y = 0, width = '100%', height = '100%',  fontSize = 11 }, nightstalker.ui.adj.bottomleft)
    nightstalker.ui.bottomleft:setStyleSheet(boxcss:getCSS())
  end