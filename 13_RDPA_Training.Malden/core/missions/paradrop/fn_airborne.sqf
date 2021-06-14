/*
this addAction["Parachutage training 1000 Mètres", {[[10000, 7000, 1000], [3000, 0, 0], 1000] call RDPA_fbnc_airborne}];
this addAction["Parachutage training 2000 Mètres", {[[10000, 7000, 2000], [3000, 0, 0], 2000] call RDPA_fbnc_airborne}]; 
*/
_player = missionnamespace getvariable ["list_player_drop", []];
if (isnil {_player select 0}) then
{
	hint "Aucune personnel de disponible pour organiser le saut";
}
else
{
	if (missionnamespace getvariable "start_aircraft_paradrop" == 0 || missionnamespace getvariable "end_aircraft_paradrop" == 0) then
	{
		hint "Veuillez choisir une trajectoire correct pour l'avion. Départ + arrivé";
	}
	else
	{
		//hint format ["avant %1", _player];
		//sleep 5;
		//[_player] spawn RDPA_fnc_track_player;
		//sleep 5;
		//missionNamespace setVariable ["list_player_drop", [],true];
		//if (TRUE) exitwith {hint format ["bravo pour ton saut %1", name(_player select 0)]};

		missionNamespace setvariable ["mission_paradrop", 1, true];
		private ["_start", "_end", "_height", "_speed", "_class", "_side"];
		/*
		//this addAction["Etape 3: Parachutage training 1000 Mètres", {[[100,100,1000], [12000,12000,1000], 1000] spawn RDPA_fnc_airborne}];
		//this addAction["Etape 3: Parachutage training 2000 Mètres", {[[100,100,2000], [12000,12000,2000], 2000] spawn RDPA_fnc_airborne}];
		_start   = param [0,position player,[[]]];
		_end   = param [1,[0,0,0],[[]]];
		_height  = param [2,500,[0]];
		_speed  = param [3,"FULL",[""]];
		_class   = param[4,"RHS_C130J",[""]]; // RHS_C130J
		_side  = param [5,WEST,[WEST]];
		*/

		//this addAction["Etape 3: Parachutage training 2000 Mètres", {[] spawn RDPA_fnc_airborne}];
		_start = getMarkerPos (missionNamespace getVariable "marker_start_aircraft_paraDrop");
		_end = getMarkerPos (missionNamespace getVariable "marker_end_aircraft_paraDrop");
		_height  = param [0,500,[0]];
		_speed  = param [1,"FULL",[""]];
		_class   = param[2,"RHS_C130J",[""]]; // RHS_C130J
		_side  = param [3,WEST,[WEST]];

		_start set [2, (_height + 700)];

		private "_direction";
		_direction = [_start, _end] call BIS_fnc_dirTo;

		private ["_vehicleContainer", "_vehicle", "_vehicleCrew", "_vehicleGroup"];
		_vehicleContainer = [_start, _direction, _class, _side] call BIS_fnc_spawnVehicle;

		_vehicle   = _vehicleContainer select 0;
		_vehicle engineOn true;
		_vehicleCrew  = _vehicleContainer select 1;
		_vehicleGroup  = _vehicleContainer select 2;

		_vehicle disableAi "TARGET";
		_vehicle disableAi "AUTOTARGET";
		_vehicleGroup allowFleeing 0;

		_vehicle flyInHeight _height;

		private "_waypoint";
		_waypoint = _vehicleGroup addWaypoint [_end, 0];

		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointBehaviour "CARELESS";
		_waypoint setWaypointCombatMode "BLUE";
		_waypoint setWaypointSpeed _speed;

		_waypoint setWaypointStatements [
		"true",
		"private ['_group', '_vehicle']; _group = group this; _vehicle = vehicle this; { deleteVehicle _x } forEach units _group; deleteVehicle _vehicle; deleteGroup _group; missionNamespace setvariable ['mission_paradrop',0,true];"
		];
		{
			_x moveInAny _vehicle;
			"Pense a prendre un parachute dans le coffre de l'avion si tu n'en as pas, je dis ca je dis rien" remoteexec ["hint", _x];
		}foreach _player;
		[_player] spawn RDPA_fnc_track_player;
	};
};