/*
	Author: Mossarelli

	Description:
	Function called by the sign with the action that unregister the shooter with name and score variable.

	Parameter(s):
		0: The name of the object the Action is on.
		1: Object using the action
		2: ID of the Action being Used
		3: Additional Parameters
*/

private ["_name","_caller","_id","_params"];
_name = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_params = _this select 3;

_logicName = player GetVariable ["MossPlayerLogicName",""];

//Make sure player can't unregister without being registered.
if ( ( str (_logicName) == str (""))) exitWith
{
	systemChat "You're not registered to any lane! Register first!";
};

//Make sure player can't unregister from a lane he's not registered to.
if ( !( str (_logicName) == str (_params))) exitWith
{
	systemChat "Unregister from the lane you used last!";
};

//Unregister.
player setVariable ["MossShooterScoreInfo",[player],false];

player setVariable ["MossPlayerLogicName","",false];

//Broadcast that lane is free.
call compile format ['
[{ systemChat "%1: %2 Unregistered. Lane is free."; }, "BIS_fnc_Spawn", true, false, false] call BIS_fnc_MP;
',(_params getVariable "MossRangeNumber"),(name _caller)
];

//Lines below added by Hill [29th ID] aka rellikplug
//Show player unregistered to lane info in mission log accessed via map screen
//[<object>,<title>,<text>] call BIS_fnc_createLogRecord;
_title = format ["%1",(_params getVariable "MossRangeNumber")];
_text = format ["%1 Unregistered.",(name _caller)];
{[_x,_title,_text] call BIS_fnc_createLogRecord;} forEach allPLayers;