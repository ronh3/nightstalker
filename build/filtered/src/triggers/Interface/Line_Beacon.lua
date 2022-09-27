if line == "Balance used: 2.00s." then
    deleteLine()
  else
    selectCurrentLine()
    copy()
    appendBuffer('beacon')
    deleteLine()
end