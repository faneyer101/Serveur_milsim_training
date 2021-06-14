/*
this AddAction ["Camion avance lente", {[0, 25, 20] spawn RDPA_fnc_aero_cible}];
this AddAction ["Camion vitesse normale", {[0, 50, 20] spawn RDPA_fnc_aero_cible}];
this AddAction ["VBL avance lente", {[1, 25, 20] spawn RDPA_fnc_aero_cible}];
this AddAction ["VBL vitesse normale", {[1, 50, 20] spawn RDPA_fnc_aero_cible}];
this AddAction ["T72B avance lente", {[2, 25, 20] spawn RDPA_fnc_aero_cible}];
this AddAction ["T72B vitesse normale", {[2, 50, 20] spawn RDPA_fnc_aero_cible}];

AT_sud_west
AT_nord_west


UK3CB_TKM_O_V3S_Closed ==> camion
UK3CB_TKM_O_BRDM2_HQ ==> vbl
UK3CB_TKA_O_T72A ==> t72
*/

_inProgress_static = missionNamespace getVariable ["aero_started_static", false];
_inProgress = missionNamespace getVariable ["aero_started", false];

_number = param [0, 0, [0]];
_car = ["O_Truck_02_covered_F", "rhs_btr80_msv", "rhs_t72ba_tv"];
//_car = ["CUP_C_Datsun", "CUP_C_Datsun", "CUP_C_Datsun"];
_alive = 1;
_count = 0;
_damage = 0;
if (_inProgress || _inProgress_static) exitWith {format ["Entrainement en deja cours par %1", missionNamespace getVariable ["Player_Name_aero_Started", false]] remoteexec ["hint", player];};
_bariere_start = "Land_Razorwire_F" createVehicle [3785.77,4024.13,0];
_bariere_start setdir 284;
_bariere_start allowDamage false;
missionNamespace setVariable ["barriere_aero_start", _bariere_start, true];
missionNamespace setVariable ["aero_started_static", true, true];
missionNamespace setVariable ["Player_Name_aero_Started", name player, true];
_vehi = _car select _number createVehicle [1785.36,2825.32,0];
_markerZone = createMarker ["zoneAeroCibleStatic", [1785.36,2825.32,0]];
_markerZone setMarkerType "mil_objective";
_markerZone setMarkerText "Cible pour aero";
_markerZone setMarkerColor "ColorRed";
createVehicleCrew _vehi;
_vehi deleteVehicleCrew gunner _vehi;
_vehi deleteVehicleCrew commander _vehi;
_grp = crew _vehi;
_vehi setBehaviour "CARELESS";
missionNamespace setVariable ["aero_vehicule", _vehi, true];
waitUntil
{
	(!alive _vehi) || (!alive driver _vehi)
};
if ((!alive _vehi)) then
{
	"Bravo vous avez detruit le vehicule fin de l'entrainement" remoteexec ["hint", player];
	_alive = 0;
}
else
{	
	if ((!alive driver _vehi)) then
	{
		"Vous avez tuée le conducteur fin de l'entrainement" remoteexec ["hint", player];
		_alive = 0;
	};
};
{deleteVehicle _x} forEach _grp;
deleteVehicle _vehi;
deleteVehicle _bariere_start;
deleteMarker "zoneAeroCibleStatic";
missionNamespace setVariable ["aero_vehicule", objNULL, true];
missionNamespace setVariable ["barriere_aero_start", objNULL, true];
missionNamespace setVariable ["aero_started_static", false, true];
missionNamespace setVariable ["Player_Name_aero_Started", nil, true];