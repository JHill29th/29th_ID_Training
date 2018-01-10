/*===============================================================================================
=		\/RP		by: Rellikplug		\/RP																									=
=	this addAction ["<t color='#FF0080'>Clean-Up</t>","scripts\cleaner.sqf","blu",1,false,true,"","((_target distance _this) < 2)"];	=
===============================================================================================*/
private ["_target","_caller","_id","_arg","_objToClean","_dead","_posBlu","_posRed","_posGreen","_nearObjA","_nearObjB","_nearObjC","_nearObjABC","_countObjects","_countDead","_countAllNear"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_arg = _this select 3;  // for multiple args use an array and <(_this select 3 select 0)>

_objToClean = ["WeaponHolder","GroundWeaponHolder"];
_dead = allDeadMen;
	//  define positions of objects addAction is attached to
_posBlu = getPosATL blu_garbage;
_posRed = getPosATL red_garbage;
_posGreen = getPosATL green_garbage;

	//  get nearest obj around each object
//_nearObjA = nearestObjects [_posBlu,["WeaponHolder","GroundWeaponHolder"],250];
_nearObjA = {_posBlu nearObjects [_x,250];} forEach _objToClean;
//_nearObjB = nearestObjects [_posRed,["WeaponHolder","GroundWeaponHolder"],250];
_nearObjB = {_posRed nearObjects [_x,250];} forEach _objToClean;
//_nearObjC = nearestObjects [_posGreen,["WeaponHolder","GroundWeaponHolder"],250];
_nearObjC = {_posGreen nearObjects [_x,250];} forEach _objToClean;

	//  group the near objects into one array
_nearObjABC = _nearObjA + _nearObjB + _nearObjC;
	//  count the strings in each array
_countObjects = count _nearObjABC;
_countDead = count _dead;
_countAllNear = _countObjects + _countDead;

if (_countAllNear < 1) exitWith {
	hintSilent "Nothing to delete.";
};
if (_arg == "blu") exitWith {
	_count_nearObjA = count _nearObjA;
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjA;
	hintSilent format ["Cleaned:\n%1 Objects\n%2 Dead Bodies",_count_nearObjA,_countDead];
};
if (_arg == "red") exitWith {
	_count_nearObjB = count _nearObjB;
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjB;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2",_count_nearObjB,_countDead];
};
if (_arg == "grn") exitWith {
	_count_nearObjC = count _nearObjC;
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjC;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2",_count_nearObjC,_countDead];
};