/*
Written by Hill [29th ID] AKA Rellikplug
*/

private ["_name","_shots","_targetsHit","_hits","_accuracy","_deaths"];
//  Get the player's name
_name = name player;
//Retrieve the variables set in init_stats.sqf at current values
_shots = player getVariable "ShotsTaken";
_targetsHit = player getVariable "TargetsHit";
_hits = player getVariable "Hits";
  //Calculate accuracy
if (_shots > 0) then {
	_accuracy = round ((_targetsHit / _shots) * 100);
} else {
	_accuracy = 0;
};
_deaths = player getVariable "Deaths";
// Give the percent symbol a variable name to be used in the displayed hint
_percent = "%";
// Display a hint showing players current stats
"Statistics" hintC [
	format [
		"%1\nShots Fired:  %2\nTargets Hit:  %3\n  - Accuracy = %4%7\nTimes Hit:    %5\nDeaths:       %6",
		_name, _shots, _targetsHit, _accuracy, _hits, _deaths, _percent
	]
];