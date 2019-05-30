/*
Executed locally (client only) when player respawns in a multiplayer mission.
		- [<newUnit>, <oldUnit>, <respawn>, <respawnDelay>]
		- This event script will also fire at the beginning of a mission if respawnOnStart is 0 or 1, oldUnit will be objNull in this instance.
		- This script will not fire at mission start if respawnOnStart equals -1 in description.ext
*/
params ["_newUnit", "_oldUnit", "_typeRespawn", "_delayRespawn"];

if (isNull _oldUnit) then {
  [_newUnit, ""] call BIS_fnc_setUnitInsignia;
  _newUnit spawn Hill_fnc_setInsignia;

//  [_newUnit] call Hill_fnc_playerAdmin;

/*  if (isNil "autoSpectate") then {
      [] spawn {
        waitUntil {!isNil "autoSpectate"};
        player addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\ico_ON_ca.paa'/><t color='#00FFFF'>  Enable Auto Spectate</t>",{autoSpectate = true;publicVariable "autoSpectate";systemChat "AutoSpectate is ON.";},"alpha",-999,false,true,"","(!autoSpectate && _target == _this && _target == theMan)"];
        player addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\ico_OFF_ca.paa'/><t color='#00FFFF'>  Disable Auto Spectate</t>",{autoSpectate = false;publicVariable "autoSpectate";systemChat "AutoSpectate is OFF.";},"alpha",-999,false,true,"","(autoSpectate && _target == _this && _target == theMan)"];
      };
    } else {
      player addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\ico_ON_ca.paa'/><t color='#00FFFF'>  Enable Auto Spectate</t>",{autoSpectate = true;publicVariable "autoSpectate";systemChat "AutoSpectate is ON.";},"alpha",-97,false,true,"","(!autoSpectate && _target == _this && _target == theMan)"];
      player addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\ico_OFF_ca.paa'/><t color='#00FFFF'>  Disable Auto Spectate</t>",{autoSpectate = false;publicVariable "autoSpectate";systemChat "AutoSpectate is OFF.";},"alpha",-97,false,true,"","(autoSpectate && _target == _this && _target == theMan)"];
    };*/
};

if !(isNull _oldUnit) then {
  [_newUnit] spawn {
    _newUnit = _this select 0;
    _newUnit hideObjectGlobal true;
    waitUntil {alive _newUnit};
    sleep 1;
    [_newUnit, ""] call BIS_fnc_setUnitInsignia;
    _newUnit spawn Hill_fnc_setInsignia;
    if (isObjectHidden _newUnit) then { 
      _newUnit hideObjectGlobal false;
    };
  };
//  enableEnvironment false;
//  {_x addCuratorEditableObjects [[player],false];} count allCurators;  // Add player back to Zeus(s)
//  [ _newUnit, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory; // load player's inventory
	if ( missionNamespace getVariable [ "menuRespawn", true ] ) then {
		if (autoSpectate) then {
			systemChat "AutoSpectate is ON.";
			[_newUnit] spawn Hill_fnc_spectator;
		};
	};
};