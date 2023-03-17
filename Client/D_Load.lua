QBCore = exports['qb-core']:GetCoreObject()

-- DATA
IsDataReady = false
Warehouses = nil
Player = nil
PlayerIdentifier = nil
Purchaseables = nil

-- Send Server Event
Citizen.CreateThread(function()
    Wait(10000)
    print("CQB:MiningV2: Loading Data...")
    TrigServ("LoadPlayer")
end)