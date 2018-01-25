comment "29th Infantry Division";
comment "Greenfor INSURGENT Rifleman";
comment "Requires ACE3, RHS, and 29th mod";
comment "Designed for Basic medical settings";
comment "Updated on: 01/24/2018";

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
_man forceAddUniform "U_I_C_Soldier_Para_2_F";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 8 do {_man addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 6 do {_man addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
_man addItemToUniform "ACE_CableTie";
_man addItemToUniform "ACE_Cellphone";
_man addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_man addItemToUniform "SmokeShell";};
_man addVest "rhs_6b23_6sh116_od";
for "_i" from 1 to 3 do {_man addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 4 do {_man addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_rgn";};
for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_rgo";};
for "_i" from 1 to 3 do {_man addItemToVest "rhs_mag_rdg2_black";};
_man addBackpack "rhs_sidor";
_man addItemToBackpack "ACE_Flashlight_XL50";
_man addItemToBackpack "ACE_Chemlight_Shield";
_man addItemToBackpack "SmokeShellRed";
_man addItemToBackpack "SmokeShellBlue";
_man addItemToBackpack "rhsusf_mag_17Rnd_9x19_JHP";
_man addItemToBackpack "rhsusf_mag_17Rnd_9x19_FMJ";
_man addItemToBackpack "rhs_30Rnd_545x39_AK";
for "_i" from 1 to 2 do {_man addItemToBackpack "rhs_mag_nspd";};
for "_i" from 1 to 2 do {_man addItemToBackpack "ACE_Chemlight_White";};
for "_i" from 1 to 2 do {_man addItemToBackpack "ACE_Chemlight_HiYellow";};
_man addHeadgear "H_Cap_oli";

comment "Add weapons";
_man addWeapon "rhs_weap_ak74";
_man addPrimaryWeaponItem "rhs_acc_dtk1983";
_man addWeapon "rhsusf_weap_glock17g4";
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemRadio";