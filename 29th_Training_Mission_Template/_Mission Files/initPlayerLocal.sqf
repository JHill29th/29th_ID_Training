/*
Executed locally (only on client) when player joins mission (includes both mission start and JIP)
*/
diag_log text format ["|=============================   %1: initPlayerLocal.sqf Running   =============================|", missionName];
params ["_theClient","_didJIP"];

//0 enableChannel [true,false]; //global
//1 enableChannel [true,false]; //side
//2 enableChannel [true,false]; //command
//3 enableChannel [true,false]; //group
//4 enableChannel [true,false]; //vehicle
//5 enableChannel [true,false]; //direct

enableSentences false;
enableEnvironment [false, true];

[] spawn {
  if (isNil "artilleryComputer") then {
    waitUntil {!isNil "artilleryComputer"};
    if (artilleryComputer == 0) then {
      enableEngineArtillery false;
    };
  };
//restrict thermals
  if (isNil "disabledTI") then {
    waitUntil {!isNil "disabledTI"};
    if (disabledTI == 0) then {
      ["visionMode", {
        [_this] spawn Hill_fnc_noThermals;
      }] call CBA_fnc_addPlayerEventHandler;
    };
  };
};

[_theClient] spawn Hill_fnc_handleInitialInventory;

//sleep 1;

// ==============================================================================

[_theClient] execVM "scripts\player_arsenal_handlers.sqf";

_theClient addEventHandler ["HandleRating", {
	params ["_unit"];
    if (rating _unit < 0) then {
     [0,_unit] call Hill_fnc_adjustRating;
    };
}];

/*
[_theClient] spawn {
 private _theClient = _this select 0;
  while {true} do {
    if (rating _theClient <= -1000) then {
     _theClient call Hill_fnc_adjustRating;
    };
  sleep 0.3;
  };
};
*/
//If the respawn menu button is active
if (!isNumber (missionConfigFile >> "respawnButton") || {getNumber (missionConfigFile >> "respawnButton") > 0}) then {
  _respawnMenu = [] spawn {
    waitUntil {!isNull (uiNamespace getVariable ["RscDisplayMPInterrupt", displayNull])};
    uiNamespace getVariable "RscDisplayMPInterrupt" displayCtrl 1010 ctrlAddEventHandler ["ButtonClick", {
      missionNamespace setVariable ["menuRespawn", true];
		}];
	};
};

// ==============================================================================

//Draw little skulls each time a player dies.  Seen only by Zeus.
_theClient call BIS_fnc_drawCuratorDeaths;

// Runs the in-game VOIP restriction script
_null = [] execVM "scripts\voice_control\voiceControl.sqf";

//Initializes the player stats
//[_theClient] execVM "scripts\Stats\init_stats.sqf";

[_theClient] spawn {
  private ["_theMan"];
  _theMan = _this select 0;
  waitUntil {currentWeapon _theMan != ""};
  sleep 3;
  if (!(weaponLowered _theMan)) then {
    _theMan action ["WeaponOnBack", _theMan];
   };
 };
 
[_theClient] execVM "scripts\checkCuratorAssignment.sqf";