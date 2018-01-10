/* Written by "Rellikplug" a.k.a "Hill [29th ID]"
// Filename: fn_spectator.sqf
// ["Initialize", [player, [<side>,<side>], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
// The custom array for Initialize function can contain:
_this select 0 : The target player object
_this select 1 : Whitelisted sides, empty means all
_this select 2 : Whether AI can be viewed by the spectator
_this select 3 : Whether Free camera mode is available
_this select 4 : Whether 3th Person Perspective camera mode is available
_this select 5 : Whether to show Focus Info stats widget
_this select 6 : Whether or not to show camera buttons widget
_this select 7 : Whether to show controls helper widget
_this select 8 : Whether to show header widget
_this select 9 : Whether to show entities / locations lists
*/
/*
While spectating in first-person the keys 'a', 's', 'd', and 'w' will move the spectating player around so
we force the player to sit and keep him sitting to prevent unintended movement.
*/
/*
For overriding the spectate button->?
Make something that triggers once (findDisplay 49) exists (the menu)
Then look up the IDC of the spectate button and add from there
*/

if (isDedicated || !hasInterface) exitWith {["Player must be not be dedicated server or HC."] call BIS_fnc_error; false}; // do not run on dedicated server or headlessclient

//switch (side (group player)) do { //  detect faction of the player
//	case (WEST): { // if BLUFOR
//		if (serverCommandAvailable "#logout") then {  //  If the payer is logged in as admin
			["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;  // Start Spectator
//		} else {
//			["Initialize", [player, [WEST], false]] call BIS_fnc_EGSpectator;
//		};
//	};
//	case (EAST): {
//		if (serverCommandAvailable "#logout") then {
//			["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;
//		} else {
//			["Initialize", [player, [EAST], false]] call BIS_fnc_EGSpectator;
//		};
//	};
//	case (INDEPENDENT): {
//		if (serverCommandAvailable "#logout") then {
//			["Initialize", [player, [], false]] call BIS_fnc_EGSpectator;
//		} else {
//			["Initialize", [player, [INDEPENDENT], false]] call BIS_fnc_EGSpectator;
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
true