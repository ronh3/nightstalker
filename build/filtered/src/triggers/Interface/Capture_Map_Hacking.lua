if hackclear then

    clearUserWindow("mapwinHacking")
    nightstalker.ui.mapper.switch('Hacking')

    hackclear = false

end

selectCurrentLine()
copy()
appendBuffer("mapwinHacking")
deleteLine()