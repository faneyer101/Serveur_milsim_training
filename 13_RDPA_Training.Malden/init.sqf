/*		Cible reste baisser			TargetP_Inf_Acc1_F (sur a 100%)*/
nopop = true;

/*		Action Unflip Ajouté a ACE		*/
_action = ["Unflip", "Retourner le véhicule", "", {[this] spawn RDPA_fnc_unFlip;}, {_t = typeof this; gettext (configfile >> 'CfgVehicles' >> _t >> 'vehicleClass') in ['Support','Car', 'rhs_vehclass_car']}] call ace_interact_menu_fnc_createAction;
["LandVehicle", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/*		Desactive les annimaux			*/
enableEnvironment [false, true];