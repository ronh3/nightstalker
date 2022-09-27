function sym.ui.create_background()
    local backgroundcss = CSSMan.new([[ background-color: rgb(0,20,20); ]])
    sym.ui.adj = sym.ui.adj or {} 
    sym.ui.adj.top = Adjustable.Container:new({name = 'Module', x = '25%', y = 0, width = '50%', height = '5%', }) 
    sym.ui.adj.bottom = Adjustable.Container:new({name = 'Gauges', x = '25%', y = '95%', width = '50%', height = '5%', }) 
    sym.ui.adj.left = Adjustable.Container:new({name = 'Starchart', x = '25%', y = '5%', width = '15%', height = '25%', }) 
    sym.ui.adj.right = Adjustable.Container:new({name = 'Beacon', x = '40%', y = '5%', width = '15%', height = '25%', }) 
  
    sym.ui.left = Geyser.Label:new({ name = 'sym.ui.left', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.adj.left)
    sym.ui.left:setStyleSheet(backgroundcss:getCSS())
  
    sym.ui.right = Geyser.Label:new({ name = 'sym.ui.right', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.adj.right)
    sym.ui.right:setStyleSheet(backgroundcss:getCSS())
  
    sym.ui.top = Geyser.Label:new({ name = 'sym.ui.top', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.adj.top)
    sym.ui.top:setStyleSheet(backgroundcss:getCSS())
  
    sym.ui.bottom = Geyser.Label:new({ name = 'sym.ui.bottom', x = 0, y = 0, width = '100%', height = '100%', }, sym.ui.adj.bottom)
    sym.ui.bottom:setStyleSheet(backgroundcss:getCSS())
  end