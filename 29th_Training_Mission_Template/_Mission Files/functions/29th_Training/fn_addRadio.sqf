if (!hasInterface) exitWith {};

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
      default {false};
    };
  };
};
true