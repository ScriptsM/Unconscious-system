if Config.Framework == 'qb' then
QBCore = exports['qb-core']:GetCoreObject()
end

if Config.Framework == 'esx' then
ESX = exports["es_extended"]:getSharedObject()  
end

ESX.RegisterUsableItem(Config.AmmoniaName, function(source, item) 
    local xPlayer = ESX.GetPlayerFromId(source)
	if tonumber(xPlayer.getInventoryItem(Config.CottonpadName).count) >= 1 then 
	   TriggerClientEvent('bleeding:clientredirect', source)
	elseif tonumber(xPlayer.getInventoryItem(Config.CottonpadName).count) <= 1 then
Config.NoPadEvent()
    end
end)

ESX.RegisterUsableItem(Config.AmmoniaCapsuleName, function(source, item) 
    local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(xPlayer.getInventoryItem(Config.AmmoniaCapsuleName).count) >= 1 then
       TriggerClientEvent('bleeding:clientredirect', source)
    end
end)

RegisterServerEvent('bleeding:serveredirect')
AddEventHandler('bleeding:serveredirect', function(p, id)
    if Config.Framework == 'esx' then
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(Config.CottonpadName, 1)
   TriggerClientEvent('bleeding:clienthelp', tonumber(id), p)
end
if Config.Framework == 'qb' then
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(Config.CottonpadName, 1)
    TriggerClientEvent('bleeding:clienthelp', tonumber(id), p)
end
end)



 --[[ QBCore.Functions.CreateUseableItem(Config.AmmoniaName, function(source) 
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local hasItem = exports['qb-inventory']:HasItem(source, Config.CottonpadName, 1)
    if hasitem then
    TriggerClientEvent('bleeding:clientredirect', source)
elseif not hasitem then
    Config.NoPadEvent()
 end
end)

QBCore.Functions.CreateUseableItem(Config.AmmoniaCapsuleName, function(source) 
        local xPlayer = ESX.GetPlayerFromId(source)
    if tonumber(xPlayer.getInventoryItem(Config.AmmoniaCapsuleName).count) >= 1 then
       TriggerClientEvent('bleeding:clientredirect', source)
    end
end) --]]