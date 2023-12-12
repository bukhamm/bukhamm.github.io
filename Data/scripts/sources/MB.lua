-- MOD BOLUDO MAIN FUNCTIONS LIBRARY
    isWUM = true


    isMBWeapon = true -- Mod special weapons On/Off

function Initialise() -- rewrite Initialise() function from standart stdvs.lua script to add our MBSettings() function
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
    MBSettings() -- mod include
   StartFirstTurn()
   
   
--   Activity = GetData("ObjectCount.Active")
--   if Activity == 0 then
--		WaitingForStartFirstTurn = false
--        StartFirstTurn()
--	else
--		WaitingForStartFirstTurn = true
--	end
end


function TurnStarted()
	
    
	local scheme = QueryContainer("GM.SchemeData")
	if scheme.WormSelect == 1 then
		SendMessage("WormSelect.OptionSelected")
	end
    TeleportIn()
    

	

end
function Weapon_Selected()
	
	--SendMessage("WeaponHelpPanel.Open")
	
	SetData("Renew.CustomTitle", "Weapon Title")
	SetData("Renew.CustomText","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
	SetData("Renew.CustomCancel","Got It")
	SetData("Renew.CustomOption1","Dont show again")
	--SetData("Renew.CustomOption4","HUD.WP.Icons1:14")
	SendStringMessage("WXMsg.CreatePopUp","WXFEP.MBCustomInfo")
	


	--local icon = QueryContainer("WXFEP.MBCustomInfo")
	
	--Re_Message("Icon: " ..icon[4].ImageId)
	--local lock, icon = EditContainer("WXFEP.MBCustomInfo") 
	--	icon.ChildrenItems[4].ImageId = "HUD.WP.Icons1:14"
	--CloseContainer(lock)

	local menu = QueryContainer("WXFEP.MBCustomInfo")
	--local icon = QueryContainer(menu.ChildrenItems[4])
	--Re_Message(icon.ImageId)
	local lock, icon = EditContainer(menu.ChildrenItems[4])
		icon.ImageId = "HUD.WP.Icons1:14"
	CloseContainer(lock)
	

end


function MBSettings() -- Run this to load special mod options

    
    --setText=GetData("Databank.MapAuthor") -- Load Map Author string from databank to Renewation Pause menu
    --SetData("Renew.BriefSub", "Map by " .. setText)    
	
	lock, scheme = EditContainer("GM.SchemeData") -- Disable ultimate mayhem shot assistant
		scheme.AssistedShotLevel = "AssistedShot.DisableMod"
	CloseContainer(lock)		

    if isMBWeapon == true then
        MBWLoadAll() -- load all Mod Boludo weapons (you need to include mbWLoad script to map in Scripts.xom to run this)
    end

end -- End of Mod Options

function Re_Message(val)
    local myComment = tostring(val)
    --SendMessage("Commentary.Clear")
    --SendMessage("Commentary.NoDefault")  
    SetData("Text.TestComment",myComment)
    SetData("CommentaryPanel.Comment",  "Text.TestComment")
    SetData("CommentaryPanel.Delay", 30000)
    SendMessage("CommentaryPanel.ScriptText")
end