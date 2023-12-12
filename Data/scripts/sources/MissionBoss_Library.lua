IsChecking = true
IsWormUnspawn = false
ActiveWormIndex = -1
ActiveTeamIndex = -1
IsWaterProof = true
WaterProofList = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false}
SavedHPList = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
-- worms IDs and HP with water proof enable function end worms IDs hp save points

function TurnStarted()
	IsChecking = true
	if IsWaterProof == true then WaterProofSaveHP() end
	UpdateActiveWormAndTeam()
	SuperWeapon()
end

function SuperWeapon() -- rewrite this function to setup boss super weapon

end

function Weapon_Fired()
	if IsWaterProof == true then WaterProofSaveHP() end
end

function Worm_Died()
	IsChecking = false
	local deadIndex = GetData("DeadWorm.Id")
	if WaterProofList[deadIndex+1] == true then
		local isWaterDeath = false
		isWaterDeath = CheckWaterDeath(deadIndex)
		if isWaterDeath == true then 
			WaterDeathRespawn (deadIndex)
		elseif deadIndex == 0 then
			lib_DisplayFailureComment()
			SendMessage("GameLogic.Challenge.Failure")			
		end
	end
	-- проблема: мы запускаем проверку упал ли червь в воду, но она расчитана и на живых червей. Мы же сейчас точно знаем, что червь мертв. Но если он умер не в воде или у него меньше 40 хп, нет никакого другого варианта
	-- надо разбивать функцию проверки смерти в воде на две функцию - функцию проверки и функцию респауна утонувшего червя. При этом вторая функция должна запускаться не из функции проверки, а из той, которая эту проверку инциализировала
end
function CheckWaterProof()
	if IsChecking == true then
		for n = 1,16 do
			if WaterProofList[n] == true then
				local isWaterDeath = CheckWaterDeath(n-1)
				if isWaterDeath == true then WaterDeathRespawn (n-1) end
			end
		end
	end
	StartTimer("CheckWaterProof", 10)
end
-- нужно сохранить хп босса перед падением в воду
function AddWaterProof(id) --AddWaterProofToWormId
	if WaterProofList[id+1] == false then
		WaterProofList[id+1] = true
	end
end
function WaterProofSaveHP()
	for n = 0,15 do
		if WaterProofList[n+1] == true then
			local worm = QueryContainer("Worm.Data0"..n)
			SavedHPList[n+1] = worm.Energy
		end
	end
end

function CheckWaterDeath(wormId)
	local isWaterDeath = false
	local waterLevel = GetData("Water.Level")
	local worm = QueryContainer("Worm.Data0"..wormId)
	local hp = SavedHPList[wormId+1]
	--Re_Message("try to check")
	--Re_Message(wormId .. " : " .. ActiveWormIndex)
	SetData("Text.TestComment",worm.Position)
	lib_SubString("Text.TestComment","Text.TestComment","(","WVector = {")
	lib_SubString("Text.TestComment","Text.TestComment",")","}")
		  
	local TextTable = GetData("Text.TestComment")
	assert(loadstring(TextTable))()
	--Re_Message("vectorY:" ..WVector.y)
	--Re_Message("worm Energy:" ..hp)
	if WVector.y< 3 + waterLevel and hp > 40 then
		isWaterDeath = true
		--Re_Message("Waterdeath test: " ..tostring(isWaterDeath))
	end
	
	return isWaterDeath
end
function WaterDeathRespawn(wormId)
	--Re_Message("Respawn Worm:" ..wormId)
	local worm = QueryContainer("Worm.Data0"..wormId)
	local hp = SavedHPList[wormId+1]
	if IsWormUnspawn == false then
		IsChecking = false
		IsWormUnspawn = true
		if wormId == ActiveWormIndex then
			SendMessage("Weapon.Delete")
			SendMessage("Utility.Delete")
			SendMessage("Timer.EndTurn") 
			SendMessage("Weapon.DisableWeaponChange")
		end		
		SendIntMessage("WXWormManager.UnspawnWorm", wormId)
		local worm = QueryContainer("Worm.Data0"..wormId)
		local hpbossa = hp - 40
		SavedHPList[wormId+1] = hpbossa
		local poisonbossa = worm.PendingPoison
		local lock, EditWorm = EditContainer(lib_GetWormContainerName(wormId))
			EditWorm.PlayedInGame = true
			EditWorm.Energy = hpbossa
			EditWorm.Active = true
			EditWorm.Spawn = "spawn"
			EditWorm.PendingPoison = poisonbossa
		CloseContainer(lock)
		SendIntMessage("Worm.Respawn", wormId)
		EndTurn()		
		IsChecking = true
		IsWormUnspawn = false
	end
end

function UpdateActiveWormAndTeam()
    ActiveWormIndex = GetData("ActiveWormIndex")
    local worm = lib_QueryWormContainer()
    ActiveTeamIndex = worm.TeamIndex
end


function GameLogic_ActiveWormChanged()
    UpdateActiveWormAndTeam()
end


function SpawnScoreCrate()
	ModeInfoTitle = GetData("RenewTXT.TopTitle")
    SetData("Renew.CustomTitle",ModeInfoTitle)
	ModeInfoText = GetData("RenewTXT.TopText")
    SetData("Renew.CustomText",ModeInfoText)
    ModeCancelText = GetData("RenewTXT.NDCancelText")
    SetData("Renew.CustomCancel",ModeCancelText) 
	ModeInfoOpt1 = GetData("Databank.Top1")
    SetData("Renew.CustomOption1",ModeInfoOpt1) 
	ModeInfoOpt2 = GetData("Databank.Top2")
    SetData("Renew.CustomOption2",ModeInfoOpt2) 
	ModeInfoOpt3 = GetData("Databank.Top3")
    SetData("Renew.CustomOption3",ModeInfoOpt3) 
	ModeInfoOpt4 = GetData("Databank.Top4")
    SetData("Renew.CustomOption4",ModeInfoOpt4) 
	ModeInfoOpt5 = GetData("Databank.Top5")
    SetData("Renew.CustomOption5",ModeInfoOpt5) 

    SendMessage("GameLogic.ResetCrateParameters")
	SetData("Crate.NumContents", 1)
	SetData("Crate.TeamDestructible", 5)
	SetData("Crate.TeamCollectable", 0)
    SetData("Crate.Index", 60)
	SetData("Crate.Scale", 1)        
	SetData("Crate.Spawn", "ScoreCrate")	
    SetData("Crate.Type", "custom") 
    SetData("Crate.Contents", "")            
	SetData("Crate.CustomGraphic", "D04_04")
    SendMessage("GameLogic.CreateCrate")
    SendIntMessage("Crate.RadarHide", 60)

end