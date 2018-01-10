/*
Executed locally (only on client) when player joins mission (includes both mission start and JIP)
*/
_theClient = _this select 0;
_didJIP = _this select 1;

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;

enableSentences false;
enableEnvironment false;

null=[] execVM "Scripts\brief.sqf";  //briefing notes
//null = [] execVM "Scripts\protection.sqf";

_noThermals = "noThermals" call BIS_fnc_getParamValue;
if (_noThermals == 0) then {
	thermals = [_theClient] execVM "Scripts\noThermals.sqf";
};

player call RP_fnc_baseProtection; //[<marker name (string)>,<distance (number)>]

[_theClient] call RP_fnc_playerAdmin;

_theClient addAction ["<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Follow.paa'/><t color='#00ff00'>  Spectator</t>", "[] spawn RP_fnc_spectator","",1,false,true,"","(_target == _this && _target == theMan)"];

//vehicle restrictions
[["B_T_VTOL_01_vehicle_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_01_F","B_Plane_CAS_01_F"],["B_Helipilot_F","B_Pilot_F"], "Only Pilots can operate the aircraft.",true,true,true,true] //Blackfoot
execVM "Scripts\restrictVehicles.sqf";

// ==============================================================================
// Handle inventory for respawn
// https://github.com/MaDmaX1337/GamersCentral.de-AW-Invade-Annex/blob/master/initPlayerLocal.sqf

//small sleep to make sure any init loadouts have been applied
//OR apply any default loadouts before this point
sleep 1;

//Save initial loadout 
[ _theClient, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;

//Save loadout when ever we exit an arsenal
[ missionNamespace, "arsenalClosed", {
	[ _theClient, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;
//	_Insignia = [player] call BIS_fnc_getUnitInsignia; 
//	missionNamespace setVariable ["Insignia", _Insignia];
//	player setVariable ["Insignia", _Insignia, true];
	systemChat "Your gear has been saved.";
	hintSilent "Your gear has been saved.";
}] call BIS_fnc_addScriptedEventHandler;

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
	[ _theClient, [ missionNamespace, "reviveInventory" ] ] call BIS_fnc_saveInventory;
//	_Insignia = [player] call BIS_fnc_getUnitInsignia; 
//	[ player, missionNamespace, "reviveInsignia" ] call BIS_fnc_getUnitInsignia;
}];

player addEventHandler [ "Respawn", {
	if ( _theClient getVariable [ "BIS_revive_incapacitated", false ] ) then {
		//Set correct loadout on incapacitated unit laying on floor in injured state
		//This is also the new unit if he is revived
		[ _theClient, [ missionNamespace, "reviveInventory" ] ] call BIS_fnc_loadInventory;
//		[ player, [ missionNamespace, "reviveInsignia" ] ] remoteExecCall [ "BIS_fnc_setUnitInsignia", player];
	};
	//Did we respawn from the menu
	if ( missionNamespace getVariable [ "menuRespawn", true ] ) then {
		[ _theClient, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory;
//		[ player, missionNamespace getVariable "Insignia" ] remoteExecCall [ "BIS_fnc_setUnitInsignia", player ];
		missionNamespace setVariable [ "menuRespawn", true ];
	};
}];

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

if (hasInterface) then {
	waitUntil {	!isNull player && isPlayer player/* && !isNull (findDisplay 46)*/; };
	if (!isServer) then {
		execVM "Scripts\openingCamera.sqf";
	};
	systemChat "Group Manager is active.  Press  U  to access group menu";
	systemChat "Ear Plugs are available.  Press  INSERT  to insert/remove.";
};