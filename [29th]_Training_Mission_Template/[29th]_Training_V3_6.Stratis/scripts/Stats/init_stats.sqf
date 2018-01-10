/*
Written by Hill [29th ID] AKA Rellikplug
*/

private ["_unit"];
_unit = _this select 0;

//Preparing variables
_shots = _unit setVariable ["ShotsTaken", 0];
_deaths = _unit setVariable ["Deaths", -1]; // -1 if respawnOnStart = 1
_hits = _unit setVariable ["Hits", 0];
_targetsHit = _unit setVariable ["TargetsHit", 0];

//Set EHs on player to adjust variables when tripped
  // Records each shot fired by player
shotsFired = _unit addEventHandler ["fired", {
	private ["_unit"];
	_unit = _this select 0;
	_unit setVariable ["ShotsTaken", (_unit getVariable "ShotsTaken") + 1];
}];
  // Records each time player hits a target
targetHits = _unit addMPEventHandler ["MPHit", {
	private ["_unit","_shooter"];
	_unit = _this select 0;
	_shooter = _this select 1;
	if (_unit != _shooter) then {
		_shooter setVariable ["TargetsHit", (_shooter getVariable "TargetsHit") + 1];
	};
}];
  // Records each time player is hit
numHits = _unit addeventHandler ["hit", {
	private ["_unit","_shooter"];
	_unit = _this select 0;
	_shooter = _this select 1;
	if (_unit != _shooter) then {
		_unit setVariable ["Hits", (_unit getVariable "Hits") + 1];
	};
}];
  // Records each time player dies
numDeaths = _unit addeventHandler ["killed", {
	private ["_unit"];
	_unit = _this select 0;
		_unit setVariable ["Deaths", (_unit getVariable "Deaths") + 1];
}];