if (missionnamespace getvariable "paradrop_zone" == 0) then
{
	hint "Aucune LZ de definit";
}
else
{
	if (missionNameSpace getvariable "mission_paradrop" == 0) then
	{
		deleteMarker "zoneParaDrop_random";
		missionNamespace setvariable ["paradrop_zone", 0, true];
		missionNamespace setVariable ["marker_paraDrop", "", true];
		_helipad = missionNamespace getVariable "target_para";
		_lumiere = missionNamespace getVariable "lumiere_heli";
		deleteVehicle _helipad;
		deleteVehicle _lumiere;
	}
	else
	{
		hint "Une mission de parachutage est en cours veuillez attendre avant de supprimer la LZ";
	};
};