Config = {}

Config.Framework = 'esx'

Config.AmmoniaName = 'ammonia'

Config.AmmoniaCapsuleName = 'ammoniacapsule'

Config.CottonpadName = 'cotton_pad'

Config.NoPadEvent = function()
		TriggerClientEvent('t-notify:client:Custom', source, {
    style = 'message',
    title = 'Interaction',
    message = 'You dont have item: Cotton pad',
    duration = 5500
})
end