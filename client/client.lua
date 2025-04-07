-- Globals
-- The variables below are accessable from every client script and need to be updated if you want to implement your own voice system.
MicrophoneEnabled = true
IsCurrentlySpeaking = false
VoiceDistance = nil

-- Local Loop variable, doesn't need to be set.
local RunLoop = true

-- Register events and start voice system.
RegisterVoiceSystemEvents()
InitVoiceSystem()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)

		if RunLoop then
			SendNUIMessage({
				action = "updateStatusHud",
				show = not IsRadarHidden(),    
				voiceRange = (MicrophoneEnabled and (VoiceDistance and tostring(VoiceDistance) or "?") .. Config.MeterText) or Config.MicOffText,
                micEnabled = MicrophoneEnabled
            })

			if not IsRadarHidden() then
				SendNUIMessage({
					action     = "updatespeech",
					speaking   = IsCurrentlySpeaking,
                    micEnabled = MicrophoneEnabled
				})
			end
		end
    end
end)

RegisterNetEvent("voice_hud:client:enableHud", function()
	RunLoop = true
	SendNUIMessage({ show = RunLoop })
end)

RegisterNetEvent("voice_hud:client:disableHud", function()
	RunLoop = false
	SendNUIMessage({ show = RunLoop })
end)