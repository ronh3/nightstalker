sym.events = sym.events or {}

function sym.registerevent(name, event, func)
  if not sym.events[name] then
    sym.events[name] = registerAnonymousEventHandler(event, func)
  end
end

function sym.killevent(name)
  if sym.events[name] then
    return killAnonymousEventHandler(sym.events[name])
  end
end