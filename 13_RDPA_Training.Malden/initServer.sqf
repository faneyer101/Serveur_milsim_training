							/*Cibles du champs de tirs*/
ciblesChampsTirs1 = [CT_1_1, CT_1_2, CT_1_3, CT_1_4, CT_1_5, CT_1_6, CT_1_7, CT_1_8, CT_1_9, CT_1_10];
publicvariable "ciblesChampsTirs1";
ciblesChampsTirs2 = [CT_2_1, CT_2_2, CT_2_3, CT_2_4, CT_2_5, CT_2_6, CT_2_7, CT_2_8, CT_2_9, CT_2_10];
publicvariable "ciblesChampsTirs2";
ciblesChampsTirs3 = [CT_3_1, CT_3_2, CT_3_3, CT_3_4, CT_3_5, CT_3_6, CT_3_7, CT_3_8, CT_3_9, CT_3_10];
publicvariable "ciblesChampsTirs3";
ciblesChampsTirs4 = [CT_4_1, CT_4_2, CT_4_3, CT_4_4, CT_4_5, CT_4_6, CT_4_7, CT_4_8, CT_4_9, CT_4_10];
publicvariable "ciblesChampsTirs4";

							/*Cibles du CQB*/
missionNamespace setvariable ["Stand_1_start",0,true];
missionNamespace setvariable ["Stand_1_end",0,true];
missionNamespace setvariable ["Stand_2_start",0,true];
missionNamespace setvariable ["Stand_2_end",0,true];
missionNamespace setvariable ["Stand_3_start",0,true];
missionNamespace setvariable ["Stand_3_end",0,true];

/*		protection entrainement medical		*/
missionNamespace setvariable ["countvictim", 0, true];

/*		entrainement parachutage			*/
missionNamespace setvariable ["mission_paradrop",0,true];
missionNamespace setvariable ["paradrop_zone",0,true];
missionNamespace setvariable ["list_player_drop",[],true];
missionNamespace setVariable ["marker_paraDrop", "", true];
missionNamespace setvariable ["start_aircraft_paradrop",0,true];
missionNamespace setvariable ["end_aircraft_paradrop",0,true];

/*		entrainement grenade main			*/
missionNamespace setvariable ["Stand_1_grenade_main",0,true];
missionNamespace setvariable ["Stand_2_grenade_main",0,true];

/*		entrainement grenade fusil			*/
missionNamespace setvariable ["Stand_1_grenade_fusil",0,true];

/*		Cibles de TP						*/
ciblesTP1 = [TP_1, TP_2, TP_3, TP_4, TP_5, TP_6, TP_7, TP_8, TP_9, TP_10, TP_11, TP_12, TP_13, TP_14, TP_15, TP_16, TP_17, TP_18, TP_19, TP_20];
publicvariable "ciblesTP1";

/*		Cibles de TE						*/
ciblesTE1 = [TE_1, TE_2, TE_3, TE_4, TE_5, TE_6, TE_7, TE_8, TE_9, TE_10, TE_11, TE_12, TE_13, TE_14, TE_15];
publicvariable "ciblesTE1";

/*		Sirene								*/
missionNamespace setVariable ["alarme", 0, true];

/*		creation de caisse logistique		*/
missionNamespace setVariable ["logistic_explo", [], true];
missionNamespace setVariable ["logistic_ammo", [], true];
missionNamespace setVariable ["logistic_medical", [], true];
missionNamespace setVariable ["logistic_empty_crate", [], true];

/*		drop aerien materiel				*/
missionNamespace setvariable ["mission_drop_aerien", 0, true];
missionNamespace setvariable ["paradrop_zone_aerien", 0, true];
missionNamespace setvariable ["start_drop_aerien", 0, true];
missionNamespace setVariable ["marker_drop_aerien", "", true];

/*		aero ciblage						*/
missionNamespace setVariable ["player_addaction_aero", objNull, true];
missionNamespace setVariable ["aero_started_static", false, true];
missionNamespace setVariable ["aero_started", false, true];

//[] execVM "modsSettings.sqf";