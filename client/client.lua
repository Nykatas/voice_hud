local microphoneEnabled   = true
local isCurrentlySpeaking = false
local voiceDistance = nil
local runLoop 		= true

RegisterNetEvent('yaca:external:microphoneMuteStateChanged')
AddEventHandler('yaca:external:microphoneMuteStateChanged', function(state)
	microphoneEnabled = not state
end)

RegisterNetEvent('yaca:external:isTalking')
AddEventHandler('yaca:external:isTalking', function(state)
	isCurrentlySpeaking = state
end) 

RegisterNetEvent('yaca:external:voiceRangeUpdate')
AddEventHandler('yaca:external:voiceRangeUpdate', function(range)
    voiceDistance = range
end)

Citizen.CreateThread(function()
    voiceDistance = exports["yaca-voice"]:getVoiceRange()

    while true do
        Citizen.Wait(100)

		if runLoop then
			SendNUIMessage({
				action = "updateStatusHud",
				show = not IsRadarHidden(),          
				voiceRange = (microphoneEnabled and tostring(voiceDistance) .. Config.MeterText) or Config.MicOffText,
                micEnabled = microphoneEnabled
            })

			if not IsRadarHidden() then
				SendNUIMessage({
					action     = "updatespeech",
					speaking   = isCurrentlySpeaking,
                    micEnabled = microphoneEnabled
				})
			end
		end
    end
end)

RegisterNetEvent("voice_hud:client:enableHud")
AddEventHandler("voice_hud:client:enableHud", function()
	runLoop = true
	SendNUIMessage({ show = runLoop })
end)

RegisterNetEvent("voice_hud:client:disableHud")
AddEventHandler("voice_hud:client:disableHud", function()
	runLoop = false
	SendNUIMessage({ show = runLoop })
end)