function nightstalker.ui.set_borders()
    local w, h = getMainWindowSize()
  
    nightstalker.ui.border_left = w / 4
    nightstalker.ui.border_top = h / 19
    nightstalker.ui.border_bottom = h / 19
    nightstalker.ui.border_right = w / 4
  
    setBorderLeft(nightstalker.ui.border_left)
    setBorderTop(nightstalker.ui.border_top)
    setBorderBottom(nightstalker.ui.border_bottom)
    setBorderRight(nightstalker.ui.border_right)
  end