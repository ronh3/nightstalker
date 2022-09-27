sym.hunter.system = {
    start = function()
      enableTrigger('hunting balance')
  
      sym.setmodule('Hunting', true)
  
      sym.hunter.triggy(gmcp.Char.Status.class)
  
      if not debug.traceback():find('Trigger', 1, true) then
        send('look', false)
      end
    end,
    stop = function()
      disableTrigger('hunting balance')
  
      sym.setmodule('Hunting', false)
    end,
  }