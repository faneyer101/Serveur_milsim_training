/*
**																		onPlayerRespawn.sqf
**			this addaction ["<t color='#00A515'>Sauvegarder l'équipement</t>", { _gear = getUnitLoadout player; profilenamespace setvariable ["RDPA_Loadout", _gear];}, [], 1.5, true, true, "", "true", 5, false, "", ""];
**			this addaction ["<t color='#FF0008'>Réinitialiser l'equipement</t>", { profilenamespace setvariable ["RDPA_Loadout", []];}, [], 1.5, true, true, "", "true", 5, false, "", ""];
**			this addaction ["<t color='#000000'>Charger l'équipement</t>", {_gear = profilenamespace getVariable ["RDPA_Loadout", false]; player setUnitLoadout _gear}, [], 1.5, true, true, "", "true", 5, false, "", ""];
**			this addaction ["<t color='#FF0000'>Supprimer l'Inventaire de la Caisse</t>", {clearItemCargoGlobal (_this select 0); clearMagazineCargoGlobal (_this select 0); clearWeaponCargoGlobal (_this select 0); clearBackpackCargoGlobal (_this select 0);}, [], 1.5, true, true, "", "true", 5, false, "", ""];													Commande pour save IG son stuff sur son profils. Si Jamais Save alors juste Uniform / Vest / Berret
*/

_gear = getUnitLoadout player;
_savedGear = profilenamespace getvariable ["RDPA_Loadout", []];

if (!(_gear isEqualTo _savedGear) && (count _savedGear) != 0) then
{
	removeAllItems player;
	removeAllWeapons player;
	removeBackpack player;
	removeGoggles player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeHeadgear player;
	player setUnitLoadout _savedGear;
};

if (!isnil {missionNamespace getVariable "player_addaction_aero"} && missionNamespace getVariable "player_addaction_aero" == player) then
{

	_inProgress = missionNamespace getVariable ["aero_started", false];
	_inProgress_static = missionNamespace getVariable ["aero_started_static", false];
	if (_inProgress) then
	{
		[1] spawn RDPA_fnc_clean_aero;
		[2] spawn RDPA_fnc_init_training_ciblage;
	}
	else
	{
		if  (_inProgress_static) then
		{
			[2] spawn RDPA_fnc_clean_aero;
			[2] spawn RDPA_fnc_init_training_ciblage;
		};
	};
};