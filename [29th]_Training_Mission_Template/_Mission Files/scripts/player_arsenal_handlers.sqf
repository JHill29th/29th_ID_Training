if (!hasInterface) exitWith {};

waitUntil {!isNull player};

arsenalClosed = {
  player spawn Hill_fnc_setInsignia;
	[player, [missionNamespace, "Current Inventory"]] call BIS_fnc_saveInventory;
	[player, ["missionNamespace:Current Inventory"]] call BIS_fnc_setRespawnInventory;
	if (!(weaponLowered player)) then {
		player action ["WeaponOnBack", player];
	};
	systemChat "Your gear has been saved.";
	hintSilent "Your gear has been saved.";
};

[missionNamespace, "arsenalClosed", {
	call arsenalClosed;
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalOpened", {
	player spawn Hill_fnc_setInsignia;
//	systemChat "Your insignia has been applied.";
}] call BIS_fnc_addScriptedEventHandler;

["ace_arsenal_displayClosed", {
  call arsenalClosed;
}] call CBA_fnc_addEventHandler;