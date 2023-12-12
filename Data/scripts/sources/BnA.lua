function Initialise()  

    setText=GetData("Databank.MapAuthor")
    SetData("Renew.BriefSub", "Map by " .. setText)   
    
    setText=GetData("Renew.BnATitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.BnATXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.DMObj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.DMObj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.DMObj3")
    SetData("Renew.BriefObj3", setText)

	
	
	MyPositions = 0


	--lib_SetupMultiplayer()
	isMaxNumOfWorms = true
	Renew_SetupMultiplayerWormsAndTeams()	
	SendMessage("WormManager.Reinitialise")
	local scheme = QueryContainer("GM.SchemeData")
	if scheme.MineFactoryOn == true then
		SendMessage("GameLogic.CreateRandMineFactory")
	end
   
	if scheme.TelepadsOn == true then
		SendMessage("GameLogic.PlaceTelepads")       
	end
	isWLoadJetPack = true
	RenewWLoad()

	StartFirstTurn()
    lock, scheme = EditContainer("GM.SchemeData")
		scheme.WeaponChance = 0
		scheme.UtilityChance = 0
		scheme.MysteryChance = 0
		scheme.HealthChance = 0
    CloseContainer(lock)
	InvMine()
	Spawning()
	
	SendMessage("GameLogic.ClearInventories")
	Index = 0
	InventoryName = lib_GetAllianceInventoryName(Index)
	while InventoryName ~= "" do
		local Lock,Container = EditContainer(InventoryName)
			Container.Jetpack = 2
			Container.Parachute = -1
			Container.PoisonArrow = -1
			CloseContainer(Lock) 
			Index = Index + 1
			InventoryName = lib_GetAllianceInventoryName(Index)
        end

	local ContainerLock, Container = EditContainer("kWeaponPoisonArrow")
        --Container.IsPoweredWeapon = "false"
        Container.WormDamageMagnitude = 30
        Container.WormDamageRadius = 45
		Container.LandDamageRadius = 50
        Container.ImpulseMagnitude = 0.30
		Container.Scale = 4
		Container.Radius = 4
		--Container.BasePower = 0.65
		Container.ImpulseRadius = 69
		Container.ImpulseOffset = -15
		Container.LifeTime = -1
		Container.SinkDepth = 0
        Container.DetonatesOnLandImpact = "true"
        Container.DetonatesOnExpiry = "false"
        Container.DetonatesOnObjectImpact = "true"
		Container.DetonationFx = ""
		Container.StartsArmed = "true"
		Container.ArmOnImpact = "false"
		Container.PreDetonationTime = 0
		Container.SkimsOnWater = "false"
	    Container.DetonationFx = "WXP_ExplosionX_Med"
	    Container.DetonationSfx = gSoundPrefix .. "ExplosionRegular2"
		Container.ArielFx = "WXP_HomingMissileTrail"
	CloseContainer(ContainerLock)
end


function TurnStarted()
   local scheme = QueryContainer("GM.SchemeData")
   if scheme.WormSelect == 1 then
      SendMessage("WormSelect.OptionSelected")
   end

end


function Spawning()
	for i = 0, 15 do	
		SendMessage("GameLogic.CreateRandomMine")
		SendMessage("GameLogic.CreateRandomOildrum")
	end
end


function InvMine()
    lock, mine = EditContainer("kWeaponLandmine")
		mine.Scale = 3
		mine.PayloadGraphicsResourceID = "D08_03"
		mine.WeaponGraphicsResourceID = "D08_03"
		mine.WormDamageRadius = 150
		mine.ImpulseRadius = 200
		mine.PreDetonationTime = 0
		mine.ArmingRadius = 150
    CloseContainer(lock)
end