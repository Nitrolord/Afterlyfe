-- Creates a new Guessing object and disarms the safe guess

local Guessing = require(script.Guessing)
local Children = script.Parent:GetChildren()

local new = Guessing.new()

for i = 1, #Children do
	if Children[i].ClassName == "Part" then
		if Children[i].Name == tostring(new.safe) then
			Children[i].KillScript.Enabled = false
		end
	end
end

local correct = {}
