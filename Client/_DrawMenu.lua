local Menu = nil

local function CreateMenu()
    Menu = {
        [1] = {Label = "Graphics Cards", Sub = {}},
        [2] = {Label = "ASICs", Sub = {}},
        [3] = nil,
        Cur = {0, 0}
    }

    local gGroup = 1
    for gLabel, gData in pairs(Purchaseables.GPU) do
        Wait(2)

        if Menu[1].Sub[gGroup] == nil then
            Menu[1].Sub[gGroup] = {}
        end

        if #Menu[1].Sub[gGroup] == 3 then
            gGroup = gGroup + 1

            if Menu[1].Sub[gGroup] == nil then
                Menu[1].Sub[gGroup] = {}
            end
        end

        Menu[1].Sub[gGroup][#Menu[1].Sub[gGroup]+1] = {
            Label = gLabel,
            AwaitingConfirm = false,
            ACTimer = 0,
            Data = gData,
            OnSelect = function()
                TrigServ("GPUASIC_Purchase", {gLabel, gData, GetNearID(), PlayerIdentifier})
            end
        }
    end

    local aGroup = 1
    for aLabel, aData in pairs(Purchaseables.ASIC) do
        Wait(2)

        if Menu[2].Sub[aGroup] == nil then
            Menu[2].Sub[aGroup] = {}
        end

        if #Menu[2].Sub[aGroup] == 3 then
            aGroup = aGroup + 1

            if Menu[2].Sub[aGroup] == nil then
                Menu[2].Sub[aGroup] = {}
            end
        end

        Menu[2].Sub[aGroup][#Menu[2].Sub[aGroup]+1] = {
            Label = aLabel,
            AwaitingConfirm = false,
            ACTimer = 0,
            Data = aData,
            OnSelect = function()
                TrigServ("GPUASIC_Purchase", {aLabel, aData, GetNearID(), PlayerIdentifier})
            end
        }
    end
end

local textcolor_r = 255
local textcolor_g = 0
local textcolor_b = 255
function CDrawMenu()
    if Menu == nil then CreateMenu() end

    if Menu.Cur[1] == 0 and Menu.Cur[2] == 0 then
        CDrawText(0.2, 0.4, 0.1, 0.1, 0.25, "(5) " .. Menu[1].Label, textcolor_r, textcolor_g, textcolor_b, 255, true)
        CDrawText(0.2, 0.415, 0.1, 0.1, 0.25, "(6) " .. Menu[2].Label, textcolor_r, textcolor_g, textcolor_b, 255, true)

        if IsControlJustReleased(0, 165) then
            Menu.Cur = {1, 1}
        end
        if IsControlJustReleased(0, 159) then
            Menu.Cur = {2, 1}
        end
    else
        local aMenu = Menu[Menu.Cur[1]].Sub[Menu.Cur[2]]
        local mCur = Menu.Cur

        if aMenu[1] ~= nil then
            if not aMenu[1].AwaitingConfirm then
                CDrawText(0.2, 0.4, 0.1, 0.1, 0.25, "(5) " .. aMenu[1].Label .. " ($" .. aMenu[1].Data.Price .. ")" .. " (" .. string.format("%f", aMenu[1].Data.BPM) .. "bpm/" .. aMenu[1].Data.PowerDraw .. "w/" .. aMenu[1].Data.SlotUsage .. "slot", textcolor_r, textcolor_g, textcolor_b, 255, true)
            else
                CDrawText(0.2, 0.4, 0.1, 0.1, 0.25, "(5) " .. aMenu[1].Label .. " | Press Again to Confirm", textcolor_r, textcolor_g, textcolor_b, 255, true)

                if GetGameTimer() > aMenu[1].ACTimer then
                    aMenu[1].AwaitingConfirm = false
                    aMenu[1].ACTimer = 0
                end
            end
        end
        if aMenu[2] ~= nil then
            if not aMenu[2].AwaitingConfirm then
                CDrawText(0.2, 0.415, 0.1, 0.1, 0.25, "(6) " .. aMenu[2].Label .. " ($" .. aMenu[2].Data.Price .. ")" .. " (" .. string.format("%f", aMenu[2].Data.BPM) .. "bpm/" .. aMenu[2].Data.PowerDraw .. "w/" .. aMenu[2].Data.SlotUsage .. "slot", textcolor_r, textcolor_g, textcolor_b, 255, true)
            else
                CDrawText(0.2, 0.415, 0.1, 0.1, 0.25, "(6) " .. aMenu[2].Label .. " | Press Again to Confirm", textcolor_r, textcolor_g, textcolor_b, 255, true)

                if GetGameTimer() > aMenu[2].ACTimer then
                    aMenu[2].AwaitingConfirm = false
                    aMenu[2].ACTimer = 0
                end
            end
        end
        if aMenu[3] ~= nil then
            if not aMenu[3].AwaitingConfirm then
                CDrawText(0.2, 0.43, 0.1, 0.1, 0.25, "(7) " .. aMenu[3].Label .. " ($" .. aMenu[3].Data.Price .. ")" .. " (" .. string.format("%f", aMenu[3].Data.BPM) .. "bpm/" .. aMenu[3].Data.PowerDraw .. "w/" .. aMenu[3].Data.SlotUsage .. "slot", textcolor_r, textcolor_g, textcolor_b, 255, true)
            else
                CDrawText(0.2, 0.43, 0.1, 0.1, 0.25, "(7) " .. aMenu[3].Label .. " | Press Again to Confirm", textcolor_r, textcolor_g, textcolor_b, 255, true)

                if GetGameTimer() > aMenu[3].ACTimer then
                    aMenu[3].AwaitingConfirm = false
                    aMenu[3].ACTimer = 0
                end
            end
        end
        CDrawText(0.2, 0.47, 0.1, 0.1, 0.25, "(8) Go Back", textcolor_r, textcolor_g, textcolor_b, 255, true)
        CDrawText(0.2, 0.4815, 0.1, 0.1, 0.25, "(9) Next Page", textcolor_r, textcolor_g, textcolor_b, 255, true)

        if IsControlJustReleased(0, 165) then
            if aMenu[1].AwaitingConfirm then
                aMenu[1].OnSelect()
                aMenu[1].AwaitingConfirm = false
                aMenu[1].ACTimer = 0
            else
                aMenu[1].AwaitingConfirm = true
                aMenu[1].ACTimer = GetGameTimer() + 5000
            end
        end
        if IsControlJustReleased(0, 159) then
            if aMenu[2].AwaitingConfirm then
                aMenu[2].OnSelect()
                aMenu[2].AwaitingConfirm = false
                aMenu[2].ACTimer = 0
            else
                aMenu[2].AwaitingConfirm = true
                aMenu[2].ACTimer = GetGameTimer() + 5000
            end
        end
        if IsControlJustReleased(0, 161) then
            if aMenu[3].AwaitingConfirm then
                aMenu[3].OnSelect()
                aMenu[3].AwaitingConfirm = false
                aMenu[3].ACTimer = 0
            else
                aMenu[3].AwaitingConfirm = true
                aMenu[3].ACTimer = GetGameTimer() + 5000
            end
        end

        if IsControlJustReleased(0, 162) then
            if Menu[mCur[1]].Sub[mCur[2]-1] ~= nil then
                Menu.Cur = {mCur[1], mCur[2]-1}
            else
                Menu.Cur = {0, 0}
            end
        end
        if IsControlJustReleased(0, 163) then
            if Menu[mCur[1]].Sub[mCur[2]+1] ~= nil then
                Menu.Cur = {mCur[1], mCur[2]+1}
            else
                Menu.Cur = {mCur[1], 1}
            end
        end
    end
end

function CResetMenu()
    Menu.Cur = {0, 0}
end