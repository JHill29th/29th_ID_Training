/*===============================================================================================
=		\/RP		written by: Rellikplug		AKA FSgt. Hill [29th ID]  \/RP																				                             					=
===============================================================================================*/
private ["_nearVehicles"];

_nearVehicles = (getMarkerPos "fob") nearEntities [["Air", "Car", "Motorcycle", "Tank"], 100];
_distance = {_x distance "fob"} forEach _nearVehicles;

while {_distance <= 100} do {
	{_x allowDamage false;} forEach _nearVehicles;
	sleep 1;
};