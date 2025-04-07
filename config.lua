Config = {}

Config.Debug = false -- Don't activate this if you're in a live environment.
Config.MicOffText = "off"
Config.MeterText  = "m"

-- Normally, there is no need to change this. If you are having issues with the automatic detections of your voice system set this to the voice system you're using.
-- Default: auto
-- Options: auto, saltychat, yaca-voice, pma-voice
Config.VoiceSystem = "auto"

if Coifng.VoiceSystem == "auto" then
    -- Detection of running Voice System
    local voiceSystemYaca = GetResourceState('yaca-voice') == 'started'
    
    if voiceSystemYaca then
        if Config.Debug then print("YACA: " .. GetResourceState('yaca-voice')) end
        Config.VoiceSystem = "yaca-voice"
    end
    
    local voiceSystemSaltychat = GetResourceState('saltychat') == 'started'
    
    if voiceSystemSaltychat then
        if Config.Debug then print("Saltychat: " .. GetResourceState('saltychat')) end
        Config.VoiceSystem = "saltychat"
    end
    
    local voiceSystemPMA = GetResourceState('pma-voice') == 'started'
    
    if voiceSystemPMA then
        if Config.Debug then print("PMA: " .. GetResourceState('pma-voice')) end
        Config.VoiceSystem = "pma-voice"
    end
end
