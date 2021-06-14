/*
	Author: Sean Crowe
	Inspired By: Bryan "Tonic" Boardwine

	Description:
	Receives information sent for a transfer request and prompts the user.
*/
private["_sender, _selectNum"];
_sender = _this select 0;
_loadoutName = _this select 1;

if (name _sender == "") exitWith {};

if(!createDialog "LT_prompt") exitWith {hint format["%1 à essayé de vous envoyer un chargement enregistré, mais nous n'avons pas pu ouvrir le menu.",_sender];};
disableSerialization;
waitUntil {!isNull (findDisplay 2550)};

((findDisplay 2550) displayCtrl 2551) ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>%1 %2</t></t><br/><t align='center'><t size='0.6px'>%3</t></t>", (name _sender) ,"souhaitez-vous transférer son équipement.", "Souhaitez-vous recevoir cette équipement?"];

((findDisplay 2550) displayCtrl 2552) ctrlSetText "Yes";

((findDisplay 2550) displayCtrl 2553) ctrlSetText "No";

waitUntil {!isNil "lt_prompt_choice"};
if(lt_prompt_choice) then
{
	[player, [missionNamespace, _loadoutName]] call bis_fnc_loadInventory;
	hint "Equipement transferé";
};

lt_prompt_choice = nil;
