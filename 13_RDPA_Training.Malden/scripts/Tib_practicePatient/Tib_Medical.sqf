/*  file: Tib_Medical.sqf
    By: RickY
    Description:
		bullet|grenade|explosive|shell|vehiclecrash        |backblast     |stab           |punch        |falling|unknown
		balle |grenade|explosif	|obus |accident de véhicule| épine dorsale|coup de couteau|coup de poing| chute |inconnues
*/
//_this setVariable ["scripts\ace_medical_isMedicalFacility",_value,true];


//spawnPos
//format ["%1, vous pénétrez dans la zone d'entrainement médical",  Name player] remoteexec ["hint", player];
//format ["%1, vous sortez de la zone d'entrainement medical",  Name player] remoteexec ["hint", player];


//this addaction [ "<t color='#00A515'>Blessures Type Standard</t>", { null = [spawnPos, 10, 1] execVM "scripts\Tib_practicePatient\Tib_medical.sqf"}];
//this addaction [ "<t color='#E79200'>Blessures Type Combat</t>", { null = [spawnPos, 10, 2] execVM "scripts\Tib_practicePatient\Tib_medical.sqf"}];
//this addaction [ "<t color='#FF0008'>Blessures Hard</t>", { null = [spawnPos, 10, 3] execVM "scripts\Tib_practicePatient\Tib_medical.sqf"}];
//this addaction [ "<t color='#000000'>Arret Cardiaque</t>", { null = [spawnPos, 10, 4] execVM "scripts\Tib_practicePatient\Tib_medical.sqf"}];

if (missionNamespace getVariable "countVictim" < 20) then
{
	_spawnpos = getPosATL param [0, objNull, [objNull]];
	_distance = param [1, 10, [0]];
	_mode = param [2, 0, [0]];
	_grp = createGroup civilian;
	_counter = 0;
	_woundcount = 0;
	_rand = 0;
	_partBody = [];
	_blessure = [];
	_spawn = [];
	_tabpos = [[-1, 0, 0], [-2, 0, 0], [-3, 0, 0], [-4, 0, 0], 
				[1, 0, 0], [2, 0, 0], [3, 0, 0], [4, 0, 0],
				[0, -1, 0], [0, -2, 0], [0, -3, 0], [0, -4, 0],
				[0, 1, 0], [0, 2, 0], [0, 3, 0], [0, 4, 0],
				[-5, 0, 0], [5, 0, 0], [0, -5, 0], [0, 5, 0]];
	_countVictime = missionNamespace getVariable "countVictim";
	_curentPos = [];
	_curentPos = _tabpos select _countVictime;
	_xx = _spawnpos select 0;
	_xxx = _curentPos select 0;
	_yy = _spawnpos select 1;
	_yyy = _curentPos select 1;
	_zz = _spawnpos select 2;
	_zzz = _curentPos select 2;
	_spawn = [(_xx + _xxx), (_yy + _yyy), (_zz + _zzz )];
	_radiusSpawn = _this select 0; // param [0, objNull, [objNull]];
	//_victim = createVehicle ["B_Protagonist_VR_F", _spawn, [], 0, "NONE"]; //c_man_1
	_victim = _grp createUnit ["B_Protagonist_VR_F", _spawn, [], 0, "NONE"]; //B_Soldier_VR_F
	_victim disableAI "MOVE";
	_victim disableAI "FSM";
	if (_countVictime == 0) then
	{
		hint format ["Il y a %1 victime", _countVictime + 1];
	}
	else
	{
		hint format ["Il y a %1 victimes", _countVictime + 1];
	};
	missionNamespace setvariable ["countvictim", _countVictime + 1, true];
	switch (_mode) do
	{
		case 1: ////// Blessures Standard //////////
		{
			sleep 1;
			_woundcount = 1 + round random 1;
			_rand = 0.2;
			_blessure = ["vehiclecrash", "backblast", "punch", "falling"];
			_partBody = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
		};
		case 2: //////// Blessures Type Combat ////////////
		{
			sleep 1;
			_woundcount = 1 + round random 2;
			_rand = 0.4;
			_blessure = ["bullet", "grenade", "explosive"];
			_partBody = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
		};
		case 3: //////////////// Blessures Hard //////////////
		{
			sleep 1;
			_woundcount = 1 + round random 4;
			_rand = 0.6;
			_blessure = ["bullet", "grenade", "explosive", "shell", "vehiclecrash", "backblast", "stab", "punch", "falling", "unknown"];
			_partBody = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
		};
		case 4: //////// Arret Cardiaque /////////
		{
			[_victim, true] call ace_medical_status_fnc_setCardiacArrestState;
		};
		default
		{
			if (TRUE)
				exitWith {hint "usage: [spanwPos, distanceSpawnPos, mod]"};
		};
	};
	if (_mode == 1 || _mode == 2 || _mode == 3) then
	{
		for [{_counter = 0}, {_counter <= _woundcount}, {_counter = _counter + 1}] do
		{
			_bodypart = selectRandom _partBody;
			_Size = 0.2 + random _rand;
			_WoundType = selectRandom _blessure;
			[_victim, _Size, _bodypart, _WoundType] call ace_medical_fnc_addDamageToUnit;
		};
	};
	waituntil { (_victim distance _radiusSpawn) > _distance || !(alive _victim) };
	if ( !alive _victim) then
	{
		hint format ["La victime %1 est morte", _countVictime + 1];
	}
	else
	{
		hint format ["La victime %1 a quitté la zone", _countVictime + 1];
	};
	sleep 2;
	_countVictime = missionNamespace getVariable "countVictim";
	if (_countVictime > 0) then
	{
		missionNamespace setvariable ["countvictim", _countVictime - 1, true];
	};
	deletevehicle _victim;
}
else
{
	if (TRUE)
		exitWith {hint "Vous ne pouvez pas avoir plus de 20 victimes"};
};