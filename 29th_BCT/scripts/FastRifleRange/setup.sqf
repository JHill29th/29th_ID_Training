private ["_maxtarg", "_numtargs", "_skill", "_targets", "_registered", "_nameRegistered", "_many", "_inc", /*"_frrScore",*/ "_rnumber1", "_rnumber2", "_rnumber3", "_flag1", "_flag2", "_percentageScore", "_accuracyCalc", "_title", "_text"];
  
_maxtarg  = _this select 0;
_numtargs = _this select 1;
_skill = _this select 2;
_registered = _this select 3; // current shooter
_nameRegistered = _this select 4;

_targets = [frt, frt_1, frt_2, frt_3, frt_4, frt_5, frt_6, frt_7];
_many =  count _targets; // count the number of possible targets

_inc = 0; // keeps track of the number of popup targets triggered 
frrScore = 0; // keep count of the targets hit

// Create variable to house number of shots only on the shooter
_registered setVariable ["shots", 0];

// Add fired event handler to shooter to record number of shots and weapon type (classname)
_registered addEventHandler ["Fired", {
	_shooter = _this select 0;
	_shooter setVariable ["shots", (_shooter getVariable "shots") + 1];
	_shooter setVariable ["wep", _this select 1];
}];

_rnumber1 = 0; 
_rnumber2 = 0;
_rnumber3 = 0;

_flag1 = 0;
_flag2 = 0;

//{ _x setVariable ["nopop", true, true] } forEach _targets;

//hintSilent "Setting up the FRRR";
"Setting up the FRRR" remoteExecCall ["hintSilent",0,false];

sleep 1;

// puts the targets down before the start
{ _x  animate ["terc", 1]; } forEach _targets;

sleep 2;
//hintSilent "FRR Ready";
"FRR Ready" remoteExecCall ["hintSilent",0,false];
sleep 2;
"BEGIN" remoteExecCall ["hintSilent",0,false];

// Start target loop
while { _inc < _maxtarg } do {
	private ["_int", "_rtarget1", "_rtarget2", "_rtarget3"];
	_rnumber1 = random _many;
	_int = _rnumber1 % 1;
	_rnumber1 = _rnumber1 - _int;

	// Check for duplicate targets 
	while { (_rnumber1 == _rnumber2) or (_rnumber1 == _rnumber3) or (_rnumber2 == _rnumber3) } do {
		_rnumber2 = random _many;
		_int = _rnumber2 % 1;
		_rnumber2 = _rnumber2 - _int;

		_rnumber3 = random _many;
		_int = _rnumber3 % 1;
		_rnumber3 = _rnumber3 - _int;
	};

	// Set the targets that will popup
	_rtarget1 = _targets select _rnumber1;
	_rtarget2 = _targets select _rnumber2;
	_rtarget3 = _targets select _rnumber3;

	// Popup target one always active
	_rtarget1 animate ["terc", 0];
	_inc = _inc + 1;
	// 3. END

	// Check to see if more than one target is required and opopup at random
	// second target
	if (_numtargs > 1 ) then {
		if ((random 2 > 1) and (_inc < _maxtarg)) then {
			_rtarget2 animate ["terc", 0];
			_inc = _inc + 1;
			_flag1 = 1;
		};
	};

	// Third target
	if (_numtargs > 2 ) then {
		if ((random 2 < 1) and (_inc < _maxtarg)) then {
			_rtarget3 animate ["terc", 0];
			_inc = _inc + 1;
			_flag2 = 1;
		};
	};

	// Time allowed to shoot targets before they go down
	sleep _skill; 

	// Display Score hint
//	hintSilent format ["Targets:  %1 Hit:  %2",_inc,frrScore];
//	format ["Targets:  %1\nHit:  %2",_inc,frrScore] remoteExecCall ["hintSilent",0,false];

	// Reset targets down and restet flags
	_rtarget1 animate ["terc", 1];
	_rtarget2 animate ["terc", 1];
	_rtarget3 animate ["terc", 1];
	_flag1 = 0;
	_flag2 = 0;

	sleep 2;
}; // End target loop

// Remove fired event handler from shooter
_registered removeAllEventHandlers "Fired";

sleep 2;
//hintSilent "FRR Session Complete";
"FRR Session Complete" remoteExecCall ["hintSilent",0,false];
sleep 2;

// Reset targets to up position
{ _x  animate ["terc", 0] } forEach _targets;

// Variables for scoring and accuracy log
_shots = _registered getVariable "shots";
_weapon = _registered getVariable "wep";
_weaponName = getText (configFile >> "CfgWeapons" >> _weapon >> "displayname"); // get display name of shooter's weapon

// Calculate score and shot accuracy
if (frrScore == 0) then {
	_percentageScore = 0;
	_accuracyCalc = 0;
} else {
	_percentageScore = round ((frrScore / _maxtarg) * 100);
	_accuracyCalc = round ((frrScore / _shots) * 100);
};

// Construct the Log
_title = "Fast Rifle Range";
_percent = "%";
_text = format ["<br />" + "%1's score is:  <font size='16'>%2%7</font>" + "<br />" + "%3  /  %4" + "<br />" + "Shots:  %5" + "<br />" + "Accuracy:  %6%7" + "<br />" + "Weapon:  %8", _nameRegistered, _percentageScore, frrScore, _maxtarg, _shots, _accuracyCalc, _percent, _weaponName];
// Display the log for all players
{ [_x, _title, _text] call BIS_fnc_createLogRecord; } forEach allPLayers;

// Remove the variables from the shooter
_registered setVariable ["shots", nil];
_registered setVariable ["wep", nil];