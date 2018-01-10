/*29th_fnc_removeAllRespawnInventory.sqf
Removes all respawn inventory
Written by: Hill [29th ID] AKA Rellikplug
*/
private ["_riAll","_riWEST","_riEAST","_riINDEPENDENT","_riCIVILIAN","_riMN"];

_riAll =  [];
_riWEST = [WEST, true] call BIS_fnc_getRespawnInventories;
_riEAST =  [EAST, true] call BIS_fnc_getRespawnInventories;
_riINDEPENDENT = [INDEPENDENT, true] call BIS_fnc_getRespawnInventories;
_riCIVILIAN = [CIVILIAN,  true] call BIS_fnc_getRespawnInventories;
_riALL = _riALL + _riWEST + _riEAST + _riINDEPENDENT + _riCIVILIAN;
if (count _riALL != 0) then {
	{
/*
// ==============================================================================
// Get players' list of saved arsenal loadouts and add to respawn inventory
// https://forums.bistudio.com/topic/187986-custom-respawn-inventory-menu-per-player-dynamically-load-players-saved-virtual-arsenal-loadouts/#entry2979787
_arsenalNames = [];
_arsenalDataLocal = [];
_arsenalData = profileNamespace getVariable ["bis_fnc_saveInventory_data",[]];
for "_i" from 0 to (count _arsenalData - 1) step 2 do {
    _name = _arsenalData select _i;
    _arsenalDataLocal = _arsenalDataLocal + [_name,_arsenalData select (_i + 1)];
    _nul = _arsenalNames pushBack ( format[ "missionNamespace:%1", _name ] );
};
missionNamespace setVariable ["bis_fnc_saveInventory_data",_arsenalDataLocal];
[player,_arsenalNames] call bis_fnc_setrespawninventory;
// ==============================================================================
*/
		if (count _riWEST != 0) then {
			[WEST, _x] call BIS_fnc_removeRespawnInventory; 
		};
		if (count _riEAST != 0) then {
			[EAST, _x] call BIS_fnc_removeRespawnInventory; 
		};
		if (count _riINDEPENDENT != 0) then {
			[INDEPENDENT, _x] call BIS_fnc_removeRespawnInventory;
		};
		if (count _riCIVILIAN != 0) then {
			[CIVILIAN, _x] call BIS_fnc_removeRespawnInventory; 
		};
	
	} forEach _riAll;
		
	["General",["Notice","Respawn Inventory has been cleared."]] remoteExecCall ["BIS_fnc_showNotification", 0, false];
};