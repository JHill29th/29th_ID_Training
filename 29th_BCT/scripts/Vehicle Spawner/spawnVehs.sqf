private ["_target","_caller","_ID","_arg","_waitTime","_nearObj","_countNearObj"];

_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_arg = _this select 3;
_waitTime = "sleep 5";
_nearObj = nearestObjects [getMarkerPos "vehSpawn",["Car","Tank","Truck"],15];
_dead = allDeadMen;
_count = count _nearObj + count _dead;

if (isServer) exitWith {};

if (_count == 1 && !(_count > 1)) then {
//	_cleaner = [this select 0,this select 1,this select 2,this select 3] execVM "scripts\cleaner.sqf";
//	waitUntil {scriptDone _cleaner};
	if ( _count < 1) then {
		hintSilent "Nothing to delete.";
	} else {
		{ deleteVehicle _x; } forEach _dead;
		{ deleteVehicle _x; } forEach _nearObj;
	};
};

_waitTime;

if (_arg == "zamak") exitWith {
	_zamak = createVehicle ["O_Truck_02_transport_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_zamak setDir 60;
	hintSilent "";
	hintSilent "Zamak Transport";
};

if (_arg == "hemtt") exitWith {
	_hemtt = createVehicle ["B_Truck_01_covered_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_hemtt setDir 60;
	hintSilent "";
	hintSilent "HEMTT Transport";
};

if (_arg == "tempest") exitWith {
	_tempest = createVehicle ["O_Truck_03_transport_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_tempest setDir 60;
	hintSilent "";
	hintSilent "Tempest Transport";
};

if (_arg == "ifrit") exitWith {
	_ifrit = createVehicle ["O_MRAP_02_hmg_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_ifrit setDir 60;
	hintSilent "";
	hintSilent "Ifrit\nMRAPC";
};

if (_arg == "hunter") exitWith {
	_hunter = createVehicle ["B_MRAP_01_gmg_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_hunter setDir 60;
	hintSilent "";
	hintSilent "Hunter\nMRAPC";
};

if (_arg == "marshall") exitWith {
	_marshal = createVehicle ["B_APC_Wheeled_01_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_marshal setDir 60;
	hintSilent "";
	hintSilent "AMV-7 Marshall\nAmphibious APC";
};

if (_arg == "sandstorm") exitWith {
	_sandstorm = createVehicle ["B_MBT_01_mlrs_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_sandstorm setDir 60;
	hintSilent "";
	hintSilent "M5 Sandstorm\nMLRS";
};

if (_arg == "slammer") exitWith {
	_slammer = createVehicle ["B_MBT_01_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_slammer setDir 60;
	hintSilent "";
	hintSilent "M2A1 Slammer";
};

if (_arg == "scorcher") exitWith {
	_scorcher = createVehicle ["B_MBT_01_arty_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_scorcher setDir 60;
	hintSilent "";
	hintSilent "M4 Scorcher";
};

if (_arg == "panther") exitWith {
	_panther = createVehicle ["B_APC_Tracked_01_rcws_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_panther setDir 60;
	hintSilent "";
	hintSilent "IFV-6c Panther\nRCWS";
};

if (_arg == "cheetah") exitWith {
	_cheetah = createVehicle ["B_APC_Tracked_01_AA_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_cheetah setDir 60;
	hintSilent "";
	hintSilent "IFV-6a Cheetah\nAnti Air";
};

if (_arg == "marid") exitWith {
	_marid = createVehicle ["O_APC_Wheeled_02_rcws_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_marid setDir 60;
	hintSilent "";
	hintSilent "MS3-E Marid\nRCWS";
};

if (_arg == "kamysh") exitWith {
	_kamysh = createVehicle ["O_APC_Tracked_02_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_kamysh setDir 60;
	hintSilent "";
	hintSilent "BTR-K Kamysh";
};

if (_arg == "varsuk") exitWith {
	_varsuk = createVehicle ["O_MBT_02_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_varsuk setDir 60;
	hintSilent "";
	hintSilent "T-100 Varsuk";
};

if (_arg == "sochor") exitWith {
	_sochor = createVehicle ["O_MBT_02_arty_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_sochor setDir 60;
	hintSilent "";
	hintSilent "2S9 Sochor";
};

if (_arg == "tigris") exitWith {
	_tigris = createVehicle ["O_APC_Tracked_02_AA_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_tigris setDir 60;
	hintSilent "";
	hintSilent "ZSU-39 Tigris\nAnti Air";
};

if (_arg == "strider") exitWith {
	_strider = createVehicle ["I_MRAP_03_hmg_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_strider setDir 60;
	hintSilent "";
	hintSilent "Strider\nMRAPC";
};

if (_arg == "gorgon") exitWith {
	_gorgon = createVehicle ["I_APC_Wheeled_03_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_gorgon setDir 60;
	hintSilent "";
	hintSilent "AFV-4 Gorgon\nAmphibious APC";
};

if (_arg == "mora") exitWith {
	_mora = createVehicle ["I_APC_tracked_03_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_mora setDir 60;
	hintSilent "";
	hintSilent "FV-720 Mora";
};

if (_arg == "kuma") exitWith {
	_mora = createVehicle ["I_MBT_03_cannon_F", getMarkerPos "vehSpawn",[], 0, "NONE"];
	_mora setDir 60;
	hintSilent "";
	hintSilent "MBT-52 Kuma";
};