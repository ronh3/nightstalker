function sym.savetable(t)
    assert(type(t) == 'string', 'sym.savetable: bad argument #1 type (string expected, got '..type(t)..')')
    assert(#t > 0, 'sym.savetable: string cannot be empty')
  
    t = 'sym.' .. t
    local sep = package.config:sub(1,1) == '/' and '/' or '\\'
    local path = getMudletHomeDir() .. sep .. t
    assert(loadstring('if '..t..' then table.save("'..path..'", '..t..') end'))()
  end
  
  function sym.loadtable(t)
    assert(type(t) == 'string', 'sym.savetable: bad argument #1 type (string expected, got '..type(t)..')')
    assert(#t > 0, 'sym.savetable: string cannot be empty')
  
    t = 'sym.' .. t
    local sep = package.config:sub(1,1) == '/' and '/' or '\\'
    local path = getMudletHomeDir() .. sep .. t
    assert(loadstring('if not '..t..' then '..t..' = {}; if lfs.attributes("'..path..'") then table.load("'..path..'", '..t..') end end'))()
  end