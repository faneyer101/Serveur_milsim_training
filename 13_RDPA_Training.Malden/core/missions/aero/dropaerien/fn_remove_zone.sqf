_mod = _this select 0;
if (missionNamespace getVariable "mission_drop_aerien" == 1) then
{
	hint "Entrainement parachutage matériel en cours. Veuillez attendre la fin de celui ci";
}
else
{
	switch (_mod) do 
	{
		case 1:	//remove LZ
		{
			if (missionNamespace getVariable ["paradrop_zone_aerien", 0] == 0) then
			{
				hint "Veuillez choisir une LZ avant de vouloir la supprimer";
			}
			else
			{
				deleteMarker "zoneDropMateriel";
				missionNamespace setVariable ["paradrop_zone_aerien", 0, true];
			};
		};
		case 2:	//remove start avion
		{
			if (missionNamespace getVariable "start_drop_aerien" == 0) then
			{
				hint "Veuillez choisir un point de départ pour l'avion avant de vouloir le supprimer";
			}
			else
			{
				deleteMarker "start_aircraft_paradrop";
				missionNamespace setVariable ["start_drop_aerien", 0, true];
			};
		};
		default
		{
			hint "usage: [_mod]";
		};
	};
};