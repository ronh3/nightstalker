if hackclear then

    clearUserWindow("mapwinHacking")
    sym.ui.mapper.switch('Hacking')

    hackclear = false

end

selectCurrentLine()
copy()
appendBuffer("mapwinHacking")
deleteLine()