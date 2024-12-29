local Utility = {}

function Utility:CreateObject(Class, Properties)
    local Object = Instance.new(Class)
    for Property, Value in next, Properties do
        Object[Property] = Value
    end
    return Object
end

function Utility:Connection(Signal, Callback)
    local Connection = Signal:Connect(Callback)
    return Connection
end

function Utility:Tween(Object, Time, Data)
    local Tween = game:GetService("TweenService"):Create(Object, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), Data)
    Tween:Play()
    return Tween
end

function Utility:SplitString(String, Separator)
    local Result = {}
    for Part in string.gmatch(String, "([^" .. Separator .. "]+)") do
        table.insert(Result, Part)
    end
    return Result
end

function Utility:ShuffleTable(Table)
    for i = #Table, 2, -1 do
        local j = math.random(i)
        Table[i], Table[j] = Table[j], Table[i]
    end
end

function Utility:PlayHitSound(SoundId, Volume)
    local Sound = self:CreateObject("Sound", {
        SoundId = SoundId,
        Volume = Volume or 1,
        Parent = cloneref(game:GetService("Workspace"))
    })
    Sound:Play()
    Sound.Ended:Connect(function()
        Sound:Destroy()
    end)
end

return Utility
