if (!hasInterface) exitWith {};

waitUntil {!isNull player};

[missionNamespace, "arsenalClosed", {
	call Hill_fnc_arsenalClosed;
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalOpened", {
	player spawn Hill_fnc_setInsignia;
//	systemChat "Your insignia has been applied.";
}] call BIS_fnc_addScriptedEventHandler;

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
  ["ace_arsenal_displayOpened", {
    player spawn Hill_fnc_setInsignia;
  }] call CBA_fnc_addEventHandler;
  
  ["ace_arsenal_displayClosed", {
    call Hill_fnc_addRadio;
    call Hill_fnc_arsenalClosed;
  }] call CBA_fnc_addEventHandler;
};