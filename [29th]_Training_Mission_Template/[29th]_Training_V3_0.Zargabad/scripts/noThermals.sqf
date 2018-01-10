if (!hasInterface || isDedicated) exitWith {};
_theGuy = _this select 0;
_layer = 85125; 

if !(_theGuy isKindOf "VirtualSpectator_F") then {
	while {true} do {
		if (currentVisionMode _theGuy == 2) then {
			_layer	cutText ["FLIR Mode is disallowed. Please Turn off Thermals.","BLACK",-1];
			playSound "FD_CP_Not_Clear_F";
			waituntil {currentVisionMode _theGuy != 2};
			_layer cutText ["", "PLAIN"];
		};
		sleep 1; 
	};
};

/*
// Would an event handler for "onEachFrame work better?  Below doesn't seem to work...
if !(_theGuy isKindOf "VirtualSpectator_F") then {
	["noTherm", "onEachFrame", {
		if (currentVisionMode _theGuy == 2) then {
			_layer	cutText ["FLIR Mode is disallowed. Please Turn off Thermals.","BLACK",-1];
			playSound "FD_CP_Not_Clear_F";
			waituntil {currentVisionMode _theGuy != 2};
			_layer cutText ["", "PLAIN"];
		};
	}, _theGuy, _layer] call BIS_fnc_addStackedEventHandler;
};
*/