-- библиотека вооружения TF2 режима

	isTF2WLoadBubble = false -- увеличенный пузырь
    isTF2WLoadRocketLauncher = false -- ракетница (базука)
    isTF2WLoadShovel = false -- лопата (вместо молотка)
    
    isTF2WLoadFlameThrower = false -- огнемет (вместо наводяшки)
    isTF2WLoadFireAxe = false -- топор (вместо тычка)
    
    isTF2WLoadMedigun = false -- медиган (вместо лука)
    isTF2WLoadSyringeGun = false -- шприцемет (вместо ружья)
    
    isTF2WLoadScattergun = false -- двустволка (вместо снайперки)
    
    isTF2WLoadGlauncher = false -- гранатомет (вместо супер авиаудара)
    isTF2WLoadSticky = false -- липкий гранатомет (вместо авиаудара)
    
    isTF2WLoadWrench = false -- гаечный ключ (вместо огненного удара)  
	

function TF2WLoadAll() -- быстрое включение всего пакета оружия
	isTF2WLoadBubble = true -- увеличенный пузырь
    isTF2WLoadRocketLauncher = true -- ракетница (базука)
    isTF2WLoadShovel = true -- лопата (вместо молотка)
    
    isTF2WLoadFlameThrower = true -- огнемет (вместо наводяшки)
    isTF2WLoadFireAxe = true -- топор (вместо тычка)
    
    isTF2WLoadMedigun = true -- медиган (вместо лука)
    isTF2WLoadSyringeGun = true -- шприцемет (вместо ружья)
    
    isTF2WLoadScattergun = true -- двустволка (вместо снайперки)
    
    isTF2WLoadGlauncher = true -- гранатомет (вместо супер авиаудара)
    isTF2WLoadSticky = true -- липкий гранатомет (вместо авиаудара)
    
    isTF2WLoadWrench = true -- гаечный ключ (вместо огненного удара)  
	TF2WLoad()
end


---------------------------------------------- ФУНКЦИЯ ЗАГРУЗКИ ВООРУЖЕНИЯ TEAM FORTRESS 2 режима

function TF2WLoad() 
   
    local setText = ""
    wSoundPrefix = "weapons/"
    gSoundPrefix = "global/"    
    
	if isTest == true then
		local ContainerLock, Container = EditContainer("kWeaponSuperAirstrike")
			Container.WormDamageMagnitude = 800
			Container.WormDamageRadius = 100
		CloseContainer(ContainerLock)
	end
	if isTF2WLoadBubble == true then
		SetData("Bubble.Radius", 60)
		SetData("Bubble.OffsetY", 45)
		if IsTeamEnable[4] == true then SetData("Bubble.Lifetime",12)
		elseif IsTeamEnable[3] == true then SetData("Bubble.Lifetime",9)
		else SetData("Bubble.Lifetime",6) end
	end
	
    if isTF2WLoadGlauncher == true then
        CopyContainer("kWeaponBazooka","kWeaponSuperAirstrike")
        setText=GetData("Renew.tf2WeaponGrenadeLauncher")
        SetData("Text.kWeaponSuperAirstrike", setText) -- #1 Demoman's Grenade Launcher
        local ContainerLock, Container = EditContainer("kWeaponSuperAirstrike")
            if isWUM then Container.DisplayName = GetData("Renew.tf2WeaponGrenadeLauncher") end
            if isWUM then UseParabolicRetical = "True" end 
            Container.IsBomberWeapon = "false"
            Container.IsPoweredWeapon = "true"
            Container.IsLowGravity = "false"
            Container.HasAdjustableHerd = "true"
            Container.IsAffectedByWind = "true"
            Container.WeaponGraphicsResourceID = "D01_02"
            Container.PayloadGraphicsResourceID = "Factory.Proj.Revolver"
            Container.ArielFx = ""
			--Container.DetonationFx = ""
			--Container.DetonationSfx= ""
			if (isWUM == true) then Container.ArmSfxLoop = "weapons/MineArmLoop" end
            Container.HasAdjustableBounce = "false"
            Container.BasePower = 0.225
            Container.MaxPower = 0.425
            Container.SpinSpeed = 2
            Container.DetonatesOnLandImpact = "false"
            Container.DetonatesOnExpiry = "true"
            Container.DetonatesOnObjectImpact = "false" 
            Container.DetonatesOnWormImpact = "false"
			Container.DetonatesAtRest = "false"
			Container.StartsArmed = "false"
			Container.ArmOnImpact = "false"
			Container.ArmingCourtesyTime = "2500"
			Container.ArmingRadius = "80"
			Container.LifeTime = "1000"
            Container.WormDamageMagnitude = 20
            Container.ImpulseMagnitude = 0.1
            Container.WormDamageRadius = 80
            Container.LandDamageRadius = 0
            Container.ImpulseRadius = 100
            Container.ImpulseOffset = -50          
            Container.TangentialMinBounceDamping = 0.6
            Container.ParallelMinBounceDamping = 0.6
            Container.TangentialMaxBounceDamping = 0.7
            Container.ParallelMaxBounceDamping = 0.8
            Container.SkimsOnWater = "false"
            Container.MinSpeedForSkim = 0
            Container.MaxAngleForSkim = 0
            Container.LaunchDelay = 500
            Container.PostLaunchDelay = 1200
            Container.IsFuseDisplayed = "false"
            if (isWUM == true) then Container.BounceSfx = "weapons/Prod"
            else Container.BounceSfx = "BananaBombImpact" end
            Container.WXAnimDraw = "DrawLauncher"
            Container.WXAnimFire = "FireLauncher"
            Container.WXAnimHolding = "HoldLauncher"
			Container.NumBomblets = 0
			Container.BombletMaxConeAngle = 0.1
			Container.BombletMinSpeed = 0.1
			Container.BombletMaxSpeed = 0.1
			Container.BombletWeaponName = "RenewTF2Grenade"
        CloseContainer(ContainerLock)
    end

    if isTF2WLoadSticky == true and isTest == false then
        setText=GetData("Renew.tf2WeaponStickyLauncher")
        SetData("Text.kWeaponAirstrike", setText) -- #2 Demoman's Sticky Bomb Launcher
        local ContainerLock, weap = EditContainer("kWeaponAirstrike")
            if isWUM then UseParabolicRetical = "True" end 
            weap.IsAimedWeapon = "true"
            weap.IsPoweredWeapon = "true"
            weap.IsTargetingWeapon = "false"
            weap.IsBomberWeapon = "false"
            weap.IsDirectionalWeapon = "true"
            weap.IsLaunchedFromWorm = "true"
            weap.DetonatesOnExpiry = "false"
            weap.MinAimAngle = -1.57
            weap.MaxAimAngle = 1.57
            weap.IsLowGravity = "false"
            weap.HasAdjustableFuse = "false"
            weap.HasAdjustableBounce = "false"
            weap.HasAdjustableHerd = "true"
            weap.IsAffectedByWind = "false"
            --weap.CameraId = "PayloadTrackCamera"
            weap.AnimTravel = ""
            weap.Scale = 1
            weap.Radius = 1
            weap.DirectionBlend = 1
            weap.SpinSpeed = 0
            weap.BasePower = 0.15
            weap.MaxPower = 0.7
            weap.DetonatesOnFirePress = "true"
            weap.DetonatesOnLandImpact = "false"
            weap.DetonatesOnObjectImpact = "false"
            weap.DetonatesOnWormImpact = "false"
            weap.DetonatesOnExpiry = "true"
            weap.DetonatesAtRest = "false"
            weap.DetonatesWhenCantJump = "false"
            weap.WormDamageMagnitude = 20
            weap.ImpulseMagnitude = 0.15
            weap.WormDamageRadius = 65
            weap.LandDamageRadius = 30
            weap.ImpulseRadius = 85
            weap.ImpulseOffset = -45
            weap.TangentialMinBounceDamping = 0
            weap.ParallelMinBounceDamping = 0
            weap.TangentialMaxBounceDamping = 0
            weap.ParallelMaxBounceDamping = 0
            weap.SkimsOnWater = "false"
            weap.BounceFx = "WXP_Poof_VFast"
            weap.LaunchDelay = 500
            weap.PostLaunchDelay = 1200
            weap.FuseTimerGraphicOffset = 10
            weap.LogicalLaunchZOffset = 0
            weap.LogicalLaunchYOffset = 0
            weap.DisplayInFirstPerson = "true"
            weap.RetreatTimeOverride = -1
            weap.FuseTimerScale = 0
            weap.IsFuseDisplayed = "true"
            weap.NumBomblets = 0
            weap.BombletMaxConeAngle = 0.35
            weap.BombletMaxSpeed = 0.3
            weap.BombletMinSpeed = 0.2
            weap.ArielFx = "WXP_BazookaTrailPack"
            weap.DetonationFx = "WXP_ExplosionX_Med"
            weap.DetonationSfx = "ExplosionRegular"
            weap.ArmSfxLoop = ""
            weap.ExpiryFx = ""
            weap.LaunchSfx = "RocketRelease"
            weap.CanBeFiredWhenWormMoving = "true"
            weap.StartsArmed = "true"
            weap.ArmOnImpact = "false"
            weap.ArmingCourtesyTime = 0
            weap.PreDetonationTime = 0
            weap.OrientationOption = 1
            weap.ArmingRadius = 0
            weap.LifeTime = 10000
            weap.DisplayInFirstPerson = "true"
            weap.WXAnimDraw = "DrawWFGun"
            weap.WXAnimAim = "AimShotgun"
            weap.WXAnimFire = "FireWFGun"
            weap.WXAnimHolding = "HoldWFGun"
            weap.WXAnimTaunt = "TauntWFGun"
            weap.PayloadGraphicsResourceID = "Factory.Proj.MorningStar"
            weap.WeaponGraphicsResourceID = "D06_03"
        CloseContainer(ContainerLock)
    end
 
    if isTF2WLoadWrench == true then 
        setText=GetData("Renew.tf2WeaponWrench")
        SetData("Text.kWeaponFirePunch", setText) -- #3 Engineer's Wrench
        local ContainerLock, Container = EditContainer("kWeaponFirePunch")
            Container.WormIsWeapon = "false"
            Container.DischargeSoundFX = ""
            Container.WormCollisionFX = ""
            Container.LaunchDelay = 200
            Container.HoldParticleFX = ""
            Container.WXAnimWindup = "WindupBat"
            Container.WXAnimDraw = "DrawBat"
            Container.WXAnimAim = "AimBat"
            Container.WXAnimFire = "Fire2Bat"
            Container.WXAnimHolding = "HoldBat"
            Container.WXAnimTaunt = "TauntBat"
            Container.WeaponGraphicsResourceID = "D04_05"
            Container.CanBeFiredWhenWormMoving = "false"
            Container.WormDamageMagnitude = 35
            Container.ImpulseMagnitude = 0.17
        CloseContainer(ContainerLock)
    end
    
    if isTF2WLoadMedigun == true then
		TF2WLoadMedigun()
    end

    if isTF2WLoadSyringeGun == true then  
        setText=GetData("Renew.tf2WeaponSyringeGun")    
        SetData("Text.kWeaponShotgun", setText) -- #5 Medic's Syringe Gun
        local ContainerLock, Container = EditContainer("kWeaponShotgun")
            Container.WeaponGraphicsResourceID = "D10_03"
            Container.WXAnimDraw = "DrawWFGun"
            Container.WXAnimAim = "AimShotgun"
            Container.WXAnimFire = "FireWFGun"
            Container.WXAnimHolding = "HoldWFGun"
            Container.WXAnimTaunt = "TauntWFGun"
            Container.IsAffectedByWind = "false"
            Container.bCanDamageLand = "false"
            Container.bCanMoveBetweenShots = "false"
            Container.NumberOfBullets = 10
            Container.WormDamageMagnitude = 4
            Container.ImpulseMagnitude = 0.015
            Container.Accuracy = 0.92
            Container.WormCollisionFX = ""
            Container.LandCollisionFX = ""
            Container.PostLaunchDelay = 0
            Container.WaitForSoundDelay = 0
            Container.DischargeEndSoundFX = ""
            Container.DischargeSoundFX = wSoundPrefix .. "sentrygun"
        CloseContainer(ContainerLock)
    end
    if isTF2WLoadFlameThrower == true then
		TF2WLoadFlameThrower()
    end
    
    if isTF2WLoadFireAxe == true then   
        setText=GetData("Renew.tf2WeaponFireAxe") 
        SetData("Text.kWeaponProd", setText)   -- #7 Pyro's  Fire AXE
        local ContainerLock, Container = EditContainer("kWeaponProd")
            --Container.WXAnimFire = "FireNMN" -- 񡮠흇𜂫死
            Container.DamageIsPercentage = "true"
            Container.WXAnimDraw = "DrawBat"
            Container.WXAnimHolding = "HoldBat"
            Container.WXAnimTaunt = "TauntBat"
            Container.WXAnimFire = "FireNMN"
            Container.WeaponGraphicsResourceID = "D10_02"
            Container.WormDamageMagnitude = 50
			Container.ImpulseMagnitude = 0
            Container.LaunchDelay = 1000
        CloseContainer(ContainerLock)
    end

    if isTF2WLoadScattergun == true then
        setText=GetData("Renew.tf2WeaponScattergun") 
        SetData("Text.kWeaponSniperRifle", setText) -- #8 Scout's Scattergun
            local ContainerLock, Container = EditContainer("kWeaponSniperRifle")
            Container.NumberOfBullets = 2
            Container.Sniper = "false"
            Container.bCanMoveBetweenShots = "true"
            Container.BulletRadius = 4
            Container.Accuracy = 0.92
            Container.WormDamageMagnitude = 15
            Container.LandDamageMagnitude = 15
            Container.ImpulseMagnitude = 0.08
            Container.WXAnimDraw = "DrawShotgun"
            Container.WXAnimAim = "AimShotgun"
            Container.WXAnimFire = "FireShotgun"
            Container.WXAnimHolding = "HoldShotgun"
            Container.WXAnimTaunt = "TauntShotgun"
            Container.WeaponGraphicsResourceID = "D04_01"
            if isWUM then DischargeSoundFX = "weapons/ShotgunFire" end
            Container.DischargeSoundFX = wSoundPrefix .. "ShotgunFire"
        CloseContainer(ContainerLock)
    end

    if isTF2WLoadRocketLauncher == true then
        setText=GetData("Renew.tf2WeaponRocketLauncher") 
        SetData("Text.kWeaponBazooka", setText) -- #9 Soldier's rocket launcher
        local ContainerLock, Container = EditContainer("kWeaponBazooka")
            if(isWUM) then Container.UseParabolicRetical = "false" end
            Container.IsPoweredWeapon = "false"
            Container.IsLowGravity = "true"
            Container.IsAffectedByGravity = "false"
            Container.HasAdjustableHerd = "false"
            Container.IsAffectedByWind = "false"
            Container.WeaponGraphicsResourceID = "D10_04"
            --Container.PayloadGraphicsResourceID = "D10_05"
            Container.HasAdjustableBounce = "false"
            Container.BasePower = 0.5
            Container.MaxPower = 0.5
            Container.SpinSpeed = 0
            Container.DetonatesOnLandImpact = "true"
            Container.DetonatesOnExpiry = "true"
            Container.DetonatesOnObjectImpact = "true"
            Container.TangentialMinBounceDamping = 0
            Container.ParallelMinBounceDamping = 0
            Container.TangentialMaxBounceDamping = 0
            Container.ParallelMaxBounceDamping = 0
            Container.LifeTime = 10000
            Container.SkimsOnWater = "false"
            Container.MinSpeedForSkim = 0
            Container.MaxAngleForSkim = 0
            Container.IsFuseDisplayed = "false"
            Container.BounceSfx = ""
            Container.WormDamageMagnitude = 30            
            Container.ImpulseMagnitude = 0.40
            Container.ImpulseMagnitude = 0.3
            Container.ImpulseOffset = -30            
            Container.ImpulseRadius = 72
            Container.WXAnimDraw = "DrawBazooka"
            Container.WXAnimAim = "AimBazooka"
            Container.WXAnimTaunt = "TauntBazooka"
            Container.WXAnimFire = "FireBazooka"
            Container.WXAnimHolding = "HoldBazooka"
            Container.CanBeFiredWhenWormMoving = "true"
        CloseContainer(ContainerLock)
    end
    
    if isTF2WLoadShovel == true then
        setText=GetData("Renew.tf2WeaponShovel") 
        SetData("Text.kWeaponNoMoreNails", setText)  -- #10 Soldier's Showel
        local ContainerLock, Container = EditContainer("kWeaponNoMoreNails")
            Container.IsAimedWeapon = "true"
            Container.DischargeSoundFX = ""
            Container.WormCollisionFX = ""
            Container.WXAnimWindup = "WindupBat"
            Container.WXAnimDraw = "DrawBat"
            Container.WXAnimAim = "AimBat"
            Container.WXAnimFire = "Fire2Bat"
            Container.WXAnimHolding = "HoldBat"
            Container.WXAnimTaunt = "TauntBat"
            Container.WeaponGraphicsResourceID = "BananaBomb"
            Container.WormDamageMagnitude = 35
            Container.ImpulseMagnitude = 0.1
        CloseContainer(ContainerLock)    
    end
    
end

function TF2WLoadFlameThrower()
        setText=GetData("Renew.tf2WeaponFlameThrower") 
		CopyContainer("kWeaponBazooka","kWeaponPoisonArrow")
        SetData("Text.kWeaponPoisonArrow", setText) -- #6 Pyro's Flame Thrower
        local ContainerLock, Container = EditContainer("kWeaponPoisonArrow")
            if isWUM then  Container.DisplayName = setText end
            Container.WeaponGraphicsResourceID = "D10_01"
            Container.WXAnimDraw = "DrawFlame"
            Container.WXAnimFire = "FireFlame"
            Container.WXAnimHolding = "HoldFlame"
            Container.WXAnimAim = "AimMinigun"																								   
            Container.WXAnimTaunt = "TauntWFGun"			
			Container.Scale = 0
			Container.IsAimedWeapon = "true"
            Container.IsPoweredWeapon = "false"
            Container.IsLowGravity = "true"
            Container.HasAdjustableBounce = "false"
            Container.HasAdjustableFuse = "false"
            Container.IsAffectedByGravity = "false"
            Container.IsAffectedByWind = "false"
            Container.IsPoweredWeapon = "false"
            Container.IsLaunchedFromWorm = "true"
            Container.DetonatesOnLandImpact = "true"
            Container.DetonatesOnWormImpact = "true"
            Container.DetonatesOnObjectImpact = "true"
            Container.DetonatesOnExpiry = "true"
            Container.EndTurnImmediate = "true"  
			 if(isWUM) then Container.UseParabolicRetical = "false" end    
            Container.ArielFx = "WXP_RenewFlameTall"
			Container.DetonationFx = ""
            Container.LaunchSfx = wSoundPrefix.."FirePunch"
            Container.LoopSfx = ""
            if isWUM then Container.HoldLoopSfx = "" end            
            Container.DetonationSfx = ""
            Container.BounceFx = ""
            if isWUM then  Container.EquipSfx = wSoundPrefix.."DefaultEquip" end
            Container.BasePower = 0.1
            Container.MaxPower = 0.1
            Container.WormDamageMagnitude = 0
            Container.ImpulseMagnitude = 0
            Container.LandDamageRadius = 0
            Container.PostLaunchDelay = 2000
            Container.SkimsOnWater = "false"
            Container.TangentialMinBounceDamping = 0
            Container.ParallelMinBounceDamping = 0
            Container.TangentialMaxBounceDamping = 0
            Container.ParallelMaxBounceDamping = 0
            Container.LifeTime = 2000
            Container.IsFuseDisplayed = false	
            Container.NumBomblets = 6
			Container.BombletWeaponName = "RenewPetrolFast"
	        Container.BombletMaxConeAngle = 0.5
	        Container.BombletMaxSpeed = 0.1
	        Container.BombletMinSpeed = 0.1	
        CloseContainer(ContainerLock)
end

function TF2WLoadMedigun()
        setText=GetData("Renew.tf2WeaponMedigun")
        CopyContainer("kWeaponBazooka","kWeaponPoisonArrow")
        SetData("Text.kWeaponPoisonArrow", setText) -- #4 ЛЕЧАЩАЯ ПУШКА
        local ContainerLock, Container = EditContainer("kWeaponPoisonArrow")
			if isWUM then  Container.DisplayName = setText end												  
			Container.WeaponGraphicsResourceID = "D07_01"
            Container.WXAnimDraw = "DrawMedigun"										 
            Container.WXAnimFire = "FireMedigun"
            Container.WXAnimHolding = "HoldMedigun"
            Container.WXAnimAim = "AimMinigun"			
            Container.WXAnimTaunt = "TauntWFGun"			
			Container.Scale = 0
            Container.IsAimedWeapon = "true"
            Container.IsPoweredWeapon = "false"
            Container.IsLowGravity = "true"
            Container.HasAdjustableBounce = "false"
            Container.HasAdjustableFuse = "false"
            Container.IsAffectedByGravity = "false"
            Container.IsAffectedByWind = "false"
            Container.IsPoweredWeapon = "false"
			Container.IsLaunchedFromWorm = "true"			
            Container.DetonatesOnLandImpact = "true"
            Container.DetonatesOnWormImpact = "true"
            Container.DetonatesOnObjectImpact = "true"
            Container.DetonatesOnExpiry = "true"
            Container.EndTurnImmediate = "true"
            if(isWUM) then Container.UseParabolicRetical = "false" end                  
            Container.ArielFx = "WXP_RenewMediRay"
            Container.DetonationFx = "WXP_RenewMediExplosion"
            Container.LaunchSfx = "weapons/SecretWeapLaunch"
            Container.LoopSfx = ""
			if isWUM then Container.HoldLoopSfx = "" end
			Container.DetonationSfx = ""
            Container.BounceFx = ""
            if isWUM then  Container.EquipSfx = wSoundPrefix.."DefaultEquip" end			
            Container.BasePower = 0.2
            Container.MaxPower = 0.2
            Container.WormDamageMagnitude = 0
            Container.ImpulseMagnitude = 0
            Container.LandDamageRadius = 0
            Container.PostLaunchDelay = 2000
            Container.SkimsOnWater = "false"
            Container.TangentialMinBounceDamping = 0
            Container.ParallelMinBounceDamping = 0
            Container.TangentialMaxBounceDamping = 0
            Container.ParallelMaxBounceDamping = 0
            Container.LifeTime = 1000
            Container.IsFuseDisplayed = "true"          
            Container.NumBomblets = 0
			Container.BombletWeaponName = ""
        CloseContainer(ContainerLock)
end