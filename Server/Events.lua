RegisterNetEvent("CQB:MININGV2::CreateNewPlayer", function(PlayerIndexer)
    local Players = FileManager:Get("Shared/Players.json", true)

    if Players[PlayerIndexer] == nil then
        local PlayerData = {
            ShelfQuantity = 0,
            Shelfs = {},
        }

        FileManager:Update("Shared/Players.json", {PlayerIndexer}, PlayerData, true)
        ReloadJsons(source)
    end
end)

RegisterNetEvent("CQB:MININGV2::BuyShelf", function(Params)
    local WarehouseID, Price, OwnerIndexer = Params[1], Params[2], Params[3]

    local Warehouses = FileManager:Get("Shared/Warehouses.json", true)
    local Warehouse = Warehouses[WarehouseID]

    local QBCore = exports['qb-core']:GetCoreObject()
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    local QBPlayerData = QBPlayer.PlayerData
    local QBPlayerBank = QBPlayerData.money['bank']

    if QBPlayerBank >= Price then
        QBPlayer.Functions.RemoveMoney('bank', Price)

        FileManager:Update("Shared/Warehouses.json", {WarehouseID, "Shelfs", Warehouse.NextAvailShelf, "isOwned"}, true, true)
        FileManager:Update("Shared/Warehouses.json", {WarehouseID, "Shelfs", Warehouse.NextAvailShelf, "ownerIndexer"}, OwnerIndexer, true)

        local PlayerData = FileManager:Get("Shared/Players.json", true)[OwnerIndexer]
        FileManager:Update("Shared/Players.json", {OwnerIndexer, "ShelfQuantity"}, PlayerData.ShelfQuantity + 1, true)
        FileManager:Update("Shared/Players.json", {OwnerIndexer, "Shelfs", #PlayerData.Shelfs+1}, {WarehouseID, Warehouse.NextAvailShelf}, true)

        FileManager:Update("Shared/Warehouses.json", {WarehouseID, "NextAvailShelf"}, Warehouse.NextAvailShelf + 1, true)

        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Successfully Bought the Shelf.", "success")
        ReloadJsons(source)
    else
        FileManager:Update("Shared/Warehouses.json", {WarehouseID, "NextAvailShelf"}, Warehouse.NextAvailShelf, true)
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Not Enough Money.", "error")
    end
end)

RegisterNetEvent("CQB:MININGV2::BuyAdditionalPower", function(Params)
    local WarehouseID, ShelfID, Price, Divider = Params[1][1], Params[1][2], Params[2], Params[3]
    local Warehouses = FileManager:Get("Shared/Warehouses.json", true)
    local QBCore = exports['qb-core']:GetCoreObject()
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    local QBPlayerData = QBPlayer.PlayerData
    local QBPlayerBank = QBPlayerData.money['bank']

    if QBPlayerBank >= (Price) then
        QBPlayer.Functions.RemoveMoney('bank', (Price))

        FileManager:Update("Shared/Warehouses.json", {WarehouseID, "Shelfs", ShelfID, "maxPower"}, Warehouses[WarehouseID].Shelfs[ShelfID].maxPower + (1000 * Divider), true)
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Successfully Bought a Power Increase.", "success")
        ReloadJsons(source)
    else
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Not Enough Money.", "error")
    end
end)

RegisterNetEvent("CQB:MININGV2::BuyAdditionalSlots", function(Params)
    local WarehouseID, ShelfID, Price = Params[1][1], Params[1][2], Params[2]
    local Warehouses = FileManager:Get("Shared/Warehouses.json", true)
    local QBCore = exports['qb-core']:GetCoreObject()
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    local QBPlayerData = QBPlayer.PlayerData
    local QBPlayerBank = QBPlayerData.money['bank']

    if QBPlayerBank >= Price then
        QBPlayer.Functions.RemoveMoney('bank', Price)

        FileManager:Update("Shared/Warehouses.json", {WarehouseID, "Shelfs", ShelfID, "slots"}, Warehouses[WarehouseID].Shelfs[ShelfID].slots + 120, true)
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Successfully Bought a Power Increase.", "success")
        ReloadJsons(source)
    else
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Not Enough Money.", "error")
    end
end)

RegisterNetEvent("CQB:MININGV2::GPUASIC_Purchase", function(Params)
    local PID, PData, WID, SID, PlrIdent = Params[1], Params[2], Params[3][1], Params[3][2], Params[4]

    local Warehouses = FileManager:Get("Shared/Warehouses.json", true)
    local Warehouse = Warehouses[WID]
    local Shelf = Warehouse.Shelfs[SID]

    local QBCore = exports['qb-core']:GetCoreObject()
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    local QBPlayerData = QBPlayer.PlayerData
    local QBPlayerBank = QBPlayerData.money['bank']

    local usedSlots = Shelf.usedData[1]
    local usedPower = Shelf.usedData[2]
    local maxSlots = Shelf.slots
    local maxPower = Shelf.maxPower

    if Shelf.isOwned and Shelf.ownerIndexer == PlrIdent then
        if maxSlots - usedSlots > PData.SlotUsage then
            if maxPower - usedPower > PData.PowerDraw then
                if QBPlayerBank > PData.Price then
                    QBPlayer.Functions.RemoveMoney('bank', PData.Price)

                    FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "usedData", 1}, usedSlots + PData.SlotUsage, true)
                    FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "usedData", 2}, usedPower + PData.PowerDraw, true)
                    FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "slotUsage", #Shelf.slotUsage+1}, PID, true)
                    FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "bitData", 1}, Shelf.bitData[1] + PData.BPM, true)

                    TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "You purchased a " .. PID .. "!", "success")
                    ReloadJsons(source)
                end
            else
                TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Not Enough Power.", "error")
            end
        else
            TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Not Enough Slots.", "error")
        end
    else
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Your somehow accessing someone elses shelf??", "error")
    end
end)

RegisterNetEvent("CQB:MININGV2::CashOut", function(Params)
    local WID, SID, PlrIdent, Divider = Params[1][1], Params[1][2], Params[2], Params[3]

    local Warehouses = FileManager:Get("Shared/Warehouses.json", true)
    local Warehouse = Warehouses[WID]
    local Shelf = Warehouse.Shelfs[SID]

    local QBCore = exports['qb-core']:GetCoreObject()
    local QBPlayer = QBCore.Functions.GetPlayer(source)
    local QBPlayerData = QBPlayer.PlayerData
    local QBPlayerBank = QBPlayerData.money['bank']

    if Shelf.isOwned and Shelf.ownerIndexer == PlrIdent then
        if QBPlayerBank > math.floor(Shelf.electricBill / Divider) then
            local currentBill = Shelf.electricBill
            local newBill = math.floor(Shelf.electricBill / Divider)

            QBPlayer.Functions.RemoveMoney('bank', newBill)
            FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "electricBill"}, currentBill - newBill, true)

            local currentBit = Shelf.bitData[2]
            local addedBit = Shelf.bitData[2] / Divider

            QBPlayer.Functions.AddMoney('crypto', addedBit)
            FileManager:Update("Shared/Warehouses.json", {WID, "Shelfs", SID, "bitData", 2}, currentBit - addedBit, true)

            TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "You have successfully cashed out.", "success")
        end
    else
        TriggerClientEvent("CQB:MININGV2:Client::Notify", source, "Your somehow accessing someone elses shelf??", "error")
    end

    ReloadJsons(source)
end)

RegisterNetEvent("CQB:MININGV2::LoadPlayer", function()
    ReloadJsons(source)
end)