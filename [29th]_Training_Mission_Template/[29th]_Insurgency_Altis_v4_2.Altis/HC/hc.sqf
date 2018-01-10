_headlessClient = "headlessClient" call BIS_fnc_getParamValue;

if (_headlessClient == 1) then {
	// Run on all player clients incl. player host and headless client and dedicated server
	if (!isDedicated || !hasInterface) then {
		//  execVM "HC\aitoc.sqf";
		//	systemChat "Starting HC script on HC";
		[true,15,false,false,60,3,true,[]] execVM "HC\WerthlesHeadless.sqf";
	};
};
/*	// Run on HC only
		if (!hasInterface && !isDedicated) then {
			// Code here
		};	
} else {
	// Run on dedicated server or player host only
	if (isServer) then {
//		execVM "HC\aitoc.sqf";
//		systemChat "Starting HC script on server";
		[true,15,true,false,60,3,true,[]] execVM "HC\WerthlesHeadless.sqf";
	};
};
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Werthles Headless Script Parameters
// 1. Repeating - true/Once - false,
// 2. Time between repeats (seconds),
// 3. Debug on - true/off - false,
// 4. Advanced balancing - true/Simple balancing - false,
// 5. Delay before executing (seconds),
// 6. Additional syncing time between groups transferred to try to reduce bad unit transfer caused by desyncs (seconds)
// 7. Display an initial setup report after the first cycle, showing the number of units moved to HCs,
// 8. Addition phrases to look for when checking whether to ignore.
// Unit names, group names, unit's current transport vehicle, modules synced to units and unit class names will all be checked for these phrases
// Format:
// ["UnitName","GroupCallsignName","SupportProviderModule1","TypeOfUnit"]
// E.g. ["BLUE1","AlphaSquad","B_Heli_Transport_01_camo_F"]
// Specifying "B_Heli" would stop all units with that class type from transferring to HCs
// However, if you specify "BLUE1", "NAVYBLUE10" will also be ignored

//[true,30,true,true,30,3,true,[]] execVM "scripts\WerthlesHeadless.sqf";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////