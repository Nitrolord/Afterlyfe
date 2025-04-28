-- Put this in a ModuleScript

-- Sets up a Guessing object (OOP/Class)

local Guessing = {}

Guessing.__index = Guessing

function Guessing.new(newTable)
	local newGuess = setmetatable(newTable or {}, Guessing)
	newGuess.safe = newGuess.safe or math.random(3)
	return newGuess
end

return Guessing
