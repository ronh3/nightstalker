if line == '----------------------------------------' then
  setTriggerStayOpen('Capture_Map_Space', 0)
  deleteLine()
else
  sym.ui.mapper:append('Space')
  sym.ui.mapper.switch('Space')
end