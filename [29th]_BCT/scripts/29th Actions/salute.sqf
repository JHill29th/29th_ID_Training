/*===============================================================================
=		\/RP		by: Rellikplug		\/RP																			=
================================================================================*/
Private ["_target","_caller","_ID","_nameCaller","_msg"];

_target 	= _this select 0; //Object that had the action
_caller 	= _this select 1; //Unit that used the action
_ID			= _this select 2;
_nameCaller = name _caller;

_caller action ["Salute", _caller];
//_caller globalChat "*Salute*";

//_msg = format ["%1: *Salute*",_nameCaller];
_msg = "*Salute*";
[[_caller,_msg], "RP_fnc_mpGlobalChat"] spawn BIS_fnc_MP;