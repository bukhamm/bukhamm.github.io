function Initialise()

    setText=GetData("Renew.LevelBoss2Title")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.LevelBoss2TXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.LevelBoss2Obj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.LevelBoss2Obj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.LevelBoss2Obj3")
    SetData("Renew.BriefObj3", setText)


	ActiveWormIndex = nil
	ActiveTeamIndex = nil
	
    SetupWormsAndTeams()
	lock, scheme = EditContainer("GM.SchemeData")
		scheme.AssistedShotLevel = "AssistedShot.DisableMod"
	CloseContainer(lock)	
	SetData("TurnTime", 30000)
	SetData("RoundTime", 0)
    SetData("Camera.StartOfTurnCamera", "Default")
	AddWaterProof(4)
	CheckWaterProof()
    SpawnScoreCrate()
    StartFirstTurn()
    n = 0
	WaterLevel = 0

	lock, AIParams = EditContainer("AIParams.Worm04") 
	AIParams.WeightingPreferAttackHumans = 5000
	CloseContainer(lock)
	
	lock, AIParams = EditContainer("AIParams.Worm05") 
	AIParams.WeightingPreferAttackHumans = 5000
	CloseContainer(lock)
	
	lock, AIParams = EditContainer("AIParams.Worm06") 
	AIParams.WeightingPreferAttackHumans = 5000
	CloseContainer(lock)
	
	lock, AIParams = EditContainer("AIParams.Worm07") 
	AIParams.WeightingPreferAttackHumans = 5000
	CloseContainer(lock)
	
    SetWormpotModes()
    SetupInventories()
	RenewWLoadAll()
end

function SetWormpotModes()
end

function SetupWormsAndTeams()

	lib_SetupTeam(0, "HumanTeam")
	lib_SetupWorm(0, "Player1")
	lib_SetupWorm(1, "Player2")
	lib_SetupWorm(2, "Player3")
	lib_SetupWorm(3, "Player4")	

-- Activate Team 1
    lock, team = EditContainer("Team.Data01") 
    team.Active = true
    team.Name = "Captain"
    team.TeamColour = 1
    team.ATT_Hat = "WXFE.A.Hat.Pirate"
    team.ATT_Gloves = "WXFE.A.Gloves.Pirate.W"
    team.ATT_Glasses = "Hat.Baseball.T17"
    team.ATT_Tash = "WXFE.A.Mustache.Afro.G"
    team.FlagGfxName = "Flag.DinoSkull"
    team.IsAIControlled = true
    team.Skill = 3
    CloseContainer(lock)

-- Activate Team 2
    lock, team = EditContainer("Team.Data02") 
    team.Active = true
    team.Name = "Sailors"
    team.TeamColour = 1
	team.ATT_Hat = "Hat.Baseball.T17"
    team.ATT_Gloves = "WXFE.A.Gloves.Pirate"
    team.ATT_Glasses = "Hat.Baseball.T17"
    team.ATT_Tash = "WXFE.A.Mustache.Scott"
    team.FlagGfxName = "Flag.DinoSkull"
    team.IsAIControlled = true
    team.Skill = 3
    CloseContainer(lock) -- must close the container ASAP



-- Worm 4, Team 1
    CopyContainer("Worm.Data00", "Worm.Data04")
    lock, worm = EditContainer("Worm.Data04")
		worm.Energy = 430 
		worm.Name = "Captain"
		worm.SfxBankName = "voknigh"
		worm.TeamIndex = 1
		worm.Spawn = "000Enemy1"
    CloseContainer(lock)

-- Worm 8, Team 2
    CopyContainer("Worm.Data00", "Worm.Data05")
    lock, worm = EditContainer("Worm.Data05")
		worm.Energy = 70 
		worm.Name = "Sailor"
		worm.TeamIndex = 2
		worm.SfxBankName = "voknigh"
		worm.Spawn = "000Enemy2"
    CloseContainer(lock)
-- Worm 9, Team 2
    CopyContainer("Worm.Data05", "Worm.Data06")
		lock, worm = EditContainer("Worm.Data06") 
		worm.Name = "Sailor"
		worm.Spawn = "000Enemy3"
    CloseContainer(lock)
-- Worm 10, Team 2
    CopyContainer("Worm.Data05", "Worm.Data07")
		lock, worm = EditContainer("Worm.Data07") 
		worm.Name = "Sailor"
		worm.Spawn = "000Enemy4"
    CloseContainer(lock)

    SendMessage("WormManager.Reinitialise")
	
end

function SetupInventories()
-- sets up a default container and adds our selection to it
    local inventory_lock, inventory = EditContainer("Inventory.Team.Default") 
    inventory.Prod = -1
    inventory.SkipGo = -1
	inventory.NinjaRope = -1
	inventory.Parachute = -1
    inventory.ClusterGrenade = -1
    CloseContainer(inventory_lock)
   CopyContainer("Inventory.Team.Default", "Inventory.Team00")
   CopyContainer("Inventory.Team.Default", "Inventory.Team01")
   CopyContainer("Inventory.Team.Default", "Inventory.Team02")
	
    lock, inventory = EditContainer("Inventory.Team00")
    inventory.Bazooka = 4
    inventory.Grenade = 4
	inventory.Shotgun = 1
	inventory.SniperRifle = 1
	inventory.FirePunch = 2
	inventory.Dynamite = 1
	inventory.GasCanister = 1
	inventory.Girder = 7
	inventory.Jetpack = 1
	inventory.HomingMissile = 1
	inventory.PoisonArrow = 1
	inventory.ChangeWorm = 1
	inventory.HolyHandGrenade = 1
    CloseContainer(lock)
	
    lock, delays = EditContainer("Inventory0.WeaponDelays")
    delays.Airstrike = 4
    delays.Dynamite = 1
    delays.HolyHandGrenade = 5
    delays.BananaBomb = 6
    delays.Landmine = 2
    delays.HomingMissile = 2
    delays.Sheep = 3
    delays.SuperSheep = 4
    delays.OldWoman = 3
    delays.Girder = 2
    delays.BridgeKit = 2
    delays.Shotgun = 2
    delays.ConcreteDonkey = 7
    delays.BaseballBat = 1
    delays.Flood = 6
    delays.Redbull = 2
    delays.Starburst = 3
    delays.SentryGun = 7
    delays.Fatkins = 5
    delays.PoisonArrow = 1
    delays.Scouser = 1
    delays.BubbleTrouble = 3
    delays.NoMoreNails = 5
    delays.SuperAirstrike = 5
    delays.AlienAbduction = 8
    delays.SniperRifle = 2
    CloseContainer(lock)
	
    lock, inventory = EditContainer("Inventory.Team01")
    inventory.Bazooka = 3
    inventory.Grenade = 3
    inventory.Dynamite = 1
	inventory.FirePunch = -1
	inventory.HolyHandGrenade = 1
	inventory.HomingMissile = 1
	inventory.Shotgun = 1
	inventory.GasCanister  = 0
	inventory.BaseballBat = -1
	inventory.BananaBomb = 1
	inventory.SniperRifle  = 1
	inventory.Airstrike = 1
    CloseContainer(lock)
	
    lock, delays = EditContainer("Inventory1.WeaponDelays")
    delays.Grenade = 1
	delays.HolyHandGrenade = 6
	delays.BananaBomb = 8
	delays.HomingMissile = 4
	delays.Shotgun = 3
	delays.BaseballBat = 2
	delays.Airstrike = 5
    CloseContainer(lock)
	
    lock, inventory = EditContainer("Inventory.Team02")
    inventory.Bazooka = -1
	inventory.FirePunch = -1
    inventory.BaseballBat = -1
	inventory.BananaBomb = 1
	inventory.SniperRifle = 1
    CloseContainer(lock)
	
    lock, delays = EditContainer("Inventory2.WeaponDelays")
	delays.BananaBomb = 9
	delays.HomingMissile = 6
	delays.SniperRifle = 3
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
end

function DoOncePerTurnFunctions()
    DoWormpotOncePerTurnFunctions()
	Woda()
	EndGame()
	WaterLevel = WaterLevel + 4
end
function Woda() -- update set worm level
    SetData("Water.Level", WaterLevel)
end
function Worm_WaterDeath()
	--Re_Message("water death test");
end

function TurnStarted()
	IsChecking = true
	if IsWaterProof == true then WaterProofSaveHP() end
	UpdateActiveWormAndTeam()
	--SuperWeapon()
	local isProof
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
            delays.ClusterGrenade = delays.ClusterGrenade+1
            delays.Grenade = delays.Grenade+1
            delays.Dynamite = delays.Dynamite+1
    	    delays.FirePunch = delays.FirePunch+1
    	    delays.HolyHandGrenade = delays.HolyHandGrenade+1
    	    delays.HomingMissile = delays.HomingMissile+1
    	    delays.Shotgun = delays.Shotgun+1
    	    delays.GasCanister  = delays.GasCanister+1
			delays.BaseballBat = delays.BaseballBat+1
			delays.SniperRifle  = delays.SniperRifle+1
			delays.BananaBomb = delays.BananaBomb+1
			delays.Airstrike = delays.Airstrike+1
            CloseContainer(lock)
	
	        lock, weapon = EditContainer("kWeaponFactoryCluster")
	        weapon.WormDamageMagnitude = 20
		   	weapon.ImpulseMagnitude = 0.075
		    weapon.WormDamageRadius = 40
		    weapon.LandDamageRadius = 52
		   	weapon.ImpulseRadius = 80
		   	weapon.ImpulseOffset = -25
	        CloseContainer(lock)
			
         	lock, weapon = EditContainer("kWeaponBazooka")
	        weapon.WormDamageMagnitude = 40
			weapon.ImpulseMagnitude = 0.29
			weapon.WormDamageRadius = 72
			weapon.LandDamageRadius = 104
			weapon.ImpulseRadius = 110
			weapon.ImpulseOffset = -45
			weapon.NumBomblets = 4
			weapon.BombletMaxConeAngle = 0.25
            weapon.BombletMaxSpeed = 0.56
            weapon.BombletMinSpeed = 0.38
			weapon.BombletWeaponName = "kWeaponFactoryCluster"
	        CloseContainer(lock)

	        n = 0
	    end
	else
	       	lock, weapon = EditContainer("kWeaponBazooka")
	        weapon.WormDamageMagnitude = 50
			weapon.ImpulseMagnitude = 0.29
			weapon.WormDamageRadius = 72
			weapon.LandDamageRadius = 52
			weapon.ImpulseRadius = 110
			weapon.ImpulseOffset = -45
			weapon.NumBomblets = 0
	        CloseContainer(lock)
	end
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
