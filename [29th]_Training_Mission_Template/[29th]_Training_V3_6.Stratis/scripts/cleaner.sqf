/*===============================================================================================
=		\/RP		by: Rellikplug		\/RP																									=
=	this addAction ["<t color='#FF0080'>Clean-Up</t>","scripts\cleaner.sqf","blu",1,false,true,"","((_target distance _this) < 2)"];	=
===============================================================================================*/

private ["_target","_caller","_id","_arg","_start","_end","_dead","_posBlu","_posRed","_posGreen","_nearObjA","_nearObjB","_nearObjC","_nearObjABC","_countObjects","_countDead","_countAllNear"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_arg = _this select 3;  // for multiple args use an array and <(_this select 3 select 0)>

_dead = allDeadMen;
	//  define positions of objects addAction is attached to
_posBlu = getPosATL blu_garbage;
_posRed = getPosATL red_garbage;
_posGreen = getPosATL green_garbage;
//_posTr = getPosATL tr_garbage;
//_allPos = [_posBlu,_posRed,_posGreen,_posTr];
	//  get nearest obj around each object
_nearObjA = nearestObjects [_posBlu,["WeaponHolder","GroundWeaponHolder"],250];
_nearObjB = nearestObjects [_posRed,["WeaponHolder","GroundWeaponHolder"],250];
_nearObjC = nearestObjects [_posGreen,["WeaponHolder","GroundWeaponHolder"],250];
//_nearObjD = nearestObjects [_posTr,["WeaponHolder","GroundWeaponHolder"],250]; 
//_nearObjABCD = { nearestObjects [_x,["WeaponHolder","GroundWeaponHolder"],250]; } forEach _allPos;
	//  group the near objects into one array
_nearObjABC/*D*/ = _nearObjA + _nearObjB + _nearObjC/* + _nearObjD*/;
	//  count the strings in each array
_countObjects = count _nearObjABC/*D*/;
_countDead = count _dead;
_countAllNear = _countObjects + _countDead;

if (_countAllNear < 1) exitWith {
	hintSilent "Nothing to delete.";
};
if (_arg == "blu") exitWith {
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjA;
	hintSilent format ["Cleaned:\n%1 Objects\n%2 Dead Bodies",_countObjects,_countDead];
};
if (_arg == "red") exitWith {
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjB;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2",_countObjects,_countDead];
};
if (_arg == "grn") exitWith {
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjC;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2",_countObjects,_countDead];
};
/*if (_arg == "tr") exitWith {
	{ deleteVehicle _x; } forEach _dead;
	{ deleteVehicle _x; } forEach _nearObjD;
	hintSilent format ["Objects:\n%1\nDead Bodies:\n%2",_countObjects,_countDead];
};*/