function JLoad(Path)
    return json.decode(LoadResourceFile(GetCurrentResourceName(), Path))
end