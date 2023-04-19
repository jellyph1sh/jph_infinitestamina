AddEventHandler("onResourceStart", function(resourceName)
    if (resourceName ~= GetCurrentResourceName()) then
        return
    end

    print("[JPH_INFINITESTAMINA] Script started!")
end)

AddEventHandler("onResourceStop", function(resourceName)
    if (resourceName ~= GetCurrentResourceName()) then
        return
    end

    print("[JPH_INFINITESTAMINA] Script stopped!")
end)