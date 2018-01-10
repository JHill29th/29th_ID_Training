/*
Executed only on server when mission is started.
*/
diag_log text "";
diag_log text format["|=============================   %1   =============================|", missionName];
diag_log text "";

//execVM "scripts\time_check.sqf";

_autoSpectate = "autoSpectate" call BIS_fnc_getParamValue;
if (_autoSpectate == 1) then {
	autoSpectate = true;
	publicVariable "autoSpectate";
} else {
	autoSpectate = false;
	publicVariable "autoSpectate";
};

execVM "scripts\excludeObjFromZeus.sqf";

attendance_join = addMissionEventHandler ["PlayerConnected", {
	if (_this select 0 != 2) then {
		private ["_text"];
		_name = _this select 2;
		_uid = _this select 1;
		_infoArray = squadParams player;    
		_infoName = _infoArray select 1;
		_IM = _infoName select 4;
		if (_IM == "") then {
			_text = format ["Connected:  -  %1  -  %2" + "<br />", _name, _uid];
		} else {
			_text = format ["Connected:  -  %1  -  %2  -  %3" + "<br />", _name, _IM, _uid];
		};
		[player, "Attendance", _text] remoteExecCall ["BIS_fnc_createLogRecord",0,true];
	};
}];

attendance_leave = addMissionEventHandler ["PlayerDisconnected", {
	if (_this select 0 != 2) then {
		private ["_text"];
		_name = _this select 2;
		_uid = _this select 1;
		_infoArray = squadParams player;    
		_infoName = _infoArray select 1;
		_IM = _infoName select 4;
		if (_IM == "") then {
			_text = format ["Connected:  -  %1  -  %2" + "<br />", _name, _uid];
		} else {
			_text = format ["Connected:  -  %1  -  %2  -  %3" + "<br />", _name, _IM, _uid];
		};
		[player, "Attendance", _text] remoteExecCall ["BIS_fnc_createLogRecord",0,true];
	};
}];

/*["attendance_join", "onPlayerConnected", {
	private ["_text"];
	_infoArray = squadParams player;    
	_infoName = _infoArray select 1;
	_IM = _infoName select 4;
	if (_IM == "") then {
		_text = format ["Connected:  -  %1  -  %2" + "<br />", _name, _uid];
	} else {
		_text = format ["Connected:  -  %1  -  %2  -  %3" + "<br />", _name, _IM, _uid];
	};
	[player, "Attendance", _text] remoteExecCall ["BIS_fnc_createLogRecord",0,true];
}] call BIS_fnc_addStackedEventHandler;

["attendance_leave", "onPlayerDisconnected", {
	private ["_text"];
	_infoArray = squadParams player;    
	_infoName = _infoArray select 1;
	_IM = _infoName select 4;
	if (_IM == "") then {
		_text = format ["Disconnected: %1 - %2" + "<br />", _name, _uid];
	} else {
		_text = format ["Disconnected: %1 - %2 - %3" + "<br />", _name, _IM, _uid];
	};
	[player, "Attendance", _text] remoteExecCall ["BIS_fnc_createLogRecord",0,true];
}] call BIS_fnc_addStackedEventHandler;**/