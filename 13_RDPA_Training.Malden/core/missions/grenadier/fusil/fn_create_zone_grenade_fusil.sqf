number_stand = _this select 1;
_save_use_stand = format ["stand_%1_grenade_fusil", number_stand];
_player_equip = format ["player_equipe_grenade_fusil_stand_%1", number_stand];
_grenadeObj = objNull;
private _zone_grenade = "grenade_fusil_" + str (number_stand);
player setVariable ["_grenade_fusil", _zone_grenade];

if (missionNamespace getVariable _save_use_stand == 0 && missionNamespace getVariable _player_equip == 1) then
{
	missionNamespace setVariable [_save_use_stand, 1, true];
	marker_train_grenade_fusil = _this select 0;
	_cursor = "Sign_Arrow_Large_F" createVehicle getMarkerPos marker_train_grenade_fusil;
	_cratere = "Crater" createVehicle getMarkerPos marker_train_grenade_fusil;
	_formatCursor = format ["cursor_fusil_stand_%1", number_stand];
	_formatCratere = format ["cratere_fusil_stand_%1", number_stand];
	_grenade = "rhs_mag_M433_HEDP";
	_distance = -1;
	missionNamespace setVariable [_formatCursor, _cursor, true];
	missionNamespace setVariable [_formatCratere, _cratere, true];
	player addEventHandler ["Fired",
	{
		if (typeOf(_this select 6) isEqualTo "rhsusf_40mm_HEDP") then
		{
			_grenadeObj = (_this select 6);
			_zone_grenade = player getVariable ["_grenade_fusil", "error"];
			[_grenadeObj, _zone_grenade, number_stand, player] spawn RDPA_fnc_track_grenade_fusil;
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