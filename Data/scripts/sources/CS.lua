-- script of Castle Siege game mode (Renewation). Version 04.08.2023
-- добавить проверку победы при смерти 2 из 4 команд; ГОТОВО
-- забалансить ящики для более быстрого прохождения;
-- установить минимальное время раунда; ГОТОВО

IsLog = false
isSpawns = true
IsCupSpawn = false
CrateCountDowns = {0,0,0}
CrateDelays = {3,7,9}
ActiveWormIndex = nil
ActiveTeamIndex = nil  

SpawnStack = {{},{}} -- списки имен червей для возрождения
SpawnStack[1] = {}
SpawnStack[2] = {}
SpawnCounter = {1,1} -- индекс позиции в стаке, которая спаунится следующей
SpawnLength = {0,0} -- текущая длина таблицы спаунов по командам
SpawnDelayValue = 1 -- настройка таймаута между спаунами
SpawnDelay = {0,0} -- текущие таймауты по командам
DeadStack = {{},{}} -- список индексов умерших червей
DeadStackLength = {0,0}
DeadCounter = {1,1}
WormsNum = {0,0,0,0} -- количество живых червей
WormHealth = 100

function Initialise()
	
    ModeGirderCrate = GetData("RenewTXT.CSGirderCrate")
    ModeBubbleCrate = GetData("RenewTXT.CSBubbleCrate")
    ModeSentryCrate = GetData("RenewTXT.CSSentryCrate")
    ModeTXTTurns = GetData("RenewTXT.turns")

    setText=GetData("Renew.CSTitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.CSTXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.CSObj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.CSObj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.CSObj3")
    SetData("Renew.BriefObj3", setText)


	StartedSuddenDeath = false
    MakeCSScheme()
	SetupScheme()
	RenewSettings()
	Renew_SetupMultiplayerWormsAndTeams()
	
	--CreateAlliances()
    SendMessage("WormManager.Reinitialise")
	MakeCSTeams()
 
	local scheme = QueryContainer("GM.SchemeData")
	WormHealth =  scheme.WormHealth

   
	if scheme.MineFactoryOn == true then
		SendMessage("GameLogic.CreateRandMineFactory")
	end
   
	SetData("Camera.StartOfTurnCamera","Default")
   
	--SetWormpotModes()

	WaitingForStartFirstTurn = false
	MakeCSWeapons()
	StartFirstTurn()
	lib_SpawnCrate("CupCrate")
end
function CreateAlliances()
	Teams = QueryContainer("GM.GameInitData")
		lock, team = EditContainer("Team.Data00") 	
			team.TeamColour = 0
			team.AlliedGroup = 0
		CloseContainer(lock)   
		lock, team = EditContainer("Team.Data01") 	
			team.TeamColour = 1
			team.AlliedGroup = 1
		CloseContainer(lock)   
	if Teams.NumberOfTeams > 2 then
		lock, team = EditContainer("Team.Data02") 	
			team.TeamColour = 1
			team.AlliedGroup = 1
		CloseContainer(lock)   
	end
	if Teams.NumberOfTeams > 3 then
		lock, team = EditContainer("Team.Data03") 	
			team.TeamColour = 0
			team.AlliedGroup = 0
		CloseContainer(lock)   
	end

end

function TurnStarted()
    UpdateActiveWormAndTeam()
	-- спауним по очереди - балка / пузырь / пулемет / веревка
			local scheme = QueryContainer("GM.SchemeData")
			if scheme.WormSelect == 1 then
				SendMessage("WormSelect.OptionSelected")
			end
	TeleportIn()
	Teams = QueryContainer("GM.GameInitData")
	if Teams.NumberOfTeams >= 3 then
		Renew_LeaderAndLast ()
	end
	SpawnCrates()
	WormSpawner()

	

end
function Worm_Died()
    local deadIndex = GetData("DeadWorm.Id")
    local deadCont = lib_QueryWormContainer(deadIndex)
    local deadTeam = deadCont.TeamIndex
	local deadName = deadCont.Name

	if deadTeam == 1 or deadTeam == 2 then
		local ind = 1
		if deadTeam == 2 then ind = 2 end
		SpawnLength[ind] = SpawnLength[ind]+1
		SpawnStack[ind][SpawnLength[ind]] = deadName
       
		DeadStackLength[ind] = DeadStackLength[ind] + 1
		DeadStack[ind][DeadStackLength[ind]] = deadIndex	
			
	end
	WormsNum[deadTeam+1] = WormsNum[deadTeam+1] - 1	
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
function WormSpawner()
	local setNumWorms
	local sGM = QueryContainer("GM.GameInitData")
    if ActiveTeamIndex == 1 then setNumWorms = GM.T2_NumOfWorms
    elseif ActiveTeamIndex == 2 then setNumWorms = GM.T3_NumOfWorms
	else setNumWorms = 0 end
	if ActiveTeamIndex == 1 or ActiveTeamIndex == 2 then

		local ind = 1
		if ActiveTeamIndex == 2 then ind = 2 end	
		if WormsNum[ActiveTeamIndex+1] < setNumWorms then
			--SendIntMessage("Worm.Respawn", 4)
			if SpawnDelay[ind] > 0 then
				if IsLog == true then Re_Message("DeadIndex:"..DeadStack[ind][DeadCounter[ind]]) end
				if IsLog == true then Re_Message("DeadName:"..SpawnStack[ind][SpawnCounter[ind]]) end
				local mes1 = GetData("RenewTXT.TF2RespawnMsg1")
				local mes2 = GetData("RenewTXT.TF2RespawnMsg2")
				Re_Message(mes1 .. SpawnDelay[ind] .. mes2)
				SpawnDelay[ind] = SpawnDelay[ind] - 1 
			else
				SpawnDelay[ind] = SpawnDelayValue
				respIndex = DeadStack[ind][DeadCounter[ind]]
				local n = DeadCounter[ind]
				
				DeadCounter[ind] = n + 1
				if IsLog == true then Re_Message("try to spawn "..respIndex) end
				WormSpawn(respIndex,ActiveTeamIndex)
			end
		end		
	end
end
function WormSpawn(respIndex,team) -- респаун червя после смерти
	local ind = 1
	if team == 2 then ind = 2 end	

    local wormCont = lib_QueryWormContainer(respIndex)
    local setTeam = team
	local setName = SpawnStack[ind][SpawnCounter[ind]]
	local setSpawn = wormCont.Spawn
	local setSfxBankName = wormCont.SfxBankName
	
	local copyindex = lib_GetWormContainerName(respIndex)
	CopyContainer("WormBackup"..ind, copyindex)
	local mes = GetData("RenewTXT.TF2Spawned")
    local lock, deadCont = EditContainer(lib_GetWormContainerName(respIndex))
		deadCont.Active = true 
		deadCont.Name = setName
		deadCont.Energy = WormHealth
		deadCont.TeamIndex = ind
		deadCont.Spawn = setSpawn
		deadCont.SfxBankName =  setSfxBankName
    CloseContainer(lock)
	SendIntMessage("Worm.Respawn", respIndex)
	Re_Message(setName .. mes)	
    SpawnCounter[ind] = SpawnCounter[ind] + 1
    WormsNum[team+1] = WormsNum[team+1] + 1
end
function SpawnCrates()
	CrateCountDowns[1] = CrateCountDowns[1] - 1
	CrateCountDowns[2] = CrateCountDowns[2] - 1
	CrateCountDowns[3] = CrateCountDowns[3] - 1
	if CrateCountDowns[1] <= 0 then 
		lib_SpawnCrate("GirderCrate") 
		CrateCountDowns[1] = 100
	elseif CrateCountDowns[1] <= CrateDelays[1] then
		Re_Message(ModeGirderCrate .. CrateCountDowns[1] .. ModeTXTTurns);
	end
	if CrateCountDowns[2] <= 0 then 
		lib_SpawnCrate("BubbleCrate") 
		CrateCountDowns[2] = 100
	elseif CrateCountDowns[2] <= CrateDelays[2] then
		Re_Message(ModeBubbleCrate .. CrateCountDowns[2].. ModeTXTTurns);
	end
	if CrateCountDowns[3] <= 0 then 
		lib_SpawnCrate("SentryCrate") 
		CrateCountDowns[3] = 100
	elseif CrateCountDowns[3] <= CrateDelays[3] then
		Re_Message(ModeSentryCrate .. CrateCountDowns[3].. ModeTXTTurns);
	end
    if IsCupSpawn == false then
		lib_SpawnCrate("CupCrate")
		IsCupSpawn = true
	end
end
function Crate_Collected()
	local crateIndex = GetData("Crate.Index")
	if IsLog == true then Re_Message("crate index " .. crateIndex) end
    if crateIndex == 1 then
		if ActiveTeamIndex == 1 or ActiveTeamIndex == 3 then
			SendMessage("GameLogic.Draw")
			local setText =  GetData("RenewTXT.YouWin")
			Re_Message(setText)
			SendIntMessage("GameLogic.Win", ActiveTeamIndex)
		else
			local setText =  GetData("RenewTXT.CSCupCaution")
			Re_Message(setText)
			IsCupSpawn = false
		end	
	elseif crateIndex == 2 then
		CrateCountDowns[1] = CrateDelays[1]
	elseif crateIndex == 3 then
		CrateCountDowns[2] = CrateDelays[2]
	elseif crateIndex == 4 then
		CrateCountDowns[3] = CrateDelays[3]
	end


end
function UpdateActiveWormAndTeam()
    ActiveWormIndex = GetData("ActiveWormIndex")
    local worm = lib_QueryWormContainer(ActiveWormIndex)
    ActiveTeamIndex = worm.TeamIndex
end

function MakeCSScheme()
    lock, scheme = EditContainer("GM.SchemeData")
		scheme.Girder.Crate = 0
		scheme.Girder.Ammo = 0
		scheme.Girder.Delay = 0
		scheme.Jetpack.Crate = 0
		scheme.Jetpack.Ammo = 0
		scheme.Jetpack.Delay = 0
		scheme.Redbull.Crate = 0
		scheme.Redbull.Ammo = 0
		scheme.Redbull.Delay = 0	
		scheme.NinjaRope.Crate = 0
		scheme.NinjaRope.Ammo = 0
		scheme.NinjaRope.Delay = 0		
		scheme.Parachute.Ammo = -1
		scheme.Parachute.Delay = 0
		scheme.Flood.Crate = 0
		scheme.Flood.Ammo = 0
		scheme.Flood.Delay = 0
		scheme.SentryGun.Crate = 0
		scheme.SentryGun.Ammo = 0
		scheme.SentryGun.Delay = 0	
		scheme.BubbleTrouble.Crate = 0
		scheme.BubbleTrouble.Ammo = 0
		scheme.BubbleTrouble.Delay = 0	
		scheme.SuperSheep.Crate = 0
		scheme.SuperSheep.Ammo = 0
		scheme.SuperSheep.Delay = 0	
		scheme.TeleportMystery.Crate = 0
    CloseContainer(lock)
	local scheme = QueryContainer("GM.SchemeData")
	if scheme.RoundTime <= 1500000 then
		SetData("RoundTime", 1500000)
	end
end
function MakeCSTeams() -- переписать на изменение имен червей циклом. Схему менять - плохая идея
    GM = QueryContainer("GM.GameInitData")
	
	local teamsCount = GM.NumberOfTeams
	local wormsCount = {GM.T1_NumOfWorms,GM.T2_NumOfWorms,GM.T3_NumOfWorms,GM.T4_NumOfWorms}
	WormsNum[1] = GM.T1_NumOfWorms
	WormsNum[2] = GM.T2_NumOfWorms	
	WormsNum[3] = GM.T3_NumOfWorms
	WormsNum[4] = GM.T4_NumOfWorms
	local tmax = teamsCount-1
	for tindex=0,tmax do
		for windex=0,wormsCount[tindex+1]-1 do
			local wormdata = lib_GetWormContainerName(tindex*wormsCount[tindex+1]+windex)
			local lock, worm = EditContainer(wormdata)
				if tindex == 0 or tindex == 3 then worm.Name = "[D] "..worm.Name
				else worm.Name = "[A] "..worm.Name end
			CloseContainer(lock)
			if windex == 0 and tinex == 1 or windex == 0 and tindex == 2 then
				CopyContainer(wormdata, "WormBackup"..tindex)
			end
		end
	end


end
function MakeCSWeapons()
	weapons = {}
	weapons[1] = "kWeaponAirstrike"
	weapons[2] = "kWeaponBananaBomb"
	weapons[3] = "kWeaponBananette"
	weapons[4] = "kWeaponBaseballBat"
	weapons[5] = "kWeaponBazooka"
	weapons[6] = "kWeaponClusterBomb"
	weapons[7] = "kWeaponClusterGrenade"
	weapons[8] = "kWeaponConcreteDonkey"
	weapons[9] = "kWeaponDynamite"
	weapons[10] = "kWeaponFactoryCluster"
	weapons[11] = "kWeaponFactoryHoming"
	weapons[12] = "kWeaponFactoryWeapon"
	weapons[13] = "kWeaponFatkinsFood"
	weapons[14] = "kWeaponFirePunch"
	weapons[15] = "kWeaponGrenade"
	weapons[25] = "kWeaponHolyHandGrenade"
	weapons[17] = "kWeaponHomingMissile"
	weapons[18] = "kWeaponLandmine"
	weapons[19] = "kWeaponLandmineBomblet"
	weapons[20] = "kWeaponLandmineCluster"
	weapons[24] = "kWeaponOldWoman"
	weapons[26] = "kWeaponSheep"
	weapons[22] = "kWeaponStarburst"
	weapons[21] = "kWeaponSuperAirstrike"
	weapons[16] = "FireCluster"
	weapons[23] = "RenewMine"
	weapons[27] = "kWeaponSuperSheep"
	weapons[28] = "kWeaponShotgun"
	weapons[29] = "kWeaponSniperRifle"

	for i = 1,23 do
		local lock, weap = EditContainer(weapons[i])
			weap.LandDamageRadius = 25
		CloseContainer(lock)		
	end
	for i = 24,27 do
		local lock, weap = EditContainer(weapons[i])
			weap.LandDamageRadius = 35
		CloseContainer(lock)		
	end	
	for i = 28,29 do
		local lock, weap = EditContainer(weapons[i])
			weap.LandDamageRadius = 0
			weap.LandDamageMagnitude = 0
		CloseContainer(lock)		
	end	
	SetData("Bubble.Radius", 90)
	SetData("Bubble.OffsetY", 60)
	SetData("Bubble.Lifetime", 4)
end

-- decides if the game has been won or drawn at the end of every turn
-- Note do this last in the TurnEnded function as it finishes with the StartTurn Message
function CheckOneTeamVictory()
   -- Changed to use alliances rather than teams so 2 teams vs 1 can end correctly
	SendMessage("WormManager.GetActiveAlliances")
	AllianceCount = GetData("AllianceCount")
	local defWormsNum = WormsNum[1]+WormsNum[4]
	local atkWormsNum = WormsNum[2]+WormsNum[3]
	local roundTime = GetData("RoundTimeRemaining")

	if AllianceCount == 0 then
		RoundOver()
		-- all the teams have just snuffed it
		SendMessage("GameLogic.Draw")
	elseif defWormsNum > 0 and atkWormsNum == 0 then -- Defenders Wins
		local winningTeam = 0
		RoundOver()
		if WormsNum[1] == 0 then winnerTeam = 3 end
		SendIntMessage("GameLogic.Win", winningTeam)
	elseif defWormsNum == 0 and atkWormsNum > 0 then -- Attackers Wins
		local winningTeam = 1
		RoundOver()
		if WormsNum[2] == 0 then winnerTeam = 2 end
		SendIntMessage("GameLogic.Win", winningTeam)	
	elseif roundTime <= 0 then 
		RoundOver()
		SendIntMessage("GameLogic.Win", 0)
	else
		StartTurn()
	end
   
end

function DoOncePerTurnFunctions()
   -- skip all this if the end of the deathmatch
    SendMessage("WormManager.GetActiveAlliances")
    AllianceCount = GetData("AllianceCount")
    if AllianceCount >1 then
        SendMessage("GameLogic.DropRandomCrate")
        SendMessage("GameLogic.StartMineFactory")
    end
end
