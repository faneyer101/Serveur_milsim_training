_mode = _this select 0;
switch (_mode) do
{
	case 1: 
	{
		missionNamespace setvariable ["list_player_drop", [], true];
		hint "Effacement de la liste d'inscription de paradrop";
	};
	case 2:
	{
		_list = missionNamespace getVariable "list_player_drop";
		hint format ["%1|%2", player, _list];
		_list = _list - [player];
		if ((count _list) == 0) then
		{
			missionNamespace setvariable ["list_player_drop", [], true];
		}
		else
		{
			missionNamespace setvariable ["list_player_drop", _list, true];
		};
		hint format ["Desincription confirmé de la list pour %1", player];
	};
	case 3:
	{
		_name = [];
		_list = missionNamespace getVariable "list_player_drop";
		{
			_name pushBackUnique (name _x);
		} forEach _list;
		hint format ["La liste d'inscrit: %1", _name];
	};
	default
	{
		if (TRUE)
			exitWith {hint "usage: [mode]"};
	};
};