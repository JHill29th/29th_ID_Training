if (!hasInterface) exitWith {};

waitUntil {!isNull player};

arsenalClosed = {
  player spawn RP_fnc_setInsignia;
	[player, [missionNamespace, "Current Inventory"]] call BIS_fnc_saveInventory;
	[player, ["missionNamespace:Current Inventory"]] call BIS_fnc_setRespawnInventory;
	if (!(weaponLowered player)) then {
		player action ["WeaponOnBack", player];
	};
	systemChat "Your gear has been saved.";
	hintSilent "Your gear has been saved.";
};

addRadio = {
  if (isClass (configfile >> "CfgPatches" >> "task_force_radio_items")) then {
    if ( (((getUnitLoadout player) select 9) select 2) == "") then {
      switch (side (group player)) do {
        case (WEST): {
          player linkItem "tf_anprc152";
        };
        case (EAST): {
          player linkItem "tf_fadak";
        };
        case (INDEPENDENT): {
          player linkItem "tf_anprc148jem";
        };
        default {};
      };
    };
  };
};

[missionNamespace, "arsenalClosed", {
	call arsenalClosed;
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalOpened", {
	player spawn RP_fnc_setInsignia;
//	systemChat "Your insignia has been applied.";
}] call BIS_fnc_addScriptedEventHandler;

["ace_arsenal_displayClosed", {
  call addRadio;
  call arsenalClosed;
}] call CBA_fnc_addEventHandler;

["ace_arsenal_displayOpened", {
  player spawn RP_fnc_setInsignia;
}] call CBA_fnc_addEventHandler;