//save player gear and load what they started with
[player, [missionnamespace, "CurrentGear"]] call bis_fnc_saveInventory;
hint "Your gear has been saved";

//save player gear and load what they had when they died
/*
player addEventHandler [
	"Killed", {
		[player, [missionnamespace, "CurrentGear"]] call bis_fnc_saveInventory;
	}
];
*/

//load player gear
player addEventHandler [
	"Respawn", {
		[player, [missionnamespace, "CurrentGear"]] call bis_fnc_loadInventory;
		[player, "29thID"] call BIS_fnc_setUnitInsignia;
		hint "Your gear has been loaded";
	}
]; 