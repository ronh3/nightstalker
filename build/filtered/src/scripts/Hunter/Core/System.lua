nightstalker.hunter.system = {
    start = function()
      enableTrigger('hunting balance')
  
      nightstalker.setmodule('Hunting', true)
  
      nightstalker.hunter.triggy(gmcp.Char.Status.class)
  
      if not debug.traceback():find('Trigger', 1, true) then
        send('look', false)
      end
    end,
    stop = function()
      disableTrigger('hunting balance')
  
      nightstalker.setmodule('Hunting', false)
    end,
  }