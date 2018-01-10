/*
Executed locally (only on client) when player joins mission (includes both mission start and JIP)
*/
_theClient = _this select 0;
_didJIP = _this select 1;
//Disable the save button
enableSaving [false,false];
//Disable AI voice reporting
enableSentences false;

// ==============================================================================
// Handle inventory for respawn
// https://github.com/MaDmaX1337/GamersCentral.de-AW-Invade-Annex/blob/master/initPlayerLocal.sqf

/*
//small sleep to make sure any init loadouts have been applied
//OR apply any default loadouts before this point
sleep 1;

//Save initial loadout 
[ player, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;
*/
//Save loadout when ever we exit an arsenal
[ missionNamespace, "arsenalClosed", {
	[ _theClient, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;
	_Insignia = [player] call BIS_fnc_getUnitInsignia; 
//	missionNamespace setVariable ["Insignia", _Insignia];
	player setVariable ["Insignia", _Insignia, true];
	systemChat "Your gear has been saved.";
	hintSilent "Your gear has been saved.";
}] call BIS_fnc_addScriptedEventHandler;
/*
//When we revive 
[ missionNamespace, "reviveRevived", {
	_nul = _this spawn {
		_unit = _this select 0;
		_revivor = _this select 1;

		//if forced respawn or we bleed out
		if ( isNull _revivor ) then {
			//wait until player is actually respawned into alive state
			sleep playerRespawnTime;
			//Load last saved inventory
			[ player, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory;
			[ player, missionNamespace getVariable "Insignia" ] remoteExecCall [ "BIS_fnc_setUnitInsignia", player ];
		};
	};
} ] call BIS_fnc_addScriptedEventHandler; 

player addEventHandler [ "Killed", {
	private ["_Insignia"];
	//Save players loadout for if he is revived
	[ player, [ missionNamespace, "reviveInventory" ] ] call BIS_fnc_saveInventory;
	_Insignia = [player] call BIS_fnc_getUnitInsignia; 
	[ player, missionNamespace, "reviveInsignia" ] call BIS_fnc_getUnitInsignia;
}];

player addEventHandler [ "Respawn", {
	if ( player getVariable [ "BIS_revive_incapacitated", false ] ) then {
		//Set correct loadout on incapacitated unit laying on floor in injured state
		//This is also the new unit if he is revived
		[ player, [ missionNamespace, "reviveInventory" ] ] call BIS_fnc_loadInventory;
		[ player, [ missionNamespace, "reviveInsignia" ] ] remoteExecCall [ "BIS_fnc_setUnitInsignia", player];
	};
	//Did we respawn from the menu
	if ( missionNamespace getVariable [ "menuRespawn", true ] ) then {
		[ player, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory;
		[ player, missionNamespace getVariable "Insignia" ] remoteExecCall [ "BIS_fnc_setUnitInsignia", player ];
		missionNamespace setVariable [ "menuRespawn", true ];
	};
}];
*/

//If the respawn menu button is active
if ( !isNumber( missionConfigFile >> "respawnButton" ) || { getNumber( missionConfigFile >> "respawnButton" ) > 0 } ) then {
	_respawnMenu = [] spawn {
		waitUntil { !isNull ( uiNamespace getVariable [ "RscDisplayMPInterrupt", displayNull ] ) };
		uiNamespace getVariable "RscDisplayMPInterrupt" displayCtrl 1010 ctrlAddEventHandler [ "ButtonClick", {
		missionNamespace setVariable [ "menuRespawn", true ];
		}];
	};
};

// ==============================================================================

//Draw little skulls each time a player dies.  Seen only by Zeus.
_theClient call BIS_fnc_drawCuratorDeaths;
// Runs the in-game voip restriction script
_null = [] execVM "scripts\voice_control\voiceControl.sqf";	// Voice Chat Control
//Initializes the player stats
playerStatsEHs = [_theClient] execVM "scripts\Stats\init_stats.sqf";
//Function to determine if player is logged in as admin
JJH_playerAdmin = {
	private ["_unit"];
	_unit = _this select 0;
	if (serverCommandAvailable "#kick") then {
		theMan = _unit;
		publicVariable "theMan";
	};
};
//Call the admin check function on the player
[_theClient] call JJH_playerAdmin;

//restrict thermals
if (paramsArray select 0 == 0) then {
	[_theClient] execVM "scripts\noThermals.sqf";
};