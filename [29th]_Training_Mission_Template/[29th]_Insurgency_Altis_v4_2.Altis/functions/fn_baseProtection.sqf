/*
	GrenadeStop v0.8 for ArmA 3 Alpha
	
AUTHOR:
	
	Bake (tweaked slightly by Rarek)
	tweaked some more by Rellikplug (Hill [29th ID])
	
DESCRIPTION:
	
	Stops players from throwing grenades and firing weapons in safety zones. Does not prevent vehicles firing.
	
CONFIGURATION:

	Edit the #defines below.
	
_______________________________________________________________________*/

#define SAFETY_ZONES	[["fob", 100]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "<t size='0.8' color='#2E0000' shadow='0'>Firing, placing, and throwing items at base is</t>"
#define MESSAGE_2  "<t size='1' color='#2E0000' shadow='0'>PROHIBITED!</t>"

waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
	{
		deleteVehicle (_this select 6);
		[] spawn { 
			cutText ["", "BLACK FADED"];
			[MESSAGE + "<br/>" + MESSAGE_2,0,0.5,4,0] call bis_fnc_dynamictext;
			sleep 1; 
			titleCut ["", "BLACK IN", 1];
		};
//		titleText [MESSAGE, "PLAIN", 3];
	};
}];

/*	// Disable guns for vehicles if player is in one
	if (vehicle player != player) then {
		player setVariable ["f_var_safetyVeh",vehicle player];
		f_eh_safetyVeh = (player getVariable "f_var_safetyVeh") addEventHandler["Fired", {deletevehicle (_this select 6);}];
	};*/