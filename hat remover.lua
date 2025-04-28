-- Removes player's hats

function onTouched(hit)
	local r = hit.Parent:GetChildren()
	for i=1, #r do
		if (r[i].className == "Accessory") then
			r[i]:remove()
		end
		if (r[i].className == "Hat") then
			r[i]:remove()
		end
	end
end

script.Parent.Touched:connect(onTouched)