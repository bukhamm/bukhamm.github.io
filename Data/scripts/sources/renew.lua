-- Основная библиотека функций RENEWATION
    Re_LoadFixes()
    isWUM = true

	isSpawns = false -- расстановка червей на спауны
	isDuel = false -- режим дуэли (1 червь от  каждой команды)

    isPro = false -- включает про режим с бесконечной веревкой, блоком и парашютом и с запретом на "не про" оружие
	isGirder = true -- множественный блок
	isNoGirder = false -- запрет  на балки
	isNoFly = false -- запрет  на утилиты перемещения (для renew_stdvs)
	isOnlyRope = false -- при isNoFly разрешает  использовать веревку
    isNoAir = false -- отключает авиаудары и прочее оружие, бьющее сверху
	isIndestructable = false -- неразрушаемая земля (для renew_stdvs)
	isNoCrates = false -- запрет на ящики и телепорты
	isMaxNumOfWorms = false -- максимальное число червей в командах (24 на карте)

    isRenewWeapon = true -- включатель вооружения мода

    wSoundPrefix = "weapons/"
    gSoundPrefix = "global/"
    if isWUM == false then -- в WUM звуки имеют директории
        wSoundPrefix = ""
        gSoundPrefix = ""
    end

function RenewSettings() -- функция инициализации Renewation
-- Special Renewation Options
 
    
    setText=GetData("Databank.MapAuthor")
    SetData("Renew.BriefSub", "Map by " .. setText)    
	RenewMiniMods()
	
	lock, scheme = EditContainer("GM.SchemeData")
		scheme.AssistedShotLevel = "AssistedShot.DisableMod"
	CloseContainer(lock)		
	if isNoCrates == true then
		lock, scheme = EditContainer("GM.SchemeData")
			scheme.WeaponChance = 0
			scheme.UtilityChance = 0
			scheme.MysteryChance = 0
			scheme.HealthChance = 0
			scheme.TelepadsOn = false
			scheme.Objects = 0
		CloseContainer(lock)		
	end

	if isGirder == true then
		Gir()
	end
    if isRenewWeapon == true then
        RenewWLoadAll()
    end
-- End of Options
end





-- Ѕиблиотека общих функций


-- конец библиотеки общих функций




function Gir() -- ћножественный блок. «апустить функцию 1 раз, если необходим
	if isNoGirder == false then
		local delays_lock, delays = EditContainer("Inventory0.WeaponDelays") 
			delays.Girder = 0
		CloseContainer(delays_lock)
	
		local delays_lock, delays = EditContainer("Inventory1.WeaponDelays") 
			delays.Girder = 0
	   	CloseContainer(delays_lock)
	
		local delays_lock, delays = EditContainer("Inventory2.WeaponDelays") 
			delays.Girder = 0
		CloseContainer(delays_lock)
	
		local delays_lock, delays = EditContainer("Inventory3.WeaponDelays") 
			delays.Girder = 0
		CloseContainer(delays_lock)
	   	StartTimer("Gir", 500)
	end
end


function RenewMines() --  использовать вместо lib_SetupMinesAndOildrums()
   	local scheme = QueryContainer("GM.SchemeData")
   		--SetData("Mine.DudProbability", 0.1)
     				 SetData("Mine.MinFuse", 400)
      				SetData("Mine.MaxFuse", 400)

   		-- 0 = None, 1 = mines, 2 = drums, 3 = both
  		 local i
  		 if scheme.Objects == 1 or scheme.Objects == 3 then
      			for i = 1,15 do
         			SendMessage("GameLogic.CreateRandomMine")
      			end
   		end

  		 if scheme.Objects == 2 or scheme.Objects == 3 then
      			for i = 1,10 do
        		 SendMessage("GameLogic.CreateRandomOildrum")
      		end
   	end
end

function RenewMiniMods ()
    if isPro == true then
        isGirder = true
        isNoAir = true
        isNoFly = true
        isOnlyRope = true
        isProWeapons = true     
    end
    if isNoFly == true then  -- отключает  все приспоcобления для перемещения
        for NumberTeam = 0, 3 do
            local lock, inventory = EditContainer("Inventory.Alliance0" .. (NumberTeam)) 
                inventory.NinjaRope = 0
                inventory.Parachute = 0
                inventory.Jetpack = 0
                inventory.Redbull = 0
            CloseContainer(lock)
        end
    end

    if isNoGirder == true then
        for NumberTeam = 0, 3 do
		    local lock, inventory = EditContainer("Inventory.Alliance0" .. (NumberTeam)) 
       			inventory.Girder = 0
		    CloseContainer(lock)
	    end
    end
    if isOnlyRope == true then
        for NumberTeam = 0, 3 do
		    local lock, inventory = EditContainer("Inventory.Alliance0" .. (NumberTeam)) 
        		inventory.NinjaRope = -1
		    CloseContainer(lock)
	    end
    end
    if isNoAir == true then
        for NumberTeam = 0, 3 do
         local lock, inventory = EditContainer("Inventory.Alliance0" .. (NumberTeam)) 
            inventory.Airstrike = 0
            inventory.ConcreteDonkey = 0
            inventory.AlienAbduction = 0
            inventory.Fatkins = 0
            inventory.SuperAirstrike = 0
            inventory.WeaponFactoryWeapon = 0
         CloseContainer(lock)
        end        
    end
    if isProWeapons == true then -- включает парашют и отключает еще некоторые не тру оружки
        for NumberTeam = 0, 3 do
            local lock, inventory = EditContainer("Inventory.Alliance0" .. (NumberTeam)) 
                inventory.Airstrike = 0
                inventory.BaseballBat = 0
                inventory.ConcreteDonkey = 0
                inventory.Prod = 0
                inventory.FirePunch = 0
                inventory.HomingMissile = 0
                inventory.SuperSheep = 0
                inventory.Starburst = 0
                inventory.AlienAbduction = 0
                inventory.Fatkins = 0
                inventory.NoMoreNails = 0
                inventory.WeaponFactoryWeapon = 0
                inventory.Parachute = -1
            CloseContainer(lock)
        end       
    end
end

-- — –»ѕ“ –≈—ѕј”Ќј „≈–¬≈… (перезапись из библиотеки)

function Renew_SetupMultiplayerWormsAndTeams()
    WormIndex = 0
	--local spawnIndexStepSize = 10
    --local WormSpawnIndex = 0
    local t_Player = "null"
    GM = QueryContainer("GM.GameInitData")
	local T1_NumOfWorms = GM.T1_NumOfWorms
	local T2_NumOfWorms = GM.T2_NumOfWorms
	local T3_NumOfWorms = GM.T3_NumOfWorms
	local T4_NumOfWorms = GM.T4_NumOfWorms
	
	--Re_Message("MaxNumOfWorms" .. GM.T1_NumOfWorms)
	if isMaxNumOfWorms == true then
		if GM.NumberOfTeams == 2 then
			T1_NumOfWorms = 8
			T2_NumOfWorms = 8
			spawnIndexStepSize = 8
		elseif GM.NumberOfTeams == 3 then
			T1_NumOfWorms = 5
			T2_NumOfWorms = 5
			T3_NumOfWorms = 5
			spawnIndexStepSize = 6
		elseif GM.NumberOfTeams == 4 then
			T1_NumOfWorms = 4
			T2_NumOfWorms = 4
			T2_NumOfWorms = 4
			T2_NumOfWorms = 4
			spawnIndexStepSize = 4
		end	
	end
    if GM.NumberOfTeams>=1 then 
        if isWUM == true then t_Player = GM.T1_Player else t_Player = 0 end
        Renew_SetupMultiplayerTeam(0, GM.T1_Name, t_Player, T1_NumOfWorms, GM.T1_W1_Name, GM.T1_W2_Name, GM.T1_W3_Name, GM.T1_W4_Name, GM.T1_W5_Name, GM.T1_W6_Name,
            GM.T1_Skill, GM.T1_Grave, GM.T1_Flag, GM.T1_Speech, GM.T1_IsLocal, GM.T1_AlliedGroup, GM.T1_Handicap, GM.T1_HatAttachment, GM.T1_GlassesAttachment, GM.T1_TashAttachment, GM.T1_GlovesAttachment)
    end
    --WormSpawnIndex=WormSpawnIndex+spawnIndexStepSize
    if GM.NumberOfTeams>=2 then
        if isWUM == true then t_Player = GM.T2_Player else t_Player = 0 end
        Renew_SetupMultiplayerTeam(1, GM.T2_Name, t_Player, T2_NumOfWorms, GM.T2_W1_Name, GM.T2_W2_Name, GM.T2_W3_Name, GM.T2_W4_Name, GM.T2_W5_Name, GM.T2_W6_Name,
            GM.T2_Skill, GM.T2_Grave, GM.T2_Flag, GM.T2_Speech, GM.T2_IsLocal, GM.T2_AlliedGroup, GM.T2_Handicap, GM.T2_HatAttachment, GM.T2_GlassesAttachment, GM.T2_TashAttachment, GM.T2_GlovesAttachment)
    end
    --WormSpawnIndex=WormSpawnIndex+spawnIndexStepSize
    if GM.NumberOfTeams>=3 then 
        if isWUM == true then t_Player = GM.T3_Player else t_Player = 0 end
        Renew_SetupMultiplayerTeam(2, GM.T3_Name, t_Player, T3_NumOfWorms, GM.T3_W1_Name, GM.T3_W2_Name, GM.T3_W3_Name, GM.T3_W4_Name, GM.T3_W5_Name, GM.T3_W6_Name,
            GM.T3_Skill, GM.T3_Grave, GM.T3_Flag, GM.T3_Speech, GM.T3_IsLocal, GM.T3_AlliedGroup, GM.T3_Handicap,  GM.T3_HatAttachment, GM.T3_GlassesAttachment, GM.T3_TashAttachment, GM.T3_GlovesAttachment)
    end
    --WormSpawnIndex=WormSpawnIndex+spawnIndexStepSize
    if GM.NumberOfTeams>=4 then 
        if isWUM == true then t_Player = GM.T4_Player else t_Player = 0 end
        Renew_SetupMultiplayerTeam(3, GM.T4_Name, t_Player, T4_NumOfWorms, GM.T4_W1_Name, GM.T4_W2_Name, GM.T4_W3_Name, GM.T4_W4_Name, GM.T4_W5_Name, GM.T4_W6_Name,
            GM.T4_Skill, GM.T4_Grave, GM.T4_Flag, GM.T4_Speech, GM.T4_IsLocal, GM.T4_AlliedGroup, GM.T4_Handicap,  GM.T4_HatAttachment, GM.T4_GlassesAttachment, GM.T4_TashAttachment, GM.T4_GlovesAttachment)
    end
    

end

function Renew_SetupMultiplayerTeam(tIndex,TeamName, PlayerName, NumWorms, Worm1Name, Worm2Name, Worm3Name, Worm4Name, Worm5Name, Worm6Name,
                   Skill, Grave, Flag, Speech, IsLocal, AlliedGroup, Handicap,
                   HatAttachment, GlassesAttachment, TashAttachment, GlovesAttachment)

    local teamSpawnIndex = tIndex * 10
	local wormNames = {Worm1Name,Worm2Name,Worm3Name,Worm4Name,Worm5Name,Worm6Name,Worm1Name,Worm2Name,Worm3Name,Worm4Name}
    local lock, team = EditContainer(lib_GetTeamContainerName(tIndex)) 	
    --WormSpawnIndexA=vWormSpawnIndex
        team.Active = true
        team.Name = TeamName
	    if isWUM == true then team.Player = PlayerName end
        team.TeamColour = 0
        team.Skill = Skill
        team.GraveIndex = Grave
        team.FlagGfxName = Flag
        team.AlliedGroup = AlliedGroup
        team.IsLocal = IsLocal
        team.ATT_Hat = HatAttachment
        team.ATT_Glasses = GlassesAttachment
        team.ATT_Tash = TashAttachment
        team.ATT_Gloves = GlovesAttachment
        if Skill>0 then
            team.IsAIControlled = true
        else
            team.IsAIControlled = false
        end

	   -- PC: added this to reset the win count for the teams if this is the first round played.
        local iRounds = GetData("GameOver.RoundNumber")
        if iRounds == 0 then 
			team.RoundsWon = 0
        end

    CloseContainer(lock) -- must close the container ASAP


   -- factor handicap into deciding worm health
    local scheme = QueryContainer("GM.SchemeData")
    local delta = 0
    if scheme.WormHealth == 50 then
      delta = 25
    elseif scheme.WormHealth == 100 then
      delta = 25
    elseif scheme.WormHealth == 150 then
      delta = 50
    elseif scheme.WormHealth == 200 then
      delta = 100
    end
   -- handicap will be set to either -1,0,1
    local Energy = scheme.WormHealth + (Handicap*delta)
	if isDuel == true then NumWorms = 1 end
	for i = 0,NumWorms-1 do
		--Re_Message("Try to spawn worm " .. wormNames[i] .. " spawn:" .. teamSpawnIndex + wormSpawnIndex)
		Renew_SetupMultiplayerWorm(tIndex, wormNames[i+1], Speech, Energy, teamSpawnIndex + i)
		--Re_Message("Worm Spawn OK")
	end
    --wormSpawnIndex=wormSpawnIndex+1
   --RrR = 0
   --WormSpawnIndexA=WormSpawnIndexA+1
end



function Renew_SetupMultiplayerWorm(tIndex, Name, Speech, Energy, wWormSpawnIndex)

   
    local scheme = QueryContainer("GM.SchemeData")
   
    local lock, worm = EditContainer(lib_GetWormContainerName(WormIndex))
		
		--Re_Message(Name .. " " .. Speech .. " " .. Energy .. " " .. wWormSpawnIndex)
        worm.Active = true
        worm.PlayedInGame = true
        worm.Name = Name
        worm.TeamIndex = tIndex
        worm.SfxBankName = Speech    
        worm.WeaponFuse = 3
        worm.WeaponIsBounceMax = false
        --Re_Message("Worm Spawn TEST")
        if isSpawns == true then
            worm.Spawn = Renew_GetWormPosition(wWormSpawnIndex)
        else
            worm.Spawn = "spawn"
        end
        worm.Energy = Energy
        local art = scheme.ArtileryMode
        if art == 0 then
            worm.ArtilleryMode = false
        else
            worm.ArtilleryMode = true
        end

    CloseContainer(lock)
	
    WormIndex = WormIndex +1
end

function Renew_GetWormPosition(Id) -- spawn system 2.0 - WORM0..9 - Team1, WORM10..19 - Team2, Worm20..29 - Team 3, Worm 30..39 - Team 4

	local DataId = { "WORM0", "WORM1", "WORM2", "WORM3", "WORM4", "WORM5", "WORM6", "WORM7", "WORM8", "WORM9", "WORM10", "WORM11", "WORM12", "WORM13", "WORM14", "WORM15", "WORM16", "WORM17", "WORM18", "WORM19", "WORM20", "WORM21", "WORM22", "WORM23", "WORM24", "WORM25", "WORM26",  "WORM27",  "WORM28",  "WORM29", "WORM30", "WORM31", "WORM32", "WORM33", "WORM34", "WORM35", "WORM36", "WORM37", "WORM38", "WORM39","spawn" }
	if Id>40 then
		return DataId[41]
	else
		return DataId[Id+1]
	end
end

function Renew_GetRandomSpawns() -- возвращает список спаунов WORM0-WORM23, в котором положение команды рандомно
	local teamPlaces = {0,0,0,0}
	local spawns = {}
	local i = 0
	local myRand = 0
	
	for someTeam = 0,3 do
		while myRand == teamPlaces[1] or myRand == teamPlaces[2] or myRand == teamPlaces[3] or myRand == teamPlaces[4] or i > 100 do        -- пока переменная x равна переменной xlast (прошлое значение x)
			myRand = Re_GetRandom(1, 4)
			i = i + 1
		end
		teamPlaces[someTeam+1] = myRand
		local setsp = 0
		local w = 0
		for wormNum = 1,10 do
            setsp = (myRand-1)*10+wormNum
			w = someTeam*10+wormNum-1
			spawns[setsp] = "WORM" .. w
		end
	end	
	return spawns
end
function Re_GetRandom(min,max)
	if RandomSeed == nil then
		RandomSeed = 0
		SendMessage("RandomNumber.Get")
		RandomSeed = GetData("RandomNumber.Uint")
		RandomSeed = RandomSeed / 1000
	else
		RandomSeed = RandomSeed + 1
	end
	local myRand = min + math.mod(RandomSeed, max+1-min)
	return math.floor(myRand)
end

-- конец скрипта респауна червей

function Re_Message(val)
    local myComment = tostring(val)
    --SendMessage("Commentary.Clear")
    --SendMessage("Commentary.NoDefault")  
    SetData("Text.TestComment",myComment)
    SetData("CommentaryPanel.Comment",  "Text.TestComment")
    SetData("CommentaryPanel.Delay", 30000)
    SendMessage("CommentaryPanel.ScriptText")
end

function Renew_LeaderAndLast ()
    
	 teamHealth = {0, 0, 0, 0}
    
	  wormInfo = QueryContainer ("Worm.Data00") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data01") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data02") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data03") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data04") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data05") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data06") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data07") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data08") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data09") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data10") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data11") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data12") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data13") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	  wormInfo = QueryContainer ("Worm.Data14") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	    wormInfo = QueryContainer ("Worm.Data15") 
	  teamInd = wormInfo.TeamIndex+1;
	  teamHealth[teamInd] = teamHealth[teamInd] + wormInfo.Energy;
	
	  max = 0
	  min = 10000
	  Teams = QueryContainer("GM.GameInitData")
	for i = 1,Teams.NumberOfTeams do 
		if teamHealth[i] > max then
			max = teamHealth[i]
		end
		if teamHealth[i] < min then
			min = teamHealth[i]
		end
	end
	leader = ""
	last = ""
	if max ~= min then
		for i = 1,Teams.NumberOfTeams do 
			team0 = nil
			if teamHealth[i] == max then
				if i == 1 then
					team0 = QueryContainer ("Team.Data00") 
				elseif i == 2 then 
					team0 = QueryContainer ("Team.Data01") 
				elseif i == 3 then 
					team0 = QueryContainer ("Team.Data02") 
				elseif i == 4 then 
					team0 = QueryContainer ("Team.Data03") 
				end

		 		if team0.AlliedGroup == 0 then
		 			leader = leader.." Red";
		 		elseif team0.AlliedGroup == 1 then
		 			leader = leader.." Blue";
		 		elseif team0.AlliedGroup == 2 then
		 			leader = leader.." Green";
		 		elseif team0.AlliedGroup == 3 then
		 			leader = leader.." Yellow";
		 		end
			end
			if teamHealth[i] == min then
				if i == 1 then
					team0 = QueryContainer ("Team.Data00") 
				elseif i == 2 then 
					team0 = QueryContainer ("Team.Data01") 
				elseif i == 3 then 
					team0 = QueryContainer ("Team.Data02") 
				elseif i == 4 then 
					team0 = QueryContainer ("Team.Data03") 
				end

		 		if team0.AlliedGroup == 0 then
		 			last = last.." Red";
		 		elseif team0.AlliedGroup == 1 then
		 			last = last.." Blue";
		 		elseif team0.AlliedGroup == 2 then
		 			last = last.." Green";
		 		elseif team0.AlliedGroup == 3 then
		 			last = last.." Yellow";
		 		end
			end
		end
		SetData("Renew.BriefSub",  "Leader:"..leader.."; Last:"..last..";")
	else
		team0 = QueryContainer ("Team.Data01");
		
		SetData("Renew.BriefSub",  "No Leader, No Last")
	end

    
end
