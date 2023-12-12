
-- Called at the start of a game
function StartFirstTurn()
   WaitUntilNoActivity = false
   SendMessage("Timer.StartGame")
   StartTurn()
end


function StartTurn()
   done_once_per_turn_functions = false
   SendMessage("GameLogic.ActivateNextWorm")
   -- do this after activating the worm so his details appear in the HUD
   SendMessage("Timer.StartHotSeatTimer") 
   --SendMessage("Weapon.Create")
   SetWind()
   --TurnStarted()
   SendMessage("GameLogic.Turn.Started") 
   TurnStarted() -- moved here so TeleportIn camera can override startofturn camera
   RunAILogic()
end


function RunAILogic()
	-- ovverride this function to now have AI.
	SendMessage("AI.PerformDefaultAITurn");
	-- actually called to start the AI turn.
	SendMessage("AI.ExecuteActions");
end

function Timer_HotSeatTimedOut()
   SendMessage("Timer.StartTurn")
end


function GameLogic_EndTurn_Immediate()
   -- this called by surrender and skip go 
   -- do all the work here as EndTurn() by itself would be illegal
   SendMessage("Weapon.Delete")
   SendMessage("Utility.Delete")
   SendMessage("Timer.EndTurn") 
   SendMessage("Weapon.DisableWeaponChange")
   EndTurn()
end


function Timer_RetreatTimedOut()
   EndTurn()
end


-- The worm whose turn it is has been damaged
function Worm_Damaged_Current()
   SendMessage("Weapon.Delete")
   SendMessage("Utility.Delete")
   SendMessage("Timer.EndRetreatTimer")
   SendMessage("Timer.EndTurn")  
   SendMessage("Weapon.DisableWeaponChange")
   EndTurn()
end


function Timer_TurnTimedOut()
   SendMessage("Weapon.Delete")
   SendMessage("Utility.Delete")
   SendMessage("Weapon.DisableWeaponChange")
   EndTurn()
end


-- Everything has come stopped moving
function Timer_PostActivityTimedOut()
   SendMessage("GameLogic.AboutToApplyDamage")
   SendMessage("GameLogic.ApplyDamage")
   CheckActivity()
end
   

function CheckActivity()
   Activity = GetData("ObjectCount.Active")
   if Activity == 0 then
      DoPostActivity()
   else
      WaitUntilNoActivity = true
   end
end

function DoPostActivity()
   if done_once_per_turn_functions == true then
      SendMessage("GameLogic.Turn.Ended") 
      TurnEnded()
   else 
      -- Done only once
      SendMessage("Net.DisableAllInput")
      SendMessage("Worm.ApplyPoison")
      SendMessage("GameLogic.AboutToApplyDamage")
      SendMessage("GameLogic.ApplyDamage")
      SetData("DoubleDamage", 0)
      DoOncePerTurnFunctions()
      done_once_per_turn_functions = true
      local GameOver = GetData("FCS.GameOver")
      -- do no further processing if sudden death drew the game
      if GameOver == 0 then
         CheckActivity() -- in case an earthquake or similar was just started
      end
   end
end


-- override this
function TurnStarted()
end

-- override this
function TurnEnded()
   CheckOneTeamVictory()      
end



-- decides if the game has been won or drawn at the end of every turn
-- Note do this last in the TurnEnded function as it finishes with the StartTurn Message
function CheckOneTeamVictory()
   -- Changed to use alliances rather than teams so 2 teams vs 1 can end correctly
   SendMessage("WormManager.GetActiveAlliances")
   AllianceCount = GetData("AllianceCount")
   if AllianceCount == 0 then
      RoundOver()
      -- all the teams have just snuffed it
      SendMessage("GameLogic.Draw")
   elseif AllianceCount == 1 then
      RoundOver()
      -- only one team remains
      -- PC: changed this call to catch naughty use of GetActiveTeamIndex usage. Use the new 
      -- call to get the last team with a worm thats alive on it.
      SendMessage("WormManager.GetSurvivingTeam")
      WinningTeam = GetData("SurvivingTeamIndex")
      SendIntMessage("GameLogic.Win", WinningTeam)
   else
      StartTurn()
   end
   
end

function EndTurn()
   -- note: could this happen multiple times per turn (eg from WormDamagedCurrent)?
   -- if so does it matter?

   -- Poisoning now moved to DoPostActivity

   SendMessage("GameLogic.EndTurn")
  
   Activity = GetData("ObjectCount.Active")
   if Activity == 0 then
      SendMessage("Timer.StartPostActivity") -- pause
   else
      WaitUntilNoActivity = true
   end
end


-- If there was some activity its finished now
function GameLogic_NoActivity()
   if WaitUntilNoActivity == true then
      -- reset WaitUntilNoActivity before calling message below because zero time might
      -- cause it to call back immediately and set it true again
      WaitUntilNoActivity = false
      SendMessage("Timer.StartPostActivity")
   end
end



function SetWind()
   SelectRandomWind()
end


function SelectRandomWind()
   -- First the speed
   SendMessage("RandomNumber.Get")
   RandomNumber = GetData("RandomNumber.Float")
   MaxWind = GetData("Wind.MaxSpeed")
   WindCap = GetData("Wind.Cap")/10 -- Scheme can set the maximum value 1-10 as appears in HUD
   SetData("Wind.Speed", WindCap*RandomNumber*RandomNumber*MaxWind) -- now squared to make high winds less common

   -- Now a direction
   SendMessage("RandomNumber.Get")
   RandomNumber = GetData("RandomNumber.Float")
   Direction = RandomNumber * 2 * 3.14
   SetData("Wind.Direction", Direction)   
end



function DoOncePerTurnFunctions()
end

function RoundOver()
end

function SetWormpotModes()
end





