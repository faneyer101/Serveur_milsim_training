_number_stand = _this select 0;
_save_use_stand = format ["stand_%1_grenade_fusil", _number_stand];
_player_equip = format ["player_equipe_grenade_fusil_stand_%1", _number_stand];
if (missionNamespace getVariable _save_use_stand == 1) then
{
	_formatCursor = format ["cursor_fusil_stand_%1", _number_stand];
	_formatCratere = format ["cratere_fusil_stand_%1", _number_stand];
	_cursor = missionNamespace getVariable _formatCursor;
	_cratere = missionNamespace getVariable _formatCratere;
	deleteVehicle _cursor;
	deleteVehicle _cratere;
	missionNamespace setVariable [_save_use_stand, 0, true];
	missionNamespace setVariable [_formatCratere, "", true];
	missionNamespace setVariable [_formatCursor, "", true];
	missionNamespace setVariable [_player_equip, 0, true];
	player removeAllEventHandlers "Fired";
	hint "Fin de l'entrainement";
}
else
{
	hint format ["Le stand %1 n'est pas utilisé", _number_stand];
};