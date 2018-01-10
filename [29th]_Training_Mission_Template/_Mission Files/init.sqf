diag_log text format ["|=============================   %1: init.sqf Running   =============================|", missionName];

//Run Curator (Zeus) Setup
execVM "scripts\init_curators.sqf";

//Add actions to spectator terminals, garbage cans, and ammo boxes
execVM "scripts\baseObjectsInit.sqf";

//set-up Parade Inventories
[WEST, "29TH_PARADE_WEST"] call BIS_fnc_addRespawnInventory;
[EAST, "29TH_PARADE_EAST"] call BIS_fnc_addRespawnInventory;
[INDEPENDENT, "29TH_PARADE_INDEPENDENT"] call BIS_fnc_addRespawnInventory;