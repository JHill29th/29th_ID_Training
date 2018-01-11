/*
	Author: Mossarelli

	Description:
	Function called by the logic to initialize the whole lane.

	Parameter(s):
		0:	Logic Object.

	Returns:
	N/A
*/

private ["_object"];
//_object = _this select 0;
_object = [_this,0,objnull,[objnull]] call bis_fnc_param; //Line added by Hill [29th ID] aka rellikplug

//Error Message.
if (isNull _object) exitWith
{
	[
		"Error: fn_LogicInit.sqf - There's no Logic referred in the script. Make sure there's one Logic per firing lane."
	] call BIS_fnc_errorMsg;
};

//Init the Array for the targets. For each target synced to the logic, they will be added to this variable.
_object setVariable ["MossLogicTargetArray",[],true];

//Get the objects that are synced to the logic.
//_synced_objects = synchronizedObjects _object;
//_synced_objects = [_object] call BIS_fnc_allSynchronizedObjects; 	//Line added by Hill [29th ID] aka rellikplug
//_synced_objects = [_object, ["Land_CampingTable_small_F","Land_InfoStand_V2_F","SignAd_Sponsor_ION_F","UserTexture1m_F","SignAd_Sponsor_ARMEX_F"],true] call BIS_fnc_synchronizedObjects; //Line added by Hill [29th ID] aka rellikplug

//Error Message.
if (count (_synced_objects) < 2) exitWith
{
	[
		"Error: fn_LogicInit.sqf - Make sure to sync all signs and targets to the logic in the editor."
	] call BIS_fnc_errorMsg;
};

//Use Target's lane number to make a unique variable for the texture.
_logicname = ([( str _object),11,12] call BIS_fnc_trimString);

//Make unique variable.
_texturename = format ["pics\Range\%1.jpg",_logicname];

//Init all the objects.
{
	if (_x isKindOf MOSS_TargetObject) then
	{
//		[_x,_object] call Moss_fnc_TargetInit;
		[_x,_object] remoteExec ["Moss_fnc_TargetInit",0];
	};
	if (_x isKindOf MOSS_SignObject) then
	{
		_x setObjectTextureGlobal [0,_texturename];
		[_x,_object] call Moss_fnc_SignInit;
	};
/*	if (_x isKindOf MOSS_MonitorObject) then
	{
//		[_x,_object] call Moss_fnc_CameraInit;
		[_x,_object] remoteExec ["Moss_fnc_CameraInit",0,true]
	};*/
/*	if (_x isKindOf MOSS_TableObject) then
	{
		[_x] call Moss_fnc_RifleOnTable;
	};*/
/*	if (_x isKindOf MOSS_Box) then
	{
	clearItemCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
		_x addMagazineCargoGlobal [MOSS_Magazine,30];
//		_x addAction ["<t color='#bf3eff'>Virtual Arsenal System</t>", {["Open",true] spawn BIS_fnc_arsenal;}];
	};*/
	if (_x isKindOf MOSS_NumberSignObject) then
	{
		_x setObjectTextureGlobal [0,_texturename];
	};
//} foreach _synced_objects;
	} forEach (synchronizedObjects _object);

