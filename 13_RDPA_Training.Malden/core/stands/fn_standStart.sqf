/*
Bariere			==>		Stand_1_Block // 
triger depart	==> 	START_1
						tout joueur/present
						repetable
						["Stand_1",name (thislist select 0),100,true] call RDPA_fnc_standStart; Stand_1_Block hideObjectGlobal false;
triger find		==>		END_1
						tout joueur/present
						repetable
						["Stand_1",thislist select 0] call RDPA_fnc_standEnd; Stand_1_Block hideObjectGlobal true;
triger centre	==>		Stand_1_Objects
						n'importe qui/present 
						/!\ si probleme voir pour mettre condition pour verifier que le joueurs activant le triger et bien le joueur actuel de la zone
object			==>		t_1
						Land_PenBlack_F

*/

_stand = param [0,"",[""]];
_player = param [1,"",[""]];
_probability = param [2,100,[0]];
_civilian = param [3,false,[false]];

////////// VERIFICATIONS //////////

if (_stand == "") exitWith {hint "Veuillez spécifier un nom de stand."};
if (_player == "") exitWith {hint "Le joueur n'a pas été sélectionné."};

////////// MISE EN PLACE DES VARIABLES //////////

_players = format ["%1_player",_stand];
if (missionNamespace getVariable [_players,""] == "") then
{
	_positions = [];
	_objects = format ["%1_Objects",_stand];
	_list_objects = list (call compile _objects);
	{
		if (typeof _x == "Land_PenBlack_F") then
		{
			_positions pushBack _x;
		};
	} foreach _list_objects;
	if (count _positions == 0) exitWith {hint "Veuillez spécifier au moins un marqueur."};
	_chrono = format ["%1_chrono",_stand];
	_start = format ["%1_start",_stand];
	_ennemiesTargets = format ["%1_ennemies",_stand];
	_civilianTargets = format ["%1_civilians",_stand];
	ennemiesFired = format ["%1_ennemiesFired",_stand];
	civilianFired = format ["%1_civiliansFired",_stand];

	missionNamespace setVariable [_chrono,time, true];
	missionNamespace setVariable [_start, time, true];
	missionNamespace setVariable [_players, _player, true];
	missionnamespace setvariable [_ennemiesTargets, [], true];
	missionnamespace setvariable [_civilianTargets, [], true];
	missionnamespace setvariable [ennemiesFired, 0, true];
	missionnamespace setvariable [civilianFired, 0, true];

	////////// MISE EN PLACE DES CIBLES //////////

	_targetsList = (missionNamespace getVariable [_ennemiesTargets,[]]) + (missionNamespace getVariable [_civilianTargets,[]]);

	if ((count _targetsList) != 0) then
	{
		{
			deleteVehicle _x;
		} foreach _targetsList;
		missionNamespace setVariable [_ennemiesTargets,[],true];
		missionNamespace setVariable [_civilianTargets,[],true];
	};
	_htargets = [];
	_civTarget = [];
	_targetsTotal = [];
	_targets = ["TargetP_Inf_Acc1_F","TargetP_Inf2_F","TargetP_Inf3_F"]; //"TargetBootcampHuman_F",
	_targetsCiv = ["TargetP_Civ2_F"];
	{
		_prob = floor random 100;
		if (_prob <= _probability) then
		{
			if (_civilian) then
			{
				_targetsTotal = _targets + _targetsCiv;
			};
			_tgt = selectRandom _targetsTotal;
			_pos = getPosAtl _x;
			_dir = getDir _x - 180;
			_tgtObj = createVehicle[_tgt, _pos, [], 0, "CAN_COLLIDE"];
			_tgtObj setDir _dir;
			if (_tgt in _targets) then
			{
				_htargets pushBack _tgtObj;
				_tgtObj addEventHandler ["HandleDamage", {_t = missionnamespace getVariable [ennemiesFired,0]; _t = _t + 1; missionnamespace setVariable [ennemiesFired,_t,true];}];
			}
			else
			{
				_civTarget pushBack _tgtObj;
				_tgtObj addEventHandler ["HandleDamage", {_t = missionnamespace getVariable [civilianFired,0];  _t = _t + 1; missionnamespace setVariable [civilianFired,_t,true];}];
			};
		};
	}foreach _positions;
/*
	if ((count _tar) == 0) then
	{
		_pos1 = selectRandom _positions;
		if (_civilian) then
		{
			_targetsTotal = _targets + _targetsCiv;
		};
		_tgt = selectRandom _targetsTotal;
		_pos = getPosAtl _pos1;
		_dir = getDir _pos1 - 180;
		_tgtObj = _tgt createVehicle _pos;
		_tgtObj setDir _dir;
		if (_tgt in _targets) then
		{
			_htargets pushBack _tgtObj;
			_tgtObj addEventHandler ["HandleDamage", {_t = missionnamespace getVariable [ennemiesFired,0]; _t = _t + 1; missionnamespace setVariable [ennemiesFired,_t,true];}];
		}
		else
		{
			_civTarget pushBack _tgtObj;
			_tgtObj addEventHandler ["HandleDamage", {_t = missionnamespace getVariable [civilianFired,0];  _t = _t + 1; missionnamespace setVariable [civilianFired,_t,true];}];
		};
	};*/
	missionNamespace setVariable [_ennemiesTargets,_htargets,true];
	missionNamespace setVariable [_civilianTargets,_civTarget,true];
}
else
{
	format ["Le stand est en cours d'utilisation par %1",  missionNamespace getVariable _players] remoteexec ["hint", player];
};