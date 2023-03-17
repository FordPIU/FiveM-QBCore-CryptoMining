Citizen.CreateThread(function()
    while true do
        Wait(60000)
        local Warehouses = FileManager:Get("Shared/Warehouses.json", true)

        for WID, WDATA in pairs(Warehouses) do
            Wait(1)
            for SID, SDATA in pairs(WDATA.Shelfs) do
                Wait(1)
                FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "bitData"}, {SDATA.bitData[1], (SDATA.bitData[2] + (SDATA.bitData[1] / Difficulty)), os.time()}, false)
                FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "electricBill"}, math.floor(SDATA.electricBill + ((SDATA.usedData[2] * 0.10) / 140)), false)
            end
        end

        ReloadJsons(-1)
    end
end)

Citizen.CreateThread(function()
    local Warehouses = FileManager:Get("Shared/Warehouses.json", true)

    for WID, WDATA in pairs(Warehouses) do
        Wait(1)
        for SID, SDATA in pairs(WDATA.Shelfs) do
            Wait(1)
            local Last = SDATA.bitData[3]

            if Last ~= -1 then
                local Now = os.time()
                local Diff = Now - Last

                if Diff > 120 then
                    FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "bitData"}, {SDATA.bitData[1], SDATA.bitData[2] + (SDATA.bitData[1] * (Diff / 60)), os.time()}, false)
                    FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "electricBill"}, math.floor(SDATA.electricBill + (((SDATA.usedData[2] * 0.10) / 140) * (Diff / 60))), false)
                end
            end
        end
    end

    ReloadJsons(-1)
end)