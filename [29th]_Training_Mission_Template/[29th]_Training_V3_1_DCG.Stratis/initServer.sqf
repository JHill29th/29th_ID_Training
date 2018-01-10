/*
Executed only on server when mission is started.
*/
diag_log text "";
diag_log text format["|=============================   %1   =============================|", missionName];
diag_log text "";

//execVM "scripts\time_check.sqf";

_autoSpectate = "autoSpectate" call BIS_fnc_getParamValue;
if (_autoSpectate == 1) then {
	autoSpectate = true;
	publicVariable "autoSpectate";
} else {
	autoSpectate = false;
	publicVariable "autoSpectate";
};

execVM "scripts\excludeObjFromZeus.sqf";