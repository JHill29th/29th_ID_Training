//Function to determine if player is logged in as admin
if (!hasInterface) exitWith {};
private ["_unit"];

_unit = _this select 0;

if (serverCommandAvailable "#kick") then {
	theMan = _unit;
	publicVariable "theMan";
};