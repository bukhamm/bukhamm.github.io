
function Initialise()
    setText=GetData("Renew.GGTitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.GGTXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.GGObj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.GGObj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.GGObj3")
    SetData("Renew.BriefObj3", setText)




	isLog = false
	isTest = false
	setTurnNum = 1 -- текущий ход (нельзя получить 2 уровня за 1 ход)
	actTeam = -1 -- id текущей команды
	lastTurnLevelUp = 0 -- последний ход, на котором был левел-ап
	weaponKit = {0,0,0,0,0,0} -- текущий набор ид оружек
	weaponMax = {5,4,4,5,5} -- максимальные значния ид оружек
	teamLevels = {0,0,0,0} -- уровни команд. Повышаются при уничтожении врага
	isLevelCompleted = {false,false,false,false} -- выполнен ли уровень (чтобы делать лэвэл ап в начале хода)
	hpLevels = {200,150,100,75,50,10} -- максимальное ХП червей под достижении уровня
	setHpLevels = {200,200,200,200}

	StartedSuddenDeath = false


    lock, scheme = EditContainer("GM.SchemeData")
        scheme.WeaponChance = 0
        scheme.UtilityChance = 0
        scheme.MysteryChance = 0
        scheme.HealthChance = 0
        scheme.WormSelect = false
		scheme.Airstrike.Delay = 0
		scheme.BananaBomb.Delay = 0
		scheme.ConcreteDonkey.Delay = 0
		scheme.Fatkins.Delay = 0
		scheme.HolyHandGrenade.Delay = 0
		scheme.OldWoman.Delay = 0
		scheme.Scouser.Delay = 0
		scheme.SuperSheep.Delay = 0
        --scheme.ChangeWorm.Delay = 0
        scheme.Airstrike.Delay = 0
        scheme.BaseballBat.Delay = 0
        scheme.Bazooka.Delay = 0
        scheme.BubbleTrouble.Delay = 0
        scheme.ClusterGrenade.Delay = 0
        scheme.Dynamite.Delay = 0
        scheme.FirePunch.Delay = 0
        scheme.GasCanister.Delay = 0
        scheme.Girder.Delay = 0
        scheme.Grenade.Delay = 0
        scheme.Landmine.Delay = 0
        scheme.NinjaRope.Delay = 0
        scheme.NoMoreNails.Delay = 0
        scheme.Parachute.Delay = 0
        scheme.PoisonArrow.Delay = 0
        scheme.Prod.Delay = 0
        scheme.SentryGun.Delay = 0
        scheme.Sheep.Delay = 0
        scheme.Shotgun.Delay = 0
        scheme.SkipGo.Delay = 0
        scheme.SniperRifle.Delay = 0
        scheme.SuperAirstrike.Delay = 0
        scheme.Surrender.Delay = 0
		--scheme.BubbleTrouble.Ammo = 9
    CloseContainer(lock)
   
	SetupScheme()
	--RenewSettings()
	isMaxNumOfWorms = true
	Renew_SetupMultiplayerWormsAndTeams()
	--lib_SetupMultiplayerWormsAndTeams()
	SendMessage("WormManager.Reinitialise")

   --RenewMines()   
	lib_SetupMinesAndOildrums() -- do this after worms are set up to get correct worm collision
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
   
   
	GetWeaponKit()
	MixWeaponSettings() 
 	for teamNum = 0 ,3 do
		LevelUp(teamNum)
    end	  
   
	SetData("HUD.Counter.Active", 1)

	StartFirstTurn()
--   Activity = GetData("ObjectCount.Active")
--   if Activity == 0 then
--		WaitingForStartFirstTurn = false
--        StartFirstTurn()
--	else
--		WaitingForStartFirstTurn = true
--	end
end


function GetWeaponKit()

	for i = 1,5 do
		local max = weaponMax[i]
		weaponKit[i] = Re_GetRandom(1, max)
	end
end



function TurnStarted()
	setTurnNum = setTurnNum + 1
	if(actTeam) ~= -1 then SaveEnemyHP(actTeam) end
	local actWorm = GetData("ActiveWormIndex")
	local worm = lib_QueryWormContainer(actWorm)
	actTeam = worm.TeamIndex
	
	if(isLevelCompleted[actTeam+1] == true) then
		LevelUp(actTeam)
	end
	LoadEnemyHP(actTeam)
	SetData("HUD.Counter.Value", teamLevels[actTeam+1])
end


function Worm_Died()
    local Id = GetData("DeadWorm.Id")
    local worm = lib_QueryWormContainer(Id)
    local team = worm.TeamIndex	

	SendMessage("WormManager.GetActiveAlliances")
	AllianceCount = GetData("AllianceCount")
	if AllianceCount < 2 then
		SendMessage("Weapon.Delete")
		SendMessage("Utility.Delete")
		SendMessage("Timer.EndTurn") 
		SendMessage("Weapon.DisableWeaponChange")
		EndTurn()
	end
    if team ~= actTeam then    
		if(lastTurnLevelUp < setTurnNum) then
			lastTurnLevelUp = setTurnNum
			isLevelCompleted[actTeam+1] = true
			if(teamLevels[actTeam+1] == 5) then
				SendMessage("GameLogic.Draw")
				SendIntMessage("GameLogic.Win", actTeam)				
			end
		end
    end

end
function MixWeaponSettings() -- случайно включает настройки оружия модов
	local setRandom = 0
	setRandom = Re_GetRandom(1, 2)
	if (setRandom == 2) then isWLoadVacum = true end
	setRandom = Re_GetRandom(1, 3)
	if (setRandom == 2) then isWLoadGLauncher = true elseif (setRandom == 3) then isTF2WLoadGlauncher = true end
	setRandom = Re_GetRandom(1, 3)
	if (setRandom == 2) then isWLoadBazooka = true elseif (setRandom == 3) then isTF2WLoadRocketLauncher = true end	
	setRandom = Re_GetRandom(1, 2)
	if (setRandom == 2) then isWLoadMagicBullet = true end
	setRandom = Re_GetRandom(1, 3)
	if (setRandom == 2) then isWLoadAirstrike = true elseif (setRandom == 3) then isTF2WLoadSticky = true end
	setRandom = Re_GetRandom(1, 3)
	setRandom = Re_GetRandom(1, 2)
	if (setRandom == 2) then isWLoadLandmine = true end
	if (setRandom == 2) then isWLoadPistol = true elseif (setRandom == 3) then isTF2WLoadSyringeGun = true end	
	setRandom = Re_GetRandom(1, 3)
	if (setRandom == 2) then isWLoadAK = true elseif (setRandom == 3) then isTF2WLoadScattergun = true end
	isTF2WLoadFlameThrower = true
	--setRandom = Re_GetRandom(1, 2)
	--if (setRandom == 2) then WLoadDragonball() end	
	setRandom = Re_GetRandom(1, 2)
	if (setRandom == 2) then isTF2WLoadWrench = true end
	setRandom = Re_GetRandom(1, 2)
	if (setRandom == 2) then isWLoadBuffalo = true end
	isTF2WLoadFireAxe = true
	setRandom = Re_GetRandom(1, 2)
	if (setRandom == 2) then isWLoadCluster = true end
	RenewWLoad()
	TF2WLoad() 
end
function LevelUp(setTeam)	
	local setLevel = teamLevels[setTeam+1] + 1
	teamLevels[setTeam+1] = setLevel
	isLevelCompleted[setTeam+1] = false
	setHpLevels[setTeam+1] = hpLevels[teamLevels[setTeam+1]]
	--LoadEnemyHP(setTeam)
	SetData("HUD.Counter.Value", setLevel)
	
	local setWeaponId = setLevel * 100 + weaponKit[setLevel]
	ClearInventory(setTeam)
	ChangeInventory(setTeam,setWeaponId)
end

function SaveEnemyHP(team)
	--Re_Message("load enemy hp")
	local minHp = 200
	local wormIndex
	for wormIndex = 0,15 do
		local wormCont = lib_GetWormContainerName(wormIndex)
		local worm = lib_QueryWormContainer(wormIndex)
		if worm.Energy < minHp and worm.TeamIndex ~= team and worm.Energy > 0 then minHp = worm.Energy end
	end
	setHpLevels[team+1] = minHp
end
function LoadEnemyHP(team)
--Re_Message("save enemy hp")
	local hp = setHpLevels[team+1]
	local wormIndex
	for wormIndex = 0,15 do
		local wormCont = lib_GetWormContainerName(wormIndex)
		local lock, wormy = EditContainer(wormCont)
			wormy.Energy = hp
		CloseContainer(lock)
	end	
end

function ChangeInventory (setTeam,setWeaponId)

	-- 101 HolyHandGrenade *****
	-- 102 BananaBomb *****
	-- 103 ConcreteDonkey *****
	-- 104 Fatkins **** +  vacum bomb (Fatkins) ****
	-- 105 SuperSheep ****	
	
	-- 201 Dynamite ****
	-- 202 Sheep ****
	-- 203 OldWoman ****
	-- 204 SuperAirstrike ****	-- Grenade Launcher (Super Airstrike)	-- tf2 Grenade Launcher (SuperAirstrike)

	
	-- 301 Bazooka ***	-- Boosted Bazooka (Bazooka)	-- tF2 Rocket Launcher (Bazooka)
	-- 302 HomingMissile ****		-- Magic Bullet (HomingMissile)	****	
	-- 303 Airstrike ***	-- Boosted Airstrike (Airstrike) ***	-- tf2 Sticky Launcher (Airstrike) **
	-- 304 Grenade **	

	
	-- 401 Landmine **
	-- 402 Shotgun **	-- Pistol (Shotgun)		-- tf2 SyringeGun (Shotgun)	
	-- 403 SniperRifle **	-- AK74U (SniperRifle)	-- tf2 Scattergun (SniperRifle)		
	-- 404 flameThrower (PoisonArrow)
	-- 405 Petrol Grenade (GasCanister)	

	-- 501 FirePunch *	-- Tf2 Wrench + jetpack (FirePunch)	
	-- 502 Scouser *	-- Buffalo (Scouser)
	-- 503 Fire AXE ++ jetpack (prod)
	-- 504 BaseballBat *
	-- 505 ClusterGrenade **	-- Boosted Cluster Grenade
	
	-- 38 пушек 7,5 пушек на группу



	if setWeaponId == 101 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.HolyHandGrenade = -1
		CloseContainer(lock)		
	elseif setWeaponId == 102 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.BananaBomb = -1
		CloseContainer(lock)		
	elseif setWeaponId == 103 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.ConcreteDonkey = -1
		CloseContainer(lock)		
	elseif setWeaponId == 104 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Fatkins = -1
		CloseContainer(lock)		
	elseif setWeaponId == 105 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.SuperSheep = -1
		CloseContainer(lock)
	elseif setWeaponId == 201 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Dynamite = -1
		CloseContainer(lock)	
	elseif setWeaponId == 202 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Sheep = -1
		CloseContainer(lock)	
	elseif setWeaponId == 203 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.OldWoman = -1
		CloseContainer(lock)	
	elseif setWeaponId == 204 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.SuperAirstrike = -1
		CloseContainer(lock)	
	elseif setWeaponId == 301 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Bazooka = -1
		CloseContainer(lock)	
	elseif setWeaponId == 302 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.HomingMissile = -1
		CloseContainer(lock)	
	elseif setWeaponId == 303 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Airstrike = -1
		CloseContainer(lock)	
	elseif setWeaponId == 304 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Grenade = -1
		CloseContainer(lock)	
	elseif setWeaponId == 401 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Landmine = -1
			Inventory.NinjaRope = -1
		CloseContainer(lock)	
	elseif setWeaponId == 402 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Shotgun = -1
		CloseContainer(lock)	
	elseif setWeaponId == 403 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.SniperRifle = -1
		CloseContainer(lock)	
	elseif setWeaponId == 404 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.PoisonArrow = -1
		CloseContainer(lock)	
	elseif setWeaponId == 405 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.GasCanister = -1
		CloseContainer(lock)	
	elseif setWeaponId == 501 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.FirePunch = -1
		CloseContainer(lock)	
	elseif setWeaponId == 502 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.BaseballBat = -1
		CloseContainer(lock)	
	elseif setWeaponId == 503 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Scouser = -1
		CloseContainer(lock)	
	elseif setWeaponId == 504 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.Prod = -1
			Inventory.GasCanister = -1
		CloseContainer(lock)
	elseif setWeaponId == 505 then
		local lock,Inventory = EditContainer("Inventory.Alliance0" .. setTeam)
			Inventory.ClusterGrenade = -1
		CloseContainer(lock)	
	elseif setWeaponId >= 600 then
		SendMessage("GameLogic.Draw")
		SendIntMessage("GameLogic.Win", setTeam)	
	end
end
function ClearInventory (team)
	local lock, inventory = EditContainer("Inventory.Alliance0" .. (team)) 
			inventory.Airstrike = 0
			inventory.Shotgun = 0
			inventory.HomingMissile = 0
			inventory.Sheep = 0
			inventory.ConcreteDonkey = 0
			inventory.SuperSheep = 0
			inventory.Starburst = 0
			inventory.Redbull = 0
			inventory.AlienAbduction = 0
			inventory.Fatkins = 0
			inventory.Scouser = 0
			inventory.NoMoreNails = 0
			inventory.SentryGun = 0
			inventory.SniperRifle = 0
			inventory.SuperAirstrike = 0
			inventory.Bazooka = 0
			inventory.Grenade = 0
			inventory.ClusterGrenade = 0
			inventory.Dynamite = 0
			inventory.HolyHandGrenade = 0
			inventory.BananaBomb = 0
			inventory.Landmine = 0
			inventory.BaseballBat = 0
			inventory.Prod = 0
			inventory.FirePunch = 0
			inventory.Flood = 0
			inventory.GasCanister = 0
			inventory.OldWoman = 0
			inventory.ChangeWorm = 0
			inventory.WeaponFactoryWeapon = 0
			inventory.PoisonArrow = 0
			inventory.BubbleTrouble = 0
			inventory.NinjaRope = 0
			inventory.Jetpack = 0
	CloseContainer(lock) 
end

function WLoadDragonball()

    local lock, weap = EditContainer("kWeaponGasCanister")  -- скрипт оружия Dragon Ball by Emishka
			  weap.IsAimedWeapon = "false"
              weap.IsAffectedByGravity = "false"
			  weap.IsPoweredWeapon = "false"
			  weap.Scale = "0"
			  weap.Radius = "5"
			  weap.BasePower = "0.1"
			  weap.MaxPower = "0.1"
			  weap.MinAimAngle = "0"
			  weap.MaxAimAngle = "0"
			  weap.DetonatesOnLandImpact = "true"
			  weap.DetonatesOnExpiry = "false"
			  weap.DetonatesOnObjectImpact = "true"
			  weap.DetonatesOnWormImpact = "true"
			  weap.ImpulseMagnitude = "0.18"
			  weap.WormDamageMagnitude = "40"
			  weap.WormDamageRadius = "30"
			  weap.ImpulseRadius = "60"
			  weap.ImpulseOffset = "-30"
			  weap.ArielFx = "WXP_MagicFlame"
			  weap.DetonationFx = "WXP_Buffallo_OL_BaseGlow"
			  weap.ArmSfxLoop = "FireLoop"
			  weap.LoopSfx = "FirePunch"
			  weap.LifeTime = "2000"
			  weap.HoldParticleFX = "WXP_MagicFlame"
			  weap.CanBeFiredWhenWormMoving = "true"
			  weap.WeaponGraphicsResourceID = "ARABIANP.House3"
			  weap.WXAnimDraw = "DrawBanana"
			  weap.WXAnimAim = "AimGrenade"
		weap.WXAnimHolding = "HoldBanana"
		weap.WXAnimTaunt = "TauntFirepunch"
    CloseContainer(lock)

end