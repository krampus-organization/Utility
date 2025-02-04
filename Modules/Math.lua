local Math = {}

function Math:RoundVector(vec)
    return Vector3.new(math.round(vec.X), math.round(vec.Y), math.round(vec.Z)) 
end

function Math:ClampVector(vec, min, max)
    return Vector3.new(math.clamp(vec.X, min.X, max.X), math.clamp(vec.Y, min.Y, max.Y), math.clamp(vec.Z, min.Z, max.Z))
end

function Math:Lerp(a, b, t)
    return a + (b - a) * t 
end

function Math:LerpVector(vec1, vec2, t)
    return Vector3.new(self:Lerp(vec1.X, vec2.X, t), self:Lerp(vec1.Y, vec2.Y, t), self:Lerp(vec1.Z, vec2.Z, t))
end

function Math:Magnitude(vec)
    return math.sqrt(vec.X^2 + vec.Y^2 + vec.Z^2) 
end

function Math:Normalize(vec)
    local mag = self:Magnitude(vec) return mag == 0 and Vector3.zero or vec / mag 
end

function Math:DotProduct(vec1, vec2)
    return vec1.X * vec2.X + vec1.Y * vec2.Y + vec1.Z * vec2.Z 
end

function Math:CrossProduct(vec1, vec2)
    return Vector3.new(vec1.Y * vec2.Z - vec1.Z * vec2.Y, vec1.Z * vec2.X - vec1.X * vec2.Z, vec1.X * vec2.Y - vec1.Y * vec2.X)
end

function Math:ApproxEqual(a, b, epsilon)
    epsilon = epsilon or 1e-6 return math.abs(a - b) <= epsilon 
end

function Math:ApproxEqualVector(vec1, vec2, epsilon)
    return self:ApproxEqual(vec1.X, vec2.X, epsilon) and self:ApproxEqual(vec1.Y, vec2.Y, epsilon) and self:ApproxEqual(vec1.Z, vec2.Z, epsilon) 
end

function Math:RotateVector(Vec, Rotation)
    local Cosine = math.cos(math.rad(Rotation))
    local Sine = math.sin(math.rad(Rotation))
    return Vector2.new(Cosine * Vec.X - Sine * Vec.Y, Sine * Vec.X + Cosine * Vec.Y)
end

function Math:ToVector(Vec)
    return Vector2.new(Vec.X, Vec.Y)
end

function Math:ToRot(Angle)
    return Vector2.new(math.sin(math.rad(Angle)), math.cos(math.rad(Angle)))
end

function Math:Round(Value)
    if typeof(Value) == "number" then
        return math.floor(Value)
    elseif typeof(Value) == "Vector2" then
        return Vector2.new(self:Round(Value.X), self:Round(Value.Y))
    elseif typeof(Value) == "Vector3" then
        return Vector3.new(self:Round(Value.X), self:Round(Value.Y), self:Round(Value.Z))
    end
end

return Math
