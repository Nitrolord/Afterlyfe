-- Removes player's face

function onTouched(hit) 
	hit.Parent.Head.face.Texture = ""
end 

script.Parent.Touched:connect(onTouched)