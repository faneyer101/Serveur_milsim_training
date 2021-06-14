
_listPlayers = _this select 0;
_pos = [];
_output = [];
_posLZ = getMarkerPos (missionNamespace getVariable "marker_paraDrop");
while {(count _listPlayers) > 0} do
{
	{
		if (((getposATL _x) select 2) <= 1 || ((getPosASL _x) select 2) <= 1) then
		{
			_distance = _posLZ distance (getPos _x);
			_string = format ["j'ai atterri à une distance de %1 Mètres de la LZ", _distance];
			_listPlayers = _listPlayers - [_x];
			[_x, _string] remoteexec ["globalChat",0];
			missionNamespace setVariable ["list_player_drop", _listPlayers, true];
			sleep 2;
			_x setposATL [8104.06,10004.6,0];
		}
	} forEach _listPlayers;
	sleep 1;
};