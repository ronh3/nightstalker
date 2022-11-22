function nightstalker.ui.gmcpiretaskslist()
    nightstalker.ui.tasklist = gmcp.IRE.Tasks.List
    nightstalker.ui.update_tasks()
  end
  
  function nightstalker.ui.gmcpiretasksupdate()
    local updated = gmcp.IRE.Tasks.Update
    for key, task in ipairs(nightstalker.ui.tasklist) do
      if task.id == updated.id then
        nightstalker.ui.tasklist[key] = updated
        break
      end
    end
    nightstalker.ui.update_tasks()
  end
  
  nightstalker.registerevent('task list', 'gmcp.IRE.Tasks.List', 'nightstalker.ui.gmcpiretaskslist')
  nightstalker.registerevent('task update', 'gmcp.IRE.Tasks.Update', 'nightstalker.ui.gmcpiretasksupdate')
  nightstalker.registerevent('task completed', 'gmcp.IRE.Tasks.Completed')