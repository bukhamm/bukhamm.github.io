
    isPro = false
    isGirder = true

    ClothesList = {}
	SetClothNum = 1
	ClothesList[1] = "WXFE.A.Hat.Arabian" -- альфа каска
	ClothesList[2] = "WXFE.A.Hat.Arabian.D" -- выпускник
	ClothesList[3] = "WXFE.A.Hat.Arabian.R" -- треуголка
	ClothesList[4] = "WXFE.A.Hat.Arabian.W" -- повар
	ClothesList[5] = "WXFE.A.Hat.Baseball" -- козырек
	ClothesList[6] = "WXFE.A.Hat.Baseball.P" -- не заменилась (розовая кепка) !!! должен быть козырек СССР
	ClothesList[7] = "WXFE.A.Hat.Baseball.Pe" -- нян кэт
	ClothesList[8] = "WXFE.A.Hat.Baseball.R" -- бейсболка роупер
	ClothesList[9] = "WXFE.A.Hat.Baseball.T17" -- бейсболка маст дай
	ClothesList[10] = "WXFE.A.Hat.Bishop" -- пусто !!! должен быть хедкраб
	ClothesList[11] = "WXFE.A.Hat.Chinese" -- фермер
	ClothesList[12] = "WXFE.A.Hat.Cowboy.R" -- не заменилась (ковбой высокий) !!! Наушники должны быть
	ClothesList[13] = "WXFE.A.Hat.Hockey" -- дьявол
	ClothesList[14] = "WXFE.A.Hat.Party" -- кепка пойзон
	ClothesList[15] = "WXFE.A.Hat.Pigtails.Bl" -- бумажный пакет
	ClothesList[16] = "WXFE.A.Hat.Police" -- шлемофон
	ClothesList[17] = "WXFE.A.Hat.QueenOfSheba" -- баба соник
	ClothesList[18] = "WXFE.A.Hat.Spacesuit.Bl" -- соник
	ClothesList[19] = "WXFE.A.Hat.Spacesuit.Gy" -- сварочный шлем
	ClothesList[20] = "WXFE.A.Hat.Spacesuit.P" -- астронафт зеленый
	ClothesList[21] = "WXFE.A.Hat.Viking" -- рога дьявола
	ClothesList[22] = "WXFE.A.Glasses.3D" -- прицел
	ClothesList[23] = "WXFE.A.Glasses.Star" -- не заменилось (розовые очки) !!! должны быть смайлы
	ClothesList[24] = "WXFE.A.Glasses.Star.L" -- очки хипстер
	ClothesList[25] = "WXFE.A.Glasses.Star.Z" -- очки доллары
	ClothesList[26] = "WXFE.A.Glasses.Pirate.R" -- очки жалюзи
	ClothesList[27] = "WXFE.A.Mustache.Curly.B" -- усы белые (не заменилось) !!! должен быть рюкзак
	ClothesList[28] = "WXFE.A.Mustache.Curly.R" -- вылет - должен быть респиратор
	
	
function Initialise()
   StartedSuddenDeath = false
   
   SetupScheme()
   --WNamesFix() -- отключено, нужно добавить функцию в глобальную библиотеку и прописать оружие в языке
   RenewSettings()
   Renew_SetupMultiplayerWormsAndTeams()
   --lib_SetupMultiplayerWormsAndTeams()
   SendMessage("WormManager.Reinitialise")

   --RenewMines()   
--lib_SetupMinesAndOildrums() -- do this after worms are set up to get correct worm collision
   if isIndestructable == true then  
	SetData("Land.Indestructable", 1)
   end
   local scheme = QueryContainer("GM.SchemeData")
   
   SetData("Camera.StartOfTurnCamera","Default")
   
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

function Worm_Died()
	local setHat = ClothesList[SetClothNum]
    -- spawn a replacement if any left
    local Id = GetData("DeadWorm.Id")
    local worm = lib_QueryWormContainer(Id)
    local team = worm.TeamIndex

    local GM = QueryContainer("GM.GameInitData")

	local clothNil = " "
    local WormIndex = GetData("DeadWorm.Id")
    local WormContainer = lib_QueryWormContainer(WormIndex)
    local team = WormContainer.TeamIndex
    local scheme = QueryContainer("GM.SchemeData")
    local lock, EditWorm = EditContainer(lib_GetWormContainerName(WormIndex))
        EditWorm.Energy = scheme.WormHealth
        EditWorm.Active = true
		EditWorm.ATT_Hat = setHat
		EditWorm.ATT_Glasses = clothNil
		EditWorm.ATT_Gloves = clothNil
		EditWorm.ATT_Tash = clothNil
    CloseContainer(lock)
    SendIntMessage("Worm.Respawn", WormIndex)
	SetClothNum = SetClothNum + 1
end

