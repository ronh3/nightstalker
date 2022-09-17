function sym.registergmcpadditions()
    sendGMCP('Core.Supports.Add ["Comm.Channel 1"]')
    sendGMCP('Core.Supports.Add ["IRE.Tasks 1"]')
    sendGMCP('Core.Supports.Add ["IRE.Target 1"]')
      sendGMCP('Comm.Channel.Players ""')
  end
  
  sym.registerevent('gmcp additions', 'gmcp.Char.Name', 'sym.registergmcpadditions')