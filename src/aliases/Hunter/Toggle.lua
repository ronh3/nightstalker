local hunting = nightstalker.checkmodule('Hunting')
nightstalker.hunter.system[hunting and 'stop' or 'start']()
nightstalker.echo('Autohunting has been '..(hunting and 'disabled' or 'enabled')..'.')