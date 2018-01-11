/*
	Author: Mossarelli

	Description:
	Function called by the sign with the action that registers the shooter with name and score variable.

	Parameter(s):
		0:	Sign or Object that should get the addActions
		1:	Name of Logic associated with Lane.

	Returns:
	N/A
*/

private ["_object","_Logic"];
_object = _this select 0;
_Logic = _this select 1;

_object allowDamage false;
_object enableSimulation false;

//Get the Range name string.
[_Logic] call Moss_fnc_GetRangeName;

//Error Message.
if (isNull _Logic) exitWith
{
	[
		"Error: fn_SignInit.sqf - There's no Logic referred in the script. Make sure there's one Logic per firing lane."
	] call BIS_fnc_errorMsg;
};

//Add Actions to sign.
//_object addAction [("<t color=""#FFFF66"">" + ("Register Rifleman") + "</t>"),Moss_fnc_RegisterShooter,_Logic];
[_object, [("<t color=""#FFFF66"">" + ("Register Rifleman") + "</t>"),Moss_fnc_RegisterShooter,_Logic]] remoteExec ["addAction",0];
//_object addAction [("<t color=""#FFFF66"">" + ("Show Score") + "</t>"),Moss_fnc_ShowScore,_Logic];
[_object, [("<t color=""#FFFF66"">" + ("Show Score") + "</t>"),Moss_fnc_ShowScore,_Logic]] remoteExec ["addAction",0];
//_object addAction [("<t color=""#FFFF66"">" + ("Reset my Score") + "</t>"),Moss_fnc_ResetScore,_Logic];
[_object, [("<t color=""#FFFF66"">" + ("Reset my Score") + "</t>"),Moss_fnc_ResetScore,_Logic]] remoteExec ["addAction",0];
//_object addAction [("<t color=""#FFFF66"">" + ("Unregister rifleman") + "</t>"),Moss_fnc_UnregisterShooter,_Logic];
[_object, [("<t color=""#FFFF66"">" + ("Unregister rifleman") + "</t>"),Moss_fnc_UnregisterShooter,_Logic]] remoteExec ["addAction",0];