/*
Written by Hill [29th ID] AKA Rellikplug
*/
if !(hasInterface) exitWith {};

params ["_unit"];

//Preparing variables
/*_shots = _unit setVariable ["ShotsTaken", 0];
_deaths = _unit setVariable ["Deaths", 0]; // -1 if respawnOnStart = 1
_hits = _unit setVariable ["Hits", 0];
_targetsHit = _unit setVariable ["TargetsHit", 0];*/

/*_shots = profileNamespace setVariable ["ShotsTaken", 0];
_deaths = profileNamespace setVariable ["Deaths", 0]; // -1 if respawnOnStart = 1
_hits = profileNamespace setVariable ["Hits", 0];
_targetsHit = profileNamespace setVariable ["TargetsHit", 0];*/

_shots = profileNamespace getVariable ["ShotsTaken", 0];
_deaths = profileNamespace getVariable ["Deaths", 0]; // -1 if respawnOnStart = 1
_hits = profileNamespace getVariable ["Hits", 0];
_targetsHit = profileNamespace getVariable ["TargetsHit", 0];

//Set EHs on player to adjust variables when tripped
  // Records each shot fired by player
shotsFired = _unit addEventHandler ["fired", {
	private ["_unit"];
	_unit = _this select 0;
	//_unit setVariable ["ShotsTaken", (_unit getVariable "ShotsTaken") + 1];
  profileNamespace setVariable ["ShotsTaken", (profileNamespace getVariable "ShotsTaken") + 1];
}];
  // Records each time player hits a target
targetHits = _unit addMPEventHandler ["MPHit", {
	private ["_unit","_shooter"];
	_unit = _this select 0;
	_shooter = _this select 1;
	if (_unit != _shooter) then {
		//_shooter setVariable ["TargetsHit", (_shooter getVariable "TargetsHit") + 1];
    profileNamespace setVariable ["TargetsHit", (profileNamespace getVariable "TargetsHit") + 1];
	};
}];
  // Records each time player is hit
numHits = _unit addeventHandler ["hit", {
	private ["_unit","_shooter"];
	_unit = _this select 0;
	_shooter = _this select 1;
	if (_unit != _shooter) then {
		//_unit setVariable ["Hits", (_unit getVariable "Hits") + 1];
    profileNamespace setVariable ["Hits", (profileNamespace getVariable "Hits") + 1];
	};
}];
  // Records each time player dies
numDeaths = _unit addeventHandler ["killed", {
	private ["_unit"];
   _unit = _this select 0;
   //_unit setVariable ["Deaths", (_unit getVariable "Deaths") + 1];
   profileNamespace setVariable ["Deaths", (profileNamespace getVariable "Deaths") + 1];
}];

_unit addAction [
  "  Check Your Statistics",
  {["check"] call Hill_fnc_checkStats},
  nil,
  0,
  false,
  true,
  "",
  "(_this == _target && (_this distance res_blu <= 30 || _this distance res_red <= 30 || _this distance res_grn <= 30))"
];
_unit addAction [
  "  Reset Your Statistics",
  {["reset"] call Hill_fnc_checkStats},
  nil,
  0,
  false,
  true,
  "",
  "(_this == _target && (_this distance res_blu <= 30 || _this distance res_red <= 30 || _this distance res_grn <= 30))"
];
// re add the addaction on respawn
_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
  _unit addAction [
    "  Check Your Statistics",
    {["check"] call Hill_fnc_checkStats},
    nil,
    0,
    false,
    true,
    "",
    "(_this == _target && (_this distance res_blu <= 30 || _this distance res_red <= 30 || _this distance res_grn <= 30))"
  ];
  _unit addAction [
    "  Reset Your Statistics",
    {["reset"] call Hill_fnc_checkStats},
    nil,
    0,
    false,
    true,
    "",
    "(_this == _target && (_this distance res_blu <= 30 || _this distance res_red <= 30 || _this distance res_grn <= 30))"
  ];
}];