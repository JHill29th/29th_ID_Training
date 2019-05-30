/*===============================================================================================
		\/RP		by: Rellikplug		AKA: Hill [29th ID]\/RP																									=
	this addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa'/><t color='#FF0080'>Clean-Up</t>","call Hill_fnc_cleaner","blu",1,false,true,"","((_target distance _this) < 2)"];	=
===============================================================================================*/

private ["_target","_caller","_id","_dead","_posBlu","_posRed","_posGreen","_all_garbages","_near_objects","_countObjects","_countDead","_countAllNear"];

_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_dead = allDeadMen;

	//  define positions of objects addAction is attached to
_posBlu = getPosATL blu_garbage;
_posRed = getPosATL red_garbage;
_posGreen = getPosATL green_garbage;
_all_garbages = [_posBlu,_posRed,_posGreen];

	//  get nearest objs around each object
_near_objects =  { nearestObjects [_x,["WeaponHolder","GroundWeaponHolder"],250]; } forEach _all_garbages;
	//  count the strings in each array
_countObjects = count _near_objects;
_countDead = count _dead;
_countAllNear = _countObjects + _countDead;

if (_countAllNear < 1) exitWith {
	hintSilent "Nothing to delete.";
	false
};

{ deleteVehicle _x; } forEach _dead;
{ deleteVehicle _x; } forEach _near_objects;
_text = format ["Cleaned:\n%1 Objects\n%2 Dead Bodies",_countObjects,_countDead];
hintSilent _text;
_text