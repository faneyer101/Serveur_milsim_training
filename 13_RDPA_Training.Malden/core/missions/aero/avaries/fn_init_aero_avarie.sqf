/*
hull carrosserie				==> HitHull
eng moteur						==> HitEngine
inst  instrument				==> HitAvionics
atrq rotor arrière				==> HitVRotor
mrot rotor principal			==> HitHRotor
slg train d’atterrissage

RHS_MELB_MH6M
RHS_AH64D
RHS_UH60M_MEV2_d
RHS_UH60M_d
rksla3_puma_hc1_troop
RHS_CH_47F

simu_avarie_aero_1
this addAction["Entrainement simulation avarie sur MH-6M Little Bird", {[RHS_MELB_MH6M, 0] spawn RDPA_fnc_init_aero_avarie}, [], 1.5, true, true, "", "true", 5, false, "", ""];
*/

_modele = param [0, objNULL, [""]];
_type_damage = param [1, "HitHull", [""]];
_helico = createVehicle [_modele, [953.583,12281.9], [], 0, "FLY"];
_helico setPosATL[953.583, 12281.9, 500];

player allowDamage false;
player moveInDriver _helico;
hint "Reduisez l'altitude a 300 mètre pour commencer";
waitUntil {(!alive _helico) || ((getPosATL _helico) select 2) < 300};
hint "La simulation d'avarie commence. Essaye de faire atterir l'hélico. Bonne chance Pilote !";
_helico setHitPointDamage [_type_damage, 1]; // peu etre faire plusieurs palier??
waitUntil {(!alive _helico) || ((getPosATL _helico) select 2) < 0.1};
_string = "";
sleep 5;
if (alive _helico) then
{
	_string = format ["%1 à reussi à poser %2 avec de déga situé %3. Bravo à lui", name player, _modele, _type_damage];
}
else
{
	_string = format ["%1 c'est crasher avec %2 en essayant de se poser avec des dégas situés %3. Ne te decourage pas", name player, _modele, _type_damage];
};
moveOut player;
deleteVehicle _helico;
player setPosATL [8104,10583.5,0];
[player, _string] remoteexec ["sidechat", 0];
player allowDamage true;
[player, player] call ace_medical_treatment_fnc_fullHeal;