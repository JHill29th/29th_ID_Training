/*
Executed only on server when mission is started.
*/
execVM "scripts\addRespawnPos.sqf";

cqb_go = false;
cqb_end_time = 0;
cqb_start_time = 0;

patrol_start = false;
publicVariable "patrol_start";

execVM "scripts\wilson_dog\spawn_wilson_dog.sqf";

//Ambient flyby's
[] spawn {
	while { true } do {
		//Flyby type
		private "_type";
		_type = [
			[150, "FULL", "B_Plane_CAS_01_F"],
			[40, "NORMAL", "B_Heli_Light_01_F"],
			[60, "NORMAL", "B_Heli_Transport_01_F"],
			[100, "FULL", "B_T_VTOL_01_infantry_F"]
		] call BIS_fnc_selectRandom;
		
		//Parameters
		private ["_height", "_speed", "_class", "_distance"];
		_height	= _type select 0;
		_speed	= _type select 1;
		_class	= _type select 2;
		
		//The direction, start and end positions
		private ["_distance", "_direction", "_position", "_positionStart", "_positionEnd"];
		_distance	= 5000;
		_direction	= random 360;
		_position	= getMarkerPos "base_centre";
		_positionStart	= [_position, _distance, _direction] call BIS_fnc_relPos;
		_positionEnd	= [_position, _distance, _direction + 180] call BIS_fnc_relPos;
		
		//The ambient flyby
		[_positionStart, _positionEnd, _height, _speed, _class, WEST] call BIS_fnc_ambientFlyBy;
		
		//The delay between each flyby
		sleep 300 + random 150;
	};
};

/*=============================================================================================*/

diag_log text format["|=============================   %1   initServer.sqf finished.=============================|", missionName];