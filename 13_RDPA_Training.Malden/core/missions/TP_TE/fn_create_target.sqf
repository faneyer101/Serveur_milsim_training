_mode = _this select 0;
_type = param [1, "", [""]];
_targets = _this select 2;
_format_ballon = format ["_list_ballon_%1", _type];
_format_fleche = format ["_list_fleche_%1", _type];
_format_training = format ["training%1", _type];
_format_init = format ["init_training%1", _type];
switch (_mode) do 
{
	case "initialisation":
	{
		_used = missionNameSpace getVariable [_format_training, 0];
		if (_used == 0) then
		{
			hint "Aucunes cibles n'est crèer";
		}
		else
		{
			missionNameSpace setVariable [_format_training, 0, true];
			if (missionNamespace getVariable [_format_init, 0] == 0) then
			{
				_ballon = missionNamespace getVariable [_format_ballon, []];
				_fleche = missionNamespace getVariable [_format_fleche, []];;
				{
					deleteVehicle _x;
				} forEach _ballon;
				{
					deleteVehicle _x;
				} forEach _fleche;
				missionNameSpace setVariable [_format_init, 1, true];
				missionNameSpace setVariable [_format_ballon, [], true];
				missionNameSpace setVariable [_format_fleche, [], true];
			};
		};
	};
	case "creer":
	{
		_used = missionNameSpace getVariable [_format_training, 0];
		_init = missionNamespace getVariable [_format_init, 1];
		if (_used == 0 && _init == 1) then
		{
			missionNameSpace setVariable [_format_training, 1, true];
			missionNameSpace setVariable [_format_init, 0, true];
			_positions = [];
			_objects = format ["%1_Objects", _type];
			_list_objects = list (call compile _objects);
			{
				if (typeof _x == "Land_PenBlack_F") then
				{
					_positions pushBack _x;
				};
			} foreach _list_objects;
			_list_ballon = [];
			_list_fleche = [];
			for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do 
			{
				_pos = _positions select _i;
				_ballon = "Land_Balloon_01_air_F" createVehicle (getPosATL _pos);
				_ballon enableSimulation false;
				_fleche = "Sign_Arrow_Large_F" createVehicle (getPosATL _pos);
				_list_ballon pushBack _ballon;
				_list_fleche pushBack _fleche;
			};
			missionNameSpace setVariable [_format_ballon, _list_ballon, true];
			missionNameSpace setVariable [_format_fleche, _list_fleche, true];
		}
		else
		{
			hint "Les cibles sont deja créer";
		};
	};
	case "relever": 
	{
		{
			_x setDamage 0;
			_x animate["terc", 0];
		} forEach _targets;
	};
	default 
	{
		hint "usage: Precicer une option"
	};
};
