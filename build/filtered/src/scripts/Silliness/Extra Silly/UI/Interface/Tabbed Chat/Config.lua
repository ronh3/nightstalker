sym.ui.chat.config = sym.ui.chat.config or {}

sym.ui.chat.config.usetimestamp = 'HH:mm:ss'

sym.ui.chat.config.timestampcustomcolour = false

sym.ui.chat.config.timestampfg = 'white'

sym.ui.chat.config.timestampbg = 'grey'

sym.ui.chat.config.channels = { 'All', 'Clan', 'Crew', 'Dynasty', 'Faction', 'Local', 'Newbie' }

sym.ui.chat.config.alltab = 'All'

sym.ui.chat.config.blink = true

sym.ui.chat.config.blinktime = 3

sym.ui.chat.config.blinkfromall = false

sym.ui.chat.config.fontsize = 9

sym.ui.chat.config.preservebackground = true

sym.ui.chat.config.gag = false

sym.ui.chat.config.filterccc = false

sym.ui.chat.config.activecolours = { r = 20, g = 60, b = 20 }

sym.ui.chat.config.inactivecolours = { r = 60, g = 60, b = 60 }

sym.ui.chat.config.windowcolours = { r = 0, g = 10, b = 10 }

sym.ui.chat.config.activetabtext = 'orange'

sym.ui.chat.config.inactivetabtext = 'white'

sym.ui.chat.currenttab = sym.ui.chat.currenttab or sym.ui.chat.config.alltab or sym.ui.chat.config.channels[1]