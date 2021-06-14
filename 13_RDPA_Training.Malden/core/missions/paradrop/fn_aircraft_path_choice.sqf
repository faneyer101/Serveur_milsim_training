
_mode = _this select 0;
switch (_mode) do
{
	case 1: //creer start
	{
		if (missionnamespace getvariable "start_aircraft_paradrop" == 1) then 
		{
			hint "Un point de depart de l'avion est deja definis";
		}
		else
		{
			openMap true;
			hint "Clique pour creer un point de depart pour l'avion";
			start_aircraft_paradrop_mapclick = false;
			onMapSingleClick "start_aircraft_paradrop_clickpos = _pos; start_aircraft_paradrop_mapclick = true; onMapSingleClick ''; true;";
			waitUntil {start_aircraft_paradrop_mapclick || !(visiblemap)};
			if (!visibleMap || !start_aircraft_paradrop_mapclick) then 
			{
				hint "vous n'avez pas selectionné de depart pour l'avion";
			}
			else
			{
				_pos = start_aircraft_paradrop_clickpos;
				_markerstart = createMarker ["start_aircraft_paradrop", _pos];
				_markerstart setMarkerType "mil_box";
				_markerstart setMarkerText "Départ C130 pour parachutage infanterie";
				_markerstart setMarkerColor "ColorRed";
				missionNamespace setvariable ["start_aircraft_paradrop",1,true];
				missionNamespace setVariable ["marker_start_aircraft_paraDrop", _markerstart, true];
				openMap false;
			};
		};
	};
	case 2: //creer end
	{
		if (missionnamespace getvariable "end_aircraft_paradrop" == 1) then 
		{
			hint "Un point d'arriver de l'avion est deja definis";
		}
		else
		{
			openMap true;
			hint "Clique pour creer un point de fin pour l'avion";
			end_aircraft_paradrop_mapclick = false;
			onMapSingleClick "end_aircraft_paradrop_clickpos = _pos; end_aircraft_paradrop_mapclick = true; onMapSingleClick ''; true;";
			waitUntil {end_aircraft_paradrop_mapclick || !(visiblemap)};
			if (!visibleMap || !end_aircraft_paradrop_mapclick) then 
			{
				hint "vous n'avez pas selectionné de fin pour l'avion";
			}
			else
			{
				_pos = end_aircraft_paradrop_clickpos;
				_markerend = createMarker ["end_aircraft_paradrop", _pos];
				_markerend setMarkerType "mil_box";
				_markerend setMarkerText "Arrivé C130 pour parachutage infanterie";
				_markerend setMarkerColor "ColorRed";
				missionNamespace setvariable ["end_aircraft_paradrop",1,true];
				missionNamespace setVariable ["marker_end_aircraft_paraDrop", _markerend, true];
				openMap false;
			};
		};
	};
	case 3:	//suprimer start
	{
		if (missionnamespace getvariable "start_aircraft_paradrop" == 0) then 
		{
			hint "Cree un point de depart avant de vouloir le supprimer";
		}
		else
		{
			deleteMarker "start_aircraft_paradrop";
			missionNamespace setvariable ["start_aircraft_paradrop", 0, true];
			missionNamespace setVariable ["marker_start_aircraft_paraDrop", "", true];
		};
	};
	case 4:	//supprimer end
	{
		if (missionnamespace getvariable "end_aircraft_paradrop" == 0) then 
		{
			hint "Cree un point d'arrivé avant de vouloir le supprimer";
		}
		else
		{
			deleteMarker "end_aircraft_paradrop";
			missionNamespace setvariable ["end_aircraft_paradrop", 0, true];
			missionNamespace setVariable ["marker_end_aircraft_paraDrop", "", true];
		};
	};
	default 
	{ 
		hint "usage aircraft_path_choise [_mode]";
	};
};