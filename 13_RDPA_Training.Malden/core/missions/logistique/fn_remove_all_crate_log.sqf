_save_crate_explo = missionNamespace getVariable ["logistic_explo", []];
_save_crate_ammo = missionNamespace	getVariable ["logistic_ammo", []];
_save_crate_medical = missionNamespace getVariable ["logistic_medical", []];
_save_crate_empty = missionNamespace getVariable ["logistic_empty_crate", []];

{
	deleteVehicle _x;
} forEach _save_crate_explo;
{
	deleteVehicle _x;
} forEach _save_crate_ammo;
{
	deleteVehicle _x;
} forEach _save_crate_medical;
{
	deleteVehicle _x;
} forEach _save_crate_empty;

missionNamespace setVariable ["logistic_explo", [], true];
missionNamespace setVariable ["logistic_ammo", [], true];
missionNamespace setVariable ["logistic_medical", [], true];
missionNamespace setVariable ["logistic_empty_crate", [], true];