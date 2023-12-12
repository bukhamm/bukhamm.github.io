-- Rope Race multiplayer mode 2.0 for Renewation modification: mod.worms.pro. Upd 23/08/2023

	IsLog = false
	IsTest = false

	ModeInfoTitle = GetData("RenewTXT.RRInfoTitle")
	ModeInfoText = GetData("RenewTXT.RRInfoText")
    ModeColorTexts = {"","","",""}    
	ModeColorTexts[1] = GetData("RenewTXT.RROpt1Text")
	ModeColorTexts[2] = GetData("RenewTXT.RROpt2Text")
	ModeColorTexts[3] = GetData("RenewTXT.RROpt3Text")
	ModeColorTexts[4] = GetData("RenewTXT.RROpt4Text")
    ModeLeaderBadge = GetData("RenewTXT.RRLeaderText")
	ModeCancelText = GetData("RenewTXT.NDCancelText")
    ModeCheckPointText = GetData("RenewTXT.RRCheckPoint")
    ModeBonusText = GetData("RenewTXT.RRBonusText")
    ModeComboText = GetData("RenewTXT.RRComboText")
    ModeDeathText = GetData("RenewTXT.RRDeathText")
    IsUnspawningWorms = false

function Initialise()
    local scheme = QueryContainer("GM.SchemeData")
    local teams = QueryContainer("GM.GameInitData")
    NumOfTeams = teams.NumberOfTeams
    TeamColors = {0,0,0,0}
    SavedTimes = {0,0,0,0}
    SavedWaters = {0,0,0,0}
    SavedWaterSkills = {0,0,0,0}
    SetCheckPoints = {2,2,2,2}
    IsBonuses = {{},{},{},{}}
    SetScores = {scheme.WormHealth,scheme.WormHealth,scheme.WormHealth,scheme.WormHealth}

    CheckPointsCount = GetData("Databank.CheckPointsCount")

    BonusesCount = GetData("Databank.BonusesCount")
    for i = 1,BonusesCount do
        for t = 1,NumOfTeams do
            IsBonuses[t][i] = true
        end
    end
    RaceMode = GetData("Databank.RaceMode") -- 1: классика, 2: кольцева€ гонка, 3: случайный спаун, 4: побег от воды
    
    SetActiveTeam = 0
    WaterSkill = 0.001
    WaterPause = false
    IsChecking = true
    
    ActiveWormIndex = 0
    ActiveTeamIndex = 0      
    
    ScoreCheckpoint= scheme.HealthInCrates*4
    ScoreBonus = scheme.HealthInCrates
    ScoreBonusCombo = 10
    DeathPenalty = 30
    WinnerScoreMargin = scheme.WormHealth * 10
    Leader = 5
    SetWinnerScoreMarginPercent = 0
    
    SetBonusCombo = 0
    
    isSpawns = true -- в Renewation режиме включит  расстановку на спауны 
    isDuel = true
    SetData("Land.Indestructable", 1)
    --isNoFly = true

    setText=GetData("Renew.RRTitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.RRTXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.RRObj1")
    SetData("Renew.BriefObj1", setText..ScoreBonus)

    setText=GetData("Renew.RRObj2")
    SetData("Renew.BriefObj2", setText..ScoreCheckpoint)

    setText=GetData("Renew.RRObj3")
    SetData("Renew.BriefObj3", setText..WinnerScoreMargin)

    SetData("Renew.CustomTitle",ModeInfoTitle)
    SetData("Renew.CustomText",ModeInfoText)
    SetData("Renew.CustomCancel",ModeCancelText) 
    SetData("Renew.CustomOption1","-") 
    SetData("Renew.CustomOption2","-") 
    SetData("Renew.CustomOption3","-") 
    SetData("Renew.CustomOption4","-")
    
   
	StartedSuddenDeath = false   


	SetupScheme()
	RenewSettings()
    WLoadRopeDynamite()
    WLoadRopeSuicide()

   Renew_SetupMultiplayerWormsAndTeams()
   SendMessage("WormManager.Reinitialise")


    SendMessage("GameLogic.ClearInventories")
    for numberTeam = 1, 4 do
        local lock, inventory = EditContainer("Inventory.Alliance0" .. (numberTeam-1)) 
            inventory.Dynamite = -1
            inventory.NinjaRope = -1
            inventory.Parachute = 0
            inventory.Jetpack = 0
            inventory.Redbull = 0
            inventory.Starburst = -1
        CloseContainer(lock)
        if NumOfTeams >= numberTeam then
            local setTeam = QueryContainer(lib_GetTeamContainerName(numberTeam-1))
            TeamColors[numberTeam] = setTeam.AlliedGroup+1
        end
    end
	local scheme = QueryContainer("GM.SchemeData")
	if scheme.RoundTime <= 300000 then
		SetData("RoundTime", 300000)
	end

    --SetData("TurnTime", 30000)
	SetData("HUD.Counter.Active", 1)

    SetData("Camera.StartOfTurnCamera","Default")

    WaitingForStartFirstTurn = false

    StartFirstTurn()
end

function TurnStarted()
    UpdateActiveWormAndTeam()
    SpawnCheckPoint()
    SpawnBonuses()
    SetData("HUD.Counter.Value", SetScores[ActiveTeamIndex+1])
end

function TurnEnded()
    SendIntMessage("Crate.Delete", 1)
    UnspawnBonuses()
    SetBonusCombo = 0
    CheckResult()
    local isOpen = GetData("WXFEP.IsPopupOpen")
    if isOpen == 0 then SendStringMessage("WXMsg.CreatePopUp","WXFEP.RenewCustomMini") end

    local RoundTimeRemaining = GetData("RoundTimeRemaining")
    if RoundTimeRemaining == 0 and Leader == 5 then
        SendMessage("GameLogic.Draw")
        SetData("Text.TestComment",'Nothing')
        lib_Comment("Text.TestComment") 
    elseif RoundTimeRemaining == 0 or SetWinnerScoreMarginPercent >= 100 then
        SendMessage("GameLogic.Draw")
		SendIntMessage("GameLogic.Win", Leader-1)	
    else
        CheckOneTeamVictory()      
    end
end

function CheckResult()
    Leader = 5
    local leaderScore = 0
    local secondScore = 0
    local leaderBadge = {"","","","",""}
    SetWinnerScoreMarginPercent = 0

    for t=1,4 do
        if SetScores[t] > leaderScore then secondScore = leaderScore leaderScore = SetScores[t] Leader = t
        elseif SetScores[t] > secondScore then  secondScore = SetScores[t] end
    end
    SetWinnerScoreMarginPercent = (leaderScore-secondScore) / WinnerScoreMargin * 100
    SetWinnerScoreMarginPercent = math.ceil(SetWinnerScoreMarginPercent)
    leaderBadge[Leader] = " (" .. ModeLeaderBadge .. " " .. SetWinnerScoreMarginPercent .. "%)"
    
    for t=1,NumOfTeams do
        SetData("Renew.CustomOption"..TeamColors[t], ModeColorTexts[TeamColors[t]] .. SetScores[t] .. leaderBadge[t])
    end
end


function DoOncePerTurnFunctions()

end




---------------------------- ‘”Ќ ÷»я –≈—ѕј”Ќј „≈–¬я ѕќ—Ћ≈ ¬«я“»я ‘»Ќ»Ўј
function Respawn(respworm,resptarget)
	
	UpdateActiveWormAndTeam()
    SendMessage("Weapon.Delete")
    SendMessage("Utility.Delete")
    SendMessage("Timer.EndRetreatTimer")
    SendMessage("Timer.EndTurn")  
    SendMessage("Weapon.DisableWeaponChange")
    EndTurn()   
    wormdataname = lib_GetWormContainerName(respworm)
    CopyContainer(wormdataname, "Worm.BeforeRespawning")
    IsUnspawningWorms = true
    SendIntMessage("WXWormManager.UnspawnWorm", respworm)
    lib_SetupWorm(respworm, "Worm.BeforeRespawning")
	
    local lock, worm = EditContainer(wormdataname) 
			worm.Active = true 
			worm.PlayedInGame = true
			worm.Spawn = resptarget
    CloseContainer(lock)	

	
    SendIntMessage("Worm.Respawn", respworm)
    IsUnspawningWorms = false 

end

function Crate_Collected()
    SetScores[ActiveTeamIndex+1] = SetScores[ActiveTeamIndex+1] + ScoreCheckpoint
    CheckResult()
    Re_Message(ModeCheckPointText .. ScoreCheckpoint)
    SetData("HUD.Counter.Value", SetScores[ActiveTeamIndex+1])
    if SetCheckPoints[ActiveTeamIndex+1] < CheckPointsCount then
        SetCheckPoints[ActiveTeamIndex+1] = SetCheckPoints[ActiveTeamIndex+1] + 1
        SpawnCheckPoint()
        local lock, editWorm = EditContainer(lib_GetWormContainerName(ActiveWormIndex))
            editWorm.Spawn = "CheckPoint" .. SetCheckPoints[ActiveTeamIndex+1]-1
            editWorm.Energy = SetScores[ActiveTeamIndex+1]
        CloseContainer(lock)
    else
        SetCheckPoints[ActiveTeamIndex+1] = 2 
        for i = 1,BonusesCount do
            IsBonuses[ActiveTeamIndex+1][i] = true
        end
        Respawn(ActiveWormIndex,"CheckPoint1")
    end
end

function Trigger_Collected() -- Bonus Collected
	local triggerIndex = GetData("Trigger.Index")
    IsBonuses[ActiveTeamIndex+1][triggerIndex-2] = false
    SendIntMessage("Crate.Delete", triggerIndex)	
    SetScores[ActiveTeamIndex+1] = SetScores[ActiveTeamIndex+1] + ScoreBonus + SetBonusCombo
    CheckResult()
    Re_Message(ModeBonusText .. ScoreBonus + SetBonusCombo .. " (+" .. SetBonusCombo .. ModeComboText .. ")")
    SetBonusCombo = SetBonusCombo + ScoreBonusCombo
    SetData("HUD.Counter.Value", SetScores[ActiveTeamIndex+1])
    local emitter = lib_CreateEmitter("Part_CrateSpawn", "Bonus"..triggerIndex-2)
	local wormCont = lib_GetWormContainerName(ActiveWormIndex)
	local lock, wormy = EditContainer(wormCont)
		wormy.Energy = SetScores[ActiveTeamIndex+1]
	CloseContainer(lock)
    --lib_DeleteEmitter(emitter)
end

function SpawnCheckPoint()
		SetData("Crate.NumContents", 1)
		SetData("Crate.GroundSnap", 0)
		SetData("Crate.Gravity", 0)
        SetData("Crate.Parachute", 0)
        SetData("Crate.CanDropFromChute", 1)
		SetData("Crate.TeamDestructible", 5)
		SetData("Crate.TeamCollectable", ActiveTeamIndex)
		SetData("Crate.TrackCam", 0)
        SetData("Crate.Index", 1)
		SetData("Crate.Scale", 4)        
		SetData("Crate.Spawn", "CheckPoint" .. SetCheckPoints[ActiveTeamIndex+1])	
		if SetCheckPoints[ActiveTeamIndex+1] == CheckPointsCount then
            SetData("Crate.Type", "custom") 
            SetData("Crate.Contents", "")            
			SetData("Crate.CustomGraphic", "D02_01")	
	          
		else
			--SetData("Crate.CustomGraphic", "D01_04")
            SetData("Crate.Type", "target")
            SetData("Crate.Contents", "taget")          
		end
		SendMessage("GameLogic.CreateCrate")  	
end
function SpawnBonuses()
    for i = 1,BonusesCount do
        if IsBonuses[ActiveTeamIndex+1][i] == true then
            SetData("Crate.Type", "custom")
            SetData("Crate.NumContents", 1)
            SetData("Crate.Contents", "")
            SetData("Crate.GroundSnap", 0)
            SetData("Crate.Gravity", 0)
            SetData("Crate.TeamDestructible", 5)
            SetData("Crate.TeamCollectable", 5)
            SetData("Crate.TrackCam", 0)
            SetData("Crate.Spawn", "Bonus"..i)		
            SetData("Crate.CustomGraphic", "D02_02")	
            SetData("Crate.Scale", 2)	
            SetData("Crate.Index", 2+i)            
            SendMessage("GameLogic.CreateCrate") 
            SendIntMessage("Crate.RadarHide", 2+i)
            
            
            SendMessage("GameLogic.ResetTriggerParams")
            SetData("Trigger.Spawn", "Bonus"..i)
            SetData("Trigger.Radius", 120)
            SetData("Trigger.Index", 2+i)
            SetData("Trigger.TeamDestroy", 5)
            SetData("Trigger.TeamCollect", -1)
            SetData("Trigger.Visibility", 1)
            SendMessage("GameLogic.CreateTrigger")              
        end
    end
end
function UnspawnBonuses()
    for i = 1,BonusesCount do
        if IsBonuses[ActiveTeamIndex+1][i] == true then
            SendIntMessage("Crate.Delete", 2+i)	
            SendIntMessage("GameLogic.DestroyTrigger", 2+i)
        end
    end
end

function Worm_Died()
    if IsUnspawningWorms == false then
        local wormIndex = GetData("DeadWorm.Id")
        local wormContainer = lib_QueryWormContainer(wormIndex)
        local team = wormContainer.TeamIndex
        local scheme = QueryContainer("GM.SchemeData")
        if ActiveTeamIndex == team then
            SetScores[ActiveTeamIndex+1] = SetScores[ActiveTeamIndex+1] - DeathPenalty
            CheckResult()
            Re_Message(ModeDeathText .. DeathPenalty)
            SetData("HUD.Counter.Value", SetScores[ActiveTeamIndex+1])
        end
        
        
        if SetScores[team+1] >= 0 then 
            local lock, EditWorm = EditContainer(lib_GetWormContainerName(wormIndex))
                EditWorm.Energy = SetScores[team+1]
                EditWorm.Active = true
                EditWorm.PhysicsOverride =  0
            CloseContainer(lock)       
            
            SendIntMessage("Worm.Respawn", wormIndex)
            EndTurn()
        else
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
end


function UpdateActiveWormAndTeam()
    ActiveWormIndex = GetData("ActiveWormIndex")
    local worm = lib_QueryWormContainer(ActiveWormIndex)
    ActiveTeamIndex = worm.TeamIndex
end


function WLoadRopeDynamite()

	local lock, weap = EditContainer("kWeaponDynamite") 
		weap.PayloadGraphicsResourceID = "Factory.Proj.Donut"
		weap.WeaponGraphicsResourceID = "Factory.Proj.Donut"
        weap.DetonationFx = "WXPF_Firework1"
        weap.DetonationSfx = gSoundPrefix .. "ExplosionRegular1"
        weap.LandDamageRadius = 0
        weap.ImpulseRadius = 0
        weap.WormDamageRadius = 0
        weap.WormDamageMagnitude = 0
        weap.ImpulseMagnitude = 0
		weap.Radius = 1        
	CloseContainer(lock)

end

function WLoadRopeSuicide()
		local lock, weap = EditContainer("kWeaponStarburst") -- Suicide OK
			setText=GetData("Renew.kWeaponSuicide")
			SetData("Text.kWeaponStarburst", setText)
			weap.WormDamageMagnitude = 0
			weap.ImpulseMagnitude = 0
			weap.WormDamageRadius = 80
			weap.LandDamageRadius = 0
			weap.ImpulseRadius = 0
			weap.LifeTime = 0
			weap.DetonationFx = "WXP_ExplosionX_Large"
			weap.WXAnimDraw = "DrawStarburst"
			weap.WXAnimHolding = "HoldStarburst"
			weap.WXAnimTaunt = "TauntStarburst"
		CloseContainer(lock)

end