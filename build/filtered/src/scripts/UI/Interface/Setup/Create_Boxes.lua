function sym.ui.create_boxes()
    local boxcss = CSSMan.new([[
      background-color: rgba(0,0,0,100);
      border-style: solid;
      border-width: 1px;
      border-radius: 10px;
      border-color: rgb(0,40,40);
      margin: 2px;
    ]])
    sym.ui.adj = sym.ui.adj or {}  
    sym.ui.adj.topright = Adjustable.Container:new({name = 'Chat', x = '75%', y = 0, width = '25%', height = '50%', }) 
    sym.ui.adj.bottomright = Adjustable.Container:new({name = 'Room Info', x = '75%', y = '50%', width = '25%', height = '50%',}) 
    sym.ui.adj.topleft = Adjustable.Container:new({name = 'Map', x = '0%', y = '0%', width = '25%', height = '75%', }) 
    sym.ui.adj.bottomleft = Adjustable.Container:new({name = 'Mindsim', x = '0%', y = '75%', width = '25%', height = '25%', fontSize = 12}) 
      
      
  
    sym.ui.topright = Geyser.Label:new({ name = 'sym.ui.topright', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.adj.topright)
    sym.ui.topright:setStyleSheet(boxcss:getCSS())
  
    sym.ui.bottomright = Geyser.Label:new({ name = 'sym.ui.bottomright', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.adj.bottomright)
    sym.ui.bottomright:setStyleSheet(boxcss:getCSS())
  
    sym.ui.topleft = Geyser.Label:new({ name = 'sym.ui.topleft',  x = 0, y = 0, width = '100%', height = '100%',  fontSize = 11 }, sym.ui.adj.topleft)
    sym.ui.topleft:setStyleSheet(boxcss:getCSS())
  
    sym.ui.bottomleft = Geyser.Label:new({ name = 'sym.ui.bottomleft',  x = 0, y = 0, width = '100%', height = '100%',  fontSize = 11 }, sym.ui.adj.bottomleft)
    sym.ui.bottomleft:setStyleSheet(boxcss:getCSS())
  end