_stand = param [0,"",[""]];
_player = param [1,objNull,[objNull]];
_playername = name _player;
////////// CHECKS //////////

if (_stand == "") exitWith {"Veuillez spécifier un nom de stand." remoteexec ["hint",_player]};
if (_playername == "") exitWith {"Le joueur n'a pas été sélectionné." remoteexec ["hint",_player]};
////////// CREATING VARIABLES //////////

_chrono = format ["%1_chrono",_stand];
_players = format ["%1_player",_stand];
_ennemiesTargets = format ["%1_ennemies",_stand];
_civilianTargets = format ["%1_civilians",_stand];
_ennemiesFired = format ["%1_ennemiesFired",_stand];
_civilianFired = format ["%1_civiliansFired",_stand];

////////// CHECK PLAYER //////////

_playerEnCours = missionNamespace getVariable [_players,""];

if (_playerEnCours == "") then 
{ 
	hint "Il n'y a aucun membre dans le stand." remoteexec ["hint", player];
}
else
{
	if (_playerEnCours != (name player)) then 
	{
		format ["Le stand est en cours d'utilisation par %1",  _playerEnCours] remoteexec ["hint", player];
	}
	else
	{

		////////// DELETING TARGETS //////////
	_targetList = missionNamespace getVariable [_ennemiesTargets,[]];
	_civilianList = missionNamespace getVariable [_civilianTargets,[]];
	_targets = [];
	_targets = _targetList + _civilianList;
	{
		deleteVehicle _x;
	} foreach _targets;

		////////// RECORD //////////

	_var = format ["%1_record",_stand];
	_CtargetsNb = missionNamespace getVariable [_civilianFired,0];
	_nbtargets = missionNamespace getVariable [_ennemiesFired,0];
	_temps = time - (missionNamespace getvariable [_chrono,0]) + (5*(_CtargetsNb)) + 5*((count _targetList)- _nbtargets);
	_record = profileNamespace getvariable [_var,999];

	_phrase = "";
	if (_temps <= _record) then
	{
		profileNamespace setvariable [_var,_temps];
		_phrase = format ["%4: %3 a fait un temps de %1s. C'est son nouveau record!!!   Civils:%6/%7 Ennemis:%5/%8",  _temps, _record, _playername, _stand,_nbtargets,_CtargetsNb,count _civilianList,count _targetList];
	}
	else
	{
		_phrase = format ["%4: %3 a fait un temps de %1s. Civils:%6/%7 Ennemis:%5/%8",  _temps, _record, _playername, _stand,_nbtargets,_CtargetsNb,count _civilianList,count _targetList];
	};
	missionnamespace setvariable [_ennemiesTargets,[],true];
	missionnamespace setvariable [_civilianTargets,[],true];
	missionnamespace setvariable [_ennemiesFired,0,true];
	missionnamespace setvariable [_civilianFired,0,true];
	missionnamespace setvariable [_chrono,0,true];
	missionnamespace setvariable [_players,"",true];

	[_player,_phrase] remoteexec ["sidechat",0];
	};
};