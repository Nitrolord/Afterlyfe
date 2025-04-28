-- Put inside NPC model
-- Handles main functions of NPC dialog GUI - displays it for player who selected prompt when prompt is selected, hides it when exit is selected

local character = script.Parent
local promptPart = character:WaitForChild("PromptPart")
local prompt = promptPart:WaitForChild("ProximityPrompt")
local npcGUI = character:WaitForChild("NPCText")

prompt.ObjectText = character.Name
npcGUI:WaitForChild("Frame"):WaitForChild("NPCName").Text = character.Name

local exitEvent

prompt.Triggered:Connect(function(player)
	if player.Character:WaitForChild("Humanoid").Health > 0 then
		npcGUI.Enabled = true
		local playerGui = player.PlayerGui

		local clone = npcGUI:Clone()
		clone.Parent = playerGui
		
		local playerScript = clone:WaitForChild("NPCTextClient")
		playerScript.Enabled = true
		
		prompt.Enabled = false
		
		if require(playerScript:WaitForChild("Text")).makePlayerAnchored then
			player.Character:WaitForChild("HumanoidRootPart").Anchored = true
		end
		
		exitEvent = clone:WaitForChild("Exit")
		exitEvent.OnServerEvent:Connect(function(player)
			prompt.Enabled = true
		end)
	end
end)
