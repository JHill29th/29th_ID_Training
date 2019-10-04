if (!hasInterface) exitWith {};

player spawn Hill_fnc_setInsignia;
[player, [missionNamespace, "Current Inventory"]] call BIS_fnc_saveInventory;
[player, ["missionNamespace:Current Inventory"]] call BIS_fnc_setRespawnInventory;
if (!(weaponLowered player)) then {
	player action ["WeaponOnBack", player];
};
systemChat "Your gear has been saved.";
hintSilent "Your gear has been saved.";
true