local fontsize = nightstalker.ui.mapper.config.fontsize - 2

local width, height = calcFontSize(fontsize)
width = width * 70
height = height * 20
nightstalker.ui.adj.right:show()
beaconMini = beaconMini or Geyser.MiniConsole:new({name = "beacon",  x=0, y=0,  autoWrap = true,  color = "black", fontSize = fontsize,  width="100%", height="100%",}, nightstalker.ui.adj.right)
clearWindow('beacon')
showWindow('beacon')


function nightstalker.ui.hidebeacon()
nightstalker.ui.adj.right:hide()
end