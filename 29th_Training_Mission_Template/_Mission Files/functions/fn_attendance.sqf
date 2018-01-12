private ["_uid", "_name", "_state","_text"];
_theClient = _this select 0;
_state = _this select 1;
_uid = getPlayerUID _theClient;
_name = name _theClient;

waitUntil {!isNil "attendance"};

switch (_state) do {
  case (true): {
    _text = format ["Disconnected:  -  %1  -  %2", _name, _uid];
    if !(_text in attendance) then {
      attendance = attendance + [_text];
      publicVariable "attendance";
    };
  };
  case (false): {
    _text = format ["Connected:  -  %1  -  %2", _name, _uid];
      attendance = attendance + [_text];
      publicVariable "attendance";
  };
  default {};
};



//{[_theClient, "Attendance", _x] call BIS_fnc_createLogRecord;} forEach attendance;
//[_theClient, "Attendance", _text] remoteExecCall ["BIS_fnc_createLogRecord", 0, true];
_text