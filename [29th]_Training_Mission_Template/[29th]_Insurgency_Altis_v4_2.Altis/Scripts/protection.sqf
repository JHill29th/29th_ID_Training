#define SAFETY_ZONES	   [["respawn_west", 100]] //default is 50
#define MESSAGE		     "Placing / Throwing / Firing at base is prohibited!"
					
if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
//	if ((_this select 2 == "HandGrenadeMuzzle") || (_this select 2 == "MiniGrenadeMuzzle") || (_this select 2 == "DirectionalMineRangeMuzzle") || (_this select 2 == "TimeBombMuzzle") || (_this select 2 == "PipeBombMuzzle") || (_this select 2 == "DemoChargeMuzzle") || (_this select 2 == "MineMuzzle") || (_this select 2 == "ClassicMineWireMuzzle") || (_this select 2 == "ClassicMineRangeMuzzle") || (_this select 2 == "BoundingMineRangeMuzzle")) then {
		if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then {
			deleteVehicle (_this select 6);
			titleText [MESSAGE, "PLAIN", 3];
			systemChat MESSAGE;
		};
//	};
}];