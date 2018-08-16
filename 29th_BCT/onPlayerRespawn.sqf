/*
Executed locally (client only) when player respawns in a multiplayer mission.
	- description.ext
		- This event script will also fire at the beginning of a mission if respawnOnStart is 0 or 1, oldUnit will be objNull in this instance.
		- This script will not fire at mission start if respawnOnStart equals -1.
*/
_newUnit = _this select 0;
_oldUnit = _this select 1;

if !(isNull _oldUnit) then {
//	[ player, [ missionNamespace, "Current Inventory" ] ] call BIS_fnc_loadInventory; // load player's inventory
	_newUnit spawn RP_fnc_setInsignia; // apply player's insignia 
};