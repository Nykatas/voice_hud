if not (Config.VoiceSystem == "yaca-voice") then return end

function InitVoiceSystem()
    VoiceDistance = exports["yaca-voice"]:getVoiceRange()
end

function RegisterVoiceSystemEvents()
    RegisterNetEvent('yaca:external:microphoneMuteStateChanged', function(state)
        MicrophoneEnabled = not state
    end)

    RegisterNetEvent('yaca:external:isTalking', function(state)
        IsCurrentlySpeaking = state
    end) 

    RegisterNetEvent('yaca:external:voiceRangeUpdate', function(range)
        VoiceDistance = range
    end)
end
