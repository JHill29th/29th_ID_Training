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
/*		//--- Arsenal loadout
		_xSplit = [_x,":"] call bis_fnc_splitstring;
		if (count _xSplit == 2) then {
			_namespace = _xSplit select 0;
			_name = _xSplit select 1;
			_cfg = switch (tolower _namespace) do {
				case "missionnamespace": {[missionnamespace,_name]};
				case "profilenamespace": {[profilenamespace,_name]};
				case "player": {[player,_name]};
				default {[]};
			};
		};
	} forEach _riALL;
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