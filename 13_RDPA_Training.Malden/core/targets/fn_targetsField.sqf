/*   File: fn_targetsField.sqf
     Author: RickY

     Description:
	Mod 1: Leve en randome _nbTarget les _target recu
	Mod 2: Leve toute les _target recu

     Parameter(s):
	_this select 0: number - Mod 1 ou 2
	_this select 1: array - Marker des cibles
	_this select 2: string - Nom du champs de tire
	_this select 3: number - Nombre de cibles a boucler
	_this select 4: number - Temps de pause entre deux cibles

	

*/

_targets = param [1, [], [[]]];
_ran = objNull;
_mod = param [0, 0, [0]];
_time = param [4, 0, [0]];
_nbTarget = param [3, 0, [0]];
_nameField = param [2, "", [""]];
_inProgress = missionNamespace getVariable [format ["%1_InProgress", _nameField], false];
_total = 0;
_timeTotal = _nbtarget * _time;
_timeMinutes = floor((_timeTotal) / 60);
_timeSecondes = _timeTotal - _timeMinutes * 60;
_lastGame = profileNamespace getVariable [ format["%1_Record_%2", _nameField, _time], []];
_i = 0;
if (_inProgress) exitWith {hint format ["Le Stand %1 est en cours de d'utilisation", _nameField]};
if ((count _targets) == 0) exitWith {hint "Les cibles ne sont pas spécifiées"};

switch (_mod) do
{
	case 1: // cible une a une
	{
		missionNamespace setVariable [format ["%1_InProgress", _nameField], true, true];
		hint format ["Etes vous pret %1? A vos marques, pret? Partez !!", Name player];
		waitUntil {_i = _i + 1; _i >= 250 };
		{
			_x setDamage 0;
			_x animate["terc", 1];
		} forEach _targets;

		for "_i" from 1 to _nbTarget do
		{
			_ran = selectRandom (_targets - [_ran]);
			_ran animate["terc", 0];
			sleep _time;
			_ran animate["terc", 1];
			if ((getdammage _ran) > 0) then
			{
				_total = _total + 1;
			};
			_ran setDamage 0;
		};

		{
			_x setDamage 0;
			_x animate["terc", 0];
		} forEach _targets;
		_string = format ["%5 as reussi a toucher %1/%2 cibles en %3Min|%4Sec aux stands de tirs", _total, _nbTarget, _timeMinutes, _timeSecondes, name player];
		[player, _string] remoteexec ["sidechat", 0];
		//hint format ["Tu as reussi a toucher %1/%2 cibles en %3Min|%4Sec", _total, _nbTarget, _timeMinutes, _timeSecondes];
		if ((count _lastGame == 0) || ((_timeMinutes <= _lastGame param [4, 0, [0]]) && (_timeSecondes <= _lastGame param [5, 0, [0]]) && (_total >= _lastGame  param [2, 0, [0]]))) then
		{
			profileNamespace setVariable [format ["%1_Record_%2", _nameField, _time], [ _nameField, _time, _total, _nbTarget, _timeMinutes, _timeSecondes]];
		};
		missionNamespace setVariable [format ["%1_InProgress", _nameField], false, true];
	};

	case 2: // relever l'ensemble des cibles
	{
		{
			_x setDamage 0;
			_x animate["terc", 0];
		} forEach _targets;
	};

	default
	{
		hint "Usage: [_mod, _nbTarget, _nameField, _nbTarget, _time]";
	};
};