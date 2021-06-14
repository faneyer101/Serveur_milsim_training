/*


*/
//hint format ["laliste avant registre %1", missionnamespace getvariable "list_player_drop"];
//sleep 3;
_list_player_register = [];
if (missionNameSpace getvariable "mission_paradrop" == 0 && missionNameSpace getvariable "paradrop_zone" == 1) then
{
	if (!isnil {missionnamespace getvariable "list_player_drop"}) then
	{
		_list_player_register = missionNamespace getVariable "list_player_drop";
		if (_list_player_register pushBackUnique player == -1) then 
		{
			hint "Tu es deja enregister. Merci de t'acheter un cerveau";
		}
		else
		{
			missionNamespace setVariable ["list_player_drop",_list_player_register,true];
			hint "Enregistrement validé";
		};
	}
	else 
	{
		_list_player_register pushBackUnique player;
		missionNamespace setVariable ["list_player_drop", _list_player_register,true];
		hint "Enregistrement validé";
	};
}
else
{
	if (missionNameSpace getvariable "mission_paradrop" != 0) then
	{
		hint "Une mission de parachutage est deja en cours veuillez attendre la prochaine";
	}
	else
	{
		if (missionNameSpace getvariable "paradrop_zone" != 1) then
		{
			hint "Veuillez creer une LZ";
		};
	};
};