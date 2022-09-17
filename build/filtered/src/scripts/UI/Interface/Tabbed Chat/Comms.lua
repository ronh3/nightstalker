function sym.ui.gmcpcommchanneltext()
    local talker = gmcp.Comm.Channel.Text.talker
  
    if sym.ui.chat.config.filterccc and (not gmcp.Comm.Channel.Players or (not table.contains(gmcp.Comm.Channel.Players, talker) and not (talker == gmcp.Char.Name.name))) then return end
  
    local channels = sym.ui.chat.config.channels
    local gmcpChannel = gmcp.Comm.Channel.Text.channel:lower()
    local text = ansi2decho(gmcp.Comm.Channel.Text.text)
    local raw = text:gsub('<.->', '')
    local r = sym.ui.chat.config.windowcolours.r
    local g = sym.ui.chat.config.windowcolours.g
    local b = sym.ui.chat.config.windowcolours.b
  
    if sym.ui.chat.config.preservebackground then
      text = text:gsub(':>', string.format(':%s,%s,%s>', r, g, b))
    end
  
    local to_channel = {
      ['say'] = 'Local',
      ['yell'] = 'Local',
      ['ft'] = 'Faction',
      ['clt'] = 'Clan',
      ['dt'] = 'Dynasty',
      ['ooc'] = 'Local',
      ['emote'] = 'Local',
      ['market'] = 'Clan',
      ['conflict'] = 'Clan'
    }
  
    local channel = table.contains(channels, gmcpChannel:title()) and gmcpChannel:title() or to_channel[gmcpChannel]
  
    if not channel then
      if gmcpChannel:starts('tell') then
        channel = 'Local'
      else
        cecho('\n<red>Unknown Channel: <yellow>' .. gmcpChannel)
        return
      end
    end
  
    sym.ui.chat:decho(channel, text .. '\n')
  
    if sym.ui.chat.config.gag then
      tempExactMatchTrigger(raw, function()
        deleteLine()
              tempLineTrigger(1, 1, [[if isPrompt() then deleteLine() end]])
      end, 1)
    end
  end
  
  sym.registerevent('gmcp comms', 'gmcp.Comm.Channel.Text', 'sym.ui.gmcpcommchanneltext')