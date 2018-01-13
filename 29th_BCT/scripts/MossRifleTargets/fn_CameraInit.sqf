/*
	Author: Mossarelli

	Description:
	Function called by the object that renders the camera on the target.

	Parameter(s):
		0:	Target Object.
		1:	Name of Logic associated with Lane.
	
	Usage:
	0 = [this,Logic_Name] call Moss_fnc_TargetInit;
*/

private ["_object","_LogicName","_LogicTargetArray"];
_object = _this select 0;
_LogicName = _this select 1;

_object allowDamage false;

//Error Message.
if (isNull _LogicName) exitWith
{
	[
		localize "fn_CameraInit.sqf - No logic exists that was passed as a parameter to the function! Make sure the logic exists and is referenced in the function call!"
	] call BIS_fnc_errorMsg;
};

_LogicTargetArray = _LogicName getVariable "MossLogicTargetArray";

_whilevariable = true;

while { _whilevariable } do
{
	//Make sure target is an object.
	if ((typeName _LogicTargetArray) == "OBJECT") then
	{
		_whilevariable = false;
	};
};

//Return Logic's target array. Turn this on in MainInit.
if (MOSS_DEBUG) then
{
	systemChat format ["%1",_LogicTargetArray select 0];
};

//Get target object.
_target = _LogicTargetArray select 0;

//Use Target's lane number to make a unique variable for the camera.
_targetstring = str ([( str _target),2] call BIS_fnc_trimString);

//Get the number of the unique camera name variable.
//hint format ["%1",_targetstring];

//Make unique variable.
_rtt = format ["rendertarget%1",_targetstring];

//Create camera.
_cam = "camera" camCreate (_target modelToWorld [0,-1.5,0.8]);
_cam camPrepareFov 0.450;
_cam camPrepareTarget (_target modelToWorld [0,0,0.8]);
_cam camCommitPrepared 0;
_cam cameraEffect ["INTERNAL", "BACK", _rtt];

//Assign texture to sign.
_object setObjectTextureGlobal [0, (format ["#(argb,256,256,1)r2t(%1,1.0)",_rtt])];  

/*
_cam cameraEffect ["terminate","back"];
camDestroy _cam;
*/