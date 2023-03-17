Difficulty = 1

local function GetRandomFloatInRange(min, max)
    return exports["cqb-miningv2"]:getRndFloat(min, max)
end

local PrideDivier = 1
local function GetPriceDivider()
    PriceDivier = PrideDivier + GetRandomFloatInRange(-0.1, 0.1)
    if (PriceDivier <= 0) then PriceDivier = 0.01 end
    return PriceDivier;
end

Citizen.CreateThread(function()
    Wait(5000)
    while true do
        Wait(10000)
        local Worth = exports["npwd_crypto"]:GetCryptoValue()

        if Worth ~= nil then
            Difficulty = ((Worth * GetPriceDivider()) * 0.0005) + (GetRandomFloatInRange(0.1, 1.0) / 10)
        end

        TriggerClientEvent("CQBMININGV2:UpdateDifficulty", -1, Difficulty)
    end
end)