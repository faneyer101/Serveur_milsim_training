_player = _this select 0;
_uid = getPlayerUID _player;
_name = name _player;

addMissionEventHandler ["HandleDisconnect", 
{
	params ["_unit", "_id", "_uid", "_name"];
	if (!isnil {missionnamespace getvariable "list_player_drop"}) then
	{
		_listPlayer = [];
		_listPlayer = missionnamespace getvariable "list_player_drop";
		_listPlayer = _listPlayer - [_unit];
		if ((count _listPlayer) == 0) then
		{
			missionNamespace setVariable ["list_player_drop", [],true];
			missionNamespace setvariable ["mission_paradrop",0,true];
		}
		else
		{
			missionNamespace setVariable ["list_player_drop", _listPlayer,true];
		};
	}
	else
	{
		if (!isnil {missionNamespace getVariable "player_addaction_aero"} && missionNamespace getVariable "player_addaction_aero" == _unit) then
		{
			_inProgress = missionNamespace getVariable ["aero_started", false];
			_inProgress_static = missionNamespace getVariable ["aero_started_static", false];
			if (_inProgress) then
			{
				[1] spawn RDPA_fnc_clean_aero;
				[2] spawn RDPA_fnc_init_training_ciblage;
			}
			else
			{
				if  (_inProgress_static) then
				{
					[2] spawn RDPA_fnc_clean_aero;
					[2] spawn RDPA_fnc_init_training_ciblage;
				};
			};
		};
	};
}];