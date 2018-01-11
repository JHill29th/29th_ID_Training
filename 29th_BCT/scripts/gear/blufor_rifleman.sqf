comment "29th Infantry Division";
comment "Blufor MTP BLUFOR";
comment "Requires ACE3, RHS, and 29th mod";
comment "Designed for Basic medical settings";

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
_man forceAddUniform "U_B_CombatUniform_mcam";
_man addItemToUniform "ACE_DefusalKit";
_man addItemToUniform "ACE_Clacker";
_man addItemToUniform "ACE_IR_Strobe_Item";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 10 do {_man addItemToUniform "ACE_fieldDressing";};
_man addItemToUniform "ACE_CableTie";
_man addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {_man addItemToUniform "ACE_morphine";};
_man addItemToUniform "ACE_MapTools";
_man addItemToUniform "ACE_Flashlight_MX991";
_man addItemToUniform "SmokeShell";
_man addVest "rhsusf_iotv_ocp_Rifleman";
_man addItemToVest "rhsusf_ANPVS_15";
for "_i" from 1 to 2 do {_man addItemToVest "SmokeShell";};
_man addItemToVest "Chemlight_red";
for "_i" from 1 to 8 do {_man addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
_man addItemToVest "rhsusf_mag_15Rnd_9x19_FMJ";
_man addItemToVest "ACE_HandFlare_White";
for "_i" from 1 to 3 do {_man addItemToVest "HandGrenade";};
_man addItemToVest "SmokeShellRed";
_man addItemToVest "SmokeShellGreen";
_man addHeadgear "rhsusf_ach_helmet_ocp";

comment "Add weapons";
_man addWeapon "rhs_weap_m4a1";
_man addPrimaryWeaponItem "rhsusf_acc_compm4";
_man addWeapon "rhsusf_weap_m9";
reload _man;
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemWatch";
_man linkItem "ItemGPS";