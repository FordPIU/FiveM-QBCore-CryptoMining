RegisterNetEvent("CQB:MININGV2:Client::Notify", function(msg, typ)
    QBCore.Functions.Notify(msg, typ, 5000)
end)

RegisterNetEvent("CQB:MININGV2:Client::LoadData", function(Params)
    local QBPData = nil
    local PlayerIndexer = nil

    while QBPData == nil do
        Wait(100)
        QBPData = QBCore.Functions.GetPlayerData()
    end

    while PlayerIndexer == nil do
        Wait(100)
        PlayerIndexer = QBPData.license:gsub("license:", "") .. "-" .. QBPData.charinfo.account
    end

    local pWarehouses = Params[1]
    local pPlayer = Params[2][PlayerIndexer]
    local pPurchaseables = Params[3]

    if pPlayer == nil or pWarehouses == nil or pPurchaseables == nil then
        if pPlayer == nil then
            print("CQB:MiningV2: Creating New Player...")
            TrigServ("CreateNewPlayer", PlayerIndexer)
        end
        print("CQB:MiningV2: Loading Data..")
        TrigServ("LoadPlayer")
    else
        Warehouses = pWarehouses
        Player = pPlayer
        PlayerIdentifier = PlayerIndexer
        Purchaseables = pPurchaseables
        IsDataReady = true
        print("CQB:MiningV2: Data Loaded.")
    end
end)