local IsNear = false
local NearID = nil

local function GetNextShelfPrice()
    local Warehouse = Warehouses[NearID]
    local ShelfPrice = Warehouse.PricePerShelf
    local NumberOfPlayerShelfs = Player.ShelfQuantity

    return math.floor(ShelfPrice * ((NumberOfPlayerShelfs * 4) + 1))
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
            local LaptopCoords = v.LaptopCoords
            local pCoords = GetEntityCoords(PlayerPedId())
            local cCoords = vector3(LaptopCoords.x, LaptopCoords.y, LaptopCoords.z)
            local cpDist = #(pCoords - cCoords)

            if cpDist < 0.5 then
                IsNear = true
                NearID = ID
                IsReset = false
            end
        end

        if IsReset then
            IsNear = false
            NearID = nil
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if IsNear then
            CDrawText(0.45, 0.4, 0.1, 0.1, 0.5, "Press E To Buy a Shelf. $" .. GetNextShelfPrice(), 0, 255, 0, 255, true)

            if IsControlJustReleased(0, 38) then
                TrigServ("BuyShelf", {NearID, GetNextShelfPrice(), PlayerIdentifier})
            end
        end
    end
end)