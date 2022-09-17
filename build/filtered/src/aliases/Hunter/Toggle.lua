local hunting = sym.checkmodule('Hunting')
sym.hunter.system[hunting and 'stop' or 'start']()
sym.echo('Autohunting has been '..(hunting and 'disabled' or 'enabled')..'.')