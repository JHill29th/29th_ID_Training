/*
Written by Hill [29th ID] AKA Rellikplug
*/

if !(hasInterface) exitWith {};

params ["_args"];

switch (_args) do {
  case ("reset"): {
    private ["_name","_shots","_targetsHit","_hits","_accuracy","_deaths"];
    _name = name player;
    _shots = profileNamespace setVariable ["ShotsTaken", 0];
    _deaths = profileNamespace setVariable ["Deaths", 0]; // -1 if respawnOnStart = 1
    _hits = profileNamespace setVariable ["Hits", 0];
    _targetsHit = profileNamespace setVariable ["TargetsHit", 0];
    // Display a hint showing players current stats
    "Statistics" hintC ["YOUR STATSTISTICS HAVE BEEN RESET!"];
  };
  case ("check"): {
    private ["_name","_shots","_targetsHit","_hits","_accuracy","_deaths"];
    //Get the player's name
    _name = name player;
    //Retrieve the variables set in init_stats.sqf at current values
    /*_shots = player getVariable "ShotsTaken";
    _targetsHit = player getVariable "TargetsHit";
    _hits = player getVariable "Hits";*/
    _shots = profileNamespace getVariable "ShotsTaken";
    _targetsHit = profileNamespace getVariable "TargetsHit";
    _hits = profileNamespace getVariable "Hits";
    //Calculate accuracy
    if (_shots > 0) then {
      _accuracy = round ((_targetsHit / _shots) * 100);
    } else {
      _accuracy = 0;
    };
    //_deaths = player getVariable "Deaths";
    _deaths = profileNamespace getVariable "Deaths";
    // Give the percent symbol a variable name to be used in the displayed hint
    _percent = "%";
    //Display a hint showing players current stats
    "Statistics" hintC [
      format [
        "%1\nShots Fired:  %2\nTargets Hit:  %3\n  - Accuracy = %4%7\nTimes Hit:    %5\nDeaths:       %6",
        _name, _shots, _targetsHit, _accuracy, _hits, _deaths, _percent
      ]
    ];
  };
};
saveProfileNamespace;
true