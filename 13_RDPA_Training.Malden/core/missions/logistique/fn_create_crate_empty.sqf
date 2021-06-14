_save_crate_empty = missionNamespace getVariable ["logistic_empty_crate", []];
_empty_crate = "Box_T_NATO_WpsSpecial_F" createVehicle position player;

clearItemCargoGlobal _empty_crate;
clearMagazineCargoGlobal _empty_crate;
clearBackpackCargoGlobal _empty_crate;
clearWeaponCargoGlobal _empty_crate;

_empty_crate setVariable ["ace_dragging_ignoreweightcarry", true, true];
_save_crate_empty pushBack _empty_crate;
missionNamespace setVariable ["logistic_empty_crate", _save_crate_empty, true];