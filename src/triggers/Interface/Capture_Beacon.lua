local fontsize = sym.ui.mapper.config.fontsize - 2

local width, height = calcFontSize(fontsize)
width = width * 70
height = height * 20
sym.ui.adj.right:show()
beaconMini = beaconMini or Geyser.MiniConsole:new({name = "beacon",  x=0, y=0,  autoWrap = true,  color = "black", fontSize = fontsize,  width="100%", height="100%",}, sym.ui.adj.right)
clearWindow('beacon')
showWindow('beacon')


function sym.ui.hidebeacon()
sym.ui.adj.right:hide()
end