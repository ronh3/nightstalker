function nightstalker.ui.create_background()
    local backgroundcss = CSSMan.new([[ background-color: rgb(0,20,20); ]])
    nightstalker.ui.adj = nightstalker.ui.adj or {} 
    nightstalker.ui.adj.top = Adjustable.Container:new({name = 'Module', x = '25%', y = 0, width = '50%', height = '5%', }) 
    nightstalker.ui.adj.bottom = Adjustable.Container:new({name = 'Gauges', x = '25%', y = '95%', width = '50%', height = '5%', }) 
    nightstalker.ui.adj.left = Adjustable.Container:new({name = 'Starchart', x = '25%', y = '5%', width = '15%', height = '25%', }) 
    nightstalker.ui.adj.right = Adjustable.Container:new({name = 'Beacon', x = '40%', y = '5%', width = '15%', height = '25%', }) 
  
    nightstalker.ui.left = Geyser.Label:new({ name = 'nightstalker.ui.left', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.adj.left)
    nightstalker.ui.left:setStyleSheet(backgroundcss:getCSS())
  
    nightstalker.ui.right = Geyser.Label:new({ name = 'nightstalker.ui.right', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.adj.right)
    nightstalker.ui.right:setStyleSheet(backgroundcss:getCSS())
  
    nightstalker.ui.top = Geyser.Label:new({ name = 'nightstalker.ui.top', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.adj.top)
    nightstalker.ui.top:setStyleSheet(backgroundcss:getCSS())
  
    nightstalker.ui.bottom = Geyser.Label:new({ name = 'nightstalker.ui.bottom', x = 0, y = 0, width = '100%', height = '100%', }, nightstalker.ui.adj.bottom)
    nightstalker.ui.bottom:setStyleSheet(backgroundcss:getCSS())
  end