-- MOD BOLUDO WEAPONS LIBRARY

	isMBWLoadBazooka = false -- custom bazooka
	

function MBWLoadAll() -- fast loading all custom weapons
	isMBWLoadBazooka = true -- custom bazooka
	MBWLoad()
end


---------------------------------------------- MOD BOLUDO WEAPONS LOADING FUNCTION

function MBWLoad() 
   
    local setText = ""
    wSoundPrefix = "weapons/" -- we use these strings because the sound storage paths in W4m are different
    gSoundPrefix = "global/"    
    
	if isMBWLoadBazooka == true then
		SetData("Bubble.Radius", 1000)
		SetData("Bubble.OffsetY", 60)
		SetData("Bubble.Lifetime",6)
	end
end