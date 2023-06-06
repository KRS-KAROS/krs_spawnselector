fx_version 'cerulean'
game 'gta5'
lua54 'yes'

Nome 'krs_spawn'
Autore 'Karos#7804'
Discord 'https://discord.gg/wM4XDaXfU8' -- 𝗞𝗥𝗦® --

client_script {
    'client/**.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/**.lua'
}

ui_page 'karos.html'

files{
    'karos.html',
    'karos.css',
    'karos.js',
}