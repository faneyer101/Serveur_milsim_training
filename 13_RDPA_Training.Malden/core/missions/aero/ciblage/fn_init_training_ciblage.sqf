_mod = _this select 0;
_inProgress = missionNamespace getVariable ["aero_started", false];
_inProgress_static = missionNamespace getVariable ["aero_started_static", false];

switch (_mod) do
{
	case 1:	//addaction
	{
		if (_inProgress || _inProgress_static) then 
		{
			format ["Entrainement en deja cours par %1", missionNamespace getVariable ["Player_Name_aero_Started", false]] remoteexec ["hint", player];
		}
		else
		{
			missionNamespace setVariable ["player_addaction_aero", player, true];
			_tab = [];
			_add1 = player AddAction ["<t color='#D8F013'>Camion avance lente</t>", {[0, 25, 20] spawn RDPA_fnc_aero_cible_moove}];
			_add2 = player AddAction ["<t color='#D8F013'>Camion vitesse normale</t>", {[0, 50, 20] spawn RDPA_fnc_aero_cible_moove}];
			_add3 = player AddAction ["<t color='#D8F013'>VBL avance lente</t>", {[1, 25, 20] spawn RDPA_fnc_aero_cible_moove}];
			_add4 = player AddAction ["<t color='#D8F013'>VBL vitesse normale</t>", {[1, 50, 20] spawn RDPA_fnc_aero_cible_moove}];
			_add5 = player AddAction ["<t color='#D8F013'>T72B avance lente</t>", {[2, 25, 20] spawn RDPA_fnc_aero_cible_moove}];
			_add6 = player AddAction ["<t color='#D8F013'>T72B vitesse normale</t>", {[2, 50, 20] spawn RDPA_fnc_aero_cible_moove}];

			_add7 = player AddAction ["<t color='#33FF36'>Camion static</t>", {[0] spawn RDPA_fnc_aero_cible_static}];
			_add8 = player AddAction ["<t color='#33FF36'>VBL static</t>", {[1] spawn RDPA_fnc_aero_cible_static}];
			_add9 = player AddAction ["<t color='#33FF36'>T72B static</t>", {[2] spawn RDPA_fnc_aero_cible_static}];

			_add10 = player AddAction ["<t color='#B40404'>Reset cible en mouvement</t>", {[1] spawn RDPA_fnc_clean_aero }];
			_add11 = player AddAction ["<t color='#B40404'>Reset cible static</t>", {[2] spawn RDPA_fnc_clean_aero }];
		
			_tab pushBack _add1;
			_tab pushBack _add2;
			_tab pushBack _add3;
			_tab pushBack _add4;
			_tab pushBack _add5;
			_tab pushBack _add6;

			_tab pushBack _add7;
			_tab pushBack _add8;
			_tab pushBack _add9;

			_tab pushBack _add10;
			_tab pushBack _add11;
			missionNamespace setVariable ["listaddaction_aero", _tab, true];
		};
	};
	case 2:	//remove addaction
	{
		_verif = missionNamespace getVariable ["player_addaction_aero", objNull];
		if (isNull _verif) then
		{
			hint "Aucun addaction n'est enregistré sur le joueur";
		}
		else
		{
			if (player != _verif) then
			{
				hint format ["Entrainement déja en cours par %1", name _verif];
			}
			else
			{
				_tab = missionNamespace getVariable ["listaddaction_aero", []];
				{
					player removeAction _x;
				} forEach _tab;
				missionNamespace setVariable ["listaddaction_aero", [], true];
				missionNamespace setVariable ["player_addaction_aero", objNull, true];
			};
		};
	};
	default
	{
		hint "usage [_mod]";
	};
};
