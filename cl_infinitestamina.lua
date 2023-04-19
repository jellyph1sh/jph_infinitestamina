local threadId = 0

local function infiniteStamina()
    Citizen.CreateThread(function()
        threadId = GetIdOfThisThread()
        local plyId = PlayerId()
        while true do
            SetPlayerStamina(plyId, GetPlayerMaxStamina(plyId))
            
            Citizen.Wait(1000)
        end
    end)
end

local function stopInfiniteStamina(thread)
    if (thread ~= 0) then
        TerminateThread(thread)
    end
end

AddEventHandler("onClientResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    infiniteStamina()
end)

AddEventHandler("onClientResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    stopInfiniteStamina(threadId)
end)