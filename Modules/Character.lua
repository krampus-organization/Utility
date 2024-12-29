local Character = {}

function Character:GetCharacter(Player)
    local Character = Player and Player.Character
    if Character and Character:FindFirstChild("Head") and Character:FindFirstChild("HumanoidRootPart") then
        return Character
    end
    return nil
end

function Character:GetTeam(Player)
    return Player and Player.Team
end

function Character:GetHealth(Player)
    local Character = self:GetCharacter(Player)
    local Humanoid = Character and Character:FindFirstChild("Humanoid")
    if Humanoid then
        return Humanoid.Health, Humanoid.MaxHealth
    end
    return nil, nil
end

function Character:IsAlive(Player)
    local Health = self:GetHealth(Player)
    return Health and Health > 0 or false
end

function Character:GetWeapon(Player)
    local Character = self:GetCharacter(Player)
    if Character then
        for Index, Item in next, Character:GetChildren() do
            if Item:IsA("Tool") then
                return Item
            end
        end
    end
end

return Character
