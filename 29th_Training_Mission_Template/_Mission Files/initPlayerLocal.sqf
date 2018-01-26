/*
Executed locally (only on client) when player joins mission (includes both mission start and JIP)
*/
_theClient = _this select 0;
_didJIP = _this select 1;

//0 enableChannel [true,false]; //global
//1 enableChannel [true,false]; //side
//2 enableChannel [true,false]; //command
//3 enableChannel [true,false]; //group
//4 enableChannel [true,false]; //vehicle
//5 enableChannel [true,false]; //direct

enableSentences false;
enableEnvironment false;

if (artilleryComputer == 0) then {
  enableEngineArtillery false; 
};

[_theClient] spawn Hill_fnc_handleInitialInventory;

//sleep 1;

// ==============================================================================

[_theClient] execVM "scripts\player_arsenal_handlers.sqf";
_theClient addEventHandler ["Respawn", {_this select 0 spawn Hill_fnc_setInsignia;}];

[_theClient] spawn {
 private _theClient = _this select 0;
  while {true} do {
    if (rating _theClient <= -1000) then {
     _theClient call Hill_fnc_adjustRating;
    };
  sleep 0.3;
  };
};

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

//Call the admin check function on the player
//[_theClient] call Hill_fnc_playerAdmin;

//restrict thermals
if (disabledTI == 0) then {
  ["visionMode", {
    [_this] spawn Hill_fnc_noThermals;
  }] call CBA_fnc_addPlayerEventHandler;
};

[_theClient] spawn {
  private ["_theMan"];
  _theMan = _this select 0;
  waitUntil {currentWeapon _theMan != ""};
  sleep 3;
  if (!(weaponLowered _theMan)) then {
    _theMan action ["WeaponOnBack", _theMan];
   };
 };