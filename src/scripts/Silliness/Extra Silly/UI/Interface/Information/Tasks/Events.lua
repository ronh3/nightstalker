function sym.ui.gmcpiretaskslist()
    sym.ui.tasklist = gmcp.IRE.Tasks.List
    sym.ui.update_tasks()
  end
  
  function sym.ui.gmcpiretasksupdate()
    local updated = gmcp.IRE.Tasks.Update
    for key, task in ipairs(sym.ui.tasklist) do
      if task.id == updated.id then
        sym.ui.tasklist[key] = updated
        break
      end
    end
    sym.ui.update_tasks()
  end
  
  sym.registerevent('task list', 'gmcp.IRE.Tasks.List', 'sym.ui.gmcpiretaskslist')
  sym.registerevent('task update', 'gmcp.IRE.Tasks.Update', 'sym.ui.gmcpiretasksupdate')
  sym.registerevent('task completed', 'gmcp.IRE.Tasks.Completed')