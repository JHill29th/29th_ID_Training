/*
attendance.sqf
Player's name is recorded in an array for retrieval by specific individuals using copyToClipboard
Written by Hill [29th ID] A.K.A Rellikplug
*/
private ["_caller","_target","_target","_ID","_args","_memberName"];
_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_args = _this select 3;

_memberName = name _caller;

if (_args == "set") then {
	if (_memberName in attending) exitWith {
		hintSilent "You have already recorded your attendance.";
		systemChat "You have already recorded your attendance.";
	};
	private ["_attending","_br"];
	_attending = [];
	_br = toString [13,10];
	_memberName = _memberName + _br;
	_attending = _attending + [_memberName];
	attending = attending + _attending;
	hintSilent "You have recorded your attendance.";
	systemChat"You have recorded your attendance.";
};

if (_args == "get") then {
	private ["_attendingOut"];
	if (count attending == 0) exitWith {
		hintSilent "The attendance sheet is empty.";
		systemChat "The attendance sheet is empty.";
	};
	{
		"Attendance" hintC [ format [ "%1", _x ] ];
	} forEach attending;
	_attendingOut = [];
	for "_i" from 0 to (count attending - 1) do {
    _attendingOut set [_i, str(attending select _i)];
  };
	copyToClipboard format ["%1",_attendingOut];
	systemChat "The attendance has been copied to your clipboard";
};

/*
_br = toString [13,10];//(carriage return & line feed)
_string = "Line 1" + _br + "Line 2";
copyToClipboard _string;
*/


/*
_myArray = ["One","Two","Three","Four"]; // 0 = "One", 1 = "Two", 2 = "Three", 3 = "Four"
_myCount = (count _myArray) -1; 

//If we count the array, it will say "4", but we don't have an element "4" in the array, but we have 0,1,2,3. So remove 1 and we have the correct amount. 
for "_x" from 0 to _myCount do
{
_currentElement = _myArray select _x; // Selects 0,1,2,3
diag_log(_currentElement);
};
*/