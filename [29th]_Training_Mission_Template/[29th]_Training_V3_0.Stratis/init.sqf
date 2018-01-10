hc_online = false;

if (count (entities "HeadlessClient_F") > 0) then {
	systemChat "Headless Client is online. Spawned units will be transferred to the HC.";
	hc_online = true;
	publicVariable "hc_online";
/*	if !(hasInterface || isServer) then {
		execVM "scripts\init_hc.sqf";
	};*/
} else {
	systemChat "Headless Client is offline. Spawned units will be transferred to the server.";
};
	
//Run Curator (Zeus) Setup
execVM "scripts\init_curators.sqf";
	
//Add actions to spectator terminals - spectator and stats check
_terminals = [terminal, terminal_1, terminal_2];
_ammo_boxes = [blu_ammo,red_ammo,grn_ammo];
_garbages = [blu_garbage,red_garbage,green_garbage];

{
	spectate_action = _x addAction ["<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Follow.paa'/><t color='#00ff00'>  Spectator</t>", "[] spawn Hill_fnc_spectator", [], 6, false, true, "", "_this distance _target < 4"];
//	playerStatsCheck = _x addAction ["<t color='#228415'>Check Stats</t>","scripts\Stats\checkStats.sqf","",-1,false,true,"","(_target distance _this) < 5"];
} forEach _terminals;

{
	ammo_action = _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Virtual Arsenal</t>", {["Open",true] spawn BIS_fnc_arsenal;}];
} forEach _ammo_boxes;

{
	garbage_action = _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa'/><t color='#FF0080'>  Clean-Up</t>","call Hill_fnc_cleaner","blu",1,false,true,"","((_target distance _this) < 2)"];
} forEach _garbages;

[WEST, "29TH_PARADE_WEST"] call BIS_fnc_addRespawnInventory;
[EAST, "29TH_PARADE_EAST"] call BIS_fnc_addRespawnInventory;
[INDEPENDENT, "29TH_PARADE_INDEPENDENT"] call BIS_fnc_addRespawnInventory;