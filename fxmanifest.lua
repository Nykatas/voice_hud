fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

shared_script {
    'config.lua'
}

client_script {
	'client/voicesystems/*.lua',
	'client/client.lua'
}

ui_page 'html/index.html'

files {
    'html/**/*'
}
