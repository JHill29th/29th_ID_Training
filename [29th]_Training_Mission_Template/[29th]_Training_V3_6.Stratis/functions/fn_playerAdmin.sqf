//Function to determine if player is logged in as admin
if (!hasInterface) exitWith {};
private ["_unit", "_isAdmin"];

_unit = _this select 0;

_isAdmin = _unit call BIS_fnc_admin;

if (_isAdmin == 2) then {
	theMan = _unit;
	publicVariable "theMan";
};
theMan