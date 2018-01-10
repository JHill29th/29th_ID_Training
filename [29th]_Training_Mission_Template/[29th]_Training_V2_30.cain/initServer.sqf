/*
Executed only on server when mission is started.
*/
diag_log text "";
diag_log text format["|=============================   %1   =============================|", missionName];
diag_log text "";

/*if (paramsArray select 0 == 1) then {
	autoSpectate = true;
} else {
	autoSpectate = false;
};
publicVariable "autoSpectate";*/

execVM "scripts\excludeObjFromZeus.sqf";

//{ _x addCuratorEditableObjects [[tgt],false]; } forEach AllCurators;