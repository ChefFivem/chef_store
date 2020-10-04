ESX = nil
local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job

	Citizen.Wait(5000)

end)


-- Shop --


local Shop_Menu = {

    Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Shop", Blocked = false },
    Data = { currentMenu = "Shop" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Pain" then
                    TriggerServerEvent('chef_store:buy', 10, 'bread', 'Pain')
                    print("Achat d'un pain")
              elseif btn.name == "Eau" then
                TriggerServerEvent('chef_store:buy', 5, 'bread', 'Eau')
                print("Achat d'une bouteille d'eau")



              end
        end,
    },

    Menu = {
        ["Shop"] = {
            b = {
                {name = "Nourriture", ask = ">", askX = true},
                {name = "Boisson", ask = ">", askX = true},
            }
        },
        ["nourriture"] = {
            b = {
                {name = "Pain", ask = "~r~10$", askX = true},

            }
        },
        ["boisson"] = {
            b = {
                {name = "Eau", ask = "~r~5$", askX = true},

            }
        },
    } 
}

local storexyz = {
    {x = 373.875,   y = 325.896,  z = 102.566},
	{x = 2557.458,  y = 382.282,  z = 107.622},
	{x = -3038.939, y = 585.954,  z = 6.908},
	{x = -3241.927, y = 1001.462, z = 11.830},
	{x = 547.431,   y = 2671.710, z = 41.156},
	{x = 1961.464,  y = 3740.672, z = 31.343},
	{x = 2678.916,  y = 3280.671, z = 54.241},
    {x = 1729.216,  y = 6414.131, z = 34.037},
    {x = -48.519,   y = -1757.514, z = 28.421},
    {x = 1163.373,  y = -323.801,  z = 68.205},
    {x = -707.501,  y = -914.260,  z = 18.215},
    {x = -1820.523, y = 792.518,   z = 137.118},
    {x = 1698.388,  y = 4924.404,  z = 41.063},
    {x = 25.740, y = -1347.507, z = 29.49} 
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            
        for k in pairs(storexyz) do
                
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, storexyz[k].x, storexyz[k].y, storexyz[k].z)
            
            if dist <= 1.5 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec ~b~le vendeur.")
                if IsControlJustPressed(1,38) then
                    CreateMenu(Shop_Menu)
                end
                end
            end
            
        end
end)
print('By Chef')
print('https://discord.gg/7fE7vMK')
