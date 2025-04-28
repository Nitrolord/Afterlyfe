-- Put inside the part you want to float (should be called "Middle" on the angels

-- Makes NPC float up and down slightly

function a() 
	for i = 1, 25 do 
		wait() 
		script.Parent.CFrame = script.Parent.CFrame * CFrame.new(0, 0.05, 0) 
	end 
end 

function b() 
	for i = 1, 25 do 
		script.Parent.CFrame = script.Parent.CFrame * CFrame.new(0, -0.05, 0) 
		wait() 
	end 
end 

while true do  
	a() 
	b() 
end 
