-- Nuclear Defuse v 2.0 for Renewation

	IsLog = false
	IsTest = false

    setText=GetData("Renew.NDTitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.NDTXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.NDObj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.NDObj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.NDObj3")
    SetData("Renew.BriefObj3", setText)
	
	SetWormsCount = 4
	SetTeamsCount = 0
	WormsCountBackup = 0
    
    ActiveWormIndex = nil
    ActiveTeamIndex = nil  

	IsTeamEnable = {false,false,false,false} -- включены ли команды	

    isSpawns = true -- в Renewation режиме включит  расстановку на спауны 
	if(isTest)then
		SpawnDelayValue = 1
		SpawnDelay = {1,1,1,1}
	end
    DeadStack = {{},{},{},{}} -- список индексов умерших червей
    DeadStackLength = {0,0,0,0}
    DeadCounter = {1,1,1,1}
    WormsNum = {0,0,0,0} -- количество живых червей
	StepPowerMin = 5 -- минимальный прирост готовности удара за ход / скорость снижения готовности
	StepPowerMax = 20 -- прирост готовности при приближении к базе в упор

	NuclearAttack = {0,0,0,0} -- процент готовности атаки по базам команд
	BasePosition = {{x = 0, y = 0, z = 0},{x = 0, y = 0, z = 0},{x = 0, y = 0, z = 0},{x = 0, y = 0, z = 0}}
   
	BeaconTaken = -1 -- -1 = ма€к не взят, иначе номер команды, у которой ма€к
	BeaconCarrier = nil -- ид черв€, у которого маяк
	UnspawningWorms = false
	UnspawningCrates = false
	
	ModeInfoTitle = GetData("RenewTXT.NDInfoTitle")
	ModeInfoText = GetData("RenewTXT.NDInfoText")
	ModeOpt1Text = GetData("RenewTXT.NDOpt1Text")
	ModeOpt2Text = GetData("RenewTXT.NDOpt2Text")
	ModeOpt3Text = GetData("RenewTXT.NDOpt3Text")
	ModeOpt4Text = GetData("RenewTXT.NDOpt4Text")
	ModeCancelText = GetData("RenewTXT.NDCancelText")
	ModeTeamDestroed = GetData("RenewTXT.NDTeamDestroed")

function SetupNumOfWorms()
    lock, GM = EditContainer("GM.GameInitData")
		SetTeamsCount = GM.NumberOfTeams
		IsTeamEnable[1] = true
		IsTeamEnable[2] = true
		if SetTeamsCount >= 3 then IsTeamEnable[3] = true end
		if SetTeamsCount >= 4 then IsTeamEnable[4] = true end
		SetWormsCount = GM.T1_NumOfWorms
		if IsLog == true then Re_Message("worms count 1 " .. SetWormsCount) end
		WormsCountBackup = GM.T1_NumOfWorms
		if SetTeamsCount == 3 and SetWormsCount >= 5 then SetWormsCount = 5
		elseif SetTeamsCount == 4 and SetWormsCount >= 4 then SetWormsCount = 4
		else SetWormsCount = SetWormsCount + 1 end
		GM.T1_NumOfWorms = SetWormsCount
		GM.T2_NumOfWorms = SetWormsCount
		GM.T3_NumOfWorms = SetWormsCount
		GM.T4_NumOfWorms = SetWormsCount
	CloseContainer(lock)
end
function RestoreNumOfWorms() -- восстанавливаем изначальное количество червей в схеме
    lock, GM = EditContainer("GM.GameInitData")
		GM.T1_NumOfWorms = WormsCountBackup
		GM.T2_NumOfWorms = WormsCountBackup
		GM.T3_NumOfWorms = WormsCountBackup
		GM.T4_NumOfWorms = WormsCountBackup	
	CloseContainer(lock)		
end
function CreateExtraWorms()
	if IsLog == true then Re_Message("worms count 2 " .. SetWormsCount) end
	for i = 0,SetTeamsCount-1 do
		
		local wnum = i*SetWormsCount + SetWormsCount-1 -- 0 - 4, 1 - 9, 2 - 14, 3 - 19  (6? 13?) (3? 7?)
		if IsLog == true then Re_Message("Unspawn Worm " .. wnum) end
		local wormdata = lib_GetWormContainerName(wnum)
		local lock, worm = EditContainer(wormdata)
			worm.Name = "[X] "..worm.Name
			worm.ATT_Tash = "Backpack"	
        CloseContainer(lock)
		CopyContainer(wormdata, "Worm" .. i .. ".Carrier")
		SendIntMessage("WXWormManager.UnspawnWorm", wnum)
	end
end


function Initialise()
   StartedSuddenDeath = false
   lock, scheme = EditContainer("GM.SchemeData")
		scheme.Landmine.Crate = 0
		scheme.Landmine.Ammo = 0
		scheme.Flood.Crate = 0
		scheme.Flood.Ammo = 0        
   CloseContainer(lock) 
   SetupScheme()
   RenewSettings()
   SetupNumOfWorms()
   Renew_SetupMultiplayerWormsAndTeams()    
   SendMessage("WormManager.Reinitialise")
   RestoreNumOfWorms()


   SetData("Renew.CustomTitle",ModeInfoTitle)
   SetData("Renew.CustomText",ModeInfoText)
   SetData("Renew.CustomCancel",ModeCancelText)
   Teams = QueryContainer("GM.GameInitData")
   if Teams.NumberOfTeams < 4 then SetData("Renew.CustomOption4","-") end
   if Teams.NumberOfTeams < 3 then SetData("Renew.CustomOption3","-") end

   if isIndestructable == true then  
	SetData("Land.Indestructable", 1)
   end

   SetData("Mine.DudProbability", 0)
 

   
   SetData("Camera.StartOfTurnCamera","Default")
   
   SetWormpotModes()
   NDSetup()


   SaveBasesPositions()
   WaitingForStartFirstTurn = false
   UpdateBeaconProgress()
   CreateExtraWorms() -- сохраняем и убираем "запасного" червя в каждой команде
   --SetupSchemeCrates()
   StartFirstTurn()
   
   SetupSchemeCrates()
   
   --ShowCrateList()
   
--   Activity = GetData("ObjectCount.Active")
--   if Activity == 0 then
--		WaitingForStartFirstTurn = false
--        StartFirstTurn()
--	else
--		WaitingForStartFirstTurn = true
--	end
end

function TurnStarted()
	--SpawnSchemeCrate()

    UpdateActiveWormAndTeam()
    CrateSpawner()
    TargetSpawner()
    
	local scheme = QueryContainer("GM.SchemeData")
	SendMessage("WormSelect.OptionSelected")
    TeleportIn()
    
    if Teams.NumberOfTeams >= 3 then
        Renew_LeaderAndLast ()
    end


    local isOpen = GetData("WXFEP.IsPopupOpen")
    if isOpen == 0 then SendStringMessage("WXMsg.CreatePopUp","WXFEP.RenewCustomInfo") end
	local actWorm = GetData("ActiveWormIndex")

end
function TurnEnded()
   UpdateBeaconProgress()
   TargetUnspawner()
   CheckOneTeamVictory()      
end


function Worm_Died()
    if UnspawningWorms == false then
		local deadIndex = GetData("DeadWorm.Id")
		local deadCont = lib_QueryWormContainer(deadIndex)
		local deadTeam = deadCont.TeamIndex
		if deadIndex == BeaconCarrier then
			if deadTeam == ActiveTeamIndex then 
				BeaconTaken = -1
				BeaconCarrier = -1
				CrateSpawner()
			else

				local scheme = QueryContainer("GM.SchemeData")
				local wnum = ActiveTeamIndex*SetWormsCount + SetWormsCount-1
				BeaconTaken = ActiveTeamIndex
				BeaconCarrier = wnum			
				local randomSpawn = Re_GetRandom(1, 4)
				local spawnIndex = ActiveTeamIndex * 10 + 5+randomSpawn
				if IsLog == true then Re_Message("spawn WORM" .. spawnIndex) end
				local respworm = lib_GetWormContainerName(wnum)
				CopyContainer("Worm" .. ActiveTeamIndex .. ".Carrier", respworm)
				
				local lock, worm = EditContainer(respworm)			
					worm.Spawn = "WORM"..spawnIndex
				CloseContainer(lock)
				SendIntMessage("Worm.Respawn", wnum)
			end
		end
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
end


function UpdateActiveWormAndTeam()
    ActiveWormIndex = GetData("ActiveWormIndex")
    local worm = lib_QueryWormContainer(ActiveWormIndex)
    ActiveTeamIndex = worm.TeamIndex
	if IsTeamEnable[ActiveTeamIndex+1] == false then
		SendIntMessage("WormManager.SurrenderTeamById", ActiveTeamIndex)
	end
end


function DoOncePerTurnFunctions()
    SendMessage("WormManager.GetActiveAlliances")
    AllianceCount = GetData("AllianceCount")
    if AllianceCount >1 then
        CheckSuddenDeath()
		SpawnSchemeCrate()
        DoWormpotOncePerTurnFunctions()
    end
    local wIndex
	local tIndex
	for tIndex=0,3 do
        if NuclearAttack[tIndex+1] >= 100 then
			local sp = "Boom" .. tIndex+1
            SendStringMessage("GameLogic.PlaceMine", sp)
			--Mine7Id = GetData("Mine.Id")
			SetData("Renew.CustomOption" .. tIndex+1,"-")		
			NuclearAttack[tIndex+1] = 0
			IsTeamEnable[tIndex+1] = false
			if BeaconTaken == tIndex then
				BeaconTaken = -1
				BeaconCarrier = nil
			end
			SetData("EFMV.MovieName", "Camera" .. tIndex+1)
			SendMessage("EFMV.Play")
			SendIntMessage("WormManager.SurrenderTeamById", tIndex)

        end		
	end

end


--------------------- ФУНКЦИИ ЯЩИКОВ-ЧЕМОДАНОВ И ЦЕЛЕЙ ---------------

function Crate_Collected()

    UpdateActiveWormAndTeam()
    local crateIndex = GetData("Crate.Index")
    if (crateIndex == 1) then
        BeaconTaken = ActiveTeamIndex
        BeaconCarrier = ActiveWormIndex
		TargetSpawner()
		if IsLog == true then Re_Message("Beacon Carrier "..BeaconCarrier) end
		Respawn(ActiveWormIndex,crateIndex)
    elseif (crateIndex > 1 and crateIndex <5) then
		if (ActiveWormIndex == BeaconCarrier) then
			BeaconTaken = -1
			BeaconCarrier = -1
			TargetUnspawner()
			BeaconSpawner()
		else
			Re_Message('please try another worm')
		end
	end
	
end
function CrateSpawner()
    if BeaconTaken == -1 then
        lib_SpawnCrate("Crate1")
    end
end
function TargetSpawner()
    if BeaconTaken == -1 then
        TargetUnspawner()
    end
    UpdateActiveWormAndTeam()
    if ActiveTeamIndex == BeaconTaken then
        if ActiveTeamIndex+1 ~= 1 and IsTeamEnable[1] == true then lib_SpawnCrate("Target1") end
        if ActiveTeamIndex+1 ~= 2 and IsTeamEnable[2] == true then lib_SpawnCrate("Target2") end
        if ActiveTeamIndex+1 ~= 3 and IsTeamEnable[3] == true then lib_SpawnCrate("Target3") end
        if ActiveTeamIndex+1 ~= 4 and IsTeamEnable[4] == true then lib_SpawnCrate("Target4") end
    else
        TargetUnspawner()
    end
end
function BeaconSpawner()
	lib_SpawnCrate("Crate1")
end
function TargetUnspawner()
   UnspawningCrates = true
   SendIntMessage("Crate.Delete", 2)
   SendIntMessage("Crate.Delete", 3)
   SendIntMessage("Crate.Delete", 4)
   SendIntMessage("Crate.Delete", 5)
   UnspawningCrates = false
end


function Crate_Destroyed()
    local CrateIndex = GetData("Crate.Index")
end


function Crate_Sunk()
    local CrateIndex = GetData("Crate.Index")
end


---------------------------- ФУНКЦИЯ РЕСПАУНА ЧЕРВЯ ПОСЛЕ ВЗЯТИЯ МАЯКА
function Respawn(respworm,crateIndex)
	
	UpdateActiveWormAndTeam()
    wormdataname = lib_GetWormContainerName(respworm)
	if isLog then Message('Go resp') end
    CopyContainer(wormdataname, "Worm.BeforeRespawning")
    UnspawningWorms = true
    SendIntMessage("WXWormManager.UnspawnWorm", respworm)
    lib_SetupWorm(respworm, "Worm.BeforeRespawning")
	
	local setTash = ""
	if crateIndex < 2 then setTash = "Backpack" end
	
	local spPrefix = "sp"
	local spIndex = 1
	if crateIndex > 4 then 
		spIndex = crateIndex - 4 
		spPrefix = "2sp"
	else spIndex = crateIndex end
	
    local lock, worm = EditContainer(wormdataname) 
			worm.Name="[X] "..worm.Name
			worm.Active = true 
			worm.PlayedInGame = true
			worm.ATT_Tash = setTash
			worm.Spawn = spPrefix .. spIndex
    CloseContainer(lock)	

	
    SendIntMessage("Worm.Respawn", respworm)
    UnspawningWorms = false 
   
    On(ActiveWormIndex)
    TimeRemaining = GetData("TurnTimeRemaining")
    if TimeRemaining <= 1000 then
        SendMessage("Weapon.Delete")
        SendMessage("Utility.Delete")
        SendMessage("Timer.EndRetreatTimer")
        SendMessage("Timer.EndTurn")  
        SendMessage("Weapon.DisableWeaponChange")
        EndTurn()
    end
end
function On(controller) --- Поиск активного червя и возврат ему имени после респауна
    SendMessage("GameLogic.ActivateNextWorm") 
    local w = GetData("ActiveWormIndex")
    local carrier = BeaconCarrier
    if w == controller then 
        if w == carrier then      
            local wormy = QueryContainer("Worm.BeforeRespawning") 
            local lock, worm = EditContainer(lib_GetWormContainerName(w)) 
				worm.Spawn=wormy.Spawn
            CloseContainer(lock)
        end
    else
        On(controller)
    end
end 

function UpdateBeaconProgress()
	local dist = {5000,5000,5000,5000}
	local setStepPower = 1000 / StepPowerMax
	if(BeaconTaken ~= -1) then
		local pos1 = lib_QueryWormContainer(BeaconCarrier)
		dist[1] = GetDistanceToBase(pos1.Position,BasePosition[1])
		dist[2] = GetDistanceToBase(pos1.Position,BasePosition[2])
		if Teams.NumberOfTeams > 2 then dist[3] = GetDistanceToBase(pos1.Position,BasePosition[3]) end
		if Teams.NumberOfTeams > 3 then dist[4] = GetDistanceToBase(pos1.Position,BasePosition[4]) end
		if IsLog == true then Re_Message("dist 1 "..dist[1]) end
		if IsLog == true then  Re_Message("dist 2 "..dist[2]) end
		if IsLog == true then Re_Message("dist 3 "..dist[3]) end
		if IsLog == true then  Re_Message("dist 4 "..dist[4]) end
		local maxTeams = Teams.NumberOfTeams - 1
		for i = 0,maxTeams do	
			if BeaconTaken ~= i then
				local points = 0
				if dist[i+1] < 1000 then
					points = dist[i+1] / setStepPower
					points = StepPowerMax - math.floor(points)
					if IsLog == true then Re_Message("ponts:"..points) end
				end
				NuclearAttack[i+1] = NuclearAttack[i+1] + StepPowerMin + points
			else
				NuclearAttack[i+1] = NuclearAttack[i+1] - StepPowerMin
			end
			if NuclearAttack[i+1] > 100 then NuclearAttack[i+1] = 100
			elseif NuclearAttack[i+1] < 0 then NuclearAttack[i+1] = 0 end
		end

	
	end
	if IsTeamEnable[1] == true then SetData("Renew.CustomOption1",ModeOpt1Text..NuclearAttack[1].."%") end
	if IsTeamEnable[2] == true then SetData("Renew.CustomOption2",ModeOpt2Text..NuclearAttack[2].."%") end
	if IsTeamEnable[3] == true then SetData("Renew.CustomOption3",ModeOpt3Text..NuclearAttack[3].."%") end
	if IsTeamEnable[4] == true then SetData("Renew.CustomOption4",ModeOpt4Text..NuclearAttack[4].."%") end


end
function SaveBasesPositions()
	local w
	local v3
	local wormInd = {0,0,0,0}
	wormInd[1] = 0
	wormInd[2] = SetWormsCount
	wormInd[3] = SetWormsCount * 2
	wormInd[4] = SetWormsCount * 3
	local maxTeams = Teams.NumberOfTeams - 1
	for teamIndex = 0,maxTeams do
		setInd = wormInd[teamIndex+1]
		w = lib_QueryWormContainer(wormInd[teamIndex+1])
		BasePosition[teamIndex+1] = GetVector3(w.Position)
	end
	
end


function GetDistanceToBase(pos1,vector2)
	local vector1 = GetVector3(pos1)
	local x = vector1.x - vector2.x
	x = x *x
	local y = vector1.y - vector2.y
	y = y *y
	local z = vector1.z - vector2.z
	z = z *z
	local dist = x + y + z
	dist = math.sqrt(dist)
	return (dist)
end
function GetVector3(str)
    SetData("Text.TestComment",str)
    lib_SubString("Text.TestComment","Text.TestComment","(","WVector = {")
    lib_SubString("Text.TestComment","Text.TestComment",")","}")
    local textTable = GetData("Text.TestComment")
    assert(loadstring(textTable))()	
	return WVector
end

--------------------- ”—“јЌќ¬ ј Ќј—“–ќ≈  –≈∆»ћј ------------
function NDSetup()

    lib_SpawnCrate("Crate1")
	lib_SpawnCrate("Target1")
    lib_SpawnCrate("Target2")
    lib_SpawnCrate("Target3")
    lib_SpawnCrate("Target4")
    

	local lock, weap = EditContainer("kWeaponLandmine") -- Nuclear Strike Spawner
	    weap.IsAimedWeapon = "true"
		weap.IsPoweredWeapon = "true"
		weap.MinAimAngle = -1.57
		weap.MaxAimAngle = 1.57
		weap.BasePower = 0.01
		weap.MaxPower = 0.4
		weap.OrientationOption = 1
		weap.DetonateMultiEffect = 0
		weap.StartsArmed = "true"
		weap.ArmingRadius = 20000
		weap.LifeTime = 6000
		weap.RumbleLight = 10
		weap.LaunchDelay = 80
		weap.RetreatTimeOverride = -1
		weap.PostLaunchDelay = 500
		weap.ArmingCourtesyTime = 150000
		weap.DisplayInFirstPerson = "true"
		weap.WormDamageMagnitude = 0
		weap.ImpulseMagnitude = 0
		weap.WormDamageRadius = 0
		weap.LandDamageRadius = 0
		weap.ImpulseRadius = 0
		weap.ImpulseOffset = -45
	    weap.NumBomblets = 1
	    weap.BombletMaxConeAngle = 0
	    weap.BombletMaxSpeed = 5
	    weap.BombletMinSpeed = 5
		weap.BombletWeaponName = "RenewPreNuke"
		weap.DetonationFx = ""
		weap.LoopSfx = ""
		weap.ArmSfxLoop = ""
		weap.FxLocator = ""
		weap.Scale = 3
	CloseContainer(lock)  
    SetData("Mine.DetonationType", 1)     
end


function SetupSchemeCrates()
	SchemeWeaponsMax = 0
	SchemeMysteryMax = 0
	SchemeUtilityMax = 0
	
	local scheme = QueryContainer("GM.SchemeData")

	SchemeCrateChance = scheme.RandomCrateChancePerTurn / 10
	SchemeWeaponChance = scheme.WeaponChance / 10
	SchemeMysteryChance = scheme.MysteryChance / 10
	SchemeUtilityChance = scheme.UtilityChance / 10
	SchemeHealthChance = scheme.HealthChance / 10
	SchemeHealthInCrates = scheme.HealthInCrates

	RandomCrates = {} 
    RandomCrates[1] = {name = "kWeaponAirstrike", type = "Weapon", chance = scheme.Airstrike.Crate / 10}
	RandomCrates[2] = {name = "kWeaponBananaBomb", type = "Weapon", chance = scheme.BananaBomb.Crate / 10}
	RandomCrates[3] = {name = "kWeaponBaseballBat", type = "Weapon", chance = scheme.BaseballBat.Crate / 10}
	RandomCrates[4] = {name = "kWeaponBazooka", type = "Weapon", chance = scheme.Bazooka.Crate / 10}
	RandomCrates[5] = {name = "kWeaponClusterGrenade", type = "Weapon", chance = scheme.ClusterGrenade.Crate / 10}
	RandomCrates[6] = {name = "kWeaponConcreteDonkey", type = "Weapon", chance = scheme.ConcreteDonkey.Crate / 10}
	RandomCrates[7] = {name = "kWeaponDynamite", type = "Weapon", chance = scheme.Dynamite.Crate / 10}
	RandomCrates[8] = {name = "kWeaponFirePunch", type = "Weapon", chance = scheme.FirePunch.Crate / 10}
	RandomCrates[9] = {name = "kWeaponGasCanister", type = "Weapon", chance = scheme.GasCanister.Crate / 10}
	RandomCrates[10] = {name = "kWeaponGrenade", type = "Weapon", chance = scheme.Grenade.Crate / 10}
	RandomCrates[11] = {name = "kWeaponHolyHandGrenade", type = "Weapon", chance = scheme.HolyHandGrenade.Crate / 10}
	RandomCrates[12] = {name = "kWeaponHomingMissile", type = "Weapon", chance = scheme.HomingMissile.Crate / 10}
	RandomCrates[13] = {name = "kWeaponLandmine", type = "Weapon", chance = scheme.Landmine.Crate / 10}
	RandomCrates[14] = {name = "kWeaponOldWoman", type = "Weapon", chance = scheme.OldWoman.Crate / 10}
	RandomCrates[15] = {name = "kWeaponProd", type = "Weapon", chance = scheme.Prod.Crate / 10}
	RandomCrates[16] = {name = "kWeaponSheep", type = "Weapon", chance = scheme.Sheep.Crate / 10}
	RandomCrates[17] = {name = "kWeaponShotgun", type = "Weapon", chance = scheme.Shotgun.Crate / 10}
	RandomCrates[18] = {name = "kWeaponSuperSheep", type = "Weapon", chance = scheme.SuperSheep.Crate / 10}
	RandomCrates[19] = {name = "kWeaponFlood", type = "Weapon", chance = scheme.Flood.Crate / 10}
	RandomCrates[20] = {name = "kWeaponFactoryWeapon", type = "Weapon", chance = scheme.WeaponFactoryWeapon.Crate / 10}
	RandomCrates[21] = {name = "kWeaponAlienAbduction", type = "Weapon", chance = scheme.AlienAbduction.Crate / 10}
	RandomCrates[22] = {name = "kWeaponFatkins", type = "Weapon", chance = scheme.Fatkins.Crate / 10}
	RandomCrates[23] = {name = "kWeaponScouser", type = "Weapon", chance = scheme.Scouser.Crate / 10}
	RandomCrates[24] = {name = "kWeaponNoMoreNails", type = "Weapon", chance = scheme.NoMoreNails.Crate / 10}
	RandomCrates[25] = {name = "kWeaponPoisonArrow", type = "Weapon", chance = scheme.PoisonArrow.Crate / 10}
	RandomCrates[26] = {name = "kWeaponSentryGun", type = "Weapon", chance = scheme.SentryGun.Crate / 10}
	RandomCrates[27] = {name = "kWeaponSniperRifle", type = "Weapon", chance = scheme.SniperRifle.Crate / 10}
	RandomCrates[28] = {name = "kWeaponSuperAirstrike", type = "Weapon", chance = scheme.SuperAirstrike.Crate / 10}
	RandomCrates[29] = {name = "kWeaponStarburst", type = "Weapon", chance = scheme.Starburst.Crate / 10}
	
	RandomCrates[30] = {name = "kMysteryMineLayer", type = "Mystery", chance = scheme.MineLayerMystery.Crate / 10}
	RandomCrates[31] = {name = "kMysteryMineTriplet", type = "Mystery", chance = scheme.MineTripletMystery.Crate / 10}
	RandomCrates[32] = {name = "kMysteryBarrelTriplet", type = "Mystery", chance = scheme.BarrelTripletMystery.Crate / 10}
	RandomCrates[33] = {name = "kMysteryFlood", type = "Mystery", chance = scheme.FloodMystery.Crate / 10}
	RandomCrates[34] = {name = "kMysteryDisarm", type = "Mystery", chance = scheme.DisarmMystery.Crate / 10}
	RandomCrates[35] = {name = "kMysteryTeleport", type = "Mystery", chance = scheme.TeleportMystery.Crate / 10}
	RandomCrates[36] = {name = "kMysteryQuickWalk", type = "Mystery", chance = scheme.QuickWalkMystery.Crate / 10}
	RandomCrates[37] = {name = "kMysteryLowGravity", type = "Mystery", chance = scheme.LowGravityMystery.Crate / 10}
	RandomCrates[38] = {name = "kMysteryDoubleTurnTime", type = "Mystery", chance = scheme.DoubleTurnTimeMystery.Crate / 10}
	RandomCrates[39] = {name = "kMysteryHealth", type = "Mystery", chance = scheme.HealthMystery.Crate / 10}
	RandomCrates[40] = {name = "kMysteryDamage", type = "Mystery", chance = scheme.DamageMystery.Crate / 10}
	RandomCrates[41] = {name = "kMysterySuperHealth", type = "Mystery", chance = scheme.SuperHealthMystery.Crate / 10}
	RandomCrates[42] = {name = "kMysterySpecialWeapon", type = "Mystery", chance = scheme.SpecialWeaponMystery.Crate / 10}
	RandomCrates[43] = {name = "kMysteryBadPoison", type = "Mystery", chance = scheme.BadPoisonMystery.Crate / 10}	
	RandomCrates[44] = {name = "kMysteryGoodPoison", type = "Mystery", chance = scheme.GoodPoisonMystery.Crate / 10}
	
	RandomCrates[45] = {name = "kUtilityBinoculars", type = "Utility", chance = scheme.Binoculars.Crate / 10}
	RandomCrates[46] = {name = "kUtilitySurrender", type = "Utility", chance = scheme.Surrender.Crate / 10}
	RandomCrates[47] = {name = "kUtilityBubbleTrouble", type = "Utility", chance = scheme.BubbleTrouble.Crate / 10}
	RandomCrates[48] = {name = "kUtilityArmour", type = "Utility", chance = scheme.Armour.Crate / 10}
	RandomCrates[49] = {name = "kUtilityRedbull", type = "Utility", chance = scheme.Redbull.Crate / 10}
	RandomCrates[50] = {name = "kUtilitySkipGo", type = "Utility", chance = scheme.SkipGo.Crate / 10}
	RandomCrates[51] = {name = "kUtilityChangeWorm", type = "Utility", chance = scheme.SelectWorm.Crate / 10}
	RandomCrates[52] = {name = "kUtilityParachute", type = "Utility", chance = scheme.Parachute.Crate / 10}
	RandomCrates[53] = {name = "kUtilityNinjaRope", type = "Utility", chance = scheme.NinjaRope.Crate / 10}
	RandomCrates[54] = {name = "kUtilityJetpack", type = "Utility", chance = scheme.Jetpack.Crate / 10}
	RandomCrates[55] = {name = "kUtilityGirder", type = "Utility", chance = scheme.Girder.Crate / 10}
	RandomCrates[56] = {name = "kUtilityDoubleDamage", type = "Utility", chance = scheme.DoubleDamage.Crate / 10}
	RandomCrates[57] = {name = "kUtilityCrateSpy", type = "Utility", chance = scheme.CrateSpy.Crate / 10}
	RandomCrates[58] = {name = "kUtilityCrateShower", type = "Utility", chance = scheme.CrateShower.Crate / 10}
	
	for i = 1,29 do
		SchemeWeaponsMax = SchemeWeaponsMax + RandomCrates[i].chance
	end
	for i = 30,44 do
		SchemeMysteryMax = SchemeMysteryMax + RandomCrates[i].chance
	end
	for i = 45,58 do
		SchemeUtilityMax = SchemeUtilityMax + RandomCrates[i].chance
	end
end
function SpawnSchemeCrate()
	local crateRand = Re_GetRandom(1,10)

	if SchemeCrateChance >= crateRand  then
		SetData("Crate.Index", -1)
		SetData("Crate.GroundSnap", 1)
		local crateRand = Re_GetRandom(1,16)
		SetData("Crate.Spawn", "RandomCrate" .. crateRand)
		SetData("Crate.RandomSpawnPos", 0)
		SetData("Crate.Type", RandomCrates[2].type)
		SetData("Crate.Contents", RandomCrates[2].name ) 
		SetData("Crate.NumContents", 1)
		SetData("Crate.GroundSnap", 1)
		SetData("Crate.Gravity", 1)
		SetData("Crate.TeamCollectable", -1)
	
		crateRand = Re_GetRandom(1,SchemeWeaponChance+SchemeMysteryChance+SchemeUtilityChance+SchemeHealthChance)

		local setCol = 0
		if crateRand <= SchemeWeaponChance then
			SetData("Crate.Type", "Weapon")
			SetData("Crate.NumContents", 1)
			crateRand = Re_GetRandom(1,SchemeWeaponsMax)
			setCol = 0
			for i = 1,29 do
				setCol = setCol + RandomCrates[i].chance
				if crateRand < setCol then
					SetData("Crate.Contents", RandomCrates[i].name ) 
					break
				end
			end		
		elseif crateRand <= SchemeWeaponChance+SchemeMysteryChance then
			SetData("Crate.Type", "Mystery")
			SetData("Crate.NumContents", 1)
			crateRand = Re_GetRandom(1,SchemeMysteryMax) 
			setCol = 0
			for i = 30,44 do
				setCol = setCol + RandomCrates[i].chance
				if crateRand < setCol then
					SetData("Crate.Contents", RandomCrates[i].name ) 
					break
				end
			end	
		elseif crateRand <= SchemeWeaponChance+SchemeMysteryChance+SchemeUtilityChance then
			SetData("Crate.Type", "Utility")
			SetData("Crate.NumContents", 1)
			crateRand = Re_GetRandom(1,SchemeUtilityMax)
			setCol = 0
			for i = 45,58 do
				setCol = setCol + RandomCrates[i].chance
				if crateRand < setCol then
					SetData("Crate.Contents", RandomCrates[i].name ) 
					break
				end
			end		
		else
			SetData("Crate.Type", "health")
			SetData("Crate.NumContents", SchemeHealthInCrates)
			SetData("Crate.Contents", "health") 
		end
		SendMessage("GameLogic.CreateCrate")
	end

end










