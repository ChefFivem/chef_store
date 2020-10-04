fx_version 'adamant'

game 'gta5'

author 'Chef#6502'

description 'Chef Menu F3'

version '1.0'

client_scripts {
	"@es_extended/locale.lua",
	'dependencies/menu.lua',
	'cl_shop.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"@es_extended/locale.lua",
	'sv_shop.lua'
}
