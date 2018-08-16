/*
Executed locally (only on client) when player joins mission (includes both mission start and JIP)
*/
if (!hasInterface) exitWith {};

_theClient = _this select 0;
_didJIP = _this select 1; // boolean

if (!isServer) then { //run only if not server / MP host and not headless client
	[]	spawn {
		execVM "scripts\openingShot.sqf";
		waitUntil {!isnil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing}};
		["<img size= '4' shadow='false' image='pictures\29th_REAL_Patch128.paa'/><br/><t size='0.9' color='#FFFFFF'>29th Infantry Division</t><br /><t size='1.3' color='#c0c0c0'>B C T</t>",0,0.2,3,2] spawn BIS_fnc_dynamicText;
	};
};

//setTerrainGrid 50; //disable grass layer

[player, [missionNamespace, "Default Gear"]] call BIS_fnc_saveInventory;
[player, ["missionNamespace:Default Gear"]] call BIS_fnc_setRespawnInventory;

sleep 1;

_theClient spawn RP_fnc_setInsignia;

if !(isClass (configFile >> "CfgPatches" >> "29th_Insignias")) then {
	execVM "scripts\29th Actions\29thActions.sqf";
};

[_theClient] execVM "scripts\player_arsenal_handlers.sqf";

//Save loadout when ever we exit an arsenal
/*[missionNamespace, "arsenalClosed", {
	player call RP_fnc_setInsignia; //apply insignia
	[player, [missionNamespace, "Current Inventory"]] call BIS_fnc_saveInventory;
	[player, ["missionNamespace:Current Inventory"]] call BIS_fnc_setRespawnInventory;
	systemChat "Your gear has been saved.";
	hintSilent "Your gear has been saved.";
}] call BIS_fnc_addScriptedEventHandler;*/


if (!isNil "di") then {
/*	if (_theClient == di ) then {
		startTimer = _theClient addAction ["<t color='#FF0080'>Start Timer</t>", "scripts\timer.sqf", "start", 1, false, false, "", "((_target distance _this) <= 1)"];
	};*/

	//set position of late joining players to the DI (if DI slot is occupied)
	if (_didJIP) then {
		_theClient setPos getPos di;
	};
};