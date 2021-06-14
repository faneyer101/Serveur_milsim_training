_stand = _this select 0;

////////// MISE EN PLACE DES VARIABLES //////////

_chrono = format ["%1_chrono",_stand];
_players = format ["%1_player",_stand];
_ennemiesTargets = format ["%1_ennemies",_stand];
_civilianTargets = format ["%1_civilians",_stand];
_ennemiesFired = format ["%1_ennemiesFired",_stand];
_civilianFired = format ["%1_civiliansFired",_stand];

_targets = [];
_targets = (missionNamespace getVariable [_ennemiesTargets, []]) + (missionNamespace getVariable [_civilianTargets,[]]);
if ((count _targets) != 0) then
{
	{
		deleteVehicle _x
	} foreach _targets;
};
missionnamespace setvariable [_ennemiesTargets,[],true];
missionnamespace setvariable [_civilianTargets,[],true];
missionnamespace setvariable [_ennemiesFired,0,true];
missionnamespace setvariable [_civilianFired,0,true];
missionnamespace setvariable [_chrono,0,true];
missionnamespace setvariable [_players,"",true];