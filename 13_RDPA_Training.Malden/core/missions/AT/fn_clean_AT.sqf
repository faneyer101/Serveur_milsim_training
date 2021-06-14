_inProgress = missionNamespace getVariable ["AT_started", false];
if (!_inProgress) then 
{
	hint "Aucun entrainement en cours";
}
else
{
	_bariere_start = missionNamespace getVariable "barriere_at_start";
	_bariere_end = missionNamespace getVariable "barriere_at_end";
	_vehi = missionNamespace getVariable "AT_vehicule";
	deleteVehicle _vehi;
	deleteVehicle _bariere_start;
	deleteVehicle _bariere_end;
	missionNamespace setVariable ["AT_vehicule", objNULL, true];
	missionNamespace setVariable ["barriere_at_start", objNULL, true];
	missionNamespace setVariable ["barriere_at_end", objNULL, true];
	missionNamespace setVariable ["AT_started", false, true];
	missionNamespace setVariable ["Player_Name_AT_Started", nil, true];
};