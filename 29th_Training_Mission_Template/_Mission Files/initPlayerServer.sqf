/*
Executed only on server when a player joins mission (includes both mission start and JIP). 
*/
diag_log text format ["|=============================   %1: initPlayerServer.sqf Running   =============================|", missionName];

private ["_theClient"];

_theClient = _this select 0;

{
	_x addCuratorEditableObjects [[_theClient],true];
} forEach allCurators;