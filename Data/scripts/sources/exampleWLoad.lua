-- example weapon library

isWLoadBazooka = false
isWLoadYourWeapon = false

function Initialise() -- rewrite Initialise() function from standart stdvs.lua script
   StartedSuddenDeath = false
   
   SetupScheme()

   lib_SetupMultiplayerWormsAndTeams()
   SendMessage("WormManager.Reinitialise")

   lib_SetupMinesAndOildrums() -- do this after worms are set up to get correct worm collision


   local scheme = QueryContainer("GM.SchemeData")
   if scheme.RoundTime == 0 then
      StartSuddenDeath() -- do this after worms are set up to readjust health
      local GameOver = GetData("FCS.GameOver")
      -- do no further processing if sudden death drew the game
      if GameOver ~= 0 then
         return 
      end
   end
   
   if scheme.MineFactoryOn == true then
      SendMessage("GameLogic.CreateRandMineFactory")
   end
   
   if scheme.TelepadsOn == true then
       SendMessage("GameLogic.PlaceTelepads")       
   end
   
   SetData("Camera.StartOfTurnCamera","Default")
   
   SetWormpotModes()
   

   WaitingForStartFirstTurn = false
   StartFirstTurn()
   
   ExampleWLoadAll()
--   Activity = GetData("ObjectCount.Active")
--   if Activity == 0 then
--		WaitingForStartFirstTurn = false
--        StartFirstTurn()
--	else
--		WaitingForStartFirstTurn = true
--	end
end


function ExampleWLoadAll() -- fast enable all weapons
	isWLoadBazooka = true
	isWLoadYourWeapon = true
	RenewWLoad()
end


function ExampleWLoad() -- Run for init new weapons   

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
	
	if isWLoadYourWeapon == true then
		-- WRITE YOUR CUSTOM CODE HERE
	end

end