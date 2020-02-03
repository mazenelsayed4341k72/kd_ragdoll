--[[

                                       _     _                       
                                      | |   (_)                      
  ___ _   _ _ __ ___   ___   _ __ ___ | |__  _ _ __  ___  ___  _ __  
 / __| | | | '_ ` _ \ / _ \ | '__/ _ \| '_ \| | '_ \/ __|/ _ \| '_ \ 
 \__ \ |_| | | | | | |  __/ | | | (_) | |_) | | | | \__ \ (_) | | | |
 |___/\__, |_| |_| |_|\___| |_|  \___/|_.__/|_|_| |_|___/\___/|_| |_|
       __/ |                                                         
      |___/___      ______      ______      ______      ______       
  _____|______|____|______|____|______|____|______|____|______|_____ 
 |______|____|______|____|______|____|______|____|______|____|______|
       |______|    |______|    |______|    |______|    |______|      
                                                                     
                                                                     
                                                                     
--]]

local sh = GetEntityHealth(ply)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ply = GetPlayerPed(-1)
            if HasEntityBeenDamagedByAnyPed(ply) then
                    dam = sh - GetEntityHealth(ply)
                    if (dam > 0) and (GetPedArmour(ply) <= 25) then
                        if (dam >= 0) and (dam <= 5) then
                            print("hurt1")
                            hurtMedium(ply, dam)
                        elseif (dam >= 6) and (dam <= 10) then
                            print("hurt2")
                            hurtMediumBad(ply, dam)
                        elseif (dam >= 11) and (dam <= 16) then
                            print("hurt3")  
                            hurtPainful(ply, dam)
                        elseif dam >= 17 then
                            print("hurt4")
                            hurtPainful(ply, dam)
                        end
                    end
                    
                    sh = GetEntityHealth(ply)
			end
			ClearEntityLastDamageEntity(ply)
	 end
end)



function hurtMedium(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 2000, 2000, 0, 0, 0, 0)
    print(r)
end
function hurtMediumBad(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 4000, 4000, 0, 0, 0, 0)
    --Citizen.SetTimeout( 4000, function() SetPedIsDrunk(ped, true) end)
    --Citizen.SetTimeout( 30000, function() SetPedIsDrunk(ped, false) end)
    print(r)
end
function hurtBad(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
    --Citizen.SetTimeout( 5000, function() SetPedIsDrunk(ped, true) end)
    --Citizen.SetTimeout( 120000, function() SetPedIsDrunk(ped, false) end)
    print(r)
end
function hurtPainful(ped, r)
    if IsEntityDead(ped) then return false end
    SetPedToRagdoll(GetPlayerPed(-1), 15000, 15000, 0, 0, 0, 0)
    --Citizen.SetTimeout( 15000, function() SetPedIsDrunk(ped, true) end)
    --Citizen.SetTimeout( 120000, function() SetPedIsDrunk(ped, false) end)
    print(r)
end
