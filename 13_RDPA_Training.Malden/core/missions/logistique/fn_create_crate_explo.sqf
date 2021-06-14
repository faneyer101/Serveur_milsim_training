_save_crate_explo = missionNamespace getVariable ["logistic_explo", []];
_explo_crate = "Box_IED_Exp_F" createVehicle position player;

clearItemCargoGlobal _explo_crate;
clearMagazineCargoGlobal _explo_crate;
clearBackpackCargoGlobal _explo_crate;

_explo_crate addItemCargoGlobal ["rhs_weap_M136", 5];							//lanceur AT HEAT
_explo_crate addItemCargoGlobal ["rhs_weap_M136_hedp", 5];					//lanceur AT HEDP
_explo_crate addItemCargoGlobal ["rhs_weap_M136_hp", 5];						//lanceur AT HP
_explo_crate addItemCargoGlobal ["MineDetector", 5];							//detecteur de mine sac
_explo_crate addItemCargoGlobal ["ACE_VMH3", 5];								//detecteur à mains
_explo_crate addItemCargoGlobal ["ACE_FlareTripMine_Mag", 20];				//flare
_explo_crate addItemCargoGlobal ["DemoCharge_Remote_Mag", 20];				//charge explo m112
_explo_crate addItemCargoGlobal ["ACE_Clacker", 10];							//declecheur explo
_explo_crate addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 20];	//claymore
_explo_crate addItemCargoGlobal ["SatchelCharge_Remote_Mag", 5];				//sac demolition

_explo_crate setVariable ["ace_dragging_ignoreweightcarry", true, true];
_save_crate_explo pushBack _explo_crate;
missionNamespace setVariable ["logistic_explo", _save_crate_explo, true];