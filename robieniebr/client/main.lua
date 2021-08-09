ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local done = true

Citizen.CreateThread(function()

		while true do
			Citizen.Wait(10)

			local ped = GetPlayerPed(ped)
			local playercoord = GetEntityCoords(ped)
			local vector = vector3(299.18, -577.67, 42.26)

			if Vdist2(playercoord, vector) < 3 then
				DrawMarker(23, vector, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 100, 255, 100, false, true, 2, true, false, false, false)
				if IsControlJustPressed(1 ,46) then
					OpenSearchMenu()
				end
			end
		end
end)


function OpenSearchMenu()

	local elements = {}

		table.insert(elements, {label = "pistolet", value = 'pistol'})

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
		title    = "bronie",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'pistolet' then
			ESX.TriggerServerCallback("pistol1:check", function(result)
				if result then
					TriggerServerEvent('pistol1:giveWeapon')
				elseif not result then
					ESX.ShowNotification('~r~Nie masz wystarczająco sprzętu', 'jd was')
					Citizen.Wait(200)
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

RegisterCommand('bbc', function()

	ESX.UI.Menu.CloseAll()
	
end)

Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("u_m_y_juggernaut_01"))
    while not HasModelLoaded(GetHashKey("u_m_y_juggernaut_01")) do
      Citizen.Wait(1)
    end

      local szeftokoks = CreatePed(4, 0x90EF5134, 299.84, -577.95, 42.26, 259.39, false, true)
      SetEntityHeading(szeftokoks, 49.404)
      FreezeEntityPosition(szeftokoks, true)
      SetEntityInvincible(szeftokoks, true)
      SetBlockingOfNonTemporaryEvents(szeftokoks, true)
end)


Citizen.CreateThread(function()

	while true do
			Citizen.Wait(10)

		local ped = GetPlayerPed(ped)
		local playercoord = GetEntityCoords(ped)
		local vector = vector3(295.29, -569.44, 43.26)

		if Vdist2(playercoord, vector) < 3 then
			DrawMarker(23, vector, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 100, 100, 255, 100, false, true, 2, true, false, false, false)
			if IsControlJustPressed(1 ,38) then
				ESX.ShowNotification('~y~Wyrabiasz sprzęt...', 'jd was')
				FreezeEntityPosition(ped, true)
				TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_gardener_plant", 0, true)

					ESX.ShowNotification("Wyrabianie ~y~sprzetu: ~w~20%")

					Citizen.Wait(100000)

					ESX.ShowNotification("Wyrabianie ~y~sprzetu: ~w~40%")

					Citizen.Wait(100000)

					ESX.ShowNotification("Wyrabianie ~y~sprzetu: ~w~60%")

					Citizen.Wait(100000)

					ESX.ShowNotification("Wyrabianie ~y~sprzetu: ~w~80%")

					Citizen.Wait(100000)

					ESX.ShowNotification("Wyrabianie ~y~sprzetu: ~w~100%")

					Citizen.Wait(100000)

					FreezeEntityPosition(ped, false)

					ClearPedTasks(ped)

					ESX.TriggerServerCallback("pistol1:give", function()
						Citizen.Wait(10)
					end)
			end
		end
	end
end)