-- Makes player transparent

function onTouch(part) 
	local human = part.Parent:findFirstChild("Humanoid") 
	if human ~= nil then 
		part.Parent:findFirstChild("Head").Transparency = 0.98
		part.Parent:findFirstChild("Torso").Transparency = 1
		part.Parent:findFirstChild("Left Arm").Transparency = 1
		part.Parent:findFirstChild("Right Arm").Transparency = 1
		part.Parent:findFirstChild("Left Leg").CanCollide = true
		part.Parent:findFirstChild("Left Leg").Transparency = 1
		part.Parent:findFirstChild("Right Leg").CanCollide = true
		part.Parent:findFirstChild("Right Leg").Transparency = 1
	end 
end 

script.Parent.Touched:connect(onTouch) 

