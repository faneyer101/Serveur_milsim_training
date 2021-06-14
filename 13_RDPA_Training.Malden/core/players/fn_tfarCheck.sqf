[] spawn {
_uid = ["76561198067457325", "76561198041233208", "76561198287233431", "76561198042306327", "76561198023564030"];
if ((getPlayerUID player) in _uid) exitWith {};
    while {true} do {
        if (([] call TFAR_fnc_isTeamSpeakPluginEnabled) && ([] call TFAR_fnc_getTeamSpeakChannelName == tf_radio_channel_name) && ([] call TFAR_fnc_getTeamSpeakServerName == tf_radio_Teamspeak_name)) then {cutText ["","PLAIN"];} else {

            if !([] call TFAR_fnc_isTeamSpeakPluginEnabled) then {cutText ["Lances Teamspeak et le plugin TaskForceRadio","BLACK FADED",9999];}else {

                if !([] call TFAR_fnc_getTeamSpeakServerName == tf_radio_Teamspeak_name) then {cutText ["Connectes toi au Teamspeak et recharges ton plugin","BLACK FADED",9999];}else {

                    if !([] call TFAR_fnc_getTeamSpeakChannelName == tf_radio_channel_name) then {cutText ["Recharges ton plugin","BLACK FADED",9999];};
                };
            };
        };
        sleep 15;
    };
};