private ["_arg"];

_arg = _this select 3;

if (_arg == "start" && !(patrol_start)) then {
	patrol_start = true;
	publicVariable "patrol_start";
	startArrow = "Sign_Arrow_Direction_Green_F" createVehicle getMarkerPos "start_patrol_arrow";
	startArrow setDir markerDir "start_patrol_arrow";
	startArrow setPos [getPos startArrow select 0,getPos startArrow select 1,(getPos startArrow select 2) + 1];
	[startArrow, 0, 90] call BIS_fnc_setPitchBank;
} else {
	hintC "A patrol is already in progress.\nPlease wait for the current patrol to finish";
};