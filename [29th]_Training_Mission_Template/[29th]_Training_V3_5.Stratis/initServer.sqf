/*
Executed only on server when mission is started.
*/
diag_log text format ["|=============================   %1: initServer.sqf Running   =============================|", missionName];

//execVM "scripts\time_check.sqf";

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

execVM "scripts\excludeObjFromZeus.sqf";

attendance = [];
publicVariable "attendance";

_tpwFurniture = "tpwFurniture" call BIS_fnc_getParamValue;
if (_tpwFurniture == 1) then {
	0 = [50,5] execvm "scripts\tpw_furniture.sqf";
};