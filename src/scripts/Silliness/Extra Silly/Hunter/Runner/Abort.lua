function sym.hunter.runner:abort()
	mmp.stop()
	sym.hunter.runner.walking = false
	sym.hunter.runner.rooms = {}
	sym.hunter.runner.walkingTo = 0
	sym.hunter.runner.backtracking = false
	sym.hunter.runner.enabled = false
  sym.hunter.system.stop()
	if sym.hunter.runner.config.returnToStart then
		decho("<0,128,128>Returning you to your starting room!\n")
    expandAlias('goto ' .. sym.hunter.runner.startRoom)
	end
end