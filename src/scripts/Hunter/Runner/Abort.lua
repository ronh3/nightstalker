function nightstalker.hunter.runner:abort()
	mmp.stop()
	nightstalker.hunter.runner.walking = false
	nightstalker.hunter.runner.rooms = {}
	nightstalker.hunter.runner.walkingTo = 0
	nightstalker.hunter.runner.backtracking = false
	nightstalker.hunter.runner.enabled = false
  nightstalker.hunter.system.stop()
	if nightstalker.hunter.runner.config.returnToStart then
		decho("<0,128,128>Returning you to your starting room!\n")
    expandAlias('goto '..nightstalker.hunter.runner.startRoom)
	end
end