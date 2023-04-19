local threadId = 0

local function infiniteStamina()
    Citizen.CreateThread(function()
        threadId = GetIdOfThisThread()
        local plyId = PlayerId()
        while true do
            SetPlayerStamina(plyId, GetMaxPlayerStamina(plyId))
            
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
    if (resourceName ~= GetCurrentResourceName()) then
        return
    end

    infiniteStamina()
end)

AddEventHandler("onClientResourceStop", function(resourceName)
    if (resourceName ~= GetCurrentResourceName()) then
        return
    end

    stopInfiniteStamina(threadId)
end)