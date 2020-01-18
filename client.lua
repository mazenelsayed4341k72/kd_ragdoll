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

local ped = PlayerPedId()

local damages = {
    h1 = 25,
    h2 = 50,
    h3 = 75,
    h4 = 100
}

local anticheat = true -- If true then code will reset MaxHealth to 200 ( the default ) in case that limit is over-reached. Making maxhealth cheats useless

phealth = ( GetEntityHealth( ped ) / GetEntityMaxHealth( ped ) ) * 100

prag = IsPedRagdoll( ped )

frag = IsPedRunningRagdollTask( ped )

function checkDamage( ped )

    if phealth <= damages.h1 then

        SetPedToRagdoll( ped, 2000, 1000, 2, false, false, false )
        
    elseif ( phealth <= damages.h2 ) and ( phealth >= damages.h1 ) then

        SetPedToRagdoll(ped, 4000, 1000, 1, false, false, false )

    elseif ( phealth <= damages.h3 ) and ( phealth >= damages.h2 ) then

        SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
        
    elseif ( phealth <= damages.h4 ) and ( phealth >= damages.h3 ) then
  
        SetPedToRagdoll( ped, 5000, 1000, 0, false, false, false )
        
    else

    end

end


Citizen.CreateThread(function()

    while true do

        Citizen.Wait( 0 )
        
            SetPedCanRagdoll( ped, true )

            if ( GetEntityHealth( ped ) < GetEntityMaxHealth( ped ) ) and ( ( prag ~= true ) or ( frag ~= true ) )  and ( GetEntityHealth( ped ) ~= oldhealth ) and ( GetPedArmour( ped ) < 50 ) then
                
                oldhealth = GetEntityHealth( ped )

				        checkDamage( ped ) 
                             
            end

    end
end)