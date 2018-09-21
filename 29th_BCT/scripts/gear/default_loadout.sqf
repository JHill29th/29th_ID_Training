private _man = _this select 1;
private _arg = _this select 3;

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
  [_man, _man, true] call ace_arsenal_fnc_openBox;
} else {
  ["Open",true] spawn BIS_fnc_arsenal;
};

sleep 1;

comment "Remove existing items";
removeAllWeapons _man;
removeAllItems _man;
removeAllAssignedItems _man;
removeUniform _man;
removeVest _man;
removeBackpack _man;
removeHeadgear _man;
removeGoggles _man;

switch (_arg) do {
  case ("parade"): {
    _man setUnitLoadout [[["rhs_weap_m1garand_sa43","","","",["rhsgref_8Rnd_762x63_M2B_M1rifle",8],[],""],[],[],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",3],["ACE_morphine",1],["ACE_EarPlugs",1],["rhsgref_8Rnd_762x63_M2B_M1rifle",5,8]]],["rhsusf_iotv_ocp",[["rhsgref_8Rnd_762x63_M2B_M1rifle",3,8]]],[],"rhsusf_patrolcap_ocp","",[],["ItemMap","ItemGPS","","ItemCompass","tf_microdagr",""]],true];
  };
  case ("blu"): {
    _man setUnitLoadout [[["rhs_weap_m4a1","","","rhsusf_acc_compm4",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],["rhsusf_weap_m9","","","",["rhsusf_mag_15Rnd_9x19_FMJ",15],[],""],["rhs_uniform_cu_ocp",[["ACE_fieldDressing",10],["ACE_morphine",2],["ACE_CableTie",1],["ACE_EarPlugs",1],["ACE_MapTools",1],["ACE_Flashlight_XL50",1]]],["rhsusf_iotv_ocp_Rifleman",[["rhsusf_ANPVS_14",1],["ACE_IR_Strobe_Item",1],["rhs_mag_m67",1,1],["SmokeShell",2,1],["SmokeShellBlue",1,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2,30],["rhs_mag_30Rnd_556x45_M855A1_Stanag",6,30]]],[],"rhsusf_ach_helmet_ocp","",["rhsusf_bino_m24","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","tf_microdagr",""]],true];
  };
  case ("red_wood"): {
    _man setUnitLoadout [[["rhs_weap_ak74m","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N22_AK",30],[],""],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_emr_patchless",[["ACE_fieldDressing",10],["ACE_morphine",2],["ACE_CableTie",1],["ACE_EarPlugs",1],["rhs_mag_rdg2_white",2,1]]],["rhs_6b23_6sh116",[["rhs_1PN138",1],["rhs_30Rnd_545x39_7N22_AK",6,30],["rhs_30Rnd_545x39_7N6M_plum_AK",2,30],["rhs_mag_nspd",1,1],["rhs_mag_rdg2_black",1,1],["rhs_mag_rgd5",1,1]]],[],"rhs_6b7_1m_emr","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","tf_microdagr",""]],true];
  };
  case ("red_desert"): {
    _man setUnitLoadout [[["rhs_weap_ak74m","rhs_acc_dtk","","",["rhs_30Rnd_545x39_7N22_AK",30],[],""],[],["rhs_weap_pya","","","",["rhs_mag_9x19_17",17],[],""],["rhs_uniform_emr_des_patchless",[["ACE_fieldDressing",10],["ACE_morphine",2],["ACE_CableTie",1],["ACE_EarPlugs",1],["rhs_mag_rdg2_white",2,1]]],["rhs_6b23_6sh116",[["rhs_1PN138",1],["rhs_30Rnd_545x39_7N22_AK",6,30],["rhs_30Rnd_545x39_7N6M_plum_AK",2,30],["rhs_mag_nspd",1,1],["rhs_mag_rdg2_black",1,1],["rhs_mag_rgd5",1,1]]],[],"rhs_6b7_1m_olive","",["Binocular","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","tf_microdagr",""]],true];
  };
  case ("grn_reg"): {
    _man setUnitLoadout [[["rhs_weap_savz58v_ris","","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_FMJ",17],[],""],["rhssaf_uniform_m93_oakleaf_summer",[["ACE_fieldDressing",10],["ACE_morphine",2],["ACE_EarPlugs",1],["ACE_CableTie",1],["rhs_1PN138",1],["rhssaf_mag_brd_m83_white",2,1],["rhssaf_mag_brd_m83_orange",1,1]]],["rhssaf_vest_md99_woodland_rifleman",[["rhs_30Rnd_762x39mm_Savz58",4,30],["rhs_30Rnd_762x39mm_Savz58_tracer",2,30],["rhssaf_mag_br_m75",1,1]]],[],"rhssaf_helmet_m97_oakleaf_black_ess_bare","rhsusf_oakley_goggles_clr",["rhssaf_zrak_rd7j","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","tf_microdagr",""]],true];
  };
  case ("grn_ins"): {
    _man SetUnitLoadout [[["rhs_weap_savz58p","","","",["rhs_30Rnd_762x39mm_Savz58",30],[],""],[],["rhs_weap_makarov_pm","","","",["rhs_mag_9x18_8_57N181S",8],[],""],["rhsgref_uniform_og107_erdl",[["ACE_EarPlugs",1],["ACE_fieldDressing",10],["ACE_CableTie",1],["ACE_morphine",2],["rhssaf_mag_brd_m83_white",2,1],["rhssaf_mag_br_m75",1,1]]],["V_TacVest_camo",[["rhs_30Rnd_762x39mm_Savz58",5,30],["rhs_30Rnd_762x39mm_Savz58_tracer",1,30],["rhssaf_mag_brd_m83_yellow",1,1],["rhs_mag_9x18_8_57N181S",1,8]]],[],"H_Bandanna_camo","G_Bandanna_khk",["rhssaf_zrak_rd7j","","","",[],[],""],["ItemMap","","","ItemCompass","tf_microdagr",""]],true];
  };
  default {};
};