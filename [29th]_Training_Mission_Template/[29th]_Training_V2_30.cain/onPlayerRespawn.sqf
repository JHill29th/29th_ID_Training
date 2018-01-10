/*
Executed locally (client only) when player respawns in a multiplayer mission.
		- [<newUnit>, <oldUnit>, <respawn>, <respawnDelay>]
		- This event script will also fire at the beginning of a mission if respawnOnStart is 0 or 1, oldUnit will be objNull in this instance.
		- This script will not fire at mission start if respawnOnStart equals -1 in description.ext
*/
private ["_newUnit","_oldUnit"];
_newUnit = _this select 0;
_oldUnit = _this select 1;

[_newUnit] call JJH_playerAdmin;
/*if (isNil "autoSpectate") then { 
	[] spawn
		{
			waitUntil {!isNil "autoSpectate"};
			player addAction ["<t color='#00FFFF'>Enable Auto Spectate</t>",{autoSpectate = true;publicVariable "autoSpectate";},"alpha",-97,false,true,"","(!autoSpectate && _target == _this && _target == theMan)"];
			player addAction ["<t color='#00FFFF'>Disable Auto Spectate</t>",{autoSpectate = false;publicVariable "autoSpectate";},"alpha",-97,false,true,"","(autoSpectate && _target == _this && _target == theMan)"];
		};
} else {
	player addAction ["<t color='#00FFFF'>Enable Auto Spectate</t>",{autoSpectate = true;publicVariable "autoSpectate";},"alpha",-97,false,true,"","(!autoSpectate && _target == _this && _target == theMan)"];
	player addAction ["<t color='#00FFFF'>Disable Auto Spectate</t>",{autoSpectate = false;publicVariable "autoSpectate";},"alpha",-97,false,true,"","(autoSpectate && _target == _this && _target == theMan)"];
};*/

if !(isNull _oldUnit) then {
		enableEnvironment false;
	//{_x addCuratorEditableObjects [[player],false];} count allCurators;  // Add player back to Zeus(s)
	[ _newUnit, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory; // load player's inventory
	[ _newUnit, _oldUnit getVariable "Insignia" ] remoteExecCall [ "BIS_fnc_setUnitInsignia"]; // apply player's insignia globally
/*	if ( missionNamespace getVariable [ "menuRespawn", true ] ) then {
		if (autoSpectate) then {
			_spetator = [] execVM "scripts\spectator.sqf";
		};
	};*/
};