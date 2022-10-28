
local displayTime = true

local displayDate = true

local display = true; 

local playerszam = 0


local timeAndDateString = nil



local weekDay = {

	[1] = 'Vasárnap',

	[2] = 'Hétfő',

	[3] = 'Kedd',

	[4] = 'Szerda',

	[5] = 'Csütörtök',

	[6] = 'Péntek',

	[7] = 'Szombat',

}


function displayText(text, justification, red, green, blue, alpha, posx, posy)
    SetTextFont(4)
    SetTextWrap(0.0, 0.5)
    SetTextScale(0.5, 0.5)
    SetTextJustification(justification)
    SetTextColour(red, green, blue, alpha)
    SetTextOutline()

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(posx, posy)
end





function CalculateDateToDisplay()

	if month == 1 then

		month = "1"

	elseif month == 2 then

		month = "2"

	elseif month == 3 then

		month = "3"

	elseif month == 4 then

		month = "4"

	elseif month == 5 then

		month = "5"

	elseif month == 6 then

		month = "6"

	elseif month == 7 then

		month = "7"

	elseif month == 8 then

		month = "8"

	elseif month == 9 then

		month = "9"

	elseif month == 10 then

		month = "10"

	elseif month == 11 then

		month = "11"

	elseif month == 12 then

		month = "12"

	end

end


Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(1000)
        playerszam = GetNumberOfPlayers()
    end
    Citizen.Wait(1000)
end)


	Citizen.CreateThread(function()

		while true do

            Wait(3)

            local jucatori = 0

			local ID = GetPlayerServerId(PlayerId())

            pPed = GetPlayerPed(-1)

            hp = GetEntityHealth(pPed)

			year, month, dayOfWeek, hour, minute = GetLocalTime()

			timeAndDateString = "~s~"
			if displayDate == true then
				timeAndDateString = "~b~( ~w~"..year.."/"..month.."/"..dayOfWeek.." ~b~| ~w~ID: ~r~"..ID.." ~b~| ~w~Játékosok: ~r~"..playerszam.."~w~/~r~64 ~b~)" --FPS: "..fps
			end

			if display then 

				SetTextFont(6)

				SetTextProportional(1)

				SetTextScale(0.20, 0.50)

				SetTextColour(255, 255, 255, 255)

				SetTextDropshadow(0, 0, 0, 0, 255)

				SetTextEdge(1, 0, 0, 0, 255)

				SetTextOutline()

				SetTextEntry("STRING")

				

				AddTextComponentString(timeAndDateString)

				DrawText(0.400, 0.003)

			end

		end

	end)





RegisterNetEvent('WLS:toggleInfo');

AddEventHandler('WLS:toggleInfo', function (toggleInfo)

    display = not toggleInfo;

end)

RegisterCommand('toginfo', function(source)
	if display then 
		display = false
		exports["Venice-Notification"]:Notify("Adatok eltűntetve!", 5500, "info")
	else
		display = true
		exports["Venice-Notification"]:Notify("Adatok megjelenítve!", 5500, "info")
	end
end)
