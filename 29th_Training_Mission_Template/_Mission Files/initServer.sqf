/*
Executed only on server when mission is started.
*/
diag_log text format ["|=============================   %1: initServer.sqf Running   =============================|", missionName];

INDEPENDENT setFriend [WEST, 0];

if (count (entities "HeadlessClient_F") > 0) then {
	systemChat "Headless Client is online. Spawned units will be transferred to the HC.";
	hc_online = true;
	publicVariable "hc_online";
	execVM "scripts\init_hc.sqf";
} else {
	systemChat "Headless Client is offline. Spawned units will be transferred to the server.";
	hc_online = false;
	publicVariable "hc_online";
};

_autoSpectate = "autoSpectate" call BIS_fnc_getParamValue;
if (_autoSpectate == 1) then {
	autoSpectate = true;
	publicVariable "autoSpectate";
} else {
	autoSpectate = false;
	publicVariable "autoSpectate";
};

disabledTI = "disabledTI" call BIS_fnc_getParamValue;
publicVariable "disabledTI";

artilleryComputer = "artilleryComputer" call BIS_fnc_getParamValue;
publicVariable "artilleryComputer";

//removeRadiosFromDead = "removeRadiosFromDead" call BIS_fnc_getParamValue;
//publicVariable "removeRadiosFromDead";

execVM "scripts\excludeObjFromZeus.sqf";
execVM "scripts\checkCuratorAssignment.sqf";