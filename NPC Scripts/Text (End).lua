-- Put this in a ModuleScript

-- kicks player
function _G.kick2()
	local player = game:GetService("Players").LocalPlayer;
	player:Kick("c? ?h? ?e? ?r? ?i? ?s? ?h? ? ?y? ?o? ?u? ?r? ? ?j? ?o? ?u? ?r? ?n? ?e? ?y?");	
end;

local Text = {
	
	makePlayerAnchored = true;
	
	defaultNpcText = { -- beginning of dialog
		functionsBefore = {}; -- functions that run before text is displayed
		text = "...";
		choices = {
			end1 =  { 
				text = "Is this... it? Is this the meaning of life?";
				nextChoice = "end1r";
			};			
		};
		functionsAfter = {}; -- functions that run after text is displayed
		exitsAfterDisplay = false;
	};
	
	end1r = {
		functionsBefore = {};
		text = "I t  i s  t h e  e n d  o f  y o u r  j o u r n e y .";
		choices = {
			end2 = {
				text = "But... there's nothing here.";
				nextChoice = "end2r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end2r = {
		functionsBefore = {};
		text = ". . .";
		choices = {
			end3 = {
				text = "With how complex the path I took to get here was, I expected the end to be equally impressive.";
				nextChoice = "end3r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end3r = {
		functionsBefore = {};
		text = "A n d  y o u  s e e  n o w  t h a t  t h a t  i s  n o t  a l w a y s  t r u e .  S o m e t i m e s ,  t h e  p a t h  j u s t . . .  e n d s .";
		choices = {
			end4 = {
				text = "Yeah.";
				nextChoice = "end4r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end4r = {
		functionsBefore = {};
		text = "W h a t  d i d  y o u  f e e l  d u r i n g  y o u r  j o u r n e y ?";
		choices = {
			end5_1 = {
				text = "Joy.";
				nextChoice = "end5r";
			};
			end5_2 = {
				text = "Pain.";
				nextChoice = "end5r";
			};
			end5_3 = {
				text = "Joy and pain.";
				nextChoice = "end5r";
			};
			end5_4 = {
				text = "I'm not sure, but definitely something.";
				nextChoice = "end5r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end5r = {
		functionsBefore = {};
		text = "A n d  w h a t  d o  y o u  f e e l  n o w ?";
		choices = {
			end6 = {
				text = "Nothing.";
				nextChoice = "end6r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end6r = {
		functionsBefore = {};
		text = ". . .";
		choices = {
			end7 = {
				text = "Look, this was an interesting dream, but I'm ready to go back to the real world. Can you wake me up now?";
				nextChoice = "end7r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end7r = {
		functionsBefore = {};
		text = "A s  I ' v e  s a i d ,  y o u ' v e  r e a c h e d  t h e  e n d  o f  y o u r  j o u r n e y .";
		choices = {
			end8 = {
				text = "...";
				nextChoice = "end8r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end8r = {
		functionsBefore = {};
		text = ". . .";
		choices = {
			end9 = {
				text = "You don't mean...";
				nextChoice = "end9r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end9r = {
		functionsBefore = {};
		text = ". . .";
		choices = {
			end10 = {
				text = "...";
				nextChoice = "end10r";
			};
		};
		functionsAfter = {};
		exitsAfterDisplay = false;
	};
	
	end10r = {
		functionsBefore = {};
		text = "A r e  y o u  r e a d y  t o  m o v e  o n ?";
		choices = {};
		functionsAfter = {
			-- Selecting this dialog option kicks the player
			f1 = function()
				_G.kick2()
			end;	
		};
		exitsAfterDisplay = true;
	};
};

return Text
