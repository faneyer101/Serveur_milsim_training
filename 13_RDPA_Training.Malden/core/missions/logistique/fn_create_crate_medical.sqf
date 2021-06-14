_save_crate_medical = missionNamespace getVariable ["logistic_medical", []];

_medical_crate = "ACE_medicalSupplyCrate_advanced" createVehicle position player;
clearItemCargoGlobal _medical_crate;

_medical_crate addItemCargoGlobal ["ACE_salineIV", 40];					//saline 1000
_medical_crate addItemCargoGlobal ["ACE_salineIV_500", 40];				//saline 500
_medical_crate addItemCargoGlobal ["ACE_salineIV_250", 40];				//saline 250
_medical_crate addItemCargoGlobal ["ACE_epinephrine",50];					//epinephrine
_medical_crate addItemCargoGlobal ["ACE_morphine", 50];					//morphine
_medical_crate addItemCargoGlobal ["ACE_quikclot", 100];					//bandage hemo
_medical_crate addItemCargoGlobal ["ACE_elasticBandage", 100];			//bandage extensible
_medical_crate addItemCargoGlobal ["ACE_fieldDressing", 100];				//bandage individuel
_medical_crate addItemCargoGlobal ["ACE_packingBandage", 100];			//bandage compresif
_medical_crate addItemCargoGlobal ["ACE_splint", 50];						//attel
_medical_crate addItemCargoGlobal ["ACE_tourniquet", 40];					//garot
_medical_crate addItemCargoGlobal ["ACE_surgicalKit", 5];					//trousse chirurgie
_medical_crate addItemCargoGlobal ["ACE_personalAidKit", 5];				//trousse sanitaire
_medical_crate addItemCargoGlobal ["ACE_CableTie", 20];					//cerflex

_medical_crate setVariable ["ace_dragging_ignoreweightcarry", true, true];
_save_crate_medical pushBack _medical_crate;
missionNamespace setVariable ["logistic_medical", _save_crate_medical, true];