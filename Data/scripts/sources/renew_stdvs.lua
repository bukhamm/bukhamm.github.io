
-- standard VS game

function Initialise()
   StartedSuddenDeath = false
   
   SetupScheme()
   RenewSettings()
   Renew_SetupMultiplayerWormsAndTeams()
   --lib_SetupMultiplayerWormsAndTeams()
   SendMessage("WormManager.Reinitialise")

   RenewMines()   
--lib_SetupMinesAndOildrums() -- do this after worms are set up to get correct worm collision
   if isIndestructable == true then  
	SetData("Land.Indestructable", 1)
   end
   local scheme = QueryContainer("GM.SchemeData")
   if scheme.RoundTime == 0 then
      StartSuddenDeath() -- do this after worms are set up to readjust health
      local GameOver = GetData("FCS.GameOver")
      -- do no further processing if sudden death drew the game
      if GameOver ~= 0 then
         return 
      end
   end
   
   if scheme.MineFactoryOn == true then
      SendMessage("GameLogic.CreateRandMineFactory")
   end
   
   if scheme.TelepadsOn == true then
       SendMessage("GameLogic.PlaceTelepads")       
   end
   
   SetData("Camera.StartOfTurnCamera","Default")
   
   SetWormpotModes()

   WaitingForStartFirstTurn = false
   StartFirstTurn()
--   Activity = GetData("ObjectCount.Active")
--   if Activity == 0 then
--		WaitingForStartFirstTurn = false
--        StartFirstTurn()
--	else
--		WaitingForStartFirstTurn = true
--	end
end


function SetSpecialWeapon(TeamIndex, WeaponName)
   SetData("SpecialWeapon.TeamIndex", WormIndex)
   SetData("SpecialWeapon.Weapon", WeaponName)
   SendMessage("GameLogic.SetSpecialWeapon")

   -- TODO
   -- uses GameLogicService to call inventory.SetWeaponCount(0, -1)
end



function DoOncePerTurnFunctions()
   -- skip all this if the end of the deathmatch
    SendMessage("WormManager.GetActiveAlliances")
    AllianceCount = GetData("AllianceCount")
    if AllianceCount >1 then
        CheckSuddenDeath()
        SendMessage("GameLogic.DropRandomCrate")
        SendMessage("GameLogic.StartMineFactory")
        DoWormpotOncePerTurnFunctions()
    end
end



function SetupScheme()

    local scheme = QueryContainer("GM.SchemeData")
   
    if scheme.FallDamage == 0 then
--       -- Don't override the wormpot setting
--       local Wormpot = QueryContainer("WormPot")
--       if Wormpot.FallingHurtsMore == false then
--           SetData("Worm.FallDamageRatio", 0)
--      end

		SendMessage("GameLogic.SetNoFallDamage")
    end
   
    SetData("HUD.Clock.DisplayRoundTime", scheme.DisplayTime)
    SetData("Crate.HealthInCrates", scheme.HealthInCrates)
    SetData("DefaultRetreatTime", scheme.LandTime)
    SetData("Land.Indestructable", GetData("FE.Land.Ind"))
    SetData("Wind.Cap", scheme.WindMaxStrength)

    SetupInventoriesAndDelays()
    SetupTeleportIn()
 
    SetData("HotSeatTime", scheme.HotSeat)
    SetData("TurnTime", scheme.TurnTime)
    SetData("RoundTime", scheme.RoundTime)


end

function SetupInventoriesAndDelays()
 
   local scheme = QueryContainer("GM.SchemeData")

   lib_SetupDefaultInventoryAndDelays()
   local index
   for index = 0,3 do
       lib_SetupTeamWeaponDelays(index, "Inventory.WeaponDelays.Default")
   end

   -- If this is the first round then no matter what the stockpiling options are
   -- of if "Stockpiling Off" then give every Alliance a copy of the Scheme inventory
   local RoundsCompleted = GetData("GameOver.RoundNumber")
   if RoundsCompleted == 0 or scheme.Stockpiling == 0 then
      CopyContainer("Inventory.Alliance.Default", "Inventory.Alliance00")
      CopyContainer("Inventory.Alliance.Default", "Inventory.Alliance01")
      CopyContainer("Inventory.Alliance.Default", "Inventory.Alliance02")
      CopyContainer("Inventory.Alliance.Default", "Inventory.Alliance03")
   -- "Stockpiling" this option gives the alliance the total of the default and the stockpile
   elseif scheme.Stockpiling == 1 then
      for i = 0,3 do
         InventoryName = lib_GetAllianceInventoryName(i)
         StockpileName = lib_GetStockpileInventoryName(i)
         CopyContainer("Inventory.Alliance.Default", InventoryName)
         SetData("GameLogic.AddInventory.Arg0", InventoryName)
         SetData("GameLogic.AddInventory.Arg1", StockpileName)
         SendMessage("GameLogic.AddInventory")
      end
   -- "Stockpiling Anti" (Stock continues to decrement throught all turns)
   elseif scheme.Stockpiling == 2 then 
      CopyContainer("Inventory.Stockpile00", "Inventory.Alliance00")
      CopyContainer("Inventory.Stockpile01", "Inventory.Alliance01")
      CopyContainer("Inventory.Stockpile02", "Inventory.Alliance02")
      CopyContainer("Inventory.Stockpile03", "Inventory.Alliance03")
   end

   -- Special weapons
   -- if option is enabled then the Alliance inventories are supplemented with
   -- the combined special weapons of all the teams
   GM = QueryContainer("GM.GameInitData")
   if scheme.Special == 1 then
       -- only add in the specials when we add the full inventories
       if RoundsCompleted == 0 or scheme.Stockpiling == 0 or scheme.Stockpiling == 1 then
          if GM.NumberOfTeams>=1 then 
             IncrementAlliedInventory(GM.T1_AlliedGroup, GM.T1_SWeapon)
          end
          if GM.NumberOfTeams>=2 then 
             IncrementAlliedInventory(GM.T2_AlliedGroup, GM.T2_SWeapon)
          end
          if GM.NumberOfTeams>=3 then 
             IncrementAlliedInventory(GM.T3_AlliedGroup, GM.T3_SWeapon)
          end
          if GM.NumberOfTeams>=4 then 
             IncrementAlliedInventory(GM.T4_AlliedGroup, GM.T4_SWeapon)
          end
       end
   end
   

    RenewMiniMods() -- включает дополнительные настройки оружия


end


function IncrementAlliedInventory(AlliedGroup, Weapon)
   local InventoryName = lib_GetAllianceInventoryName(AlliedGroup)
   SetData("GameLogic.AddInventory.Arg0", InventoryName)
   SetData("GameLogic.AddInventory.Arg1", Weapon)
   SendMessage("GameLogic.IncrementInventory")
end


function Stockpile()
   -- record the remaining stock for future rounds
   CopyContainer("Inventory.Alliance00", "Inventory.Stockpile00")
   CopyContainer("Inventory.Alliance01", "Inventory.Stockpile01")
   CopyContainer("Inventory.Alliance02", "Inventory.Stockpile02")
   CopyContainer("Inventory.Alliance03", "Inventory.Stockpile03")
end



function RoundOver()
   Stockpile()
end

function TurnStarted()
		   local scheme = QueryContainer("GM.SchemeData")
		   if scheme.WormSelect == 1 then
		      SendMessage("WormSelect.OptionSelected")
		   end
   TeleportIn()
   Teams = QueryContainer("GM.GameInitData")
   if Teams.NumberOfTeams >= 3 then
   	Renew_LeaderAndLast ()
   end

end



function SetupTeleportIn()
   -- Must do this BEFORE call to ReinitialiseWorms
   local scheme = QueryContainer("GM.SchemeData")
   local WormIndex = 0
   local DataId = lib_GetWormContainerName(WormIndex)
   while DataId ~= "" do
      
      lock, worm = EditContainer(DataId)
      if scheme.TeleportIn == 1 then
         worm.TeleportIn = true
      else
         worm.TeleportIn = false
      end
      CloseContainer(lock)
      
      WormIndex = WormIndex + 1
      DataId = lib_GetWormContainerName(WormIndex)
   end
end


function TeleportIn()
   local CurrentWorm = GetData("ActiveWormIndex")
   if CurrentWorm ~= -1 then
      local DataId = lib_GetWormContainerName(CurrentWorm)
      local worm = QueryContainer(DataId)
      if worm.TeleportIn == true then
         SendMessage("WormManager.TeleportIn")
      end
   end
end




function Timer_GameTimedOut()
   -- game over dealth with in CheckSuddenDeath()
end


function CheckSuddenDeath()

   -- dont start or continue sudden death if a win is pending
   -- ie. if a team already won dont risk killing it due to sudden death
   SendMessage("WormManager.GetActiveAlliances")
   local AllianceCount = GetData("AllianceCount")

   if AllianceCount>1 then
      local RoundTimeRemaining = GetData("RoundTimeRemaining")
   
      if RoundTimeRemaining == 0 and StartedSuddenDeath==false then
         StartSuddenDeath()
      end

      -- Tell game water is about to rise, so as not to award kills
      SendMessage( "GameLogic.AboutToWaterRise" )
      
      -- Raise the water level
      SetData("Water.Level", GetData("Water.Level") + GetData("Water.RiseSpeed.Current") )
   end
end


function StartSuddenDeath()
   -- called at start if No game timer

   -- Set Sudden Death Options
   -- (0 = One health, 1 = Water rise, 2 = GameOver)

   StartedSuddenDeath = true

   local scheme = QueryContainer("GM.SchemeData")
   if scheme.SuddenDeath == 0 then
      SendMessage("Comment.SuddenDeath")
      lib_SetAllWormsEnergy(1)
   -- unecessary (we can switch it on and off by the later level rise button)
   elseif scheme.SuddenDeath == 1 then
      SendMessage("Comment.SuddenDeath")
   elseif scheme.SuddenDeath == 2 then
      RoundOver()
      SendMessage("GameLogic.Draw")
   end
   
   -- Set Water Rise Speed
   -- (0 = No Rise, 1 = Slow rise, 2 = Medium rise, 3 = fast rise)
   if scheme.WaterSpeed == 0 then
      SetData("Water.RiseSpeed.Current", 0)
   elseif scheme.WaterSpeed == 1 then
      SetData("Water.RiseSpeed.Current", GetData("Water.RiseSpeed.Slow") )
   elseif scheme.WaterSpeed == 2 then
      SetData("Water.RiseSpeed.Current", GetData("Water.RiseSpeed.Medium") )
   elseif scheme.WaterSpeed == 3 then
      SetData("Water.RiseSpeed.Current", GetData("Water.RiseSpeed.Fast") )
   end


end



-- If there was some activity its finished now
function GameLogic_NoActivity()

   if WaitUntilNoActivity == true then
      SendMessage("Timer.StartPostActivity")
      WaitUntilNoActivity = false
   end
   
   if WaitingForStartFirstTurn == true then
      StartFirstTurn()
      WaitingForStartFirstTurn = false
   end
   
end


function Worm_Died()
   -- if there is only one team left abort the turn now rather than wait on
   SendMessage("WormManager.GetActiveAlliances")
   AllianceCount = GetData("AllianceCount")
   if AllianceCount < 2 then
      SendMessage("Weapon.Delete")
      SendMessage("Utility.Delete")
      SendMessage("Timer.EndTurn") 
      SendMessage("Weapon.DisableWeaponChange")
		EndTurn()
   end
end
