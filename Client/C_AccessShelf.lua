local IsNear = false
local WasNear = false
local NearID = nil
local Divider = 1

local function GetAvailableSlots(NearData)
    local WarehouseID, ShelfID = NearData[1], NearData[2]
    local Shelf = Warehouses[WarehouseID].Shelfs[ShelfID]
    return Shelf.slots - Shelf.usedData[1]
end

local function GetAvailablePower(NearData)
    local WarehouseID, ShelfID = NearData[1], NearData[2]
    local Shelf = Warehouses[WarehouseID].Shelfs[ShelfID]
    return Shelf.maxPower - Shelf.usedData[2]
end

local function GetAdditionalSlotsPrice(NearData)
    local WarehouseID, ShelfID = NearData[1], NearData[2]
    local Warehouse = Warehouses[WarehouseID]
    local Shelf = Warehouse.Shelfs[ShelfID]

    if Shelf.slots >= Warehouse.MaxSlots then
        return "MAXED"
    else
        return math.floor(Warehouse.PricePerShelfUpgrade * (Shelf.slots / 100))
    end
end

local function GetAdditionalPowerPrice(NearData)
    local WarehouseID, ShelfID = NearData[1], NearData[2]
    --local Shelf = Warehouses[WarehouseID].Shelfs[ShelfID]
    --return math.floor(Warehouses[WarehouseID].PricePerPowerIncrease * (Shelf.maxPower / 1000))
    return math.floor(Warehouses[WarehouseID].PricePerPowerIncrease * Divider)
end

local function PlayerOwnsShelf(WID, SID)
    local Warehouse = Warehouses[WID]
    local Shelf = Warehouse.Shelfs[SID]

    if Shelf.ownerIndexer == PlayerIdentifier then
        return true
    else
        return false
    end
end

local function GetCurrentData(NearData)
    local WarehouseID, ShelfID = NearData[1], NearData[2]
    local Warehouse = Warehouses[WarehouseID]
    local Shelf = Warehouse.Shelfs[ShelfID]

    return {Shelf.bitData[1], Shelf.bitData[2], Shelf.electricBill}
end

function GetNearID()
    return NearID
end

Citizen.CreateThread(function()
    repeat
        Wait(100)
    until IsDataReady

    while true do
        Wait(500)
        local IsReset = true

        for ID,v in pairs(Warehouses) do
            Wait(5)
            for SID,s in pairs(v.Shelfs) do
                Wait(5)

                if PlayerOwnsShelf(ID, SID) then
                    local ShelfCoords = s.position
                    local pPed = PlayerPedId()
                    local pCoords = GetEntityCoords(pPed)
                    local pHeading = GetEntityHeading(pPed)
                    local sCoords = vector3(ShelfCoords.x, ShelfCoords.y, ShelfCoords.z)
                    local spDist = #(pCoords - sCoords)

                    if spDist < 0.5 and (pHeading - ShelfCoords.w) < 5.0 then
                        IsNear = true
                        NearID = {ID, SID}
                        IsReset = false
                    end
                end
            end
        end

        if IsReset then
            IsNear = false
            NearID = nil
            Divider = 1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if IsNear then
            WasNear = true
            local aSlots = GetAvailableSlots(NearID)
            local aPower = GetAvailablePower(NearID)
            local pSlots = GetAdditionalSlotsPrice(NearID)
            local pPower = GetAdditionalPowerPrice(NearID)
            local cData = GetCurrentData(NearID)

            CDrawText(0.45, 0.4, 0.1, 0.1, 0.25, "Available Slots: " .. aSlots, 255, 255, 0, 255, true)
            CDrawText(0.45, 0.415, 0.1, 0.1, 0.25, "Available Power: " .. aPower .. "w", 255, 255, 0, 255, true)

            CDrawText(0.45, 0.445, 0.1, 0.1, 0.25, "Current Bits Per Minute: " .. string.format("%f", (cData[1] / Difficulty)), 0, 255, 255, 255, true)
            CDrawText(0.45, 0.46, 0.1, 0.1, 0.25, "Current Bit Balance: " .. cData[2] / Divider, 0, 255, 255, 255, true)
            CDrawText(0.45, 0.475, 0.1, 0.1, 0.25, "Current Bill Balance: $" .. cData[3] / Divider, 0, 255, 255, 255, true)
            CDrawText(0.45, 0.55, 0.1, 0.1, 0.25, "Pay your Bills and Cash Out. (Q)", 255, 255, 255, 255, true)

            if pSlots ~= "MAXED" then
                CDrawText(0.45, 0.5, 0.1, 0.1, 0.25, "Purchase Additional Slots: $" .. pSlots .. " (E)", 0, 255, 255, 255, true)
            else
                CDrawText(0.45, 0.5, 0.1, 0.1, 0.25, "Slots Maxed", 0, 255, 0, 255, true)
            end
            CDrawText(0.45, 0.515, 0.1, 0.1, 0.25, "Purchase an Additional " .. 1000 * Divider .. "w for: $" .. pPower .. " (R)", 0, 255, 255, 255, true)
            CDrawText(0.45, 0.65, 0.1, 0.1, 0.25, "Increase Divider From: " .. Divider .. " (UP ARROW)", 0, 255, 255, 255, true)
            CDrawText(0.45, 0.665, 0.1, 0.1, 0.25, "Decrease Divider From: " .. Divider .. " (DOWN ARROW)", 0, 255, 255, 255, true)
            CDrawMenu()

            DisableControlAction(0, 140, true)
            DisableControlAction(0, 44, true)
            DisableControlAction(0, 172, true)
            DisableControlAction(0, 173, true)

            if IsControlJustReleased(0, 38) and pSlots ~= "MAXED" then
                TrigServ("BuyAdditionalSlots", {NearID, pSlots})
            end
            if IsDisabledControlJustReleased(0, 140) then
                TrigServ("BuyAdditionalPower", {NearID, pPower, Divider})
            end
            if IsDisabledControlJustReleased(0, 44) then
                TrigServ("CashOut", {NearID, PlayerIdentifier, Divider})
            end
            if IsDisabledControlJustReleased(0, 172) then
                Divider = Divider + 1
            end
            if IsDisabledControlJustReleased(0, 173) then
                Divider = Divider - 1

                if Divider < 1 then
                    Divider = 1
                end
            end
        else
            if WasNear then
                WasNear = false
                CResetMenu()
            end
        end
    end
end)