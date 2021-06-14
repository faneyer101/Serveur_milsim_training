/*
HandGrenade
MiniGrenade
HandGrenade_Stone
//1Rnd_HE_Grenade_shell ==> grenade pour grenadier fusils

VR_3DSelector_01_exit_F
Crater



grenade_1




format ["%1, vous pénétrez dans la zone d'entrainement aux lancé de grenades",  Name player] remoteexec ["hint", player]; player allowDamage false;
this AddAction ["Démarer entrainement grenade a main longue distance", {["grenade_longue_1", 1, "grenade_1"] spawn RDPA_fnc_create_zone_grenade_main}, [], 1.5, true, true, "", "true", 5, false, "", ""];
this AddAction ["Démarer entrainement grenade a main moyenne distance", {["grenade_moyen_1", 1, "grenade_1"] spawn RDPA_fnc_create_zone_grenade_main}, [], 1.5, true, true, "", "true", 5, false, "", ""];
this AddAction ["Démarer entrainement grenade a main courte distance", {["grenade_court_1", 1, "grenade_1"] spawn RDPA_fnc_create_zone_grenade_main}, [], 1.5, true, true, "", "true", 5, false, "", ""]; this AddAction ["Arreter l'entrainement en cours", {[1] spawn RDPA_fnc_remove_zone_grenade_main}, [], 1.5, true, true, "", "true", 5, false, "", ""];
this AddAction ["Charger son équipement en grenades", {[1] spawn RDPA_fnc_equip_grenade}, [1], 1.5, true, true, "", "true", 5, false, "", ""]; 
*/

number_stand = _this select 1;
_save_use_stand = format ["stand_%1_grenade_main", number_stand];
_player_equip = format ["player_equipe_stand_%1", number_stand];
_grenadeObj = objNull;
private _zone_grenade = "grenade_" + str (number_stand);
player setVariable ["_grenade", _zone_grenade];

if (missionNamespace getVariable _save_use_stand == 0 && missionNamespace getVariable _player_equip == 1) then
{
	missionNamespace setVariable [_save_use_stand, 1, true];
	marker_train_grenade_hand = _this select 0;
	_cursor = "VR_3DSelector_01_exit_F" createVehicle getMarkerPos marker_train_grenade_hand;
	_cratere = "Crater" createVehicle getMarkerPos marker_train_grenade_hand;
	_formatCursor = format ["cursor_stand_%1", number_stand];
	_formatCratere = format ["cratere_stand_%1", number_stand];
	_grenade = "HandGrenade";
	_distance = -1;
	missionNamespace setVariable [_formatCursor, _cursor, true];
	missionNamespace setVariable [_formatCratere, _cratere, true];
	player addEventHandler ["Fired",
	{
		if (typeOf(_this select 6) isEqualTo "GrenadeHand") then
		{
			_grenadeObj = (_this select 6);
			_zone_grenade = player getVariable ["_grenade", "error"];
			[_grenadeObj, _zone_grenade, number_stand, player] spawn RDPA_fnc_track_grenade;
		//	[_grenadeObj, _zone_grenade, number_stand, player] execVM "core\missions\grenadier\fn_track_grenade.sqf";
		};
	}];
}
else
{
	if (missionNamespace getVariable _save_use_stand == 1) then
	{
		hint format ["Le stand %1 est deja utilisé", number_stand];
	}
	else
	{
		hint format ["Veuillez vous équipez de grenades pour le stand %1 avant de commencer l'entrainement", number_stand];
	};
};