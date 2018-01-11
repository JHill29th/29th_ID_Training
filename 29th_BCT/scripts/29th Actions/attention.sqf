/*===============================================================================
=		\/RP		by: Rellikplug		\/RP																			=
================================================================================*/
private ["_target","_caller","_ID"/*,"_nameCaller","_msg"*/];

_target 	= _this select 0;
_caller 	= _this select 1;
_ID			= _this select 2;
//_nameCaller = name _caller;
//_msg = "Sir! At-Ease. Yes Sir!";

//[[_caller, _msg], "RP_fnc_mpSideChat"] spawn BIS_fnc_MP;

RP_fnc_switchToPrimary = {
	_a = player addAction [
		"Primary Weapon",
		"player action ['SwitchWeapon', player, player, 0];",
		"",
		1,
		false,
		true,
		"",
		""
	];
	waitUntil {
		!(currentWeapon player == "");
	};
	player removeAction _a;
};

_caller action ["SwitchWeapon", _caller, _caller, 100];  // wep on back 100
if (handGunWeapon _caller == "") then {
	player call RP_fnc_switchToPrimary;
};
_caller action ["HandGunOffStand", _caller]; // holster sidearm
