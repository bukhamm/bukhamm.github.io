-- Bridge Build game for Innovation modification



-- standard VS game

function Initialise()
    isSpawns = true -- в Renewation режиме включит  расстановку на спауны 
    isNoFly = true
    isGirder = false



    setText=GetData("Renew.BBTitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.BBTXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.BBObj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.BBObj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.BBObj3")
    SetData("Renew.BriefObj3", setText)




                
   StartedSuddenDeath = false   
   SetData("Weapon.Girder.MaxDistance", 55)
   
   SetupScheme()
    for NumberTeam = 0, 3 do
	local lock, inventory = EditContainer("Inventory.Alliance0" .. (NumberTeam)) 
       	inventory.Airstrike = 0
       	inventory.AlienAbduction = 0
       	inventory.OldWoman = 0
       	inventory.Scouser = 0
		inventory.Sheep = 0
		inventory.SuperSheep = 0
		inventory.WeaponFactoryWeapon = 0
		inventory.Fatkins = 0
		inventory.ConcreteDonkey = 0
		inventory.Girder = -1
	CloseContainer(lock)
    end
    RenewSettings()
    Renew_SetupMultiplayerWormsAndTeams()
    SendMessage("WormManager.Reinitialise")
    


   --RenewMines()   
--lib_SetupMinesAndOildrums() -- do this after worms are set up to get correct worm collision
   if isIndestructable == true then  
	SetData("Land.Indestructable", 1)
   end
   local scheme = QueryContainer("GM.SchemeData")


   
   SetData("Camera.StartOfTurnCamera","Default")
   
   SetWormpotModes()

   WaitingForStartFirstTurn = false
   --lib_SpawnCrate("crate")
   
    SetData("Crate.Spawn", "crate")
    SetData("Crate.Type", "custom")
    SetData("Crate.NumContents", 1)
    SetData("Crate.Contents", "")
    SetData("Crate.Index", 1)
    SetData("Crate.GroundSnap", 0)
    SetData("Crate.Gravity", 0)
    SetData("Crate.TeamDestructible", 5)
    SetData("Crate.TeamCollectable", -1)
    SetData("Crate.TrackCam", 0)
    SetData("Crate.Scale", 4)
    SetData("Crate.CustomGraphic", "D02_01")
    SendMessage("GameLogic.CreateCrate")
   
   
   
   StartFirstTurn()
--   Activity = GetData("ObjectCount.Active")
--   if Activity == 0 then
--		WaitingForStartFirstTurn = false
--        StartFirstTurn()
--	else
--		WaitingForStartFirstTurn = true
--	end
end


function Crate_Collected()

    
  SendMessage("GameLogic.Draw")
  SetData("Text.TestComment",'You Win!!!')
  lib_Comment("Text.TestComment")

  local CurrentWorm = GetData("ActiveWormIndex")
  local wormdataname = lib_GetWormContainerName(CurrentWorm)

  local lock, worm = EditContainer(wormdataname) 
    TimIndx = worm.TeamIndex  
  CloseContainer(lock) 

  WinningTeam = TimIndx
  SendIntMessage("GameLogic.Win", WinningTeam)
        
end


function DoOncePerTurnFunctions()
   SendMessage("WormManager.GetActiveAlliances")
   AllianceCount = GetData("AllianceCount")
   if AllianceCount >1 then
      DoWormpotOncePerTurnFunctions()
   end
end

function TurnEnded()
   local RoundTimeRemaining = GetData("RoundTimeRemaining")
   CheckOneTeamVictory()      
end













