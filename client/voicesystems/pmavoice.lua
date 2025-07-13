if Config.VoiceSystem ~= "pma-voice" then return end

function InitVoiceSystem()
    VoiceDistance = LocalPlayer.state.proximity.distance or '?'

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            local isTalking = MumbleIsPlayerTalking(PlayerId())

            if IsCurrentlySpeaking ~= isTalking then
                IsCurrentlySpeaking = isTalking
            end
        end
    end)

    exports('StatusSetTalking', function(isTalking)
        IsCurrentlySpeaking = isTalking
    end)
end

function RegisterVoiceSystemEvents()
    RegisterNetEvent('pma-voice:radioActive', function(isMicrophoneActive)
        MicrophoneEnabled = isMicrophoneActive
    end)

    AddEventHandler('pma-voice:setTalkingMode', function(voiceRange)
        VoiceDistance = voiceRange
    end)
end
