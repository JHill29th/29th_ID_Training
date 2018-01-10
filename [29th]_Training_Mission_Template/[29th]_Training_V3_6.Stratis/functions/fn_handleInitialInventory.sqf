if (!hasInterface) exitWith {};

_theClient = _this select 0;

waitUntil {!isNull player && player == player};

if (side (group _theClient) == WEST) then {
	[_theClient, configfile >> "CfgRespawnInventory" >> "29TH_PARADE_WEST"] call BIS_fnc_loadInventory;
};
if (side (group _theClient) == EAST) then {
	[_theClient, configfile >> "CfgRespawnInventory" >> "29TH_PARADE_EAST"] call BIS_fnc_loadInventory;
};
if (side (group _theClient) == INDEPENDENT) then {
	[_theClient, configfile >> "CfgRespawnInventory" >> "29TH_PARADE_INDEPENDENT"] call BIS_fnc_loadInventory;
};