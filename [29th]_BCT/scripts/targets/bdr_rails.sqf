//https://www.reddit.com/r/armadev/comments/1yldyg/moving_targets/
//make a marker called "x" and in init.sqf add
//["x", 0, 5, "Target_PopUp_Moving_F", 0.02] execVM "scripts\targets\bdr_rails.sqf";
//  ["x", 0, 5, "Target_PopUp_Moving_F", 0.02] remoteExec ["RP_fnc_bdr_rails",allPlayers];

//bdr_rails.sqf:

_posMarker = _this select 0;
_ang        = _this select 1;
_railCount  = _this select 2;
_targetType = _this select 3;
_speed      = _this select 4;

if (!isServer) exitWith {};

_railPos = (getMarkerPos _posMarker);
_railPos set [2, getTerrainHeightASL _railPos];
_railArray = [];

for "_i" from 0 to _railCount do {
	_rail = "Target_Rail_F" createVehicle _railPos;
	_rail setPosASL _railPos;
	_rail setDir (_ang+90);

	_railArray set [(count _railArray), _rail];

	_railPos set [0, ((_railPos select 0) + 1 * sin _ang)];
	_railPos set [1, ((_railPos select 1) + 1 * cos _ang)];
};
//Target66
//_target = _targetType createVehicle _railPos;
_target = _targetType;
_railPos = (getMarkerPos _posMarker);
_railPos set [2, getTerrainHeightASL _railPos];

sleep 0.5;

waitUntil {
	_railPos set [0, ((_railPos select 0) + _speed * sin _ang)];
	_railPos set [1, ((_railPos select 1) + _speed * cos _ang)];
	_target setPosASL _railPos;
	_target setdir (getDir (_railArray select 0));
	if (_speed > 0) then {
		if ((_target distance (getMarkerPos _posMarker)) > _railCount) then {
			_speed = -1 * _speed;
		};
	} else {
		if ((_target distance (getMarkerPos _posMarker)) < 1.1) then {
			_speed = -1 * _speed;
		};
	};
	false;
};