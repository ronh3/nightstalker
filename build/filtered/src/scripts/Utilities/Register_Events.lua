nightstalker.events = nightstalker.events or {}

function nightstalker.registerevent(name, event, func)
  if not nightstalker.events[name] then
    nightstalker.events[name] = registerAnonymousEventHandler(event, func)
  end
end

function nightstalker.killevent(name)
  if nightstalker.events[name] then
    return killAnonymousEventHandler(nightstalker.events[name])
  end
end