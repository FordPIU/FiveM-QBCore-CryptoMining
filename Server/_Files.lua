FileManager = {}
local Files = {}

function FileManager:Load(FilePath)
    if Files[FilePath] == nil then
        local File = json.decode(LoadResourceFile(GetCurrentResourceName(), FilePath))
        Files[FilePath] = File
    end
end

function FileManager:Save(FilePath)
    SaveResourceFile(GetCurrentResourceName(), FilePath, json.encode(Files[FilePath]), -1)
end

function FileManager:SaveAll()
    if #Files > 0 then
        for FilePath, _ in pairs(Files) do
            FileManager:Save(FilePath)
        end
    end
end

function FileManager:Get(FilePath, LoadIfNil)
    if Files[FilePath] == nil and LoadIfNil then
        repeat
            Wait(10)
            FileManager:Load(FilePath)
        until Files[FilePath] ~= nil
    end

    return Files[FilePath]
end

function FileManager:DeepGet(FilePath, Keys)
    local File = Files[FilePath]

    for _, Key in pairs(Keys) do
        File = File[Key]
    end

    return File
end

function FileManager:GetFromFile(FilePath)
    local File = json.decode(LoadResourceFile(GetCurrentResourceName(), FilePath))
    return File
end

function FileManager:Set(FilePath, File, Urgent)
    Files[FilePath] = File

    if Urgent then
        FileManager:Save(FilePath)
    end
end

function FileManager:Update(FilePath, Keys, Value, Urgent)
    if #Keys == 1 then
        Files[FilePath][Keys[1]] = Value
    end
    if #Keys == 2 then
        Files[FilePath][Keys[1]][Keys[2]] = Value
    end
    if #Keys == 3 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]] = Value
    end
    if #Keys == 4 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]] = Value
    end
    if #Keys == 5 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]][Keys[5]] = Value
    end
    if #Keys == 6 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]][Keys[5]][Keys[6]] = Value
    end
    if #Keys == 7 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]][Keys[5]][Keys[6]][Keys[7]] = Value
    end
    if #Keys == 8 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]][Keys[5]][Keys[6]][Keys[7]][Keys[8]] = Value
    end
    if #Keys == 9 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]][Keys[5]][Keys[6]][Keys[7]][Keys[8]][Keys[9]] = Value
    end
    if #Keys == 10 then
        Files[FilePath][Keys[1]][Keys[2]][Keys[3]][Keys[4]][Keys[5]][Keys[6]][Keys[7]][Keys[8]][Keys[9]][Keys[10]] = Value
    end

    if Urgent then
        FileManager:Save(FilePath)
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(30000)
        FileManager:SaveAll()
    end
end)