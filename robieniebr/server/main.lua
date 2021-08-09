ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('pistol1:giveWeapon')
AddEventHandler('pistol1:giveWeapon' ,function()

    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addWeapon('weapon_pistol', 30)

end)

ESX.RegisterServerCallback("pistol1:check", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    local item = xPlayer.getInventoryItem("sprzet")["count"]

    if item >= 1 then
        xPlayer.removeInventoryItem("sprzet", 3)
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback("pistol1:give", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addInventoryItem('sprzet', 1)
end)