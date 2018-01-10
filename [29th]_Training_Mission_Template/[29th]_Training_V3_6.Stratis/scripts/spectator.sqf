// Written by "Rellikplug" a.k.a "Hill [29th ID]"
// Filename: spectator.sqf

/*  Action added to object
this addAction [
	"<t color='#00ff00'>Spectator</t>",
	"spectator.sqf",
	[],
	0,
	false,
	true,
	"",
	"_this distance _target < 2"
];
*/

/*
While spectating in first-person the keys 'a', 's', 'd', and 'w' will move the spectating player around so
we force the player to sit and keep him sitting to prevent unintended movement.
*/
if (isDedicated || !hasInterface) exitWith {}; // do not run on dedicated server or headlessclient

//switch (side (group player)) do { //  detect faction of the player
//	case (WEST): { // if BLUFOR
//		if (serverCommandAvailable "#logout") then { //  If the payer is logged in as admin
			["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		} else {
//			["Initialize", [player, [WEST], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		};
//	};
//	case (EAST): {  //  If OPFOR
//		if (serverCommandAvailable "#logout") then { //  If the payer is logged in as admin
//			["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		} else {
//			["Initialize", [player, [EAST], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		};
//	};
//	case (INDEPENDENT): {  // I AAF
//		if (serverCommandAvailable "#logout") then { //  If the payer is logged in as admin
//			["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		} else {
//			["Initialize", [player, [INDEPENDENT], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		};
//	};
//};

player action ["SITDOWN", player]; // make player sit down.
cutText ["SPECTATOR\n----------\nPress RELOAD to exit","PLAIN DOWN"]; // Tell player they are spectating
hintSilent "SPECTATOR\n----------\nPress RELOAD to exit";  // Tell player they are spectating

[player, true] remoteExec ["hideObjectGlobal", 0];
player enableSimulation false;

["exitSpect", "onEachFrame", {
//	if (stance player != "CROUCH") then { // check if player is still sitting
//		player action ["SITDOWN", player]; // if player is not sitting then sit him back down
//	};
	
	if (inputAction "ReloadMagazine" > 0) exitWith { // Check if "Reload" key is pressed
		["Terminate"] call BIS_fnc_EGSpectator; //  End Spectator
		[player, false] remoteExec ["hideObjectGlobal", 0];
		cutText ["","PLAIN DOWN"]; // Clear cutText
		hintSilent ""; // Clear Hint
		player allowDammage true; // Make player vulnerable again
		player switchCamera "internal"; // Make sure the camera is returned to the player
		player enableSimulation true;
		["exitSpect", "onEachFrame"] call BIS_fnc_removeStackedEventHandler; //  Remove the stackedEventHandler as we no longer need it
	};
}] call BIS_fnc_addStackedEventHandler;

sleep 30;

if (!isNil {missionNamespace getVariable "BIS_EGSpectator_initialized"}) then { // Check if spectator is active
	[] spawn {
		while {!isNil {missionNamespace getVariable "BIS_EGSpectator_initialized"}} do { // While spectator is active show messages
			cutText ["SPECTATOR\n----------\nPress RELOAD to exit","PLAIN DOWN"];
//			hintSilent "SPECTATOR\n----------\nPress RELOAD to exit";
		sleep 30; // Show message every 30 seconds
		};
	};
};