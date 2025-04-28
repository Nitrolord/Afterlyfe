-- Kills player who touches the part you put it in

script.Parent.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health = 0
	end
end)
