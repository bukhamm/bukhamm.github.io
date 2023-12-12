function Initialise()
	IsIllusionSpawned = {false,false,false}
    setText=GetData("Renew.LevelBoss3Title")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.LevelBoss3TXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.LevelBoss3Obj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.LevelBoss3Obj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.LevelBoss3Obj3")
    SetData("Renew.BriefObj3", setText)

    SetupWormsAndTeams()
	lock, scheme = EditContainer("GM.SchemeData")
		scheme.AssistedShotLevel = "AssistedShot.DisableMod"
	CloseContainer(lock)	

	SetData("TurnTime", 60000)
	SetData("RoundTime", 0)
    SetData("Camera.StartOfTurnCamera", "Default")
	
	RenewWLoadAll()
	AddWaterProof(0)
	AddWaterProof(5)
	CheckWaterProof()
    SpawnScoreCrate()
    StartFirstTurn()
	
	lib_SpawnCrate("Crate")
	lib_SpawnCrate("Crate")
	
	n = 0

    SetupInventories()
end

function SetupWormsAndTeams()

	lib_SetupTeam(0, "HumanTeam")
	lib_SetupWorm(0, "Player1")
	--lib_SetupWorm(1, "Player2")
	--lib_SetupWorm(2, "Player3")
	--lib_SetupWorm(3, "Player4")	
	--lib_SetupWorm(4, "Player5")		


-- Activate Team 1
    lock, team = EditContainer("Team.Data01") 
		team.Active = true
		team.Name = "Demon of lies"
		team.TeamColour = 1
		team.IsAIControlled = true
		team.Skill = 5
		team.FlagGfxName = "Flag.Genie"	
    CloseContainer(lock)



-- Worm 4, Team 1
    CopyContainer("Worm.Data00", "Worm.Data05")
		lock, worm = EditContainer("Worm.Data05")
		worm.Energy = 666
		worm.Name = "Demon of lies"
		worm.TeamIndex = 1
		worm.Spawn = "000Enemy1"
		worm.ATT_Hat = "WXFE.A.Hat.Hockey"
		team.ATT_Gloves = "WXFE.A.Gloves.FuManChu"		
    CloseContainer(lock)

    SendMessage("WormManager.Reinitialise")
	
end




function Crate_Collected()
    local crateIndex = GetData("Crate.Index")
    if crateIndex == 60 then
        SendStringMessage("WXMsg.CreatePopUp","WXFEP.RenewCustomTop")
    else
        DeleteIllusions()
        lib_SpawnCrate("Crate")
    end
end




function MakeIllusions()
	-- если до этого в этом ходу уже респунили червя - не дает взять контейнер
	-- почему проблема именно с 5м червем? не потому ли, что мы его проверяем на падение в воду? попробуем отключить проверку
	-- попробовать  отключать части скрипта по очереди
	-- почему оно присутствовало в роуп рейсе? и почему больше не связано со смертью червя? это другой баг?
	
	local worm = QueryContainer("Worm.Data05")
	local hpbossa = worm.Energy
	local poisonbossa = worm.PendingPoison
	if ActiveTeamIndex == 1 and hpbossa > 0 and IsWormUnspawn == false then
		IsChecking = false
		IsWormUnspawn = true
		SendIntMessage("WXWormManager.UnspawnWorm", 5)
		-- почему игры не видит червя с этим ИД, говорит он не существует... хотя при его утоплении - все ок и тот же ид респаунится.
		local lock, EditWorm = EditContainer(lib_GetWormContainerName(5))
			EditWorm.Energy = hpbossa
			EditWorm.Active = true
			EditWorm.Spawn = "spawn"
			EditWorm.PendingPoison = poisonbossa
		CloseContainer(lock)
		SendIntMessage("Worm.Respawn", 5)
		IsWormUnspawn = false
		
		if hpbossa > 0 then
		    CopyContainer("Worm.Data05", "Worm.Data06")
		    SendIntMessage("Worm.Respawn", 6)
			IsIllusionSpawned[1] = true 
			if hpbossa < 400 then
			    CopyContainer("Worm.Data05", "Worm.Data07")
		        SendIntMessage("Worm.Respawn", 7)
				IsIllusionSpawned[2] = true 
			end
			if hpbossa < 200 then
			    CopyContainer("Worm.Data05", "Worm.Data08")
		        SendIntMessage("Worm.Respawn", 8)
				IsIllusionSpawned[3] = true 
			end
		end
		IsChecking = true
	else
		DeleteIllusions()
		DeleteIllusions()
		DeleteIllusions()
	end
end
function DeleteIllusions()
	IsChecking = false
	if IsIllusionSpawned[1] == true then
		SendIntMessage("WXWormManager.UnspawnWorm", 6)
		IsIllusionSpawned[1] = false	
	elseif IsIllusionSpawned[2] == true then
		SendIntMessage("WXWormManager.UnspawnWorm", 7)
		IsIllusionSpawned[2] = false
	elseif IsIllusionSpawned[3] == true then
		SendIntMessage("WXWormManager.UnspawnWorm", 8)
		IsIllusionSpawned[3] = false
	end
	IsChecking = true
end
function Weapon_Fired()
	if IsWaterProof == true then WaterProofSaveHP() end
	DeleteIllusions()
	DeleteIllusions()
	DeleteIllusions()
end


function DoOncePerTurnFunctions()
    --DoWormpotOncePerTurnFunctions()
	EndGame()
end

function TurnStarted()


	
	MakeIllusions()
	UpdateActiveWormAndTeam()
	--Re_Message("worm ID: " .. ActiveWormIndex)
	IsChecking = true
	if IsWaterProof == true then WaterProofSaveHP() end
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


function SuperWeapon()
    local nTeam = GetData("CurrentTeamIndex")
	if nTeam == 1 then
	    n = n + 1
		
		if n == 4 then
	    	local worm = QueryContainer("Worm.Data05")
			local hpbossa = worm.Energy
			local lock, EditWorm = EditContainer(lib_GetWormContainerName(5))
        	EditWorm.Energy = hpbossa + 20
		    EditWorm.PoisonRate = 0
			EditWorm.PendingPoison = 0
			CloseContainer(lock)

            lock, delays = EditContainer("Inventory1.WeaponDelays")
            delays.Prod = delays.Prod + 1
            delays.SkipGo = delays.SkipGo + 1
            delays.NinjaRope = delays.NinjaRope + 1
            delays.Parachute = delays.Parachute + 1
            delays.Bazooka = delays.Bazooka+1
            delays.Grenade = delays.Grenade+1
            delays.Dynamite = delays.Dynamite+1
    	    delays.BaseballBat = delays.BaseballBat+1
    	    delays.HomingMissile = delays.HomingMissile+1
    	    delays.GasCanister  = delays.GasCanister+1
			delays.PoisonArrow = delays.PoisonArrow+1
			delays.BananaBomb = delays.BananaBomb+1
			delays.Airstrike = delays.Airstrike+1
			delays.SniperRifle = delays.SniperRifle+1
			delays.HolyHandGrenade = delays.HolyHandGrenade+1
            CloseContainer(lock)
	
	        lock, weapon = EditContainer("kWeaponClusterGrenade")
	        weapon.NumBomblets = 15
	        CloseContainer(lock)

			n = 0
		end
	else
	    lock, weapon = EditContainer("kWeaponClusterGrenade")
	    weapon.NumBomblets = 4
	    CloseContainer(lock)
	end
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
		inventory.Bazooka = 8
		inventory.Grenade = 7
		inventory.Shotgun = 2
		inventory.FirePunch = 2
		inventory.Dynamite = 2
		inventory.GasCanister = 1
		inventory.Girder = 4
		inventory.Jetpack = 2
		inventory.HomingMissile = 2
		inventory.PoisonArrow = 1
		inventory.ChangeWorm = 0
		inventory.HolyHandGrenade = 1
		inventory.Sheep = 1
		inventory.Airstrike = 1
		inventory.BananaBomb = 1
		inventory.SniperRifle = 2
		inventory.BaseballBat = 1
		inventory.OldWoman = 1
		inventory.Redbull = 1
		inventory.NoMoreNails = 1
		inventory.Scouser = 1
		inventory.BubbleTrouble = 1
		inventory.SuperSheep = 1
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
		inventory.Bazooka = -1
		inventory.Grenade = -1
		inventory.Dynamite = 1
		inventory.BaseballBat = 1
		inventory.HomingMissile = 2
		inventory.GasCanister  = 1
		inventory.PoisonArrow = 2
		inventory.BananaBomb = 1
		inventory.Airstrike = 0
		inventory.SniperRifle = 1
		inventory.HolyHandGrenade = 0
    CloseContainer(lock)
	
    lock, delays = EditContainer("Inventory1.WeaponDelays")
		delays.BananaBomb = 6
		delays.HolyHandGrenade = 6
		delays.HomingMissile = 2
		delays.Airstrike = 4
		delays.BubbleTrouble = 3
    CloseContainer(lock)
end