/*
waitUntil {
	!isnil "BIS_fnc_establishingShot_playing" && {!BIS_fnc_establishingShot_playing};
};
*/

//if (!isServer) exitWith {};
//deleteMarker "respawn_west";

if (!isNil "di") then {
	_DI = [missionNamespace,"di","Drill Instructor"] call BIS_fnc_addRespawnPosition;
};
/*
_respawnWest = createMarker ["respawn_west", [2159,5634,0]];
_respawnWest setMarkerShape "ICON";
_respawnWest setMarkerType "hd_dot";
_respawnWest setMarkerText "Barracks";
*/
_barracks = [missionNamespace,"barracks",">Barracks<"] call BIS_fnc_addRespawnPosition;
_ptCourse = [missionNamespace,"militaryrange","Military Range"] call BIS_fnc_addRespawnPosition;
_killfarm = [missionNamespace,"killfarm","Kill Farm"] call BIS_fnc_addRespawnPosition;
_rogain = [missionNamespace,"rogain","Camp Rogain"] call BIS_fnc_addRespawnPosition;
_kamino = [missionNamespace,"kamino","Kamino Firing Range"] call BIS_fnc_addRespawnPosition;
_asm26 = [missionNamespace,"asm26","Air Station Mike 26"] call BIS_fnc_addRespawnPosition;
_maxwell = [missionNamespace,"maxwell","Camp Maxwell"] call BIS_fnc_addRespawnPosition;
_tempest = [missionNamespace,"tempest","Camp Tempest"] call BIS_fnc_addRespawnPosition;
_connor = [missionNamespace,"connor","LZ Connor"] call BIS_fnc_addRespawnPosition;
_spartan = [missionNamespace,"spartan","The Spartan"] call BIS_fnc_addRespawnPosition;
_marina = [missionNamespace,"marina","Marina"] call BIS_fnc_addRespawnPosition;

/*=============================================================================================*/
diag_log text format["|=============================   %1  Respawn positions added.=============================|", missionName];