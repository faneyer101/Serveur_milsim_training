if (missionnamespace getvariable "paradrop_zone" == 1) then
{
	hint "Une LZ est deja définis";
}
else
{
	openMap true;
	hint "Clique pour creer une LZ";
	LZ_paradrop_mapclick = false;
	onMapSingleClick "LZ_paradrop_clickpos = _pos; LZ_paradrop_mapclick = true; onMapSingleClick ''; true;";
	waitUntil {LZ_paradrop_mapclick || !(visiblemap)};
	if (!visibleMap || !LZ_paradrop_mapclick) then 
	{
		hint "vous n'avez pas selectionné de LZ";
	}
	else
	{
		_pos = LZ_paradrop_clickpos;
		_markerZone = createMarker ["zoneParaDrop_random", _pos];
		_markerZone setMarkerType "mil_objective";
		_markerZone setMarkerText "LZ infanterie";
		_markerZone setMarkerColor "ColorBlack";
		_helipad = "PARACHUTE_TARGET" createVehicle _pos;
		_lumiere = "PortableHelipadLight_01_blue_F" createVehicle _pos;
		missionNamespace setvariable ["paradrop_zone",1,true];
		missionNamespace setVariable ["marker_paraDrop", _markerZone, true];
		missionNamespace setVariable ["target_para", _helipad, true];
		missionNamespace setVariable ["lumiere_heli", _lumiere, true];
		openMap false;
	};
};