/*
this addAction["Etape 1: Choisir une LZ", {[] spawn RDPA_fnc_create_zoneParaDrop;}];
this addAction["Etape 2: Créer une caisse de ravitaillement", {["spawn_crate_aero"] spawn RDPA_fnc_create_crate}];
*/
spawn_crate = _this select 0;
_crate = "B_supplyCrate_F" createVehicle getMarkerPos spawn_crate_aero;