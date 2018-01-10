/*===============================================================================================
=		\/RP		by: Rellikplug		\/RP																									=
===============================================================================================*/
if (!isServer) exitWith {};

params ["_allowed_dead","_cycle_time","_debug"];

_allowed_dead = _this select 0;
_cycle_time = _this select 1;
_debug = _this select 2;

while {true} do {
	private ["_baseObj","_count_baseObj","_dead","_count_dead"];
	_baseObj = nearestObjects [getMarkerPos "fob",["WeaponHolder","GroundWeaponHolder"],150];
	_dead= allDead;
	_count_dead = count _dead;
	_count_baseObj = count _baseObj;

	if (_count_dead > _allowed_dead) then {
		{ deleteVehicle _x; } forEach _dead;
		if (_debug) then {
			systemChat format ["%1 dead deleted",_count_dead];
		};
	} else {
		if (_debug) then {
			systemChat format ["%1 dead is less than %2; no dead deleted",_count_dead,_allowed_dead];
		};
	};
	
	if (_count_baseObj > 0) then {
		{ deleteVehicle _x; } forEach _baseObj;
		if (_debug) then {
			systemChat format ["%2 discarded objects deleted",_count_baseObj];
		};
	} else {
		if (_debug) then {
			systemChat "No discarded objects to delete";
		};
	};
	
	if (_debug) then {
		systemChat format ["Next cleaning in %1",_cycle_time];
	};
sleep _cycle_time;
};