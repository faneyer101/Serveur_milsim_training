_save_crate_ammo = missionNamespace	getVariable ["logistic_ammo", []];
_ammo_crate = "rhs_3Ya40_1_single" createVehicle position player;

clearItemCargoGlobal _ammo_crate;
clearMagazineCargoGlobal _ammo_crate;
_ammo_crate addItemCargoGlobal ["ACE_30Rnd_556x45_Stanag_M995_AP_mag", 80];		//5.56 AP
_ammo_crate addItemCargoGlobal ["ACE_20Rnd_762x51_Mk316_Mod_0_Mag", 20];			//munition TP
_ammo_crate addItemCargoGlobal ["ACE_20Rnd_762x51_M993_AP_Mag", 20];				//munition TP AP		
_ammo_crate addItemCargoGlobal ["rhsusf_200Rnd_556x45_box", 10];					//gunner
_ammo_crate addItemCargoGlobal ["ACE_SpareBarrel", 2];							//mg cannon de rechange 
_ammo_crate addItemCargoGlobal ["rhs_mag_an_m8hc", 20];							//grenade fumigene blanche
_ammo_crate addItemCargoGlobal ["rhs_mag_m18_green", 20];							//grenade fumigene vert
_ammo_crate addItemCargoGlobal ["SmokeShellBlue", 20];							//grenade fumigene bleu
_ammo_crate addItemCargoGlobal ["rhs_mag_m18_purple", 20];						//grenade fumigene violet
_ammo_crate addItemCargoGlobal ["rhs_mag_m18_red", 20];							//grenade fumigene rouge
_ammo_crate addItemCargoGlobal ["ACE_HuntIR_M203", 10];							//grenade lanceur IR							
_ammo_crate addItemCargoGlobal ["3Rnd_HE_Grenade_shell", 10];						//grenade lanceur frag
_ammo_crate addItemCargoGlobal ["rhs_mag_M433_HEDP", 20];							//grenade lanceur frag HEDP
_ammo_crate addItemCargoGlobal ["3Rnd_Smoke_Grenade_shell", 10];					//grenade lanceur fumi blanc
_ammo_crate addItemCargoGlobal ["3Rnd_SmokeBlue_Grenade_shell", 10];				//grenade lanceur fumi bleu
_ammo_crate addItemCargoGlobal ["3Rnd_SmokePurple_Grenade_shell", 10];			//grenade lanceur fumi violet
_ammo_crate addItemCargoGlobal ["3Rnd_SmokeRed_Grenade_shell", 10];				//grenade lanceur fumi rouge
_ammo_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 5];							//ecran IR
_ammo_crate addItemCargoGlobal ["rhs_mag_m67", 20];								//grenade frag
_ammo_crate addItemCargoGlobal ["rhs_mag_mk84", 20];								//grenade stun	

_ammo_crate setVariable ["ace_dragging_ignoreweightcarry", true, true];

_save_crate_ammo pushBack _ammo_crate;
missionNamespace setVariable ["logistic_ammo", _save_crate_ammo, true];