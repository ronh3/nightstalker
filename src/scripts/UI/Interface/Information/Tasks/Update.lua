function nightstalker.ui.update_tasks()
    local taskList = nightstalker.ui.tasklist
  
    clearWindow('infowinTasks')
  
    local function colour(col)
      return '<'..table.concat(color_table[col], ',')..'>'
    end
  
    local c = 0
    for _, task in ipairs(taskList) do
      nightstalker.ui.info:dechoLink('Tasks', string.format('\n%s[%s%s%s] %s%s',
        colour('yellow'),
        task.status == '0' and '' or colour('green'),
        task.status == '0' and ' ' or 'X',
        colour('yellow'),
        colour('ghost_white'),
        task.name
      ), 'send("'..task.cmd..'")', task.desc)
      c = c + 1
      if c == nightstalker.ui.info.config.tasklimit then break end
    end
  end