if !(triggerActivated frr_trg) exitWith {};


_caller = missionNamespace getVariable "frr_shooter";
_nameRegisteredShooterName = name _caller;

//[targets to pop up, max targets at a time, delay before dropping target]
[20, 3, 2, _caller, _nameRegisteredShooterName] execVM "scripts\FastRifleRange\setup.sqf";