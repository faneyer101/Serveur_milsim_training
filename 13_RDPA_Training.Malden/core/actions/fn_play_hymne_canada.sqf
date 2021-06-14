if (missionNamespace getVariable ["alarme", 0] == 0) then
{
	missionNamespace setVariable ["alarme", 1, true];
	_string = format ["%1 ecoute l'hymne nationnal du Canada", name player];
	[player, _string] remoteexec ["sidechat", 0];
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "sound\hymne_canada.ogg";
	{
		playSound3D [_soundToPlay, _x, false, getPos _x, 5, 1, 250];
	} forEach _this;
	sleep 66;
	missionNamespace setVariable ["alarme", 0, true];
}
else
{
	hint "Les HP sont deja utilisé";
};