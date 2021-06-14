/*
	fn_targetPlace.sqf

this addaction ["Spawn Cibles", {["testcamps", ["m_target1","m_target2"],100,true] spawn BWB_fnc_targetPlace}]


	params:
		0 = Stand Name
		1 = table with targets positions	[Array]
		2 = Probabilities to spawn targets	0 - 100
		3 = if civilians are spawning.    	true / false

*/

//this AddAction ["Champs de tir Moyen", {[1, ciblesChampsTirs1, "1", floor random [0, 25, 50], 2] spawn BWB_fnc_targetsField}];  
//this AddAction ["Champs de tir Difficile", {[1, ciblesChampsTirs1, "1", floor random [0, 25, 50], 1] spawn BWB_fnc_targetsField}];  
//this AddAction ["Champs de tir Héroïque", {[1, ciblesChampsTirs1, "1", floor random [0, 25, 50], 0.75] spawn BWB_fnc_targetsField}];  
//this AddAction ["Champs de tir Légendaire", {[1, ciblesChampsTirs1, "1", floor random [0, 25, 50], 0.5] spawn BWB_fnc_targetsField}];  
//this AddAction ["Relever les cibles", {[2, ciblesChampsTirs1] spawn BWB_fnc_targetsField}];

_name = param [0, "targets", [""]];
_pos = param [1,[],[[]]];
_number = param [2,100,[0]];
_mode = param [3,false,[false]];
_var = format ["RDPA_targets_%1", _name];
_tar = missionNamespace getVariable [_var, []];
if ((count _tar) != 0) then
{
	{
		deleteVehicle _x;
	} foreach _tar;
	_tar = [];
	missionNamespace setVariable [_var, []];
};
if ((count _pos) == 0) exitWith {};
_targets = ["TargetBootcampHuman_F","TargetP_Inf_Acc1_F","TargetP_Inf2_F","TargetP_Inf3_F"];
_targetsCiv = ["TargetP_Civ2_F"];
{
	_prob = floor random 100;
	if (_prob <= _number) then
	{
		if (_mode) then
		{
			_targets = _targets + _targetsCiv;
		};
		_tgt = selectRandom _targets;
		_pos = getMarkerPos _x;
		_dir = markerDir _x;
		_tgtObj = createVehicle[_tgt, _pos, [], 0, "CAN_COLLIDE"];
		_tgtObj setDir _dir;
		_tar pushBack _tgtObj;
	};
}foreach _pos;
if ((count _tar) == 0) then
{
	_pos1 = selectRandom _pos;
	if (_mode) then
	{
		_targets = _targets + _targetsCiv;
	};
	_tgt = selectRandom _targets;
	_pos = getMarkerPos _pos1;
	_dir = markerDir _pos1;
	_tgtObj = _tgt createVehicle _pos;
	_tgtObj setDir _dir;
	_tar pushBack _tgtObj;
};
missionNamespace setVariable [_var, _tar];