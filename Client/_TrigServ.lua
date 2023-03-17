function TrigServ(EventName, EventParams)
    TriggerServerEvent("CQB:MININGV2::" .. EventName, EventParams)
end