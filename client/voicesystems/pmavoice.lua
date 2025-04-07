-- UNTESTED - Please test this if you can and if there are any errors open an issue in the github repository. (https://github.com/Nykatas/voice_hud)
if not (Config.VoiceSystem == "pma-voice") then return end

function InitVoiceSystem()
    VoiceDistance = exports["saltychat"]:GetVoiceRange()

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
