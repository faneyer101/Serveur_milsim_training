class RegDragonParaArma3
{
    tag = "RDPA";
    class core
    {
        file = "core";
    };
    class actions
    {
        file = "core\actions\playsound";
        class play_sirene {};
        class play_hymne_france {};
        class play_hymne_canada {};
        class play_hymne_belge {};
    };
    class vehicules
    {
        file = "core\vehicules";
        class unFlip {};
        class emptyFuel {};
    };
    class players
    {
        file = "core\players";
    };
    class stands 
    {
        file = "core\stands";
        class standEnd {};
        class standStart {};
        class standReset {};
        class close_door {};
    };
    class targets
    {
        file = "core\targets";
        class targetPlace {};
        class targetsField {};
    };
    class aero
    {
        file = "core\missions\aero";
    };
    class avarie
    {
        file = "core\missions\aero\avaries";
        class init_aero_avarie {};
    };
    class at
    {
        file = "core\missions\AT";
        class initAT {};
        class clean_AT {};
    };
    class tp_te
    {
        file = "core\missions\TP_TE";
        class create_target {};
    };
    class stuff
    {
        file = "core\actions\stuff";
        class demo {};
        class tp {};
        class medic {};
        class guner {};
        class grenadier {};
        class fusiller {};
    };
    class logistique
    {
        file = "core\missions\logistique";
        class create_crate_ammo {};
        class create_crate_explo {};
        class create_crate_medical {};
        class create_crate_empty {};
        class remove_all_crate_log {};
    };
    class dropaerien
    {
        file = "core\missions\aero\dropaerien";
        class start_drop {};
        class create_zoneDropCrate {};
        class start_aircraft_drop {};
        class remove_zone {};
    };
    class aerociblage
    {
        file = "core\missions\aero\ciblage";
        class aero_cible_moove {};
        class aero_cible_static {};
        class init_training_ciblage {};
        class clean_aero {};
    };
    class grenadiermain
    {
        file = "core\missions\grenadier";
        class create_zone_grenade_main {};
        class remove_zone_grenade_main {};
        class equip_grenade {};        
        class track_grenade {};
    };
    class grenadierfusil
    {
        file = "core\missions\grenadier\fusil";
        class equip_grenade_fusil {};
        class create_zone_grenade_fusil {};
        class remove_zone_grenade_fusil {};
        class track_grenade_fusil {};
    };
    class para
    {
        file = "core\missions\paradrop";
        class airborne {};
        class list_register {};
        class create_zoneParaDrop {};
        class remove_zoneParaDrop {};
        class remove_list {};
        class track_player {};
        class aircraft_path_choice {};
    };
};