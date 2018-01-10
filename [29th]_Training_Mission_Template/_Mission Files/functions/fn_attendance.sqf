private ["_uid", "_name", "_state"];
_theClient = _this select 0;
_uid = getPlayerUID _theClient;
_name = name _theClient;

_text = format ["Connected:  -  %1  -  %2", _name, _uid];
if !(_text in attendance) then {
	attendance = attendance + [_text];
	publicVariable "attendance";
};
{[_theClient, "Attendance", _x] call BIS_fnc_createLogRecord;} forEach attendance;
//[_theClient, "Attendance", _text] remoteExecCall ["BIS_fnc_createLogRecord", 0, true];
_text