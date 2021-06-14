_countdoors = _this select 0;
_house = nearestBuilding getPos player;
for [{_i = 0}, {_i < _countdoors}, {_i = _i + 1}] do 
{
	[_house, _i + 1, 0] call BIS_fnc_Door;
};
