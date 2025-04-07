if not (Config.VoiceSystem == "saltychat") then return end

function InitVoiceSystem()
    VoiceDistance = exports["saltychat"]:GetVoiceRange()
end

function RegisterVoiceSystemEvents()
    RegisterNetEvent('SaltyChat_MicStateChanged', function(isMicrophoneMuted)
        MicrophoneEnabled = not isMicrophoneMuted
    end)
    
    RegisterNetEvent('SaltyChat_TalkStateChanged', function(isTalking)
        IsCurrentlySpeaking = isTalking
    end)
    
    RegisterNetEvent('SaltyChat_VoiceRangeChanged', function(voiceRange)
        VoiceDistance = voiceRange
    end)
end
