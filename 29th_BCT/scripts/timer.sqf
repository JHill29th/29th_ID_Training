private ["_target","_caller","_ID","_arg"];
_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_arg = _this select 3;

_caller removeAction _ID;

if (_arg == "start") then {

	hintSilent "";

	END_TIMER = false;
	stopTimer = _caller addAction ["<t color='#FF0080'>Stop Timer</t>", "scripts\timer.sqf", "stop", 1, false, false, "", "((_target distance _this) <= 1)"];

	[] spawn {
		ELAPSED_TIME  = 0;
		START_TIME = diag_tickTime;
		while {!END_TIMER} do {
			ELAPSED_TIME = diag_tickTime - START_TIME;
//			publicVariable "ELAPSED_TIME";
		 sleep 0.1;
		};
	};

	[] spawn {
		while{!END_TIMER} do {
			_time = ELAPSED_TIME;
			_finish_time_minutes = floor(_time / 60);
			_finish_time_seconds = floor(_time) - (60 * _finish_time_minutes);
/*			_finish_time_m_seconds = _time - (floor (_time)) ;
			if(_finish_time_m_seconds < 100) then {
				_finish_time_m_seconds = format ["%1", _finish_time_m_seconds];
			};*/
			if(_finish_time_seconds < 10) then {
				_finish_time_seconds = format ["0%1", _finish_time_seconds];
			};
			if(_finish_time_minutes < 10) then {
				_finish_time_minutes = format ["0%1", _finish_time_minutes];
			};
			_formatted_time = format ["%1 : %2", _finish_time_minutes, _finish_time_seconds/*,_finish_time_m_seconds*/];
			hintSilent format ["Timer:\n%1", _formatted_time];
			sleep 0.1;
		};
	};
		
};

if (_arg == "stop") then {
 END_TIMER = true;
	stopTimer = _caller addAction ["<t color='#FF0080'>Start Timer</t>", "scripts\timer.sqf", "start", 1, false, false, "", "((_target distance _this) <= 1)"];
};