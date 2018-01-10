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

[_theClient] spawn Hill_fnc_handleInitialInventory;
//[] spawn Hill_fnc_saveInventoryFromAA;

sleep 1;

[_theClient] call Hill_fnc_attendance;

// ==============================================================================

[_theClient] execVM "scripts\player_arsenal_handlers.sqf";

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
_disabledTI = "disabledTI" call BIS_fnc_getParamValue;
if (_disabledTI == 0) then {
	[_theClient] execVM "scripts\noThermals.sqf";
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