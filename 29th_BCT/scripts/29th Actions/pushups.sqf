/*===============================================================================
=		\/RP		by: Rellikplug		\/RP																			=
================================================================================*/
private ["_target","_caller","_ID","_nameCaller","_msg"];

_target 	= _this select 0;
_caller 	= _this select 1;
_ID			= _this select 2;
_nameCaller = name _caller;

//_caller sideChat 'Sir! Drop and give you 10. Yes Sir!';
//_msg = format ["%1: Sir! Drop and give you 10. Yes Sir!",_nameCaller];
_msg = "Sir! Drop and give you 10. Yes Sir!";
[[_caller, _msg], "RP_fnc_mpSideChat"] spawn BIS_fnc_MP;
_caller playMove "AmovPercMstpSnonWnonDnon_exercisePushup";