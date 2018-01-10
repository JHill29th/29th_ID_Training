/*
 * aitohc.sqf
 *
 * By VCRPlayer
 *
 * This script will move ANY ai (ie: zeus-spawned, etc)         to the headless client for processing on every frame
 * 
 * In init.sqf, put "[] execVM "aitohc.sqf";" (without outer quotes)
 *
 * In the description of the HeadlessClient virtual unit, put HC
 */
if (!isServer) exitWith {};
_HC = owner "Headless Client"; //<string> denotes the name of the HC entity/unit in-game
waitUntil {!isNil "Headless Client"};

/* ["HCS_addToHC", "onEachFrame", {
    if ((isPlayer)||(_x in units group _HC)) exitWith {};
    if (isNull _HC) ExitWith {};

    { _x setGroupOwner _HC; //adding all units that aren't player or aren't already under HC to HC
    } forEach allUnits;

}] call BIS_fnc_addStackedEventHandler;*/

//https://forums.bistudio.com/forums/topic/204479-headless-client-script-for-all-ai/?do=findComment&comment=3187161
[
	{
		{
			if (count (units _x select {isPlayer _x}) == 0) then {
				_x setGroupOwner _HC;
			};
		} forEach allGroups;
	},
	30,
	[]
] call CBA_fnc_addPerFrameHandler;