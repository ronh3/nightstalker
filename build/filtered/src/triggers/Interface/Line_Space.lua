if line == '----------------------------------------' then
  setTriggerStayOpen('Capture_Map_Space', 0)
  deleteLine()
else
  nightstalker.ui.mapper:append('Space')
  nightstalker.ui.mapper.switch('Space')
end