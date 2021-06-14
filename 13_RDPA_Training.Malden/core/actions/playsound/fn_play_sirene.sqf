if (missionNamespace getVariable ["alarme", 0] == 0) then
{
	missionNamespace setVariable ["alarme", 1, true];
	_string = format ["%1 lance l'alerte", name player];
	[player, _string] remoteexec ["sidechat", 0];
	_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
	_soundToPlay = _soundPath + "sound\sirene.wav";
	for [{_i = 0}, {_i < 5}, {_i = _i + 1}] do 
	{
		{
			playSound3D [_soundToPlay, _x, false, getPos _x, 5, 0.5, 250];
		} forEach _this;
		sleep 30;
	};
	missionNamespace setVariable ["alarme", 0, true];
}
else
{
	hint "L'alerte est déja donné";
};