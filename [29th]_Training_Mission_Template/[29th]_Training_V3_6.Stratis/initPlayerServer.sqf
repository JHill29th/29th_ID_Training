/*
Executed only on server when a player joins mission (includes both mission start and JIP). 
*/
private ["_theClient"];

_theClient = _this select 0;

{
	_x addCuratorEditableObjects [[_theClient],true];
} forEach allCurators;