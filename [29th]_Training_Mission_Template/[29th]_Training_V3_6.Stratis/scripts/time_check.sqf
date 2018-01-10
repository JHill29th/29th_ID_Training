waitUntil {time > 1;};

private ["_start_time","_current_time"];
_start_time = diag_tickTime;
_current_time = 0;

while {_current_time < 3600} do {
	_current_time = diag_tickTime - _start_time;
	
	if (_current_time >= 3600) then {
		["TimeWarning",[_msgHalf,""]] remoteExec ["BIS_fnc_showNotification"];
	};
	
	sleep 1;
};