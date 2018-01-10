	class 29TH_PARADE_WEST
  {
		displayName = "Parade"; // Name visible in the menu
		icon = "\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa"; // Icon displayed next to the name
		role = "PARADE_WEST";
 
		// Loadout definition, uses same entries as CfgVehicles classes
		weapons[] = {
			"rhs_weap_m16a4_carryhandle"
		};
		magazines[] = {
			"rhs_mag_30Rnd_556x45_Mk318_Stanag",
			"rhs_mag_30Rnd_556x45_Mk318_Stanag"
		};
		items[] = {
			"ACE_EarPlugs",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_morphine"
		};
		linkedItems[] = { //hats, vests, attachments, optics
			"29th_Helmet", //29th helmet
			"rhsusf_iotv_ocp",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_B_CombatUniform_mcam" /*"rhs_uniform_cu_ocp"*/;
		backpack = "";
	};
	class 29TH_PARADE_EAST
  {
		displayName = "Parade"; // Name visible in the menu
		icon = "\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa"; // Icon displayed next to the name
		role = "PARADE_EAST";
 
		// Loadout definition, uses same entries as CfgVehicles classes
		weapons[] = {
			"rhs_weap_akm"
		};
		magazines[] = {
			"rhs_30Rnd_762x39mm_tracer",
			"rhs_30Rnd_762x39mm_tracer"
		};
		items[] = {
			"ACE_EarPlugs",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_morphine"
		};
		linkedItems[] = { //hats, vests, attachments, optics
			"rhs_fieldcap_khk", //headgear
			"rhs_vest_pistol_holster",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "rhs_uniform_m88_patchless";
		backpack = "";
	};
	class 29TH_PARADE_INDEPENDENT
  {
		displayName = "Parade"; // Name visible in the menu
		icon = "\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa"; // Icon displayed next to the name
		role = "PARADE_INDEPENDENT";
 
		// Loadout definition, uses same entries as CfgVehicles classes
		weapons[] = {
			"rhs_weap_m38"
		};
		magazines[] = {
			"rhsgref_5Rnd_762x54_m38",
			"rhsgref_5Rnd_762x54_m38"
		};
		items[] = {
			"ACE_EarPlugs",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_fieldDressing",
			"ACE_morphine"
		};
		linkedItems[] = { //hats, vests, attachments, optics
			"rhsgref_ssh68_ttsko_digi", //headgear
			"rhs_vest_pistol_holster",
			"ItemMap",
			"ItemCompass",
			"ItemWatch",
			"ItemRadio"
		};
		uniformClass = "U_BG_Guerrilla_6_1";
		backpack = "";
	};