-- библиотека вооружения Renewation

	isWLoadAirstrike = false
	isWLoadAK = false
	isWLoadBazooka = false
	isWLoadBlowgun = false
	isWLoadBuffalo = false
	isWLoadCluster = false
	isWLoadDope = false -- грузим только через подключение скрипта renew_dope
	isWLoadDynamite = false
	isWLoadGLauncher = false
	isWLoadJetpack = false
	isWLoadLandmine = false
	isWLoadMagicBullet = false
	isWLoadNinja = false
	isWLoadPetrol = false
	isWLoadPistol = false
	--isWLoadStucky = false
	isWLoadSuicide = false
	isWLoadVacum = false

function RenewWLoadAll() -- быстрое включение всего пакета оружия
	isWLoadAirstrike = true
	isWLoadAK = true
	isWLoadBazooka = true
	isWLoadBlowgun = false
	isWLoadBuffalo = true
	isWLoadCluster = true
	isWLoadDope = false -- грузим только через подключение скрипта renew_dope
	isWLoadDynamite = true
	isWLoadGLauncher = true
	isWLoadJetpack = true
	isWLoadLandmine = true
	isWLoadMagicBullet = true
	isWLoadNinja = true
	isWLoadPetrol = true
	isWLoadPistol = true
	--isWLoadStucky = true
	isWLoadSuicide = true
	isWLoadVacum = true
	RenewWLoad()
end


function RenewWLoad() -- Запустить, для инициализации библиотеки


    
	if isWLoadAirstrike == true then -- Boosted Airstrike OK
		local lock, weap = EditContainer("kWeaponAirstrike") 
			setText=GetData("Renew.kWeaponAirstrike")
			SetData("Text.kWeaponAirstrike", setText)
			weap.NumBomblets = 1
			weap.BombletWeaponName = "FireEffect"
			--weap.CameraId = "HomingMissileFlyCamera"
			weap.PayloadGraphicsResourceID = "Bazooka.Payload"
			weap.Scale = 1
			weap.WormDamageMagnitude = 40
			weap.ImpulseMagnitude = 0.36
			weap.ImpulseRadius = 50
            weap.FxLocator = "bazookarocket"
			weap.ArielFx = "WXP_StarBurstRocketFlames"
				-- weap.CameraId = "PayloadTrackCamera"
		CloseContainer(lock)


	end



	if isWLoadAK == true then
		local lock, weap = EditContainer("kWeaponSniperRifle") -- AKSU 74 OK
			setText=GetData("Renew.kWeaponAK")
			SetData("Text.kWeaponSniperRifle", setText)
			weap.WeaponGraphicsResourceID = "D07_05"
			weap.Sniper = false
			weap.NumberOfBullets = 30
			weap.Accuracy = 1.00
			weap.WormDamageMagnitude = 1
			weap.ImpulseMagnitude = 0.01
			weap.LandDamageRadius = 4
			weap.DischargeSoundFX = wSoundPrefix .. "sentrygun"
		 	-- weap.WXAnimDraw = "DrawShotgun"
		 	-- weap.WXAnimAim = "AimShotgun"
		 	-- weap.WXAnimFire = "FireShotgun"
			 -- weap.WXAnimHolding = "HoldShotgun"
			 -- weap.WXAnimTaunt = "TauntShotgun"
		CloseContainer(lock)
	end

	if isWLoadBazooka == true then
		local lock, weap = EditContainer("kWeaponBazooka") -- Boosted Bazooka OK
			setText=GetData("Renew.kWeaponBazooka")
			SetData("Text.kWeaponBazooka", setText)
			weap.IsLowGravity = false
			weap.HasAdjustableHerd = false
			weap.Scale = 1
			weap.Radius = 1
			weap.MaxPower = 0.775
			weap.WormDamageMagnitude = 50
			weap.ImpulseMagnitude = 0.19
			weap.WormDamageRadius = 100
			weap.LandDamageRadius = 50
			weap.ImpulseRadius = 150
			weap.ImpulseOffset = -45 
			weap.WeaponGraphicsResourceID = "D09_01"
			--weap.DetonationFx = "WXP_NuclearBomb"
		CloseContainer(lock)
	end
    
    if isWLoadBlowgun == true then
        local lock, weap = EditContainer("kWeaponPoisonArrow") -- Blowgun OK
            weap.Scale = 0.1
            weap.AnimImpact = ""
            weap.WeaponGraphicsResourceID = "D09_02"
            weap.WXAnimDraw = "DrawBow"
            weap.WXAnimAim = "AimBow"
            weap.WXAnimFire = "DrawBow"
            weap.WXAnimHolding = "HoldBow"
            weap.WXAnimEndFire = "FireBow"
            weap.WXAnimTaunt = "TauntBow"
			weap.WXAnimEndFire = ""
        CloseContainer(lock)
    end

	if isWLoadBuffalo == true then
		local lock, weap = EditContainer("kWeaponScouser") -- Buffalo OK
			setText=GetData("Renew.kWeaponBuffalo")
			SetData("Text.kWeaponScouser", setText)
			weap.PayloadGraphicsResourceID = "BuffaloOfLies"
			weap.WeaponGraphicsResourceID = "D08_05"
			weap.AnimTravel = "Fly"
			weap.HasAdjustableHerd = false
			weap.DetonatesOnObjectImpact = true
			weap.DetonatesOnWormImpact = false
			weap.DetonatesOnFirePress = true
			weap.Scale = 6
			weap.Radius = 8
			weap.LogicalLaunchZOffset = 7
	      	weap.DetonateMultiEffect = 1
			weap.BasePower = 0.06
	      	weap.WormCollideResponse = 1
	      	weap.WormDamageMagnitude = 20
	      	weap.ImpulseMagnitude = 0.21
	      	weap.WormDamageRadius = 110
	      	weap.LandDamageRadius = 40
	      	weap.ImpulseRadius = 110
	      	weap.ImpulseOffset = -45
			weap.ArielFx = "WXP_RenewBuff1"
			weap.DetonationFx = "WXP_Explosion_Sheep"
	      	weap.DetonationSfx = gSoundPrefix .. "ExplosionRegular1"
			weap.ExpiryFx = "WXP_Explosion_Sheep"
			weap.ArmSfxLoop = wSoundPrefix .. "CowFall"
			weap.ArmSfx1Shot = ""
			weap.LaunchSfx = wSoundPrefix .. "CowFall"
			weap.LoopSfx = wSoundPrefix .. "CowFall"
			weap.WalkSfx = wSoundPrefix .. "CowFall"
			weap.BounceSfx = wSoundPrefix .. "CowFall"
			weap.BigJumpSfx = wSoundPrefix .. "CowFall"
			weap.LifeTime = 10000
			weap.WXAnimAim = "Struggle"
	      	weap.SkimsOnWater = true
	     	weap.MinSpeedForSkim = 0.01
	      	weap.MaxAngleForSkim = -0.01
			weap.NumBomblets = 0
	        weap.BombletMaxConeAngle = 0
	        weap.BombletMaxSpeed = 0.3
	        weap.BombletMinSpeed = 0.2
		CloseContainer(lock)
	end

	if isWLoadCluster == true then
		local lock, weap = EditContainer("kWeaponClusterGrenade") 
            weap.PayloadGraphicsResourceID = "D06_05"
            weap.WeaponGraphicsResourceID = "D06_05"
            weap.WormDamageMagnitude = 10
            weap.NumBomblets = 6
            weap.BombletMaxConeAngle = 0.2
            weap.BombletMaxSpeed = 0.2
            weap.BombletMinSpeed = 0.09
            weap.BombletWeaponName = "firecluster"
		CloseContainer(lock)
	end


	if isWLoadDynamite == true then 
		local lock, weap = EditContainer("kWeaponDynamite") 
		 weap.PayloadGraphicsResourceID = "D08_02"
		 weap.WeaponGraphicsResourceID = "D08_02"
		CloseContainer(lock)
	end

	if isWLoadJetpack == true then
	
		local lock, weap = EditContainer("kUtilityJetpack") 
			setText=GetData("Renew.kWeaponJetpack")
			SetData("Text.kUtilityJetpack", setText)
		CloseContainer(lock)
	    SetData("Jetpack.InitFuel", 3000)
	   	SetData("AIJetpack.ParabolicTime", 400)
	    SetData("Jetpack.FwdThrustRotation", 1.3)
	    SetData("Jetpack.MaxAltitude", 4000)
	    SetData("Jetpack.OverCeilingThrustMod", 0.05)
	    SetData("Jetpack.SuperThrustAccel", 0.3)
	    SetData("Jetpack.SuperThrustMax", 1)
	    SetData("Jetpack.SuperThrustMod", 0.2)
	    SetData("Jetpack.SuperThrustReduct", 0.97)
	    SetData("Jetpack.SuperThrustShutOff", 0.1)
	    SetData("Jetpack.ThrustScale", 0.01)
	  	SetData("Jetpack.XZWindResNoThrust", 0.95)
		SetData("Jetpack.XZWindResThrust", 0.999)
	 	SetData("Jetpack.TurnRotationSpeed", 0.02)
	end 

	if isWLoadGLauncher == true then
	     local lock, weap = EditContainer("kWeaponSuperAirstrike") -- Grenade Launcher OK
			setText=GetData("Renew.kWeaponGLauncher")
			SetData("Text.kWeaponSuperAirstrike", setText)
	    		weap.IsAimedWeapon = "true"
	    		weap.IsPoweredWeapon = "true"
	    		weap.IsTargetingWeapon = "false"
	    		weap.IsBomberWeapon = "false"
	    		weap.IsDirectionalWeapon = "true"
	    		weap.IsLaunchedFromWorm = "true"
                weap.DetonatesOnExpiry = "false"
	    		weap.MinAimAngle = 0
	    		weap.MaxAimAngle = 1.57
	    		weap.IsLowGravity = "false"
	    		weap.HasAdjustableFuse = "false"
                weap.HasAdjustableBounce = "false"
	    		weap.HasAdjustableHerd = "false"
	    		weap.IsAffectedByWind = "false"
	    		--weap.CameraId = "PayloadTrackCamera"
	    		weap.AnimTravel = ""
	    		weap.Radius = 2
	    		weap.DirectionBlend = 1
	    		weap.SpinSpeed = 0
	    		weap.BasePower = 0.15
	    		weap.MaxPower = 0.4
	    		weap.DetonatesOnFirePress = "true"
	    		weap.DetonatesOnLandImpact = "false"
                weap.DetonatesOnObjectImpact = "false"
                weap.DetonatesOnWormImpact = "false"
	    		weap.DetonatesOnExpiry = "true"
	    		weap.DetonatesAtRest = "false"
	    		weap.DetonatesWhenCantJump = "false"
	    		weap.WormDamageMagnitude = 0
	    		weap.ImpulseMagnitude = 0.7
	    		weap.WormDamageRadius = 170
                weap.LandDamageRadius = 0
	    		weap.ImpulseRadius = 0
	    		weap.ImpulseOffset = -45
	    		weap.TangentialMinBounceDamping = 0.6
	    		weap.ParallelMinBounceDamping = 0.6
	    		weap.TangentialMaxBounceDamping = 1.1
	    		weap.ParallelMaxBounceDamping = 1.1
	    		weap.SkimsOnWater = "false"
	    		weap.BounceFx = "WXP_Poof_VFast"
	    		weap.BounceSfx = wSoundPrefix .. "BananaBombImpact"
	    		weap.LaunchDelay = 0
	    		weap.PostLaunchDelay = 1200
	    		weap.FuseTimerGraphicOffset = 10
	    		weap.LogicalLaunchZOffset = 0
	    		weap.LogicalLaunchYOffset = 0
	    		weap.DisplayInFirstPerson = "true"
	    		weap.RetreatTimeOverride = -1
	    		weap.FuseTimerScale = 0
	    		weap.IsFuseDisplayed = "true"
	    		weap.NumBomblets = 6
	    		weap.BombletMaxConeAngle = 0.35
	    		weap.BombletMaxSpeed = 0.3
	    		weap.BombletMinSpeed = 0.2
	    		weap.BombletWeaponName = "RenewMine"
	    		weap.ArielFx = "WXP_BazookaTrailPack"
	    		weap.DetonationFx = "WXP_ExplosionX_Med"
	    		weap.DetonationSfx = gSoundPrefix .. "ExplosionRegular2"
	    		weap.ArmSfxLoop = ""
	    		weap.ExpiryFx = ""
	    		weap.LaunchSfx = wSoundPrefix .. "RocketRelease"
	    		weap.CanBeFiredWhenWormMoving = "true"
	    		weap.StartsArmed = "true"
	    		weap.ArmOnImpact = "false"
	    		weap.ArmingCourtesyTime = 0
	    		weap.PreDetonationTime = 0
	    		weap.OrientationOption = 1
	    		weap.ArmingRadius = 0
	    		weap.LifeTime = 10000
	    		weap.DisplayInFirstPerson = "true"
	    		weap.WXAnimDraw = "DrawShotgu2"
	    		weap.WXAnimFire = "FireShotgu2"
	    		weap.WXAnimHolding = "HoldShotgu2"
	    		weap.WXAnimDraw = "DrawWFGun"
	    		weap.WXAnimAim = "AimShotgun"
	    		weap.WXAnimFire = "FireWFGun"
	    		weap.WXAnimHolding = "HoldWFGun"
			weap.WXAnimTaunt = "TauntWFGun"
			weap.PayloadGraphicsResourceID = "Bazooka.Payload"
			weap.WeaponGraphicsResourceID = "D05_05"
	     CloseContainer(lock)
	end





	if isWLoadLandmine == true then -- обязательно отключить функцию SetupMinesAndDrums в скрипте
		local lock, weap = EditContainer("kWeaponLandmine") -- Brutal Mine
			setText=GetData("Renew.kWeaponLandmine")
			SetData("Text.kWeaponLandmine", setText)
			weap.PayloadGraphicsResourceID = "D08_03"
			weap.WeaponGraphicsResourceID = "D08_03"
			weap.ArielFx = "XXX_PlaceholderPP"
			weap.WormDamageMagnitude = 50
			weap.ImpulseMagnitude = 0.25
			weap.WormDamageRadius = 85
			weap.LandDamageRadius = 45
			weap.ImpulseRadius = 100
			weap.ImpulseOffset = -50
			weap.ArmingCourtesyTime = 2500
			weap.PreDetonationTime = 0
			weap.ArmingRadius = 45
			weap.LifeTime = 500
			weap.SpinSpeed = 0
		CloseContainer(lock)
	    
        SetData("Mine.DetonationType", 1) 
	end

	if isWLoadMagicBullet == true then
		local lock, weap = EditContainer("kWeaponHomingMissile") --- MagicBullet OK
			setText=GetData("Renew.kWeaponBullet")
			SetData("Text.kWeaponHomingMissile", setText)
		 	weap.PayloadGraphicsResourceID = "Factory.Proj.MagicBullet"
			weap.Scale = 0.5
			weap.Radius = 2
			weap.OrientationOption = 2
			weap.FxLocator = "Mybullet"
			weap.ArielFx = "WXP_RenewBullet"
			weap.LaunchSfx = wSoundPrefix .. "ShotgunFire"
			--weap.LoopSfx = wSoundPrefix .. "magic2looping_high"
			weap.WeaponGraphicsResourceID = "D09_05"
			weap.WXAnimDraw = "DrawShotgu2"
			weap.WXAnimFire = "FireShotgu2"
			weap.WXAnimHolding = "HoldShotgu2"
			weap.AvoidsLand = true
			weap.VerticalLandAvoidanceDistance = 30
			weap.ForwardLandAvoidanceDistance = 30
			weap.VerticalLandAvoidanceForce = 0.07
			weap.ForwardLandAvoidanceForce = 0.07
			weap.IsPoweredWeapon = "false"
			weap.OrientationProportion = 0.2
			weap.Stage1Duration = 10
			weap.Stage2Duration = 15000
			weap.Stage3Duration = 5000
			weap.MaxHomingSpeed = 0.25
			weap.HomingAcceleration = 0.004
      		weap.DetonatesOnExpiry = false
      		weap.DetonatesOnObjectImpact = true
      		weap.DetonatesOnWormImpact = true
			weap.DetonatesOnFirePress = true
			weap.MinAimAngle = -1.57
			weap.MaxAimAngle = 1.57
			weap.WormDamageMagnitude = 50
			weap.ImpulseMagnitude = 0.42
			weap.WormDamageRadius = 60
			weap.LandDamageRadius = 30
			weap.ImpulseRadius = 80
			weap.ImpulseOffset = -50
			weap.LifeTime = 21000
            --weap.CameraId = ["StarburstCamera"]
          
		CloseContainer(lock)
	end


	if isWLoadNinja == true then
		local lock, weap = EditContainer("kUtilityNinjaRope") --- Ninja Rope OK
			setText=GetData("Renew.kWeaponRope")
			SetData("Text.kUtilityNinjaRope", setText)
			--weap.HoldParticleFX = "WXPF_Firework1"
		CloseContainer(lock)
	    	SetData("Ninja.NumShots", -1)
	    	SetData("Ninja.MaxLength", 650)
	end

	if isWLoadPetrol == true then -- Petrol Grenade 
		local lock, weap = EditContainer("kWeaponGasCanister")  -- Petrol Grenade OK
			setText=GetData("Renew.kWeaponPetrol")
			SetData("Text.kWeaponGasCanister", setText)
			weap.IsAimedWeapon ="true"
			weap.HasAdjustableFuse = "true"
			weap.HasAdjustableBounce = "false"
			weap.DetonatesOnLandImpact = "false"
			weap.DetonatesOnObjectImpact = "false"
			DetonatesOnWormImpact = "true"
			weap.NumBomblets = 6
			weap.BombletWeaponName = "RenewPetrol1"
	        weap.BombletMaxConeAngle = 0.3
	        weap.BombletMaxSpeed = 0.25
	        weap.BombletMinSpeed = 0.20	
			weap.ArielFx = ""
			weap.DetonationFx = "WXP_Explosion_Small"
			weap.DetonationSfx = gSoundPrefix .. "ExplosionRegular"
		 	weap.PayloadGraphicsResourceID = "D09_03"
			weap.WeaponGraphicsResourceID = "D09_03"
		CloseContainer(lock)
	end

	if isWLoadPistol == true then
		local lock, weap = EditContainer("kWeaponShotgun") -- Pistol OK
			setText=GetData("Renew.kWeaponPistol")
			SetData("Text.kWeaponShotgun", setText)
			weap.WeaponGraphicsResourceID = "D08_01"
			weap.WXAnimDraw = "DrawShotgu2"
			weap.WXAnimFire = "FireShotgu2"
			weap.WXAnimHolding = "HoldShotgu2"
			weap.NumberOfBullets = 5
			weap.WormDamageMagnitude = 10
			weap.ImpulseMagnitude = 0.05
		CloseContainer(lock)
	end

	if isWLoadStucky == true then
		local lock, weap = EditContainer("kWeaponHolyHandGrenade") --Sticky bomb
			setText=GetData("Renew.kWeaponStickyBomb")
			SetData("Text.kWeaponHolyHandGrenade", setText)
			weap.PayloadGraphicsResourceID = "D07_01"
			weap.WeaponGraphicsResourceID = "D07_01"
			weap.SpinSpeed = 0.2
			weap.DetonateMultiEffect = 0
			weap.WormDamageMagnitude = 100
			weap.ImpulseMagnitude = 0.3
			weap.WormDamageRadius = 100
			weap.LandDamageRadius = 100
			weap.ImpulseRadius = 130
			weap.ImpulseOffset = 40
			weap.TangentialMinBounceDamping = 0
			weap.ParallelMinBounceDamping = 0
			weap.TangentialMaxBounceDamping = 0
			weap.ParallelMaxBounceDamping = 0
			weap.DetonationFx = "WXP_ExplosionX_Large"
			weap.HoldParticleFX = ""
			weap.DetonateMultiEffect = 0
			weap.ArmSfxLoop = wSoundPrefix .. "RocketRelease"
			weap.LoopSfx = wSoundPrefix .. "MineArmLoop"
			weap.FuseTimerGraphicOffset = 0
			weap.FuseTimerScale = 0
			weap.DetonatesOnExpiry = "false"
			weap.DetonatesAtRest = "true"
			weap.CanBeFiredWhenWormMoving = "true"
			weap.IsControlledBomber = "false"
			weap.StartsArmed = "false"
			weap.ArmingRadius = 200000
			weap.ArmingCourtesyTime = 50000
			weap.LifeTime = 6000
			weap.RumbleLight = 10
			weap.LaunchDelay = 80
			weap.RetreatTimeOverride = -1
		CloseContainer(lock)
	end

	if isWLoadSuicide == true then
		local lock, weap = EditContainer("kWeaponStarburst") -- Suicide OK
			setText=GetData("Renew.kWeaponSuicide")
			SetData("Text.kWeaponStarburst", setText)
			weap.WormDamageMagnitude = 100
			weap.ImpulseMagnitude = 0.25
			weap.WormDamageRadius = 80
			weap.LandDamageRadius = 70
			weap.ImpulseRadius = 150
			weap.LifeTime = 0
			weap.DetonationFx = "WXP_ExplosionX_Large"
			weap.WXAnimDraw = "DrawStarburst"
			weap.WXAnimHolding = "HoldStarburst"
			weap.WXAnimTaunt = "TauntStarburst"
		CloseContainer(lock)
	end

	if isWLoadVacum == true then
		local lock, weap = EditContainer("kWeaponFatkins") -- vacum bomb
			setText=GetData("Renew.kWeaponVacumBomb")
			SetData("Text.kWeaponFatkins", setText)
		 	weap.PayloadGraphicsResourceID = "D08_04"
		 	weap.IsControlledBomber = true
	        weap.DetonateMultiEffect = 4
	        weap.WormCollideResponse = 0
	        weap.WormDamageMagnitude = 0
	        weap.ImpulseMagnitude = -0.25
	        weap.WormDamageRadius = 0
	        weap.LandDamageRadius = 30
	        weap.ImpulseRadius = 100000
	        weap.ImpulseOffset = -45
		 	weap.NumBomblets = 1
            weap.TangentialMinBounceDamping = 0
            weap.ParallelMinBounceDamping = 0
            weap.TangentialMaxBounceDamping = 0
            weap.ParallelMaxBounceDamping = 0
            weap.BombletMaxConeAngle = 0
            weap.BombletMaxSpeed = 0
            weap.BombletMinSpeed = 0
		 	weap.BombletWeaponName = "RenewWarp1"
	     	weap.ArielFx = "WXP_BazookaTrail_Main"
	    	weap.DetonationFx = "WXP_AlienWarpGate"
		 	weap.DetonationSfx = wSoundPrefix .. "Teleport"
	     	weap.SplashFx = "WXP_ExplosionX_Large"
	      	weap.SplishFx = "WXP_WaterSmallSplash"
	        weap.SinkingFx = "WXP_UnderWaterBubbles"
		CloseContainer(lock)
	end

end