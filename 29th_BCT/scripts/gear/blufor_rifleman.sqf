comment "29th Infantry Division";
comment "Blufor Rifleman Loadout";
comment "Requires ACE3, RHS, and 29th mod";
comment "Designed for Basic medical settings";
comment "Updated on 01/24/2018";

_man = _this select 1;

["Open",true] spawn BIS_fnc_arsenal;

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

comment "Add containers";
_man forceAddUniform "rhs_uniform_cu_ocp";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 8 do {_man addItemToUniform "ACE_fieldDressing";};
_man addItemToUniform "ACE_CableTie";
for "_i" from 1 to 6 do {_man addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
_man addVest "rhsusf_iotv_ocp_Rifleman";
for "_i" from 1 to 7 do {_man addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
for "_i" from 1 to 3 do {_man addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {_man addItemToVest "SmokeShell";};
for "_i" from 1 to 3 do {_man addItemToVest "MiniGrenade";};
_man addBackpack "rhsusf_assault_eagleaiii_ocp";
_man addItemToBackpack "rhsusf_ANPVS_15";
_man addItemToBackpack "ACE_EntrenchingTool";
_man addItemToBackpack "ACE_Flashlight_MX991";
_man addItemToBackpack "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {_man addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
_man addItemToBackpack "SmokeShellGreen";
_man addItemToBackpack "SmokeShellRed";
_man addHeadgear "rhsusf_ach_helmet_ocp";

comment "Add weapons";
_man addWeapon "rhs_weap_m4a1";
_man addPrimaryWeaponItem "rhsusf_acc_compm4";
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "tf_microdagr";
_man linkItem "ItemRadio";
_man linkItem "ItemGPS";

