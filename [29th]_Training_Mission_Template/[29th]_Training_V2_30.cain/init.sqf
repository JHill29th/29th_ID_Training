//Run Curator (Zeus) Setup
execVM "scripts\init_curators.sqf";
//Add actions to spectate terminals - spectator and stats check
_terminals = [terminal, terminal_1, terminal_2/*,terminal_3*/];
{
	spectate_action = _x addAction ["<t color='#00ff00'>Spectator</t>", "scripts\spectator.sqf", [], 0, false, true, "", "_this distance _target < 4"];
	playerStatsCheck = _x addAction ["<t color='#228415'>Check Stats</t>","scripts\Stats\checkStats.sqf","",-1,false,true,"","(_target distance _this) < 5"];
} forEach _terminals;

//attending = [];
//attendance_stand addAction ["<t color='#00ff70'>Record Attendance</t>", "scripts\attendance.sqf", "set", 0.5, false, true, "", "_this distance _target < 4"];
//attendance_stand addAction ["<t color='#00ff70'>Get Attendance</t>", "scripts\attendance.sqf", "get", 0, false, true, "", "_this distance _target < 4"];

//Disable environmental sounds and animals
waitUntil {time > 1};
enableEnvironment false;

	_range = createLocation [ "NameVillage" , getMarkerPos "range", 15, 15];
	_range setText "Ochrolimni Shooting Range";
	_range setSide CIVILIAN;
	_range setImportance 1;