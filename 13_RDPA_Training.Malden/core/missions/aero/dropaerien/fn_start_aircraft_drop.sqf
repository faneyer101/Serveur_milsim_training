if (missionnamespace getvariable "start_drop_aerien" == 1) then 
{
	hint "Un point de depart de l'avion est deja definis";
}
else
{
	openMap true;
	hint "Clique pour creer un point de depart pour l'avion";
	start_aircraft_drop_mapclick = false;
	onMapSingleClick "start_aircraft_drop_clickpos = _pos; start_aircraft_drop_mapclick = true; onMapSingleClick ''; true;";
	waitUntil {start_aircraft_drop_mapclick || !(visiblemap)};
	if (!visibleMap || !start_aircraft_drop_mapclick) then 
	{
		hint "vous n'avez pas selectionné de depart pour l'avion";
	}
	else
	{
		_pos = start_aircraft_drop_clickpos;
		_markerstart = createMarker ["start_aircraft_paradrop", _pos];
		_markerstart setMarkerType "mil_box";
		_markerstart setMarkerText "Départ C130 pour parachutage matériel";
		_markerstart setMarkerColor "ColorOrange";
		missionNamespace setvariable ["start_drop_aerien", 1, true];
		missionNamespace setVariable ["marker_start_drop_aerien", _markerstart, true];
		openMap false;
	};
};