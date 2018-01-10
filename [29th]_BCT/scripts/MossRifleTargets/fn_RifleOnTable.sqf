/*
	Author: Mossarelli

	Description:
	Function that puts a rifle on a table.

	Parameter(s):
		0: The name of the object the Action is on.
*/

private ["_object"];
_object = _this select 0;

_groundobject = "groundweaponholder" createVehicleLocal getpos _object;
_groundobject addWeaponCargo [MOSS_RifleOnTable,1];

_groundobject setPos (_object modelToWorld [0,0,0.4]);
_groundobject setVectorUp (vectorUp _object);
_groundobject setDir ((getDir _object) + 180);
