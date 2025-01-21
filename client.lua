local animDict = "move_m@intimidation@cop@unarmed"
local animName = "idle"
local isPlaying = false

local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(100)
    end
end

CreateThread(function()
    while true do
        Wait(0)
      
        if IsControlPressed(0, 19) then
            if not isPlaying then
                loadAnimDict(animDict)
                TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, -1, 49, 0, false, false, false)
                isPlaying = true
            end
        else
            if isPlaying then
                ClearPedTasks(PlayerPedId()) -- Stopt de animatie
                isPlaying = false
            end
        end
    end
end)
