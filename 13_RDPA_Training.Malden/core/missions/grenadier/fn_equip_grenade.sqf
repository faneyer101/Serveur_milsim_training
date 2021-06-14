_number_stand = _this select 0;
_player_equip = format ["player_equipe_stand_%1", _number_stand];
removeAllItems player;
removeAllWeapons player;
removeBackpack player;
removeAllAssignedItems player;
removeVest player;
player addBackpack "SOG_BAG_ALPIN_tan";
missionNamespace setVariable [_player_equip, 1, true];
for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do
{
	player addItemToBackpack "HandGrenade";
};