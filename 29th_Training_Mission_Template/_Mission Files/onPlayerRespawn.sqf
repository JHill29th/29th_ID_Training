/*
Executed locally (client only) when player respawns in a multiplayer mission.
		- [<newUnit>, <oldUnit>, <respawn>, <respawnDelay>]
		- This event script will also fire at the beginning of a mission if respawnOnStart is 0 or 1, oldUnit will be objNull in this instance.
		- This script will not fire at mission start if respawnOnStart equals -1 in description.ext
*/
params ["_newUnit", "_oldUnit"];

if (isNull _oldUnit) then {
  [_newUnit, ""] call BIS_fnc_setUnitInsignia;
  _newUnit spawn Hill_fnc_setInsignia;
};

if !(isNull _oldUnit) then {
  _posOldUnit = position _oldUnit;
  _oldUnit setPos [10,10,10];
  ["respawnUnitPosCheck", "onEachFrame", {
    diag_log text format ["|RESPAWN|  OLD UNIT POS:  %1, OLD UNIT IS HIDDEN?: %2, OLD UNIT SIMULATION?:  %3",position (_this select 0),isObjectHidden (_this select 0),simulationEnabled (_this select 0)];
    diag_log text format ["|RESPAWN 01|  NEW UNIT POS 01:  %1, NEW UNIT IS HIDDEN?: %2, NEW UNIT SIMULATION?:  %3",position (_this select 1),isObjectHidden (_this select 1),simulationEnabled (_this select 1)];
    if (alive (_this select 1) && (position _this select 1 ) then {
  }, [_oldUnit,_newUnit]] call BIS_fnc_addStackedEventHandler;
  
  ["respawnUnitPosCheck", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
  //diag_log text format ["|RESPAWN|  OLD UNIT POS:  %1, OLD UNIT IS HIDDEN?: %2, OLD UNIT SIMULATION?:  %3",position _oldUnit,isObjectHidden _oldUnit,simulationEnabled _oldUnit];
  //diag_log text format ["|RESPAWN 01|  NEW UNIT POS 01:  %1, NEW UNIT IS HIDDEN?: %2, NEW UNIT SIMULATION?:  %3",position _newUnit,isObjectHidden _newUnit,simulationEnabled _newUnit];

  [_newUnit] spawn {
    params ["_newUnit"];
    waitUntil {alive _newUnit};
    uiSleep 1;
    [_newUnit, ""] call BIS_fnc_setUnitInsignia;
    _newUnit spawn Hill_fnc_setInsignia;
  };

//  [ _newUnit, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory; // load player's inventory
	if ( missionNamespace getVariable [ "menuRespawn", true ] ) then {
		if (autoSpectate) then {
			systemChat "AutoSpectate is ON.";
			[_newUnit] spawn Hill_fnc_spectator;
		};
	};
};