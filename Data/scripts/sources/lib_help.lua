
-- support functions

function lib_Comment(comment)
   SetData("CommentaryPanel.Comment", comment)
   SendMessage("CommentaryPanel.ScriptText")
end
        
function lib_CreateEmitter(sName, sLocation)
   SetData("Particle.DetailObject", sLocation)
   SetData("Particle.Name", sName)
   SendMessage("Particle.NewEmitter")
   return GetData("Particle.Handle")
end
    
function lib_DeleteEmitter(nEmitterId)
   SendIntMessage("Particle.DelGraphicalEmitter", nEmitterId ) 
end

function lib_DeleteEmitterImmediate(nEmitterId)
   SendIntMessage("Particle.DelGraphicalEmitterImm", nEmitterId ) 
end

function lib_GetRandom(min, max)
   SendMessage("RandomNumber.Get")
   local RawRand = GetData("RandomNumber.Uint")
   local MyRand = min + math.mod(RawRand, max+1-min)
   return MyRand
end

function lib_GetRandomFloat(min, max)
   SendMessage("RandomNumber.Get")
   local RawRand = GetData("RandomNumber.Float")
   local MyRand = min + (RawRand*(max-min))
   return MyRand
end

function lib_GetRandomBool()
   SendMessage("RandomNumber.Get")
   local RawRand = GetData("RandomNumber.Uint")
   local MyRand = math.mod(RawRand, 2)
   return ( MyRand == 1 )
end

function lib_DisplayFailureComment()
   local Comment = { "Miss.Generic.Lose1", "Miss.Generic.Lose2", "Miss.Generic.Lose3", 
                     "Miss.Generic.Lose4", "Miss.Generic.Lose5" }
   local MyRand = lib_GetRandom(1,5)
   SendMessage("Commentary.Clear")
   SendMessage("Commentary.NoDefault")  
   SetData("CommentaryPanel.Comment", Comment[MyRand] )
   SetData("CommentaryPanel.Delay", 30000)
   SendMessage("CommentaryPanel.TimedText")
end

function lib_DisplaySuddenDeathComment()
   local Comment = { "Comment.Sdeath.1", "Comment.Sdeath.2", "Comment.Sdeath.3", 
                     "Comment.Sdeath.4", "Comment.Sdeath.5", "Comment.Sdeath.6" }
   local MyRand = lib_GetRandom(1,6)
   SendMessage("Commentary.Clear")
   SendMessage("Commentary.NoDefault")  
   SetData("CommentaryPanel.Comment", Comment[MyRand] )
   SendMessage("CommentaryPanel.ScriptText")
end

function lib_DisplaySuccessComment()
   local Comment = { "Miss.Generic.Win1", "Miss.Generic.Win2", "Miss.Generic.Win3", 
                     "Miss.Generic.Win4", "Miss.Generic.Win5" }
   local MyRand = lib_GetRandom(1,5)
   SendMessage("Commentary.Clear")
   SendMessage("Commentary.NoDefault")  
   SetData("CommentaryPanel.Comment", Comment[MyRand] )
   SetData("CommentaryPanel.Delay", 30000)
   SendMessage("CommentaryPanel.TimedText")
end

function lib_CreateAirstrike(direction, target, weapon)
   SetData("Airstrike.Direction.Radians", direction) 
   SetData("Airstrike.TargetEntity", target)
   SetData("Airstrike.WeaponProperties", weapon)
   SendMessage("GameLogic.CreateAirstrike")
end


function lib_PlayAnim(animName, worm)
   SendIntMessage("Worm.ResetAnim", worm)
   lib_QueueAnim(animName, worm)
end

function lib_QueueAnim(animName, worm)
   SetData("Worm.ScriptAnim", animName)
   SendIntMessage("Worm.QueueAnim", worm)
end

function lib_DeathmatchMissionTurnEnded()
   -- check win conditions  
   SendMessage("WormManager.GetActiveAlliances")
   local nAllianceCount = GetData("AllianceCount")
   SendMessage("WormManager.GetSurvivingTeam")
   local nWhichTeam = GetData("SurvivingTeamIndex")

   local nRoundTimeRemaining = GetData("RoundTimeRemaining")
   local nRoundTime = GetData("RoundTime")
    
   if nRoundTime>0 and nRoundTimeRemaining <= 0 then
      lib_DisplayFailureComment()
      SendMessage("GameLogic.Mission.Failure")
   elseif nAllianceCount == 0 then
      lib_DisplayFailureComment()
      SendMessage("GameLogic.Mission.Failure")
   elseif nAllianceCount == 1 and nWhichTeam == 1 then
      lib_DisplayFailureComment()
      SendMessage("GameLogic.Mission.Failure")
   elseif nAllianceCount == 1 and nWhichTeam == 0 then
      lib_DisplaySuccessComment()
      SetData("EFMV.GameOverMovie", "Outro")
      SendMessage("GameLogic.Mission.Success")
   else
      StartTurn()
   end
end

function lib_DeathmatchChallengeTurnEnded()

   -- check win conditions  
   SendMessage("WormManager.GetActiveAlliances")
   local nAllianceCount = GetData("AllianceCount")
   SendMessage("WormManager.GetSurvivingTeam")
   local nWhichTeam = GetData("SurvivingTeamIndex")

   local nRoundTimeRemaining = GetData("RoundTimeRemaining")
   local nRoundTime = GetData("RoundTime")
    
   if nRoundTime>0 and nRoundTimeRemaining <= 0 then
      lib_DisplayFailureComment()
      SendMessage("GameLogic.Challenge.Failure")
   elseif nAllianceCount == 0 then
      lib_DisplayFailureComment()
      SendMessage("GameLogic.Challenge.Failure")
   elseif nAllianceCount == 1 and nWhichTeam == 1 then
      lib_DisplayFailureComment()
      SendMessage("GameLogic.Challenge.Failure")
   elseif nAllianceCount == 1 and nWhichTeam == 0 then
      lib_DisplaySuccessComment()
      -- SetData("EFMV.GameOverMovie", "Outro")
      SendMessage("GameLogic.Challenge.Success")
   else
      StartTurn()
   end
end

function lib_ShakeCamera(nLength, nMagnitude)
    SetData("Camera.Shake.Length",nLength)
    SetData("Camera.Shake.Magnitude",nMagnitude)
    SendMessage("Camera.ShakeStart")
end


function lib_SetAllWormsEnergy(energy)
   local WormIndex = 0
   local DataId = lib_GetWormContainerName(WormIndex)
   while DataId ~= "" do
      lock, worm = EditContainer(DataId)
      worm.Energy = energy
      CloseContainer(lock)
      WormIndex = WormIndex + 1
      DataId = lib_GetWormContainerName(WormIndex)
   end
end

function lib_CreateExplosion(DetailObject, WormDamageMag, ImpulseMag, WormDamageRadius, LandDamageRadius, ImpulseRadius)

   SetData("Explosion.DetailObject", DetailObject)
   SetData("Explosion.WormDamageMagnitude", WormDamageMag)
   SetData("Explosion.ImpulseMagnitude", ImpulseMag)
   SetData("Explosion.WormDamageRadius", WormDamageRadius)
   SetData("Explosion.LandDamageRadius", LandDamageRadius)
   SetData("Explosion.ImpulseRadius", ImpulseRadius)
   SendMessage("Explosion.Construct")

end

function lib_SubString( SourceResource, DestResource, SearchString, ReplacementString )
   SetData( "String.SourceDataName", SourceResource )
   SetData( "String.DestDataName", DestResource )
   SetData( "String.SearchString", SearchString )
   SetData( "String.ReplaceString", ReplacementString )
   SendMessage( "String.Substitute" )
end

function lib_SubStringIndirect( SourceResource, DestResource, SearchString, ReplacementResource )
   SetData( "String.SourceDataName", SourceResource )
   SetData( "String.DestDataName", DestResource )
   SetData( "String.SearchString", SearchString )
   SetData( "String.ReplaceString", ReplacementResource )
   SendMessage( "String.SubstituteIndirect" )
end


function lib_GetWormContainerName(Id)

   local DataId = { "Worm.Data00", "Worm.Data01", "Worm.Data02", "Worm.Data03",
                    "Worm.Data04", "Worm.Data05", "Worm.Data06", "Worm.Data07",
                    "Worm.Data08", "Worm.Data09", "Worm.Data10", "Worm.Data11",
                    "Worm.Data12", "Worm.Data13", "Worm.Data14", "Worm.Data15",
                    "Worm.Data16", "Worm.Data17", ""}
  
   -- indexed from 1
  return DataId[Id+1]

end


function lib_GetTeamContainerName(Id)

   local DataId = { "Team.Data00", "Team.Data01", "Team.Data02", "Team.Data03", "" }
  
   -- indexed from 1
  return DataId[Id+1]

end

function lib_GetTeamInventoryName(Id)

   local DataId = { "Inventory.Team00", "Inventory.Team01", "Inventory.Team02", "Inventory.Team03", "" }
  
   -- indexed from 1
  return DataId[Id+1]

end


function lib_GetAllianceInventoryName(Id)

   local DataId = { "Inventory.Alliance00", "Inventory.Alliance01", "Inventory.Alliance02", "Inventory.Alliance03", "" }
  
   -- indexed from 1
  return DataId[Id+1]

end


function lib_GetStockpileInventoryName(Id)

   local DataId = { "Inventory.Stockpile00", "Inventory.Stockpile01", "Inventory.Stockpile02", "Inventory.Stockpile03", "" }
  
   -- indexed from 1
  return DataId[Id+1]

end


function lib_GetWormInventoryName(Id)

   local DataId = { "Inventory.Worm00", "Inventory.Worm01", "Inventory.Worm02", "Inventory.Worm03", "Inventory.Worm04",  
					"Inventory.Worm05", "Inventory.Worm06", "Inventory.Worm07", "Inventory.Worm08",
					"Inventory.Worm09", "Inventory.Worm10", "Inventory.Worm11", "Inventory.Worm12",
					"Inventory.Worm13", "Inventory.Worm14", "Inventory.Worm15",
					 "" }
  
   -- indexed from 1
  return DataId[Id+1]

end

function lib_QueryWormContainer(...)

   if arg.n == 1 then
      Id = arg[1]
   else
      Id = GetData("ActiveWormIndex")
   end

   ContainerName = lib_GetWormContainerName(Id)
   return  QueryContainer(ContainerName) 

end

function lib_GetWormTeamIndex(index)
    local DataId = lib_GetWormContainerName(index)
    local worm = QueryContainer(DataId)
	return worm.TeamIndex
end

function lib_GetWormName(index)
if index < 0 then return "" end
if index > 16 then return "" end
    local DataId = lib_GetWormContainerName(index)
    local worm = QueryContainer(DataId)
	return worm.Name
end

function lib_GetTeamName(index)
if index < 0 then return "" end
if index > 4 then return "" end
    local DataId = lib_GetTeamContainerName(index)
    local team = QueryContainer(DataId)
	return team.Name
end


function lib_SetupCrate(DataId)
   local CrateContainerData = QueryContainer(DataId)
   SendMessage("GameLogic.ResetCrateParameters")
   SetData("Crate.Type", CrateContainerData.Type)
   SetData("Crate.Contents", CrateContainerData.Contents)
   SetData("Crate.NumContents", CrateContainerData.NumContents)
   SetData("Crate.Index", CrateContainerData.Index)
   SetData("Crate.LifetimeSec", CrateContainerData.LifetimeSec)
   SetData("Crate.GroundSnap", CrateContainerData.GroundSnap)
   SetData("Crate.Parachute", CrateContainerData.Parachute)
   SetData("Crate.Spawn", CrateContainerData.Spawn)
   SetData("Crate.FallSpeed", CrateContainerData.FallSpeed)
   SetData("Crate.Gravity", CrateContainerData.Gravity)
   SetData("Crate.TeamDestructible", CrateContainerData.TeamDestructible)
   SetData("Crate.TeamCollectable", CrateContainerData.TeamCollectable)
   SetData("Crate.UXB", CrateContainerData.UXB)
   SetData("Crate.Hitpoints", CrateContainerData.Hitpoints)
   SetData("Crate.Pushable", CrateContainerData.Pushable)
   SetData("Crate.RandomSpawnPos", CrateContainerData.RandomSpawnPos)
   SetData("Crate.CanDropFromChute", CrateContainerData.CanDropFromChute)
   SetData("Crate.WaitTillLanded", CrateContainerData.WaitTillLanded)
   SetData("Crate.TrackCam", CrateContainerData.TrackCam)
   SetData("Crate.Scale", CrateContainerData.Scale)
   SetData("Crate.AddToWormInventory", CrateContainerData.AddToWormInventory)
   SetData("Crate.CustomGraphic", CrateContainerData.CustomGraphic)
end

function lib_SpawnCrate(DataId)
   lib_SetupCrate(DataId)
   SendMessage("GameLogic.CreateCrate")
end

function lib_SetupTrigger(DataId)
   local TriggerContainerData = QueryContainer(DataId)
	SendMessage("GameLogic.ResetTriggerParams")
   SetData("Trigger.Spawn", TriggerContainerData.Spawn)
   SetData("Trigger.Radius", TriggerContainerData.Radius)
   SetData("Trigger.Index", TriggerContainerData.Index)
   SetData("Trigger.TeamCollect", TriggerContainerData.TeamCollect)
   SetData("Trigger.TeamDestroy", TriggerContainerData.TeamDestroy)
   SetData("Trigger.HitPoints", TriggerContainerData.HitPoints)
   SetData("Trigger.SheepCollect", TriggerContainerData.SheepCollect)
   SetData("Trigger.PayloadCollect", TriggerContainerData.PayloadCollect)
   SetData("Trigger.GirderCollect", TriggerContainerData.GirderCollect)
   SetData("Trigger.WormCollect", TriggerContainerData.WormCollect)
end

function lib_SpawnTrigger(DataId)
   lib_SetupTrigger(DataId)
	SendMessage("GameLogic.CreateTrigger")
end

function lib_SetupWorm(index, DataId)
   local CopyFromContainer = DataId
   local CopyToContainer = lib_GetWormContainerName(index)
   CopyContainer(CopyFromContainer, CopyToContainer)

   local lock, worm = EditContainer(CopyToContainer)
   worm.Active = true
   worm.PlayedInGame = true
   
   local team = QueryContainer(lib_GetTeamContainerName(worm.TeamIndex))
   if team.IsAIControlled == true then
      -- AI Player: If no worm speech specified copy from the team default
      if worm.SfxBankName == "" then
          worm.SfxBankName = team.SfxBankName
      end
   else 
      -- Human Player: Copy "Mission Team" speech and names
      local GM = QueryContainer("GM.GameInitData")
      worm.SfxBankName = GM.T1_Speech
      if index==0 then
         worm.Name = GM.T1_W1_Name
         SetData("BriefingText.Name0", worm.Name) -- used to substitute with dialogue boxes
      elseif index==1 then
         worm.Name = GM.T1_W2_Name
         SetData("BriefingText.Name1", worm.Name)
      elseif index==2 then
         worm.Name = GM.T1_W3_Name
         SetData("BriefingText.Name2", worm.Name)
      elseif index==3 then
         worm.Name = GM.T1_W4_Name
         SetData("BriefingText.Name3", worm.Name)
      elseif index==4 then
         worm.Name = GM.T1_W5_Name
         SetData("BriefingText.Name4", worm.Name)
      elseif index==5 then
         worm.Name = GM.T1_W6_Name
         SetData("BriefingText.Name5", worm.Name)
      end
   end

   CloseContainer(lock)
end


function lib_SetupInactiveWorm(index, DataId)
   local CopyFromContainer = DataId
   local CopyToContainer = lib_GetWormContainerName(index)
   CopyContainer(CopyFromContainer, CopyToContainer)

   local lock, worm = EditContainer(CopyToContainer)
   worm.Active = false
   worm.PlayedInGame = false
   
   local team = QueryContainer(lib_GetTeamContainerName(worm.TeamIndex))
   if team.IsAIControlled == false then
      local GM = QueryContainer("GM.GameInitData")
      worm.SfxBankName = GM.T1_Speech
      if index==0 then
         worm.Name = GM.T1_W1_Name
      elseif index==1 then
         worm.Name = GM.T1_W2_Name
      elseif index==2 then
         worm.Name = GM.T1_W3_Name
      elseif index==3 then
         worm.Name = GM.T1_W4_Name
      elseif index==4 then
         worm.Name = GM.T1_W5_Name
      elseif index==5 then
         worm.Name = GM.T1_W6_Name
      end
   end

   CloseContainer(lock)
end


function lib_SetupTeam(index, DataId)
   local CopyFromContainer = DataId
   local CopyToContainer = lib_GetTeamContainerName(index)
   CopyContainer(CopyFromContainer, CopyToContainer)   

   local GM = QueryContainer("GM.GameInitData")
   local lock, team = EditContainer(CopyToContainer)
   team.Active = true
   if team.IsAIControlled == false then
      team.Name = GM.T1_Name
      team.FlagGfxName = GM.T1_Flag
      team.GraveIndex = GM.T1_Grave
      team.ATT_Hat = GM.T1_HatAttachment  
      team.ATT_Glasses = GM.T1_GlassesAttachment
      team.ATT_Gloves = GM.T1_GlovesAttachment
      team.ATT_Tash = GM.T1_TashAttachment
   end
   CloseContainer(lock)
end

function lib_SetupWormInventory(index, DataId)
   local CopyFromContainer = DataId
   local CopyToContainer = lib_GetWormInventoryName(index)
   CopyContainer(CopyFromContainer, CopyToContainer)   
end

function lib_SetupTeamInventory(index, DataId)
   local CopyFromContainer = DataId
   local CopyToContainer = lib_GetTeamInventoryName(index)
   CopyContainer(CopyFromContainer, CopyToContainer)   
end

function lib_SetupAllianceInventory(index, DataId)
   local CopyFromContainer = DataId
   local CopyToContainer = lib_GetAllianceInventoryName(index)
   CopyContainer(CopyFromContainer, CopyToContainer)   
end

function lib_SetupMultiplayer()

    -- ensure no water rise weapons or crates (can cause trouble when respwaning worms)
    lock, scheme = EditContainer("GM.SchemeData")
    scheme.FloodMystery.Crate = 0
    scheme.Flood.Crate = 0
    scheme.Flood.Ammo = 0
    CloseContainer(lock)

    local scheme = QueryContainer("GM.SchemeData")
    SetData("Crate.HealthInCrates", scheme.HealthInCrates)
    SetData("Wind.Cap", scheme.WindMaxStrength)
    SetData("HotSeatTime", scheme.HotSeat)
    SetData("TurnTime", scheme.TurnTime)
    SetData("RoundTime", scheme.RoundTime)
  
    -- Inventories and delays
    -- Setup per alliance not team
    lib_SetupDefaultInventoryAndDelays()
    local Inventory = { "Inventory.Alliance00", "Inventory.Alliance01", "Inventory.Alliance02", "Inventory.Alliance03" }
    local a
    for a = 0,3 do
       CopyContainer("Inventory.Alliance.Default", Inventory[a+1])
       -- remove surrender from all inventories
       lock, inventory = EditContainer(Inventory[a+1])
       inventory.Surrender = 0
       CloseContainer(lock)
       lib_SetupTeamWeaponDelays(a, "Inventory.WeaponDelays.Default")
    end

    lib_SetupMultiplayerWormsAndTeams()
   
    
end


function lib_SetupMultiplayerWormsAndTeams()

   WormIndex = 0
   TeamIndex = 0

   GM = QueryContainer("GM.GameInitData")

   if GM.NumberOfTeams>=1 then 
      lib_SetupMultiplayerTeam(GM.T1_Name, GM.T1_Player, GM.T1_NumOfWorms, GM.T1_W1_Name, GM.T1_W2_Name, GM.T1_W3_Name, GM.T1_W4_Name, GM.T1_W5_Name, GM.T1_W6_Name,
               GM.T1_Skill, GM.T1_Grave, GM.T1_Flag, GM.T1_Speech, GM.T1_IsLocal, GM.T1_AlliedGroup, GM.T1_Handicap, GM.T1_HatAttachment, GM.T1_GlassesAttachment, GM.T1_TashAttachment, GM.T1_GlovesAttachment)
   end  
   if GM.NumberOfTeams>=2 then 
      lib_SetupMultiplayerTeam(GM.T2_Name, GM.T2_Player, GM.T2_NumOfWorms, GM.T2_W1_Name, GM.T2_W2_Name, GM.T2_W3_Name, GM.T2_W4_Name, GM.T2_W5_Name, GM.T2_W6_Name,
               GM.T2_Skill, GM.T2_Grave, GM.T2_Flag, GM.T2_Speech, GM.T2_IsLocal, GM.T2_AlliedGroup, GM.T2_Handicap, GM.T2_HatAttachment, GM.T2_GlassesAttachment, GM.T2_TashAttachment, GM.T2_GlovesAttachment)
   end
   if GM.NumberOfTeams>=3 then 
      lib_SetupMultiplayerTeam(GM.T3_Name, GM.T3_Player, GM.T3_NumOfWorms, GM.T3_W1_Name, GM.T3_W2_Name, GM.T3_W3_Name, GM.T3_W4_Name, GM.T3_W5_Name, GM.T3_W6_Name,
               GM.T3_Skill, GM.T3_Grave, GM.T3_Flag, GM.T3_Speech, GM.T3_IsLocal, GM.T3_AlliedGroup, GM.T3_Handicap,  GM.T3_HatAttachment, GM.T3_GlassesAttachment, GM.T3_TashAttachment, GM.T3_GlovesAttachment)
   end  
   if GM.NumberOfTeams>=4 then 
      lib_SetupMultiplayerTeam(GM.T4_Name, GM.T4_Player, GM.T4_NumOfWorms, GM.T4_W1_Name, GM.T4_W2_Name, GM.T4_W3_Name, GM.T4_W4_Name, GM.T4_W5_Name, GM.T4_W6_Name,
               GM.T4_Skill, GM.T4_Grave, GM.T4_Flag, GM.T4_Speech, GM.T4_IsLocal, GM.T4_AlliedGroup, GM.T4_Handicap,  GM.T4_HatAttachment, GM.T4_GlassesAttachment, GM.T4_TashAttachment, GM.T4_GlovesAttachment)
   end
    

end


function lib_SetupMultiplayerTeam(TeamName, PlayerName, NumWorms, Worm1Name, Worm2Name, Worm3Name, Worm4Name, Worm5Name, Worm6Name,
                   Skill, Grave, Flag, Speech, IsLocal, AlliedGroup, Handicap,
                   HatAttachment, GlassesAttachment, TashAttachment, GlovesAttachment)

   local lock, team

   lock, team = EditContainer(lib_GetTeamContainerName(TeamIndex)) 
   team.Active = true
   team.Name = TeamName
   team.Player = PlayerName
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
   if iRounds == 0 
   then 
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

   if NumWorms>=1 then 
      lib_SetupMultiplayerWorm(Worm1Name, Speech, Energy) 
   end   
   if NumWorms>=2 then 
      lib_SetupMultiplayerWorm(Worm2Name, Speech, Energy) 
   end
   if NumWorms>=3 then 
      lib_SetupMultiplayerWorm(Worm3Name, Speech, Energy) 
   end
   if NumWorms>=4 then 
      lib_SetupMultiplayerWorm(Worm4Name, Speech, Energy) 
   end
   if NumWorms>=5 then 
      lib_SetupMultiplayerWorm(Worm5Name, Speech, Energy) 
   end
   if NumWorms>=6 then 
      lib_SetupMultiplayerWorm(Worm6Name, Speech, Energy) 
   end

   TeamIndex = TeamIndex+1

end


function lib_SetupMultiplayerWorm(Name, Speech, Energy)
   
   local scheme = QueryContainer("GM.SchemeData")
   local lock, worm 

   lock, worm = EditContainer(lib_GetWormContainerName(WormIndex))
   worm.Active = true
   worm.PlayedInGame = true
   worm.Name = Name
   worm.TeamIndex = TeamIndex
   worm.SfxBankName = Speech    
   worm.WeaponFuse = 3
   worm.WeaponIsBounceMax = false
   worm.Spawn = "spawn"
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


function lib_GetActiveAlliances()
    SendMessage("WormManager.GetActiveAlliances")
  
    local AllianceCount = GetData("AllianceCount")
    return AllianceCount
end


function lib_GetSurvivingTeamIndex()
    SendMessage("WormManager.GetSurvivingTeam")
    
    local WinningTeam = GetData("SurvivingTeamIndex")
    return WinningTeam
end


function lib_CreateTelepad(location, group)
    SetData("Telepad.Location", location)
    SetData("Telepad.Group", group)
    SendMessage("GameLogic.CreateTelepad")
end

function lib_CreateWXBriefingBox(type, textId, image)
    local text = GetData(textId) -- convert the resource into text
    SetData("WXD.BriefingText", text)
    SetData("WXD.BriefingImage", image)
    -- GameLogicService will take care of pausing/unpausing
    SendStringMessage("GameLogic.CreateBriefingBox", type)
end

function lib_SetupTeamWeaponDelays(index, dataID)
   local DelayContainers = {"Inventory0.WeaponDelays", "Inventory1.WeaponDelays", "Inventory2.WeaponDelays", "Inventory3.WeaponDelays" }
   local CopyFromContainer = dataID
   local CopyToContainer = DelayContainers[index+1]
   CopyContainer(CopyFromContainer, CopyToContainer)   
end

function lib_SetupDefaultInventoryAndDelays()

   -- Open the containers for read and write
   local inventory_lock, inventory = EditContainer("Inventory.Alliance.Default") 
   local delays_lock, delays = EditContainer("Inventory.WeaponDelays.Default") 
   local scheme = QueryContainer("GM.SchemeData")
 
   -- Airstrike
   delays.Airstrike    = scheme.Airstrike.Delay
   inventory.Airstrike = scheme.Airstrike.Ammo

   -- BananaBomb
   delays.BananaBomb    = scheme.BananaBomb.Delay
   inventory.BananaBomb = scheme.BananaBomb.Ammo

   -- BaseballBat
   delays.BaseballBat    = scheme.BaseballBat.Delay
   inventory.BaseballBat = scheme.BaseballBat.Ammo

   -- Bazooka
   delays.Bazooka    = scheme.Bazooka.Delay
   inventory.Bazooka = scheme.Bazooka.Ammo

   -- ClusterGrenade
   delays.ClusterGrenade    = scheme.ClusterGrenade.Delay
   inventory.ClusterGrenade = scheme.ClusterGrenade.Ammo

   -- ConcreteDonkey
   delays.ConcreteDonkey    = scheme.ConcreteDonkey.Delay
   inventory.ConcreteDonkey = scheme.ConcreteDonkey.Ammo

   -- Dynamite
   delays.Dynamite    = scheme.Dynamite.Delay
   inventory.Dynamite = scheme.Dynamite.Ammo

   -- FirePunch
   delays.FirePunch    = scheme.FirePunch.Delay
   inventory.FirePunch = scheme.FirePunch.Ammo
   
   -- Flood
   delays.Flood    = scheme.Flood.Delay
   inventory.Flood = scheme.Flood.Ammo
   
   -- Girder
   delays.Girder    = scheme.Girder.Delay
   inventory.Girder = scheme.Girder.Ammo
 
   -- Grenade
   delays.Grenade =  scheme.Grenade.Delay
   inventory.Grenade =  scheme.Grenade.Ammo
   
   -- HolyHandGrenade
   delays.HolyHandGrenade    = scheme.HolyHandGrenade.Delay
   inventory.HolyHandGrenade = scheme.HolyHandGrenade.Ammo
 
   -- HomingMissile
   delays.HomingMissile    = scheme.HomingMissile.Delay
   inventory.HomingMissile = scheme.HomingMissile.Ammo
 
   -- Jetpack
   delays.Jetpack    = scheme.Jetpack.Delay
   inventory.Jetpack = scheme.Jetpack.Ammo
 
   -- Landmine
   delays.Landmine    = scheme.Landmine.Delay
   inventory.Landmine = scheme.Landmine.Ammo
  
   -- NinjaRope
   delays.NinjaRope    = scheme.NinjaRope.Delay
   inventory.NinjaRope = scheme.NinjaRope.Ammo

   -- OldWoman
   delays.OldWoman    = scheme.OldWoman.Delay
   inventory.OldWoman = scheme.OldWoman.Ammo

   -- Parachute
   delays.Parachute    = scheme.Parachute.Delay
   inventory.Parachute = scheme.Parachute.Ammo

   -- Prod
   delays.Prod    = scheme.Prod.Delay
   inventory.Prod = scheme.Prod.Ammo

   -- SelectWorm
   delays.ChangeWorm    = scheme.SelectWorm.Delay
   inventory.ChangeWorm = scheme.SelectWorm.Ammo

   -- Sheep
   delays.Sheep    = scheme.Sheep.Delay
   inventory.Sheep = scheme.Sheep.Ammo

   -- Shotgun
   delays.Shotgun    = scheme.Shotgun.Delay
   inventory.Shotgun = scheme.Shotgun.Ammo

   -- SkipGo
   delays.SkipGo     = 0
   inventory.SkipGo  = -1

   -- Surrender
   delays.Surrender     = 0
   inventory.Surrender  = -1

   -- SuperSheep
   delays.SuperSheep    = scheme.SuperSheep.Delay
   inventory.SuperSheep = scheme.SuperSheep.Ammo
  
   -- Red bull
   delays.Redbull     = scheme.Redbull.Delay
   inventory.Redbull  = scheme.Redbull.Ammo

   -- Starburst
   delays.Starburst     = scheme.Starburst.Delay
   inventory.Starburst  = scheme.Starburst.Ammo

   -- FactoryWeapon
   delays.WeaponFactoryWeapon     = scheme.WeaponFactoryWeapon.Delay
   inventory.WeaponFactoryWeapon  = scheme.WeaponFactoryWeapon.Ammo

   -- AlienAbduction
   delays.AlienAbduction     = scheme.AlienAbduction.Delay
   inventory.AlienAbduction  = scheme.AlienAbduction.Ammo

   -- Fatkins
   delays.Fatkins     = scheme.Fatkins.Delay
   inventory.Fatkins  = scheme.Fatkins.Ammo

   -- Scouser
   delays.Scouser     = scheme.Scouser.Delay
   inventory.Scouser  = scheme.Scouser.Ammo

   -- NoMoreNails
   delays.NoMoreNails     = scheme.NoMoreNails.Delay
   inventory.NoMoreNails  = scheme.NoMoreNails.Ammo

   -- PoisonArrow
   delays.PoisonArrow     = scheme.PoisonArrow.Delay
   inventory.PoisonArrow  = scheme.PoisonArrow.Ammo

   -- SentryGun
   delays.SentryGun     = scheme.SentryGun.Delay
   inventory.SentryGun  = scheme.SentryGun.Ammo

   -- SniperRifle
   delays.SniperRifle     = scheme.SniperRifle.Delay
   inventory.SniperRifle  = scheme.SniperRifle.Ammo

   -- SuperAirstrike
   delays.SuperAirstrike     = scheme.SuperAirstrike.Delay
   inventory.SuperAirstrike  = scheme.SuperAirstrike.Ammo

   -- BubbleTrouble
   delays.BubbleTrouble     = scheme.BubbleTrouble.Delay
   inventory.BubbleTrouble  = scheme.BubbleTrouble.Ammo

   -- BubbleTrouble
   delays.Binoculars     = scheme.Binoculars.Delay
   inventory.Binoculars  = scheme.Binoculars.Ammo

   -- Gas Canister
   delays.GasCanister     = scheme.GasCanister.Delay
   inventory.GasCanister  = scheme.GasCanister.Ammo

   -- Close the lock
   CloseContainer(delays_lock)
   CloseContainer(inventory_lock)


end



function lib_SetupMinesAndOildrums()
   
   -- note do this AFTER worms have been spawned in so they apear in the collision tests
   

   local scheme = QueryContainer("GM.SchemeData")
   
   --SetData("Mine.DudProbability", 0.1)
   
   log("scheme.MineFuse = ", scheme.MineFuse)
   if scheme.MineFuse == -1 then
      -- random
      SetData("Mine.MinFuse", 0)
      SetData("Mine.MaxFuse", 5000)
   else
      SetData("Mine.MinFuse", scheme.MineFuse*1000)
      SetData("Mine.MaxFuse", scheme.MineFuse*1000)
   end

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
function Re_LoadFixes() -- загрузка всех фиксов ренью
    WNamesFix()
    Re_MenuFix()
end


function WNamesFix() -- фикс смены имен оружия на стандартные

        setText=GetData("Renew.DMTitle")
        SetData("Renew.BriefTitle", setText)

        setText=GetData("Renew.DMTXT")
        SetData("Renew.BriefText", setText)

        setText=GetData("Renew.DMObj1")
        SetData("Renew.BriefObj1", setText)

        setText=GetData("Renew.DMObj2")
        SetData("Renew.BriefObj2", setText)

        setText=GetData("Renew.DMObj3")
        SetData("Renew.BriefObj3", setText)

        SetData("Renew.BriefSub", "mod.worms.pro")  

		setText=GetData("FETXT.AirStrike")
		SetData("Text.kWeaponAirstrike", setText)
		
		setText=GetData("XSave.AlienAbduction")
		SetData("Text.kWeaponAlienAbduction", setText)		

		setText=GetData("FETXT.BananaBomb")
		SetData("Text.kWeaponBananaBomb", setText)

		setText=GetData("FETXT.BaseballBat")
		SetData("Text.kWeaponBaseballBat", setText)
		
		setText=GetData("FETXT.Bazooka")
		SetData("Text.kWeaponBazooka", setText)

		setText=GetData("FETXT.ClusterBomb")
		SetData("Text.kWeaponClusterGrenade", setText)
 
		setText=GetData("XSave.ConcreteDonkey")
		SetData("Text.kWeaponConcreteDonkey", setText)

		setText=GetData("FETXT.Dynamite")
		SetData("Text.kWeaponDynamite", setText)
		
		setText=GetData("FETXT.HomingMissile")
		SetData("Text.kWeaponHomingMissile", setText)		

		setText=GetData("XSave.kWeaponFatkins")
		SetData("Text.kWeaponFatkins", setText)
		
		setText=GetData("FETXT.Firepunch")
		SetData("Text.kWeaponFirePunch", setText)
		
		setText=GetData("FETXT.Flood")
		SetData("Text.kWeaponFlood", setText)		
		
		setText=GetData("FETXT.GasGrenade")
		SetData("Text.kWeaponGasCanister", setText)

		setText=GetData("FETXT.Grenade")
		SetData("Text.kWeaponGrenade", setText)
		
		setText=GetData("FETXT.HolyHandGrenade")
		SetData("Text.kWeaponHolyHandGrenade", setText)

		setText=GetData("FETXT.Landmine")
		SetData("Text.kWeaponLandmine", setText)
		
		setText=GetData("FETXT.TailNail")
		SetData("Text.kWeaponNoMoreNails", setText)

		setText=GetData("FETXT.OldWoman")
		SetData("Text.kWeaponOldWoman", setText)

        setText=GetData("FETXT.PoisonArrow")
		SetData("Text.kWeaponPoisonArrow", setText) 

        setText=GetData("FETXT.Prod")
		SetData("Text.kWeaponProd", setText) 		

		setText=GetData("FETXT.InflatableScouser")
		SetData("Text.kWeaponScouser", setText)

		setText=GetData("FETXT.SentryGun")
		SetData("Text.kWeaponSentryGun", setText)

		setText=GetData("FETXT.Sheep")
		SetData("Text.kWeaponSheep", setText)

		setText=GetData("FETXT.Shotgun")
		SetData("Text.kWeaponShotgun", setText)

		setText=GetData("FETXT.SniperRifle")
		SetData("Text.kWeaponSniperRifle", setText)

		setText=GetData("FETXT.Starburst")
		SetData("Text.kWeaponStarburst", setText)
		
		setText=GetData("XSave.kWeaponSuperAirstrike")
		SetData("Text.kWeaponSuperAirstrike", setText)
		
		setText=GetData("FETXT.SuperSheep")
		SetData("Text.kWeaponSuperSheep", setText)
				
		setText=GetData("FETXT.BubbleTrubble")
		SetData("Text.kUtilityBubbleTrouble", setText)
		
		setText=GetData("FETXT.JetPack")
		SetData("Text.kUtilityJetpack", setText)

		setText=GetData("FETXT.NinjaRope")
		SetData("Text.kUtilityNinjaRope", setText)
        
		setText=GetData("FETXT.Parachute")
		SetData("Text.kUtilityParachute", setText)
		
		setText=GetData("FETXT.IcarusPotion")
		SetData("Text.kUtilityRedbull", setText)

		
end

function Re_MenuFix()
    local setgametype = GetData("GameOver.GameType")
    --Re_Message("Game Type:" .. setgametype)
    if setgametype == "Story" or setgametype == "Challenge" or setgametype == "Tutorial" or setgametype == "Deathmatch" then
        CopyContainer("WXFEP.PauseRenewListBackup2", "WXFEP.PauseRenewList")
    else -- type = Multiplayer
        CopyContainer("WXFEP.PauseRenewListBackup1", "WXFEP.PauseRenewList")
    end
end