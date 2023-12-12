function Initialise()
    Re_LoadFixes()
    
    isWUM = true	
    wSoundPrefix = "weapons/"
    gSoundPrefix = "global/"
    if isWUM == false then -- в WUM звуки имеют директории
        wSoundPrefix = ""
        gSoundPrefix = ""
    end
	


    SpawnScoreCrate()


	SavedTime = 0
	SavedWater = 0
	SavedWaterSkill = 0.1
	WaterSkill = 0.001
	IsWaterPause = false
    WaterPauseTime = 5000
    WaterPauseDefaultTime = 5000
    
	IsChecking = true
    IsWormUnspawn = false
	CheckPointsCount = GetData("Databank.CheckPointsCount")
    RaceMode = GetData("Databank.RaceMode") -- 1: классика, 2: кольцевая гонка, 3: случайный спаун, 4: побег от воды
	SetCheckPoint = 2
	
	SetData("Land.Indestructable", 1)
	SetData("TurnTime", 0)
    SetData("RoundTime",0)
	SetData("HotSeatTime", 0) 
    SetData("RetreatTime", 0) 
    --SetData("DefaultRetreatTime",0)
    --SetData("PostActivityTime",0)
    SetData("HUD.Clock.DisplayTenths", 1)
    
	lib_SetupTeam(0, "PlayerTeam")
	lib_SetupWorm(0, "PlayerWorm")
	lib_SetupTeamInventory(0, "PlayerInventory")
	
    WLoadRopeDynamite()
    WLoadRopeSuicide()
    
    
    if RaceMode == 4 then
        setText=GetData("Renew.LevelFAFTitle")
        SetData("Renew.BriefTitle", setText)

        setText=GetData("Renew.LevelFAFTXT")
        SetData("Renew.BriefText", setText)

        setText=GetData("Renew.LevelFAFObj1")
        SetData("Renew.BriefObj1", setText)

        setText=GetData("Renew.LevelFAFObj2")
        SetData("Renew.BriefObj2", setText)

        setText=GetData("Renew.LevelFAFObj3")
        SetData("Renew.BriefObj3", setText)	     
    else
        setText=GetData("Renew.LevelRRTitle")
        SetData("Renew.BriefTitle", setText)

        setText=GetData("Renew.LevelRR1TXT")
        SetData("Renew.BriefText", setText)

        setText=GetData("Renew.LevelRRObj1")
        SetData("Renew.BriefObj1", setText)

        setText=GetData("Renew.LevelRRObj2")
        SetData("Renew.BriefObj2", setText)

        setText=GetData("Renew.LevelRRObj3")
        SetData("Renew.BriefObj3", setText)	    
    end
    
	
	
		
	SendMessage("WormManager.Reinitialise")	
	
	SetData("Trigger.Visibility", 0)	
    --SetData("Worm.FallDamageRatio", 100)		
   	SendMessage("Commentary.NoDefault")	
	
	
    --SetData("Camera.StartOfTurnCamera", "Default")





    SetData("Ninja.NumShots", -1)
    SetData("Ninja.MaxLength", 650)
	
    
 	
	

   	Update()
   	if RaceMode == 4 then -- FAF mode
        WaterUp() 
        SetData("HUD.Counter.Active", 1)
    end 
	SpawnCheckPoint()
    StartFirstTurn()
	SendMessage("Timer.StartHotSeatTimer") 
end

function WaterUp()
	if IsWaterPause == false then
		WaterSkill = WaterSkill+0.015;
		SetData("Water.Level", GetData("Water.Level") + WaterSkill)
		SetData("HUD.Counter.Value", tonumber(WaterSkill)) 
	else
        WaterPauseTime = WaterPauseTime - 100
        if WaterPauseTime <= 0 then
            IsWaterPause = false 
            WaterPauseTime = WaterPauseDefaultTime
        end
    end
	StartTimer("WaterUp",100)
end

function Update()
	if IsChecking == true then
		CheckWaterDeath()
	end
	StartTimer("Update", 10)
end
function CheckWaterDeath()
	local waterLevel = GetData("Water.Level")
	local worm = QueryContainer("Worm.Data00")
	SetData("Text.TestComment",worm.Position)
	lib_SubString("Text.TestComment","Text.TestComment","(","WVector = {")
	lib_SubString("Text.TestComment","Text.TestComment",")","}")
		  
	local TextTable = GetData("Text.TestComment")
	assert(loadstring(TextTable))()
	if WVector.y< 3 + waterLevel then
		IsChecking = false
        IsWormUnspawn = true
		SendMessage("Weapon.Delete")
		SendMessage("Utility.Delete")
		SendMessage("Timer.EndTurn") 
		SendMessage("Weapon.DisableWeaponChange")
		SendIntMessage("WXWormManager.UnspawnWorm", 0)
		local worm = QueryContainer("Worm.Data00")
		local wormhp = worm.Energy
		local lock, EditWorm = EditContainer(lib_GetWormContainerName(0))
			EditWorm.PlayedInGame = true
			EditWorm.Energy = 100
			EditWorm.Active = true
			SetData("Camera.StartOfTurnCamera", "Default")
		CloseContainer(lock)
		SendIntMessage("Worm.Respawn", 0) 
        IsWormUnspawn = false
		EndTurn()
		LoadGame()
	end
	
end


function Crate_Collected()
    local crateIndex = GetData("Crate.Index")
    if crateIndex == 60 then
        SendStringMessage("WXMsg.CreatePopUp","WXFEP.RenewCustomTop")
	elseif SetCheckPoint >= CheckPointsCount then
		SendMessage("GameLogic.Challenge.Success")
	else
        local lock, EditWorm = EditContainer(lib_GetWormContainerName(0))
       		EditWorm.Spawn = "CheckPoint" .. SetCheckPoint
        CloseContainer(lock)
		SetCheckPoint = SetCheckPoint + 1
		SaveGame()
		SpawnCheckPoint()
	
	end
end
function SpawnCheckPoint()
		SetData("Crate.NumContents", 1)
		SetData("Crate.GroundSnap", 0)
		SetData("Crate.Gravity", 0)
        SetData("Crate.Parachute", 0)
        SetData("Crate.CanDropFromChute", 1)
		SetData("Crate.TeamDestructible", 5)
		SetData("Crate.TeamCollectable", -1)
		SetData("Crate.TrackCam", 0)
        SetData("Crate.Index", 1)
		SetData("Crate.Scale", 4)  
		SetData("Crate.Spawn", "CheckPoint" ..SetCheckPoint)		
		if SetCheckPoint == CheckPointsCount then
            SetData("Crate.Type", "custom") 
            SetData("Crate.Contents", "")            
			SetData("Crate.CustomGraphic", "D02_01")			
		else
            SetData("Crate.Type", "target")
            SetData("Crate.Contents", "taget") 			
		end
		SendMessage("GameLogic.CreateCrate")  	
end


function TurnStarted()
	SendMessage("Timer.StartTurn")
	
	IsChecking = true
end
function TurnEnded()
	SetData("Camera.StartOfTurnCamera", "Default")
    StartTurn()
end


function Worm_Died()
    if IsWormUnspawn == false then
        IsChecking = false
        deadIndex = 0
        local deadCont = lib_QueryWormContainer(deadIndex)
        local lock, worm = EditContainer(lib_GetWormContainerName(deadIndex))
            worm.PlayedInGame = true
            worm.Active = true 
            worm.Energy = 100
            worm.PhysicsOverride =  0
        CloseContainer(lock)
        --SendMessage("Timer.EndTurn") 
        SendIntMessage("Worm.Respawn", deadIndex)
        EndTurn()
        LoadGame()	
    end
end

function SaveGame()
	SavedTime = GetData ("ElapsedRoundTime")
	SavedWaterSkill = WaterSkill
	SavedWater = GetData("Water.Level")
end

function LoadGame()
	SetData("ElapsedRoundTime", SavedTime)
	SetData("Water.Level", SavedWater)
	WaterSkill = SavedWaterSkill
	IsWaterPause = true
end


function Re_Message(val)
    local myComment = tostring(val)
    --SendMessage("Commentary.Clear")
    --SendMessage("Commentary.NoDefault")  
    SetData("Text.TestComment",myComment)
    SetData("CommentaryPanel.Comment",  "Text.TestComment")
    SetData("CommentaryPanel.Delay", 30000)
    SendMessage("CommentaryPanel.ScriptText")
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

	SetData("Crate.NumContents", 1)
	SetData("Crate.GroundSnap", 1)
	SetData("Crate.Gravity", 1)
    SetData("Crate.Parachute", 1)
    SetData("Crate.CanDropFromChute", 1)
	SetData("Crate.TeamDestructible", 5)
	SetData("Crate.TeamCollectable", 0)
	SetData("Crate.TrackCam", 1)
    SetData("Crate.Index", 60)
	SetData("Crate.Scale", 1)        
	SetData("Crate.Spawn", "ScoreCrate")	
    SetData("Crate.Type", "custom") 
    SetData("Crate.Contents", "")            
	SetData("Crate.CustomGraphic", "D04_04")
    SendMessage("GameLogic.CreateCrate")
    SendIntMessage("Crate.RadarHide", 60)

end