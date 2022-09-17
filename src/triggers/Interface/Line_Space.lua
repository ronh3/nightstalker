if line == '----------------------------------------' then
  setTriggerStayOpen('capture map (space)', 0)
  deleteLine()
else
  sym.ui.mapper:append('Space')
  sym.ui.mapper.switch('Space')
end