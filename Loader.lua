local Utility = {}

local Repository = "https://github.com/krampus-organization/Utility/raw/refs/heads/main/Modules/"

local Modules = {
    "Character",
    "Colors",
    "Hitsounds",
    "Math",
    "Skyboxes"
}

for _, Module in next, Modules do
    local Success, Source = pcall(function()
        return loadstring(game:HttpGet(Repository .. Module .. ".lua"))()
    end)

    if Success then
        Utility[Module] = Source
    else
        rconsoleprint(('Failed to load module "%s" from URL "%s"'):format(Module, Repository .. Module .. ".lua"))
    end
end

return Utility
