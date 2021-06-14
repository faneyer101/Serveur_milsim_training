_mod = _this select 0;
switch (_mod) do {
	case 1:	//remove cible en mouvement
	{
		_inProgress = missionNamespace getVariable ["aero_started", false];
		if (!_inProgress) then 
		{
			hint "Aucun entrainement en cours";
		}
		else
		{
			_bariere_start = missionNamespace getVariable "barriere_aero_start";
			_vehi = missionNamespace getVariable "aero_vehicule";
			deleteVehicle _vehi;
			deleteVehicle _bariere_start;
			missionNamespace setVariable ["aero_vehicule", objNULL, true];
			missionNamespace setVariable ["barriere_aero_start", objNULL, true];
			missionNamespace setVariable ["aero_started", false, true];
			missionNamespace setVariable ["Player_Name_aero_Started", nil, true];
		};
	};
	case 2:	//remove cible static
	{
		_inProgress = missionNamespace getVariable ["aero_started_static", false];
		if (!_inProgress) then 
		{
			hint "Aucun entrainement en cours";
		}
		else
		{
			_bariere_start = missionNamespace getVariable "barriere_aero_start";
			_vehi = missionNamespace getVariable "aero_vehicule";
			deleteVehicle _vehi;
			deleteVehicle _bariere_start;
			deleteMarker "zoneAeroCibleStatic";
			missionNamespace setVariable ["aero_vehicule", objNULL, true];
			missionNamespace setVariable ["barriere_aero_start", objNULL, true];
			missionNamespace setVariable ["aero_started_static", false, true];
			missionNamespace setVariable ["Player_Name_aero_Started", nil, true];
		};
	};
	default
	{
		hint "usage [_mod]";
	};
};