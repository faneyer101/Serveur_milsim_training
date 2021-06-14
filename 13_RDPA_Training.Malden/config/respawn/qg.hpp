 class QG//Class of the respawn inventory, used by BIS_fnc_addRespawnInventory
{
    displayName = "Responsable Mission";//Name of the respawn inventory
    role = "Event"; //Role the respawn inventory is assigned to
    icon = "\A3\ui_f\data\map\VehicleIcons\iconManLeader_ca.paa";//Icon shown next to the role
    show = "side group _this == west";//Condition used to make specific respawn inventories only avaiable for specfic sides, must return [[Boolean]]
    weapons[] =
    {           //Weapons
            "Binocular",
            "BT01_F"
    };
    magazines[] =
    {           //Magazines
            "Taser_Caseless",
            "Taser_Caseless",
            "Taser_Caseless",
            "Taser_Caseless",
            "Taser_Caseless",
            "Taser_Caseless"
    };
    items[] =
    {           //Useable items
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_quikclot",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_elasticBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_packingBandage",
            "ACE_tourniquet",
            "ACE_tourniquet",
            "ACE_MapTools",
            "ACE_EarPlugs",
            "ACE_IR_Strobe_Item",
            "ACE_altimeter",
            "ACE_microDAGR",
            "ACE_Flashlight_MX991"
    };
    linkedItems[] =
    {           //Linked items, also weapon items, helmet etc.
            "V_PlateCarrier2_blk",
            "ItemMap",
            "ItemCompass",
            "ACE_altimeter",
            "TFAR_anprc152"
    };
    uniformClass = "BWB_uniforme04";//uniform*/
    backpack = "TFAR_rt1523g_black";
};