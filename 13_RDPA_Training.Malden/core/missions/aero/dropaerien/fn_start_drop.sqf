_lz_ok = missionNamespace getVariable "paradrop_zone_aerien";
_start_ok = missionNamespace getVariable "start_drop_aerien";
_inprogress = missionNamespace getVariable "mission_drop_aerien";
if (_lz_ok == 0) then
{
	hint "Choisissez une LZ avant de drop le matériel";
}
else
{
	if (_start_ok == 0) then
	{
		hint "Choisissez un point de départ de l'avion avant de drop le matériel";
	}
	else
	{
		if (_inprogress == 0) then
		{
			missionNamespace setVariable ["mission_drop_aerien", 1, true];
			_marker_pos_start = missionNamespace getVariable "marker_start_drop_aerien";
			_marker_pos_lz = missionNamespace getVariable "marker_drop_aerien";
			_pos_lz = getMarkerPos _marker_pos_lz;
			_pos_start = getMarkerPos _marker_pos_start;
			_posx = _pos_start select 0;
			_posy = _pos_start select 1;
			_posz = 3000;
			_avion = createVehicle ["RHS_C130J", _pos_start, [], 0, "FLY"];
			_avion engineOn true;
			_avion setPosATL [_posx, _posy, _posz];
			_direction = [_pos_start, _pos_lz] call BIS_fnc_dirTo;
			_avion setDir _direction;
			_crate = "B_supplyCrate_F" createVehicle  [_pos_lz select 0, _pos_lz select 1, 0];
			sleep 0.5;
			_crate attachTo [_avion, [0, 0, -3.6]];
			sleep 0.5;
			_string = "";
			player moveInDriver _avion;
			hint "Bonne chance pilote";
			waitUntil { isNull attachedTo _crate };
		//	_smoke = selectRandom ["Red","Green","Yellow","Purple","Blue","Orange"];
		//	_smoke = createVehicle ["SmokeShell"+_smoke, [0,0,0], [], 0 , ""];       
		//	_smoke attachTo [_crate, [0,0,0]];
			player setPosATL [8104,10583.5,0];
			deleteVehicle _avion;
			_while = true;
			while {_while} do
			{
				if (isTouchingGround _crate || underwater _crate) then
				{
					_while = false;
				};
				sleep 0.5;
			};
			_pos_crate = getPos _crate;
			_distance = _crate distance2D _pos_lz;
			deleteVehicle _crate;
			_string = format ["%1 à largué la caisse de matériel a %2 métres de l'objectif", name player, _distance];
			[player, _string] remoteexec ["sidechat", 0];
			missionNamespace setVariable ["mission_drop_aerien", 0, true];
			sleep 1;
			[player, player] call ace_medical_treatment_fnc_fullHeal;
		}
		else
		{
			hint "entrainement de largage deja en cours. Veuillez patienter la fin";
		};
	};
};