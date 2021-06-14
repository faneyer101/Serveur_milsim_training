/*
 Created by Mokomoko
 Date: 04.08.2014
 Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption"];
while {true} do 
{
 	_vehicleToFuel = (vehicle player);
	if (isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player)) then
 	{
 		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
 		_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;
 		if (_fuelConsumption > 0.002) then
 		{
			_fuelConsumption = 0.002;
		};
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
 		//hint format["Benzinverbrauch: %1L/km",_fuelConsumption*10000/2];
 		if (fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
 		{
 			"Votre réservoir d'essence est presque vide. Dépêchez-vous d'aller à la prochaine station-service!" remoteexec ["hint", player];
 		}
 		else
 		{
 			if (fuel _vehicleToFuel < 0.03) then
 			{
 				"J'espère que vous aimez courir - votre reservoir d'essence est vide!" remoteexec ["hint", player];
 			};
 		};
 	}
	else
	{
		if (isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player)) then
 		{
			// _velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
			// _fuelConsumption = _velocityOfVehicle/1000000 + 0.0001;
			_class_name = typeOf _vehicleToFuel;
			_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2)+((velocity _vehicleToFuel select 2)^2))*3.6;
			switch (_class_name) do 
			{
				case "RHS_AH64D":
				{
					hintSilent format ["%1 km/h | Réservoir %2 L | %3 L/Seconde", _velocityOfVehicle, (fuel _vehicleToFuel) * 100, _fuelConsumption];
					//sleep 3;
					//_fuelConsumption = _velocityOfVehicle/1000000000;
					//_fuelConsumption = _velocityOfVehicle/10000000;
					_fuelConsumption = 0.00001;
 				//	hint format["La consommation d'essence: %1L/km",_fuelConsumption*10000/2];
				};
				default
				{
					//hint format ["Defaut %1 | %2", _vehicleToFuel, _velocityOfVehicle];
					_fuelConsumption = _velocityOfVehicle/1000000 + 0.0001;
				};
			};
			//if (_fuelConsumption > 0.002) then
			//{
			//	_fuelConsumption = 0.002;
			//};
			_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
			if (fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
			{
 				"Votre réservoir d'essence est presque vide. Dépêchez-vous d'aller à la prochaine station-service!" remoteexec ["hint", player];
 			}
 			else
 			{
 				if (fuel _vehicleToFuel < 0.03) then
 				{
 					"J'espère que vous aimez courir - votre reservoir d'essence est vide!" remoteexec ["hint", player];
 				};
 			};
		};
	};
	sleep 2;
};