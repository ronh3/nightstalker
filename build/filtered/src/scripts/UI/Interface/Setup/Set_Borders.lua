function sym.ui.set_borders()
    local w, h = getMainWindowSize()
  
    sym.ui.border_left = w / 4
    sym.ui.border_top = h / 19
    sym.ui.border_bottom = h / 19
    sym.ui.border_right = w / 4
  
    setBorderLeft(sym.ui.border_left)
    setBorderTop(sym.ui.border_top)
    setBorderBottom(sym.ui.border_bottom)
    setBorderRight(sym.ui.border_right)
  end