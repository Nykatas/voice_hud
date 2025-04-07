Config = {}

Config.MicOffText = "off"
Config.MeterText  = "m"

-- Detection of running Voice System
local voiceSystemYaca = GetResourceState('yaca-voice') == 'started'
if voiceSystemYaca then
print("YACA: " .. GetResourceState('yaca-voice'))
Config.VoiceSystem = "yaca-voice"
end

local voiceSystemSaltychat = GetResourceState('saltychat') == 'started'
if voiceSystemSaltychat then
print("Saltychat: " .. GetResourceState('saltychat'))
Config.VoiceSystem = "saltychat"
end

local voiceSystemPMA = GetResourceState('pma-voice') == 'started'
if voiceSystemPMA then
print("PMA: " .. GetResourceState('pma-voice'))
Config.VoiceSystem = "pma-voice"
end