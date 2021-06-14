_grenadeObj = _this select 0;
_zone_grenade = _this select 1;
_number_stand = _this select 2;
_player = _this select 3;
waitUntil
{
	((getPosATL _grenadeObj) inArea _zone_grenade) && ((getPosATL _grenadeObj) select 2 < 0.1)//&& ((getPosASL _grenadeObj) select 2 < 0.1)
};
_grenadePos = getPosATL _grenadeObj;
_distance = _grenadePos distance2D (getMarkerPos marker_train_grenade_fusil);
//_string = format ["%2 a fait une distance à l'objectif de %1 mètre au lancé de grenade à main", _distance];
//[player, _string] remoteexec ["sidechat", 0];
hint format ["La distance à l'objectif est de %1 mètre", _distance];
sleep 5;
if (count (backpackItems _player) == 0) then
{
	[_number_stand] spawn RDPA_fnc_remove_zone_grenade_fusil;
};