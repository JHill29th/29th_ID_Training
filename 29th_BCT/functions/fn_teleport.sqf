/*==========================
Written by Rellikplug  AKA FSgt. Hill [29th ID]
==========================*/

if (!hasInterface) exitWith {};

private ["_dest","_caller","_pos","_dir"];

// Get the destination.
_dest = (_this select 3) select 0;
//systemChat format ["Destination is: %1",_dest];

// Get a random direction
_dir = random 359;

// Move the person 15 meters away from the destination (in the direction of _dir)
//player SetPos [(getMarkerPos _dest select 0)-20*sin(_dir),(getMarkerPos _dest select 1)-20*cos(_dir)];

_caller = _this select 1;

_pos = getMarkerPos _dest;

_camx = _pos select 0;
_camy = _pos select 1;
_camz = _pos  select 2;
	
_cam = "camera" CamCreate [_camx - 250 ,_camy + 150,_camz + 75];
	
_cam CamSetTarget _pos;
_cam CameraEffect ["Internal","Back"];
_cam CamCommit 0;
	
_cam camsetpos [_camx - 100 ,_camy + 50,_camz + 20];
_cam CamCommit 4;
	
_cam camsetpos [_camx + 25 ,_camy - 15,_camz + 10];
_cam CamCommit 7;
["Moving to", markerText _dest] call BIS_fnc_infoText;

waitUntil {camCommitted _cam;};
titleText ["","BLACK FADED"];

_caller setpos [(_pos select 0) + ((random 5) - (random 5)), (_pos select 1) + ((random 5) - (random 5)), 0];

sleep 0.5;
_cam CameraEffect ["Terminate","Back"];
CamDestroy _cam;
titleText ["","BLACK IN"];