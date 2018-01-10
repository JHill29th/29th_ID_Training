{
	[_x,[-1,-2,0]] call BIS_fnc_setCuratorVisionModes; // -2 = NV, -1 = normal, 3rd number is TI see https://community.bistudio.com/wiki/setCamUseTi
//	if (isServer) then {_x call BIS_fnc_drawCuratorLocations;}; // add location names to curators UI
//	[_x,[WEST,EAST,INDEPENDENT,CIVILIAN]] call BIS_fnc_drawCuratorRespawnMarkers;
} forEach allCurators;

if (hc_online) then {
	{
// 		Move curator placed units to the headless client
		AIswitchToHC = _x addEventHandler ["CuratorGroupPlaced", {
			private ["_grp_entity", "_numUnits"];
			_grp_entity = _this select 1;
			_numUnits = count (units _grp_entity);
			missionNamespace setVariable ["BIS_fps_rescanNewObjects", true];
			if (groupOwner _grp_entity != owner "Headless Client") then {
				_grp_entity setGroupOwner (owner "Headless Client");
				systemChat format ["%1 units moved to HC.", _numUnits];
			};
		}];
	} forEach allCurators;
};
	
if (!hc_online) then {
	{
//		Move curator placed units to the server
		AIswitchToServer = _x addEventHandler ["CuratorGroupPlaced", {
			private ["_grp_entity", "_numUnits"];
			_grp_entity = _this select 1;
			_numUnits = count (units _grp_entity);
			missionNamespace setVariable ["BIS_fps_rescanNewObjects", true];
			if (groupOwner _grp_entity != 2) then {
				_grp_entity setGroupOwner 2;
				systemChat format ["%1 units moved to server.", _numUnits];
			};
		}];
	} forEach allCurators;
};

{
// Checks if the deleted object in a respawnInventory module and then deletes all respawn inventories
// configfile >> "CfgFunctions" >> "A3_Modules_F_Curator" >> "Respawn" >> "moduleRespawnInventory"
	RemoveRespawnInventory = _x addEventHandler ["CuratorObjectDeleted", {
		private ["_theModule"];
		_theModule = _this select 1;
		if (_theModule isKindOf "moduleRespawnInventory") then {
			[] call Hill_fnc_removeAllRespawnInventory;
		};
	}];
	
} forEach allCurators;

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	{
		// Call ACE3 Fast Rope function on each helicopter placed
		addFRIES = _x addEventHandler ["CuratorObjectPlaced", {
			private ["_objectPlaced"];
			_objectPlaced = _this select 1;
			if (_objectPlaced isKindOf "Helicopter") then {
				[_objectPlaced] call ace_fastroping_fnc_equipFRIES;
			};
		}];
	} forEach allCurators;
};

/*
//	Used with Stats system
{
	addAI_hitDetection = _x addEventHandler ["CuratorObjectPlaced", {
		private ["_entity"];
		_entity = _this select 1;
		if (_entity isKindOf "Man") then {
			target_AI_hits = _entity addMPEventHandler ["MPHit", {
				private ["_shooter"];
				_shooter = _this select 1;
				_shooter setVariable ["TargetsHit", (_shooter getVariable "TargetsHit") + 1];
			}];
		};
	}];
} forEach allCurators;
*/