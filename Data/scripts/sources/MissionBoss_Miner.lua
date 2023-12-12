function Initialise()

    setText=GetData("Renew.LevelBoss1Title")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.LevelBoss1TXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.LevelBoss1Obj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.LevelBoss1Obj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.LevelBoss1Obj3")
    SetData("Renew.BriefObj3", setText)

	CopyContainer("Boss.SchemeData", "GM.SchemeData")
	lock, scheme = EditContainer("GM.SchemeData")
		scheme.AssistedShotLevel = "AssistedShot.DisableMod"
	CloseContainer(lock)	
	SetData("TurnTime", 30000)
	SetData("RoundTime", 0)
    SetData("Camera.StartOfTurnCamera", "Default")
    SetData("Mine.DudProbability", 0)
    SetData("Mine.MinFuse", 500)
    SetData("Mine.MaxFuse", 500)
	n = 0


	
	--setup teams and worms from d/bank
	lib_SetupTeam(0, "HumanTeam")
	lib_SetupTeam(1, "EnemyTeam")

	lib_SetupWorm(0, "Player1")
	lib_SetupWorm(1, "Player2")
	lib_SetupWorm(2, "Player3")
	lib_SetupWorm(3, "Player4")
	
	lib_SetupWorm(4, "Enemy1")
	SendMessage("WormManager.Reinitialise")

--~     SendMessage("GameLogic.CrateShower")
--~     SendMessage("GameLogic.CrateShower")
--~     SendMessage("GameLogic.CrateShower")
	
	lib_SetupTeamInventory(0, "Inv_Player")
	lib_SetupTeamInventory(1, "Inv_Enemy")

    lib_SetupTeamWeaponDelays(0, "PlayerDelays")
	RenewWLoadAll()
	InvMine()

	for i = 0, 31 do	
		SendMessage("GameLogic.CreateRandomMine")
	end
	
	
	AddWaterProof(4)
	CheckWaterProof()
    SpawnScoreCrate()
	StartFirstTurn()
end

function InvMine()
    lock, mine = EditContainer("kWeaponLandmine")
		mine.Scale = 2.5
		mine.PayloadGraphicsResourceID = "D08_03"
		mine.WeaponGraphicsResourceID = "D08_03"
		mine.WormDamageRadius = 150
		mine.ImpulseRadius = 150
		mine.PreDetonationTime = 0
		mine.ArmingRadius = 120
    CloseContainer(lock)
end


function Crate_Collected()
    local crateIndex = GetData("Crate.Index")
    if crateIndex == 60 then
        SendStringMessage("WXMsg.CreatePopUp","WXFEP.RenewCustomTop")
    end
end

function DoWormpotOncePerTurnFunctions()
end

function SpawnCrate()
    SendMessage("GameLogic.DropRandomCrate")
end

function SetMines()
	for i = 0, 5 do	
		SendMessage("GameLogic.CreateRandomMine")
	end
end

function SuperWeapon()
    local nTeam = GetData("CurrentTeamIndex")
	if nTeam == 1 then
	    n = n + 1
	    if (n - 4) == 0 then
            lock, delays = EditContainer("Inventory1.WeaponDelays")
				delays.Prod = delays.Prod + 1
				delays.SkipGo = delays.SkipGo + 1
				delays.NinjaRope = delays.NinjaRope + 1
				delays.Parachute = delays.Parachute + 1
				delays.Bazooka = delays.Bazooka+1
				delays.ClusterGrenade = delays.ClusterGrenade+1
				delays.Dynamite = delays.Dynamite+1
				delays.FirePunch = delays.FirePunch+1
				delays.HolyHandGrenade = delays.HolyHandGrenade+1
				delays.HomingMissile = delays.HomingMissile+1
				delays.Airstrike = delays.Airstrike+1
				delays.GasCanister  = delays.GasCanister+1
				delays.BananaBomb = delays.BananaBomb+1
            CloseContainer(lock)
			
			lock, inventory = EditContainer("Inventory.Team01")
				inventory.Grenade = inventory.Grenade+1
			CloseContainer(lock)
					
			lock, weapon = EditContainer("kWeaponGrenade")
				weapon.WormDamageMagnitude = 25
				weapon.ImpulseMagnitude = 0.56
				weapon.WormDamageRadius = 35
				weapon.LandDamageRadius = 23
				weapon.ImpulseRadius = 220
				weapon.ImpulseOffset = -90
				weapon.PayloadGraphicsResourceID = "Factory.Proj.RazorBall"
				weapon.WeaponGraphicsResourceID = "Factory.Proj.RazorBall"
			CloseContainer(lock)
					
			n = 0
	    end
	else
	    lock, weapon = EditContainer("kWeaponGrenade")
			weapon.WormDamageMagnitude = 55
			weapon.ImpulseMagnitude = 0.28
			weapon.WormDamageRadius = 75
			weapon.LandDamageRadius = 46
			weapon.ImpulseRadius = 110
			weapon.ImpulseOffset = -45
			weapon.PayloadGraphicsResourceID = "Factory.Proj.Grenade"
			weapon.WeaponGraphicsResourceID = "Grenade.Weapon"				
	    CloseContainer(lock)
	end
end



function DoOncePerTurnFunctions()
    DoWormpotOncePerTurnFunctions()
	SetMines()
	InvMine()
	EndGame()
end

function TurnStarted()
	IsChecking = true
	if IsWaterProof == true then WaterProofSaveHP() end
	UpdateActiveWormAndTeam()
	SpawnCrate()
	SuperWeapon()
end

function EndGame()
   SendMessage("WormManager.GetActiveAlliances")
   local nAllianceCount = GetData("AllianceCount")
   SendMessage("WormManager.GetSurvivingTeam")
   local nWhichTeam = GetData("SurvivingTeamIndex")

   if nAllianceCount == 0 then
      SendMessage("GameLogic.Challenge.Failure")
   elseif nAllianceCount == 1 and nWhichTeam ~= 0 then
      SendMessage("GameLogic.Challenge.Failure")
   elseif nAllianceCount == 1 and nWhichTeam == 0 then
      SendMessage("GameLogic.Challenge.Success")
   end
end