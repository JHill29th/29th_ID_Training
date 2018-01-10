/*
this addAction ["<t color='#FF0080'>Clean-Up</t>", "scripts\cleaner.sqf", "gr_range", 1, false, true, "", "((_target distance _this) < 2)"];
*/

private ["_target","_caller","_ID","_arg","_start","_dead"];

_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_arg = _this select 3;

_start = diag_tickTime;
_dead = allDeadMen;

if (_arg == "veh_spawn") exitWith {
	[private "_nearObj","_count"];
	_nearObj = nearestObjects [getMarkerPos "vehSpawn",["Air","Car","Tank","Truck","Ship"],15];
	_count = count _nearObj + count _dead;
	if ( _count < 1) exitWith { hintSilent "Nothing to delete."; };
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObj;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2\nObject clean-up took:\n%3 seconds",count _nearObj,count _dead,round (diag_tickTime - _start)];
};

/*
switch _target do {
	case "sr_clean": {_locationSelect = getPosATL (_location select 0);};
	case "barracks_clean": {getPosATL (_location select 1);};
	case "cqb_clean": {getPosATL (_location select 2);};
	case "gr_clean": {getPosATL (_location select 3);};
	case "mr_clean": {getPosATL (_location select 4);};
};
*/

if (_arg == "sr_range") exitWith {
	[private "_nearObj","_count"];
	_nearObj = nearestObjects [getPosATL sr_clean,["WeaponHolder","GroundWeaponHolder"],15];
	_count = count _nearObj + count _dead;
	if (_count <  1) exitWith { hintSilent "Nothing to delete"; };
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObj;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2\nObject clean-up took:\n%3 seconds",count _nearObj,count _dead,round (diag_tickTime - _start)];
};
if (_arg == "barracks") exitWith {
	[private "_nearObj","_count"];
	_nearObj = nearestObjects [getPosATL barracks_clean,["WeaponHolder","GroundWeaponHolder"],15];
	_count = count _nearObj + count _dead;
	if (_count <  1) exitWith { hintSilent "Nothing to delete"; };
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObj;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2\nObject clean-up took:\n%3 seconds",count _nearObj,count _dead,round (diag_tickTime - _start)];
};
if (_arg == "cqb") exitWith {
	[private "_nearObj","_count"];
	_nearObj = nearestObjects [getPosATL cqb_clean,["WeaponHolder","GroundWeaponHolder"],15];
	_count = count _nearObj + count _dead;
	if (_count <  1) exitWith { hintSilent "Nothing to delete"; };
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObj;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2\nObject clean-up took:\n%3 seconds",count _nearObj,count _dead,round (diag_tickTime - _start)];
};
if (_arg == "gr_range") exitWith {
	[private "_nearObj","_count"];
	_nearObj = nearestObjects [getPosATL gr_clean,["WeaponHolder","GroundWeaponHolder"],15];
	_count = count _nearObj + count _dead;
	if (_count <  1) exitWith { hintSilent "Nothing to delete"; };
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObj;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2\nObject clean-up took:\n%3 seconds",count _nearObj,count _dead,round (diag_tickTime - _start)];
};

if (_arg == "mr_range") exitWith {
	[private "_nearObj","_count"];
	_nearObj = nearestObjects [getPosATL mr_clean,["WeaponHolder","GroundWeaponHolder"],15];
	_count = count _nearObj + count _dead;
	if (_count <  1) exitWith { hintSilent "Nothing to delete"; };
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObj;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2\nObject clean-up took:\n%3 seconds",count _nearObj,count _dead,round (diag_tickTime - _start)];
};