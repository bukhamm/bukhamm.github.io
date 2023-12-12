-- Скрипт TF2 режима версия 2.1 февраль 2022 года
function Initialise() 

    isLog = false
	isTest = false

    setText=GetData("Databank.MapAuthor")
    SetData("Renew.BriefSub", "Map by " .. setText)   

    setText=GetData("Renew.TF2Title")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.TF2TXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.TF2Obj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.TF2Obj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.TF2Obj3")
    SetData("Renew.BriefObj3", setText)
    
    ActiveWormIndex = nil
    ActiveTeamIndex = nil
    
	TF2Classes = {}
    TF2Classes.Default = {name = "Worm", health = 100, speed = 1}
    TF2Classes.Scout = {name = "Scout", health = 75, speed = 2}
    TF2Classes.Engineer = {name = "Engineer", health = 80, speed = 1}
    TF2Classes.Demoman = {name = "Demoman", health = 100, speed = 0.75}
    TF2Classes.Pyro = {name = "Pyro", health = 125, speed = 1}
    TF2Classes.Soldier = {name = "Soldier", health = 150, speed = 0.5}
    TF2Classes.Medic = {name = "Medic", health = 60, speed = 1.25}
	if isTest == true then
		TF2Classes.Scout = {name = "Scout", health = 75, speed = 3}
		TF2Classes.Engineer = {name = "Engineer", health = 100, speed = 3}
		TF2Classes.Demoman = {name = "Demoman", health = 100, speed = 3}
		TF2Classes.Pyro = {name = "Pyro", health = 125, speed = 3}
		TF2Classes.Soldier = {name = "Soldier", health = 150, speed = 3}
		TF2Classes.Medic = {name = "Medic", health = 50, speed = 3}	
	end
    
	TeamBases = {-1,-1,-1,-1} --  номер базы для каждой команды, нужно знать, т.к. они определены случайно
    SpawnStack = {{},{},{},{}}
    SpawnStack[1] = {"Engineer", "Soldier", "Demoman", "Medic", "Pyro", "Scout"}; -- список порядка спауна классов. После смерти червя, спаунится следующий в списке класс. Умерший добавляется в конец списка.
    SpawnStack[2] = {"Engineer", "Soldier", "Demoman", "Medic", "Pyro", "Scout"};
    SpawnStack[3] = {"Engineer", "Soldier", "Demoman", "Medic", "Pyro", "Scout"};
    SpawnStack[4] = {"Engineer", "Soldier", "Demoman", "Medic", "Pyro", "Scout"};
    SpawnCounter = {1,1,1,1} -- индекс класса в SpawnStack, который спаунится следующим
    SpawnLength = {6,6,6,6} -- текущая длина таблицы спаунов по командам
    SpawnDelayValue = 4 -- постоянная, определяющая  задержку до респауна следующего червя после смерти
    SpawnDelay = {4,4,4,4} -- текущие задержки по командам
	if(isTest)then
		SpawnDelayValue = 1
		SpawnDelay = {1,1,1,1}
	end
	
    DeadStack = {{},{},{},{}} -- список индексов умерших червей
    DeadStackLength = {0,0,0,0}
    DeadCounter = {1,1,1,1}
    WormsNum = {0,0,0,0} -- количество живых червей
	ActiveMedicPosition = {0,0,0} -- текущие координаты медика в команде
	TeamMedics = {-1,-1,-1,-1,} -- ид медиков команд. -1 если медика нет
	

	
    SetWormIndex = -1
    
    HealValue = 30
	PassiveHealRadius = 150
	PassiveHealValue = 15
    
	IsTeamEnable = {false,false,false,false}
    
    BriefcaseTaken = {-1, -1, -1, -1} -- -1 = кейс не взят, иначе - номер команды, у которой кейс (для кейсов 1-4 баз)
	BriefcaseCarrier = {-1, -1, -1, -1} -- -1 = кейс не взят, иначе - ид червя, у которого кейс (по ид команды червя)
	BriefcaseDelivered = {-1,-1,-1,-1} -- -1 = кейс команды не доставлен, иначе - 1
    BriefcaseState = "NotTaken" -- Not Taken, Taken, NotDelivered, Delivered
    IsUnspawningWorms = false
    IsUnspawningCrates = false
    IsChecking = false -- включена ли циклическая проверка текущего червя

    WeaponDelays = {}
    WeaponDelays.WeaponSuperAirstrike = {"SuperAirstrike", 2} -- #1 Demoman's Grenade launcher
    WeaponDelays.WeaponAirstrike = {"Airstrike", 2} -- #2 Demoman's sticky bomb
    WeaponDelays.WeaponFirePunch = {"FirePunch", 2} -- #3 Engineer's Wrench
    WeaponDelays.WeaponPoisonArrow = {"PoisonArrow", 2} -- #4 Medic's medigun / Pyro's Flame Thrower
    WeaponDelays.WeaponShotgun = {"Shotgun", 2} -- #5 Medic's Syringe Gun
    WeaponDelays.WeaponSheep = {"Sheep", 2}  -- #6 Pyro's Flame Thrower
    WeaponDelays.WeaponProd ={"Prod", 4} -- #7 Pyro's  Fire AXE
    WeaponDelays.WeaponSniperRifle = {"SniperRifle", 2} -- #8 Scout's Scattergun
    WeaponDelays.WeaponBazooka = {"Bazooka", 2} -- #9 Soldier's rocket launcher
    WeaponDelays.WeaponNoMoreNails = {"NoMoreNails", 4} -- #10 Soldier's Showel
    WeaponDelays.WeaponGrenade = {"Grenade", 2}
    WeaponDelays.WeaponClusterGrenade = {"ClusterGrenade", 2} 
    WeaponDelays.WeaponGasCanister = {"GasCanister", 3}
    WeaponDelays.WeaponDynamite = {"Dynamite", 2}
    WeaponDelays.WeaponLandmine = {"Landmine", 2}
    WeaponDelays.WeaponBaseballBat = {"BaseballBat", 2}
	WeaponDelays.WeaponAirstrike = {"Airstrike", 2}
	if(isTest)then WeaponDelays.WeaponAirstrike = {"Airstrike", 1} end
    WeaponDelays.UtilityNinjaRope = {"NinjaRope", 2}
    WeaponDelays.UtilityParachute = {"Parachute", 2}
    WeaponDelays.UtilityGirder = {"Girder", 2}
    WeaponDelays.UtilityBubbleTrouble = {"BubbleTrouble", 2}
    WeaponDelays.WeaponSentryGun = {"SentryGun", 4}  
    --WeaponDelays.UtilityChangeWorm = {"ChangeWorm", 0}
    WeaponDelays.UtilitySkipGo = {"SkipGo", 0}
    WeaponDelays.UtilitySurrender = {"Surrender", 0}
	WeaponDelays.TF2FlameThrower = {2,0,0,0,0}
	WeaponDelays.TF2Medigun = {2,0,0,0,0}

    RenewWLoadAll()
	lib_SetupMultiplayer()
    MakeTF2Worms()
	TF2WLoadAll()
	SendMessage("WormManager.Reinitialise")

    lock, scheme = EditContainer("GM.SchemeData")
        scheme.WeaponChance = 0
        scheme.UtilityChance = 0
        scheme.MysteryChance = 0
        scheme.HealthChance = 0
        scheme.WormSelect = true
        scheme.SuperAirstrike.Delay = 0
        scheme.Airstrike.Delay = 0
        scheme.FirePunch.Delay = 0
        scheme.PoisonArrow.Delay = 0
        scheme.Shotgun.Delay = 0
        scheme.Sheep.Delay = 0
        scheme.Prod.Delay = 0
        scheme.SniperRifle.Delay = 0
        scheme.Bazooka.Delay = 0
        scheme.NoMoreNails.Delay = 0
        scheme.Grenade.Delay = 0
        scheme.ClusterGrenade.Delay = 0
        scheme.GasCanister.Delay = 0
        scheme.Dynamite.Delay = 0
        scheme.Landmine.Delay = 0
        scheme.BaseballBat.Delay = 0
        scheme.NinjaRope.Delay = 0
        scheme.Parachute.Delay = 0
        scheme.Girder.Delay = 0
        scheme.BubbleTrouble.Delay = 0
        scheme.SentryGun.Delay = 0
        --scheme.ChangeWorm.Delay = 0
        scheme.SkipGo.Delay = 0
        scheme.Surrender.Delay = 0
		scheme.Airstrike.Delay = 0
		--scheme.BubbleTrouble.Ammo = 9
    CloseContainer(lock)
    SetupScheme()

	StartFirstTurn()
    



	SendMessage("GameLogic.ClearInventories")
	Index = 0
	InventoryName = lib_GetAllianceInventoryName(Index)
	while InventoryName ~= "" do
        local Lock,Container = EditContainer(InventoryName)
            Container.Bazooka = -1
            Container.Grenade = -1
            Container.ClusterGrenade = -1
            Container.GasCanister = -1
            Container.Airstrike = -1
            Container.Shotgun = -1
            Container.Dynamite = -1
            Container.Landmine = -1
            Container.NoMoreNails = -1
            Container.SniperRifle = -1
            Container.BaseballBat = -1
            Container.NinjaRope = -1
            Container.Parachute = -1
            Container.Prod = -1
            Container.FirePunch = -1
            Container.Girder = 9
            Container.BubbleTrouble = 9
            Container.SentryGun = -1
            Container.SuperAirstrike = -1
            Container.ChangeWorm = -1
            Container.PoisonArrow = -1
            Container.Sheep = -1
			if (isTest) then Container.Airstrike = -1 end
            
            
            --Container.SuperAirstrike = -1
            --Container.Fatkins = -1
        CloseContainer(Lock) 
        Index = Index + 1
        InventoryName = lib_GetAllianceInventoryName(Index)
    end

    SetData("Crate.ImpulseMagnitude", 0)
    SetData("Crate.LandDamageRadius", 0)
    SetData("Crate.WormDamageMagnitude", 0)
    
    CheckWormName()
end


function TurnStarted()

	
    SendMessage("WormSelect.OptionSelected")
    UpdateActiveWormAndTeam()
    CrateSpawner()
	CheckUber()
    BriefcaseState = "NotTaken"
    TargetSpawner()
    WormSpawner()
    IsChecking = true
	
	if(isLog)then Re_Message("ActiveWorm:"..ActiveWormIndex.." ..Team:"..ActiveTeamIndex) end
	if(isLog)then ShowStackDebug() end
   
 
end

function TurnEnded()
	IsChecking = false
	TargetUnspawner()
	CrateUnspawner()
	CheckOneTeamVictory()  
	CheckDelays("UtilityBubbleTrouble")
	CheckDelays("UtilityGirder")   
end

function UpdateActiveWormAndTeam()
    ActiveWormIndex = GetData("ActiveWormIndex")
    local worm = lib_QueryWormContainer()
    ActiveTeamIndex = worm.TeamIndex
end

function ShowStackDebug()
	Re_Message('Spawn Stack:')
	for i = SpawnCounter[ActiveTeamIndex+1],SpawnLength[ActiveTeamIndex+1] do
		Re_Message(SpawnStack[ActiveTeamIndex+1][i])
	end
	Re_Message('Dead ID Stack')
	for k = DeadCounter[ActiveTeamIndex+1],DeadStackLength[ActiveTeamIndex+1] do
		Re_Message(DeadStack[ActiveTeamIndex+1][k])
	end	
end
--------------------- УСТАНОВКА СПАУНОВ И КЛАССОВ ЧЕРВЕЙ ----------------------

function MakeTF2Worms()
    for SomeTeam = 0,3 do
        local lock, team = EditContainer("Team.Data0" .. (SomeTeam))
            team.ATT_Hat = ""  
            team.ATT_Glasses = ""
            team.ATT_Gloves = ""
            team.ATT_Tash = ""
        CloseContainer(lock)
    end
    --WormSpawn = { "WORM0", "WORM1", "WORM2", "WORM3", "WORM4", "WORM5", "WORM6", "WORM7", "WORM8", "WORM9", "WORM10", "WORM11", "WORM12", "WORM13", "WORM14", "WORM15", "WORM16", "WORM17", "WORM18", "WORM19", "WORM20", "WORM21", "WORM22", "WORM23"}
	WormSpawn = {}
    WormSpawn = Renew_GetRandomSpawns()

	local GM = QueryContainer("GM.GameInitData")
    PrevTeams = 0
    
    SpawnNum = 0
    TeamNum = GM.T1_NumOfWorms
    SoundBank = GM.T1_Speech
    TeamIn = 0
    if TeamNum > 0 then
		IsTeamEnable[1] = true 
		TeamBases[TeamIn+1] = GetBaseNum(WormSpawn[SpawnNum+1])
	end	
    Classify()
    
    SpawnNum = 10
    TeamNum = GM.T2_NumOfWorms
    SoundBank = GM.T2_Speech
    TeamIn = 1
    if TeamNum > 0 then
		IsTeamEnable[2] = true 
		TeamBases[TeamIn+1] = GetBaseNum(WormSpawn[SpawnNum+1])
	end		
    Classify()
    
    SpawnNum = 20
    TeamNum = GM.T3_NumOfWorms
    SoundBank = GM.T3_Speech
    TeamIn = 2
    if TeamNum > 0 then
		IsTeamEnable[3] = true 
		TeamBases[TeamIn+1] = GetBaseNum(WormSpawn[SpawnNum+1])
	end		
    Classify()
    
    SpawnNum = 30
    TeamNum = GM.T4_NumOfWorms
    SoundBank = GM.T4_Speech
    TeamIn = 3
    if TeamNum > 0 then
		IsTeamEnable[4] = true 
		TeamBases[TeamIn+1] = GetBaseNum(WormSpawn[SpawnNum+1])
	end			
    Classify()
end
function GetBaseNum(spawn)

	local base = -1
	if spawn == "WORM0" then base = 1
	elseif spawn == "WORM10" then base = 2
	elseif spawn == "WORM20" then base = 3
	elseif spawn == "WORM30" then base = 4 end
	return base
end
function Classify()
    windex = 0 + PrevTeams
    TeamNum = TeamNum + PrevTeams
	--TeamBases[TeamIn+1] = GetBaseNum(WormSpawn[SpawnNum+1])

    while windex ~= TeamNum do
        local counter = SpawnCounter[TeamIn+1]
        local setClass = SpawnStack[TeamIn+1][counter]
		if setClass == "Medic" then
			TeamMedics[TeamIn+1] = windex
		end	
		local cSettings = TF2Classes[setClass]
        lib_SetupWorm(windex, setClass)
        local copyindex = lib_GetWormContainerName(windex)
        CopyContainer(setClass, copyindex)
        local lock, worm = EditContainer(copyindex)
            worm.TeamIndex = TeamIn
            worm.Spawn = WormSpawn[SpawnNum+1]
            worm.SfxBankName = SoundBank
			worm.Energy = cSettings.health
            --worm.Acceleration = {x='0' y='0' z='0'}
        CloseContainer(lock)
        windex = windex + 1
        SpawnCounter[TeamIn+1] = SpawnCounter[TeamIn+1] + 1
        PrevTeams = PrevTeams + 1
        SpawnNum = SpawnNum + 1
        WormsNum[TeamIn+1] = WormsNum[TeamIn+1] + 1
    end
end
function Reclassify(i,team) -- установка нового класса червя после смерти
    local DeadCont = lib_QueryWormContainer(i)
    local setTeam = team
    local setSpawn = DeadCont.Spawn
    local setSfxBankName = DeadCont.SfxBankName
    BriefcaseState = "NotDelivered"
    
    local name = SpawnStack[setTeam+1][SpawnCounter[setTeam+1]]
    --local deadWormData = lib_GetWormContainerName(i)
    
    
    if BriefcaseDelivered[setTeam+1] <= 0 then
        --lib_SetupWorm(i,name)
        local copyindex = lib_GetWormContainerName(i)
        CopyContainer(name, copyindex)
        local mes = GetData("RenewTXT.TF2Spawned")
        Re_Message(DeadCont.Name .. mes)
		local cSettings = TF2Classes[DeadCont.Name]
        if(isLog)then Re_Message("Spawned Worm:"..i.." SpawnedTeam:"..setTeam.." Spawn:"..setSpawn) end
        local lock, worm = EditContainer(copyindex)
            worm.TeamIndex = setTeam
            worm.Spawn = setSpawn
            worm.SfxBankName = setSfxBankName
			worm.Energy = cSettings.health
        CloseContainer(lock)   
        SendIntMessage("Worm.Respawn", i) 
    end
    SpawnCounter[setTeam+1] = SpawnCounter[setTeam+1] + 1
    WormsNum[setTeam+1] = WormsNum[setTeam+1] + 1
end
function WormSpawner()
    local setNumWorms
    if ActiveTeamIndex+1 == 1 then setNumWorms = GM.T1_NumOfWorms
    elseif ActiveTeamIndex+1 == 2 then setNumWorms = GM.T2_NumOfWorms
    elseif ActiveTeamIndex+1 == 3 then setNumWorms = GM.T3_NumOfWorms
    elseif ActiveTeamIndex+1 == 4 then setNumWorms = GM.T4_NumOfWorms
    else setNumWorms = 0 end
    
    if WormsNum[ActiveTeamIndex+1] < setNumWorms then
        if SpawnDelay[ActiveTeamIndex+1] > 0 then
            local mes1 = GetData("RenewTXT.TF2RespawnMsg1")
            local mes2 = GetData("RenewTXT.TF2RespawnMsg2")
            Re_Message(mes1 .. SpawnDelay[ActiveTeamIndex+1] .. mes2)
            SpawnDelay[ActiveTeamIndex+1] = SpawnDelay[ActiveTeamIndex+1] - 1 
        else
            SpawnDelay[ActiveTeamIndex+1] = SpawnDelayValue
            i = DeadStack[ActiveTeamIndex+1][DeadCounter[ActiveTeamIndex+1]]
            DeadCounter[ActiveTeamIndex+1] = DeadCounter[ActiveTeamIndex+1] + 1
            Reclassify(i,ActiveTeamIndex)
        end
    end
end

function Worm_Died()
    IsChecking = false
    if IsUnspawningWorms == false then
		local DeadIndex = GetData("DeadWorm.Id")
		if DeadIndex == ActiveWormIndex then IsChecking = false end       
		local DeadCont = lib_QueryWormContainer(DeadIndex)
		local setTeam = DeadCont.TeamIndex
		local setName = DeadCont.Name

		if DeadIndex == BriefcaseCarrier[setTeam+1] then
			BriefcaseCarrier[setTeam+1] = -1
			for someBase = 1,4 do
				if BriefcaseTaken[someBase] == setTeam then
					BriefcaseTaken[someBase] = -1
				end
			end				
		end
		if setName == "Medic" then
			TeamMedics[setTeam+1] = -1
		end

		SpawnLength[setTeam+1] = SpawnLength[setTeam+1]+1
		SpawnStack[setTeam+1][SpawnLength[setTeam+1]] = setName
       
		DeadStackLength[setTeam+1] = DeadStackLength[setTeam+1] + 1
		DeadStack[setTeam+1][DeadStackLength[setTeam+1]] = DeadIndex
       
		if isLog then Re_Message('Worm Died Index ' .. DeadIndex .. " Dead Team:" ..DeadCont.TeamIndex .. "Dead Name:" .. setName) end
		WormsNum[setTeam+1] = WormsNum[setTeam+1] - 1
    end
end

function Worm_Damaged()
    
    local DamagedWormId = GetData("DamagedWorm.Id") -- a number 0-15
    local DamageTypeTaken = GetData("DamageTypeTaken") -- 0-5 (see below)
    local worm = lib_QueryWormContainer(DamagedWormId)
    local WormCont = lib_GetWormContainerName(DamagedWormId)
    local PoisonRate = tonumber(worm.PoisonRate)

    if (PoisonRate == 1) then
        local lock, wormy = EditContainer(WormCont)
            wormy.Energy = wormy.Energy + HealValue + 1
            wormy.PoisonRate = 0
            wormy.PendingPoison = 0
            wormy.DamagePending = 0
            wormy.IsEmotional = "false"
        CloseContainer(lock)          
    end    
end

function Weapon_Selected()
    local worm = lib_QueryWormContainer()
    local kWormWeaponIndex = worm.WeaponIndex
    --Message("weapon: " ..kWormWeaponIndex)
    if kWormWeaponIndex == "WeaponPoisonArrow" then

    end
end

function Weapon_Fired()
    local worm = lib_QueryWormContainer()
    local weapName = WeaponDelays[worm.WeaponIndex][1]
    local weapDelay = WeaponDelays[worm.WeaponIndex][2]
	local currentT = worm.TeamIndex
	if isLog then Re_Message("weapon fired:" .. worm.WeaponIndex) end
	if weapName == PoisonArrow then
		if worm.Name == "Pyro" then
			WeaponDelays.TF2FlameThrower[currentT+2] = WeaponDelays.TF2FlameThrower[1]+1
		elseif worm.Name == "Medic" then
			WeaponDelays.TF2Medigun[currentT+2] = WeaponDelays.TF2Medigun[1]+1
		end
	else
		local delayslock, delay = EditContainer("Inventory" .. (ActiveTeamIndex) .. ".WeaponDelays")
			delay[weapName] = weapDelay
		CloseContainer(delayslock)
	end
end


function DoOncePerTurnFunctions()
    IsChecking = false
end
function GameLogic_ActiveWormChanged()
    UpdateActiveWormAndTeam()
end


------------------------------- ЦИКЛИЧНАЯ ФУНКЦИЯ СМЕНЫ НАСТРОЕК ТЕКУЩЕГО ЧЕРВЯ
function CheckWormName()
    if IsChecking == true then
        local currentW = GetData("ActiveWormIndex")  
		local worm = lib_QueryWormContainer(currentW)
		local currentT = worm.TeamIndex
        if SetWormIndex ~= currentW then
			local cSettings = TF2Classes[worm.Name]
            if SetWormIndex == -1 then
                TF2Classes.Default.speed = GetData("Worm.Walk.Speed")
            else
                local s = TF2Classes.Default.speed*cSettings.speed
                SetData("Worm.Walk.Speed",s)
            end
            if worm.Name == "Pyro" then
				TF2WLoadFlameThrower()
				--Message ("team"..WeaponDelays.TF2FlameThrower[currentT+2])
				local delayslock, delay = EditContainer("Inventory" .. (currentT) .. ".WeaponDelays")
					delay.PoisonArrow = WeaponDelays.TF2Medigun[currentT+2] 
				CloseContainer(delayslock)            
            end
            if worm.Name == "Medic" then
				TF2WLoadMedigun()
				--Message ("team"..WeaponDelays.TF2Medigun[currentT+2])
				local delayslock, delay = EditContainer("Inventory" .. (currentT) .. ".WeaponDelays")
					delay.PoisonArrow = WeaponDelays.TF2FlameThrower[currentT+2] 
				CloseContainer(delayslock)  
            end
            SetWormIndex = currentW
        end
    end
    StartTimer("CheckWormName",500)
end

-------------------------------- МЕХАНИКА ЛЕЧЕНИЯ --------------

function CheckUber()
	local WormIndex
	for WormIndex = 0,15 do
		local wormCont = lib_GetWormContainerName(WormIndex)
		local worm = lib_QueryWormContainer(WormIndex)
		local health = 100
		if (worm.Name == "Soldier") then health = TF2Classes.Soldier.health
		elseif (worm.Name == "Engineer") then health = TF2Classes.Engineer.health
		elseif (worm.Name == "Demoman") then health = TF2Classes.Demoman.health
		elseif (worm.Name == "Medic") then health = TF2Classes.Medic.health
		elseif (worm.Name == "Pyro") then health = TF2Classes.Pyro.health
		elseif (worm.Name == "Scout") then health = TF2Classes.Scout.health end
		if (worm.Energy >= health*2 and worm.Armoured == false) then
				local lock, wormy = EditContainer(wormCont)
					wormy.Energy = health*2
					wormy.Armoured = false
				CloseContainer(lock)				
		end
		if worm.TeamIndex == ActiveTeamIndex and worm.Name ~= "" and TeamMedics[ActiveTeamIndex+1] ~= -1 then
			--if (isLog) then Re_Message("team"..worm.TeamIndex) end
			--if (isLog) then Re_Message("dist Medic" .. TeamMedics[ActiveTeamIndex+1] .. "-" .. worm.Name .. WormIndex) end
			local dataId = lib_GetWormContainerName(TeamMedics[ActiveTeamIndex+1])
			local medworm = QueryContainer(dataId)
			local setDist = GetDistance(medworm.Position,worm.Position)
			--if (isLog) then Re_Message("distance:" .. setDist) end
			if setDist < PassiveHealRadius and worm.Energy < health then
				local newEnergy = worm.Energy + PassiveHealValue
				if newEnergy > health then newEnergy = health end
				local lock, wormy = EditContainer(wormCont)
					wormy.Energy = newEnergy
				CloseContainer(lock)	
				Re_Message(worm.Name .. " healed by Medic")
			end
		end			
    end
end

function GetDistance(pos1,pos2)
	local vector1 = GetVector3(pos1)
	local vector2 = GetVector3(pos2)
	local x = vector2.x - vector1.x
	x = x *x
	local y = vector2.y - vector1.y
	y = y *y
	local z = vector2.z - vector1.z
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
function CheckDelays(val) -- возвращаем инженеру пузырь и балки
	local weapDelay = WeaponDelays[val][2]
	local weapName = WeaponDelays[val][1]
	
	local inventory = QueryContainer("Inventory.Alliance0" .. (ActiveTeamIndex))
	if inventory[weapName] < 9 then
		local lock,inventory = EditContainer("Inventory.Alliance0" .. (ActiveTeamIndex))
			inventory[weapName] = 9
		CloseContainer(lock)
		local delayslock, delay = EditContainer("Inventory" .. (ActiveTeamIndex) .. ".WeaponDelays")
            delay[weapName] = weapDelay
		CloseContainer(delayslock)  		
	end
	if(WeaponDelays.TF2FlameThrower[ActiveTeamIndex+2] > 0) then WeaponDelays.TF2FlameThrower[ActiveTeamIndex+2] = WeaponDelays.TF2FlameThrower[ActiveTeamIndex+2] - 1 end	
	if(WeaponDelays.TF2Medigun[ActiveTeamIndex+2] > 0) then WeaponDelays.TF2Medigun[ActiveTeamIndex+2] = WeaponDelays.TF2Medigun[ActiveTeamIndex+2] - 1 end	
	
end

----------------- ФУНКЦИИ ЯЩИКОВ-ЧЕМОДАНОВ И ЦЕЛЕЙ

function Crate_Collected()
    UpdateActiveWormAndTeam()
    local crateIndex = GetData("Crate.Index")
	--Re_Message ('Crate Index='..crateIndex..' TeamIndex='..ActiveTeamIndex..' TeamBase='..TeamBases[ActiveTeamIndex+1])
    if crateIndex < 5 and TeamBases[ActiveTeamIndex+1] ~= crateIndex then
        if (isLog) then Re_Message("CrateCollected") end
        IsChecking = false
        BriefcaseTaken[crateIndex] = ActiveTeamIndex
        BriefcaseCarrier[ActiveTeamIndex+1] = ActiveWormIndex
        BriefcaseState = "Taken"

        SpawnDelay[ActiveTeamIndex+1] = 0 -- поощряем взятие ящика сбросом респауна
        WormSpawner()

        TargetSpawner()
        Respawn(ActiveWormIndex,crateIndex)

    elseif crateIndex == TeamBases[ActiveTeamIndex+1] + 4 then
        if ActiveWormIndex == BriefcaseCarrier[ActiveTeamIndex+1] then
            --Re_Message("delivered")
            for team = 0,3 do
                if BriefcaseTaken[TeamBases[team+1]] == ActiveTeamIndex then
                    BriefcaseDelivered[team+1] = 1
                    BriefcaseState = "Delivered"
                    Respawn(ActiveWormIndex,crateIndex)
                    DeleteTeam(team)
                end
            end
        else
            local mes = GetData("RenewTXT.TF2Breafcase1")
            Re_Message(mes)
        end
    end
end
function DeleteTeam(team)
    IsTeamEnable[team+1] = false
    SendIntMessage("WormManager.SurrenderTeamById", team)
end
function ChangeTeamCollectable()
	local CrateInd
	for CrateInd = 1,4 do
		if CrateInd == TeamBases[ActiveTeamIndex + 1] then
			local lock, crate = EditContainer("Crate" .. (CrateInd)) 
				crate.TeamCollectable = 5
			CloseContainer(lock)
		else
			local lock, crate = EditContainer("Crate" .. (CrateInd)) 
				crate.TeamCollectable = ActiveTeamIndex
			CloseContainer(lock)
		 end
	end
end


function CrateSpawner()
    ChangeTeamCollectable()
    local TeamIn
    for TeamIn = 1,4 do
        if BriefcaseTaken[TeamBases[TeamIn]] == -1 and TeamBases[TeamIn] ~= -1 then
            lib_SpawnCrate("Crate" .. (TeamBases[TeamIn]))
        end
    end
end


function TargetSpawner()
	if (isLog) then Re_Message('try to spawn target') end
    if BriefcaseState == "Taken" then
       TargetUnspawner()
    end
    UpdateActiveWormAndTeam()
    if ActiveTeamIndex == BriefcaseTaken[1] then
       lib_SpawnCrate("Target" .. (TeamBases[ActiveTeamIndex+1]))
    elseif ActiveTeamIndex == BriefcaseTaken[2] then
       lib_SpawnCrate("Target" .. (TeamBases[ActiveTeamIndex+1]))
    elseif ActiveTeamIndex == BriefcaseTaken[3] then
       lib_SpawnCrate("Target" .. (TeamBases[ActiveTeamIndex+1]))
    elseif ActiveTeamIndex == BriefcaseTaken[4] then
       lib_SpawnCrate("Target" .. (TeamBases[ActiveTeamIndex+1]))
    else
       TargetUnspawner()
    end
end


function TargetUnspawner()
   IsUnspawningCrates = true
   SendIntMessage("Crate.Delete", 5)
   SendIntMessage("Crate.Delete", 6)
   SendIntMessage("Crate.Delete", 7)
   SendIntMessage("Crate.Delete", 8)
   IsUnspawningCrates = false
end


function CrateUnspawner()
   IsUnspawningCrates = true
   SendIntMessage("Crate.Delete", 1)
   SendIntMessage("Crate.Delete", 2)
   SendIntMessage("Crate.Delete", 3)
   SendIntMessage("Crate.Delete", 4)
   IsUnspawningCrates = false
end


function Crate_Destroyed()
   if IsUnspawningCrates == false then
      local Ind = GetData("Crate.Index")
      if Ind < 5 then
         lib_SpawnCrate("Crate" .. (Ind))
      else
         local TInd = Ind - 4
         lib_SpawnCrate("Target" .. (TInd))
      end
   end
end


function Crate_Sunk()
   if IsUnspawningCrates == false then
      local Ind = GetData("Crate.Index")
      if Ind < 5 then
         lib_SpawnCrate("Crate" .. (Ind))
      else
         local TInd = Ind - 4
         lib_SpawnCrate("Target" .. (TInd))
      end
   end
end

---------------------------- ФУНКЦИЯ РЕСПАУНА ЧЕРВЯ ПОСЛЕ ВЗЯТИЯ ЧЕМОДАНА

function Respawn(respworm,crateIndex)
	
	UpdateActiveWormAndTeam()
    wormdataname = lib_GetWormContainerName(respworm)
	if isLog then Re_Message('Go resp') end
     CopyContainer(wormdataname, "Worm.BeforeRespawning")
    IsUnspawningWorms = true
    SendIntMessage("WXWormManager.UnspawnWorm", respworm)
    lib_SetupWorm(respworm, "Worm.BeforeRespawning")
	
	local setTash = ""
	if crateIndex < 5 then setTash = "BackBriefcase" end
	
	local spPrefix = "sp"
	local spIndex = spIndex
	if crateIndex > 4 then 
		spIndex = crateIndex - 4 
		spPrefix = "2sp"
	else spIndex = crateIndex end
	
    local lock, worm = EditContainer(wormdataname) 
            worm.Active = true 
            worm.PlayedInGame = true
            worm.ATT_Tash = setTash
        worm.Spawn = spPrefix .. spIndex
    CloseContainer(lock)	

	
    SendIntMessage("Worm.Respawn", respworm)
    IsUnspawningWorms = false 
   
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
    local carrier = BriefcaseCarrier[ActiveTeamIndex+1]
    if w == controller then 
        if w == carrier then      
            local wormy = QueryContainer("Worm.BeforeRespawning") 
            local lock, worm = EditContainer(lib_GetWormContainerName(w)) 
				worm.Name=wormy.Name
				worm.Spawn=wormy.Spawn
            CloseContainer(lock)
        end
    else
        On(controller)
    end
end 

