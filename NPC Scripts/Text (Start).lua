-- Put this in a ModuleScript
-- Put inside NPCTextClient of the start's NPC

-- kicks player
function _G.kick()
	local player = game:GetService("Players").LocalPlayer;
	player:Kick("i? ?n? ?f? ?i? ?n? ?i? ?t? ?e? ?,? ? ?m? ?e? ?a? ?n? ?i? ?n? ?g? ?l? ?e? ?s? ?s? ? ?n? ?o? ?t? ?h? ?i? ?n? ?g?");	
end;

-- teleports player to next place
function _G.tp()
	local TeleportService = game:GetService("TeleportService")
	local player = game:GetService("Players").LocalPlayer;
	local place = 77821363910482
	if player then
		TeleportService:Teleport(place, player)
	end
end

local Text = {
	
	makePlayerAnchored = true;
	
	defaultNpcText = { -- beginning of dialog
		functionsBefore = {}; -- functions that run before text is displayed
		text = "...";
		choices = {
			hello =  { 
				text = "Hello?";
				nextChoice = "hiResponse";
			};			
		};
		functionsAfter = {}; -- functions that run after text is displayed
		exitsAfterDisplay = false;
	};
	
	hiResponse = {
		functionsBefore = {};
		text = "H e l l o .";
		choices = {
			what = {
				text = "What... is this place?";
				nextChoice = "whatResponse";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	whatResponse = {
		functionsBefore = {};
		text = "I t  i s  a  p l a c e  f o r  t h o s e  w h o  h a v e  n o t  y e t  g r a s p e d  t h e  m e a n i n g  o f  l i f e .";
		choices = {
			huh = {
				text = "Huh? What even are you? Am I dreaming?";
				nextChoice = "huhResponse";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	huhResponse = {
		functionsBefore = {};
		text = "Y o u  a r e  n e i t h e r  d r e a m i n g ,  n o r  a w a k e . . .  y e t .";
		choices = {
			well = {
				text = "Well, can you wake me up? I feel... scared.";
				nextChoice = "wellResponse";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	wellResponse = {
		functionsBefore = {};
		text = "I  c a n  m o v e  y o u  o n  f r o m  t h i s  p l a c e ,  b u t  y o u  m a y  n o t  b e  r e a d y  f o r  w h a t  a w a i t s  y o u .";
		choices = {
			ok = {
				text = "Okay, I'll bite. How can I be ready?";
				nextChoice = "readyResponse";
			};
			nok = {
				text = "I don't care. Get me out of here.";
				nextChoice = "outResponse";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	outResponse = {
		functionsBefore = {};
		text = "A s  y o u  w i s h .";
		choices = {};
		functionsAfter = {
			-- Selecting this dialog option kicks the player
			f1 = function()
				_G.kick()
			end;
		};
		exitsAfterDisplay = true;
	};
	
	readyResponse = {
		functionsBefore = {};
		text = "E x i t  t h i s  c h u r c h  a n d  s e e .";
		choices = {};
		functionsAfter = {
			-- Selecting this dialog option teleports the player to the next place
			f2 = function()
				_G.tp()
			end;	
		};
		exitsAfterDisplay = true;
	};
};

return Text
