ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
        RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        Citizen.Wait(0)
    end
end)

function setBleedingOn(ped)
   if not effect then
  StartScreenEffect('DeathFailMPDark', 0, true)
  effect = true
  end
   SetPedToRagdoll(GetPlayerPed(-1), 10000, 10000, 0, 0, 0, 0)
   InfoRanny("~r~You are in an unconscious state")
   SetPlayerHealthRechargeMultiplier(PlayerId(), 0.05)
   Wait(1000)

end

function setBleedingOff(ped)
   effect = false
   StopScreenEffect('DeathFailMPDark')
end

effect = false

Citizen.CreateThread(function()
while true do
Wait(0)
local player = GetPlayerPed(-1)
local Health = GetEntityHealth(player)

 if Health <= 136 then
    setBleedingOn(player)

 elseif Health >= 137 then
   setBleedingOff(player)

 end
end
end)

RegisterNetEvent('bleeding:clientredirect')
AddEventHandler('bleeding:clientredirect', function()

local player = GetPlayerPed(-1)
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
local closestped = GetPlayerPed(closestPlayer)
local HealthCl = GetEntityHealth(closestped)
   
   if closestPlayer ~= -1 and closestDistance <= 2.0 then
   local dist = #(vector3(GetEntityHeading(PlayerPedId()),GetEntityHeading(PlayerPedId()),GetEntityHeading(PlayerPedId())) - vector3(GetEntityHeading(GetPlayerPed(closestPlayer)),GetEntityHeading(GetPlayerPed(closestPlayer)),GetEntityHeading(GetPlayerPed(closestPlayer))) )
   if dist > 3.0 and HealthCl <= 136 then
    
    TaskPlayAnim(player, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 5.0, 5.0, 5000)
    exports.rprogress:Custom({
    Duration = 5000,
    ShowTimer = false,
    Label = "Helping...",
    Radius = 25,
    Stroke = 5,
    x = 0.8,
    y = 0.95,
    LabelPosition = 'right',
})
        exports['t-notify']:Custom({
    style = 'message',
    title = 'Взаимодействие',
    message = 'You applied ammonia to the person',
    duration = 5500
})
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'cloth', 0.5)
    Wait(300)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'drip', 0.5)
    Wait(5000)
    TriggerServerEvent('bleeding:serveredirect', 1, GetPlayerServerId(closestPlayer))
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'inhale', 0.5)
  end
  if dist < 3.0 then
    exports['t-notify']:Custom({
    style = 'message',
    title = 'Взаимодействие',
    message = 'Человек слишком далеко',
    duration = 5500
})
      if Health >= 137 then
    exports['t-notify']:Custom({
    style = 'message',
    title = 'Взаимодействие',
    message = 'Человек уже в сознании',
    duration = 5500
})
   end
   end
 end
end)

RegisterNetEvent('bleeding:clienthelp')
AddEventHandler('bleeding:clienthelp', function()
    ProcessHelp(x)
  
  if x == 0 then 
     SetEntityHealth(GetPlayerPed(PlayerId()), 200)
              exports['t-notify']:Custom({
    style = 'message',
    title = 'Взаимодействие',
    message = 'Вас привели в сознание с помощью аммиака',
    sound = true,
    duration = 5500
})
  else 
     SetEntityHealth(GetPlayerPed(PlayerId()), 200)
         exports['t-notify']:Custom({
    style = 'message',
    title = 'Взаимодействие',
    message = 'Вас привели в сознание с помощью аммиака',
    sound = true,
    duration = 5500
})
  end
end)

 
function InfoRanny(text)
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(false, false)
end

function ProcessHelp(type) 

    if type == 0 then 
        print('0')
    elseif type == 1 then  
        print('1')
    end
end