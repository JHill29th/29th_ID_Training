if (!isServer) exitWith {};

params ["_unit","_logic"];

{
	if (!isNull (_unit)) then {
		if (isNull (getAssignedCuratorLogic _unit)) then {
			unassignCurator _logic;
			sleep 2;
			_unit assignCurator _logic;
		};
	};
} forEach allPlayers;