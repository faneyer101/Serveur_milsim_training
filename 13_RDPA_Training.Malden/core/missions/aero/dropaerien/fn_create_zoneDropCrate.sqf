if (missionNameSpace getvariable "paradrop_zone_aerien" == 1) then
{
	hint "Une LZ est deja définis";
}
else
{
	openMap true;
	hint "Clique pour creer une LZ";
	LZ_drop_mapclick = false;
	onMapSingleClick "LZ_drop_clickpos = _pos; LZ_drop_mapclick = true; onMapSingleClick ''; true;";
	waitUntil {LZ_drop_mapclick || !(visiblemap)};
	if (!visibleMap || !LZ_drop_mapclick) then 
	{
		hint "vous n'avez pas selectionné de LZ";
	}
	else
	{
		_pos = LZ_drop_clickpos;
		_markerZone = createMarker ["zoneDropMateriel", _pos];
		_markerZone setMarkerType "mil_objective";
		_markerZone setMarkerText "LZ drop aérien materiel";
		_markerZone setMarkerColor "ColorBrown";
		missionNamespace setvariable ["paradrop_zone_aerien",1,true];
		missionNamespace setVariable ["marker_drop_aerien", _markerZone, true];
		openMap false;
	};
};