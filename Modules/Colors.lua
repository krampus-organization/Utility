local Colors = {}

function Colors:ToInteger(Color)
    return math.floor(Color.r * 255) * 256 ^ 2 + math.floor(Color.g * 255) * 256 + math.floor(Color.b * 255)
end

function Colors:ToHex(Color)
    local Int = self:ToInteger(Color)
    local Current = Int
    local Final = ""
    local HexChar = {"A", "B", "C", "D", "E", "F"}

    repeat
        local Remainder = Current % 16
        local Char = tostring(Remainder)

        if Remainder >= 10 then
            Char = HexChar[1 + Remainder - 10]
        end

        Current = math.floor(Current / 16)
        Final = Final .. Char
    until Current <= 0

    return string.reverse(Final)
end

function Colors:FromHex(Hex)
    Hex = Hex:gsub("#", "")
    local Int = tonumber(Hex, 16)
    if not Int then return Color3.new(0, 0, 0) end

    local R = ((Int >> 16) & 0xFF) / 255
    local G = ((Int >> 8) & 0xFF) / 255
    local B = (Int & 0xFF) / 255

    return Color3.new(R, G, B)
end

function Colors:Lighten(Color, Amount)
    Amount = math.clamp(Amount, 0, 1)
    return Color3.new(math.clamp(Color.r + Amount, 0, 1), math.clamp(Color.g + Amount, 0, 1), math.clamp(Color.b + Amount, 0, 1))
end

function Colors:Darken(Color, Amount)
    Amount = math.clamp(Amount, 0, 1)
    return Color3.new( math.clamp(Color.r - Amount, 0, 1), math.clamp(Color.g - Amount, 0, 1), math.clamp(Color.b - Amount, 0, 1))
end

function Colors:Lerp(Color1, Color2, Alpha)
    Alpha = math.clamp(Alpha, 0, 1)
    return Color3.new(Color1.r + (Color2.r - Color1.r) * Alpha, Color1.g + (Color2.g - Color1.g) * Alpha, Color1.b + (Color2.b - Color1.b) * Alpha)
end

return Colors
