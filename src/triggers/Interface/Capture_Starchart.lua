local fontsize = sym.ui.mapper.config.fontsize - 2

local width, height = calcFontSize(fontsize)
width = width * 81
height = height * 33
-- creating the starchart container
sym.ui.adj.left:show()
schartMini = schartMini or Geyser.MiniConsole:new({name = "starchart",  x=0, y=0,  autoWrap = true,  color = "black", fontSize = fontsize,  width="100%", height="100%",}, sym.ui.adj.left)
clearWindow('starchart')
showWindow('starchart')


function sym.ui.hidestarchart()
sym.ui.adj.left:hide()
end
