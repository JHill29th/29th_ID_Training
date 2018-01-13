_this addAction [
	"<t color='#FF0080'>Clean-Up</t>",
	"scripts\cleaner.sqf",
	"veh_spawn",
	1,
	false,
	true,
	"",
	"((_target distance _this) <= 1)"
];

_this addAction ["Open Virtual Garage",{
	_nearObj = nearestObjects [getMarkerPos "vic_spawn_loc",["Air","Car","Tank","Truck","Ship"],15];
	{ deleteVehicle _x; } forEach _nearObj;
	_caller = _this select 1;
 	//Create a position 30 meters infront of the player
	_pos = getMarkerPos "vic_spawn_loc";
	_dir = (getDir _caller) - 90;
	//Create empty helipad at the position
	_vehicle = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ]; 
	_vehicle setDir _dir;
	//Pass created vehicle to function for use as position
	["Open",[ true, _vehicle ]] call BIS_fnc_garage; 
}];
/*
_this addAction [
	"<t color='#ED2744'>Spawn Zamak</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"zamak",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn HEMTT</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"hemtt",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn Tempest</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"tempest",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn Ifrit</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"ifrit",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn Hunter</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"hunter",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn AMV-7 Marshall</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"marshall",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn M5 Sandstorm MLRS</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"sandstorm",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn M2A1 Slammer</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"slammer",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn M4 Scorcher</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"scorcher",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn FV-63c Panther</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"panther",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn FV-6a Cheetah</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"cheetah",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn MSE-3 Marid</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"marid",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn BTR-K Kamysh</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"kamysh",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn T-100 Varsuk</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"varsuk",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn 2S9 Sochor</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"sochor",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn ZSU-39 Tigris</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"tigris",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn Strider</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"strider",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn AFV-4 Gorgon</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"gorgon",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn FV-720 Mora</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"mora",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];

_this addAction [
	"<t color='#ED2744'>Spawn MBT-52 Kuma</t>",
	"scripts\Vehicle Spawner\spawnVehs.sqf",
	"kuma",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];
*/