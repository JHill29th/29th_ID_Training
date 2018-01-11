/*
	Author: Mossarelli

	Description:
	This is function is not used because the targets are not pop up targets.

	Parameter(s):
		0:	Sign or Object that should get the addActions
		1:	Array with Names of Logics associated with the Lanes.

	Returns:
	N/A
*/

private ["_object","_Logic","_errorbool"];
_object = _this select 0;
_LogicArray = _this select 1;
_errorbool = false;

_object allowDamage false;

{
	_name = _x getVariable "MossRangeNumber";
	_object addAction [("<t color=""#FFFF66"">" + _name + (" ") + ("Up") + "</t>"),Moss_fnc_TargetsUpOrDown,[_x,0]];
	_object addAction [("<t color=""#FFFF66"">" + _name + (" ") + ("Down") + "</t>"),Moss_fnc_TargetsUpOrDown,[_x,1]];
} foreach _LogicArray;