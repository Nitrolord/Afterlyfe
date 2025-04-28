-- Put this in a LocalScript and disable it
-- Put inside NPCText GUI

local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local module = require(script:WaitForChild("Text"))
local player = game:GetService("Players").LocalPlayer
local playerHumanoid = player.Character:WaitForChild("Humanoid")
local npcGUI = script.Parent
local frame = npcGUI:WaitForChild("Frame")
local buttons = frame:WaitForChild("Buttons")
local currentText = frame:WaitForChild("Text")
local template = npcGUI:WaitForChild("Template")
local exitEvent = npcGUI:WaitForChild("Exit")
local talkSound = frame:WaitForChild("TalkSound")
local isTalking = false

-- Runs a given list of functions, used in DisplayLoop
function ApplyFuction(input, functionOrder)
	if input[functionOrder] then
		for i, item in pairs(input[functionOrder]) do
			print(input[functionOrder][i])
			input[functionOrder][i]()
		end
	end
end

-- Exits the dialog
function Exit()
	if module.makePlayerAnchored then
		player.Character:WaitForChild("HumanoidRootPart").Anchored = false
	end
	exitEvent:FireServer()
	npcGUI.Enabled = false
end

-- Checks if something is in a list, used in CheckPunc
function IsInList(compare, list)
	for i, item in pairs(list) do
		if compare == list[i] then
			return true
		end
	end
	return false
end

-- Checks if, at a given index, a piece of text is one of a list of punctuation. Used in DisplayText
function CheckPunc(index, text, list)
	local currentChar = string.sub(text, index, index)
	local prevChar = string.sub(text, index - 1, index - 1)
	local nextChar = string.sub(text, index + 1, index + 1)
	if currentChar == nil then
		return false
	end
	return (IsInList(prevChar, list) or IsInList(currentChar, list)) and nextChar ~= " " and nextChar ~= "" and currentChar ~= ""
end

-- Displays text letter by letter, playing the talk sound every letter and checking if certain punctuation appear (wait time is different after
-- certain punctuation to simulate actual dialog better)
function DisplayText(newText)
	isTalking = true
	currentText.Text = ""
	for i = 0, string.len(newText.text), 1 do
		if not isTalking then 
				return 
			else
				currentText.Text = currentText.Text .. string.sub(newText.text, i, i)
				if talkSound and string.sub(newText.text, i, i):match("%a") then
					talkSound:Play()
				end
				if CheckPunc(i, newText.text, {".", "!", "?"}) then
					task.wait(0.6)
				else if CheckPunc(i, newText.text, {",", ";", ":"}) then
					task.wait(0.4)
				else 
					task.wait(0.045)
				end
			end
		end
	end
end

-- Turns scripted player response choices into buttons and displays them
function DisplayButton(buttonToDisplay)
	local button = template:Clone()
	local choice = buttonToDisplay.nextChoice
	button.Visible = true
	button.Parent = buttons
	button.Text = buttonToDisplay.text
	button.MouseButton1Click:Connect(function()
	local buttonsList = buttons:GetChildren()
		for i = 1, #buttonsList do
			if not buttonsList[i]:IsA("UIListLayout") then
				buttonsList[i]:Destroy()
			end
		end
		displayLoop(module[choice])
	end)
end

-- Main function. Applies any "before" functions, displays text, applies any "after" functions, exits if asked, displays player response buttons.
function displayLoop(input)
	ApplyFuction(input, "functionsBefore")
	DisplayText(input)
	ApplyFuction(input, "functionsAfter")
	if input.exitsAfterDisplay then
		task.wait(0.75)
		Exit()
		else if input.choices then
			for i, item in pairs(input.choices) do
				DisplayButton(input.choices[i])
			end
		end
	end
end

-- Exits if z key is pressed
local function onInputBegan(input, _gameProcessed)
	if input.KeyCode == Enum.KeyCode.Z then
		Exit()
	end
end

-- Exits if player dies
local function onHealthChange(health)
	if health <= 0 then
		Exit()
	end
end

-- Runs main function starting at the beginning of the Text script
displayLoop(module.defaultNpcText)

-- Constantly checking to see if z is pressed or player dies
UserInputService.InputBegan:Connect(onInputBegan)
playerHumanoid.HealthChanged:Connect(onHealthChange)
