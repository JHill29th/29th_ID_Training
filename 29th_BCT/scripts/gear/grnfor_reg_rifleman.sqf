comment "29th Infantry Division";
comment "Grnfor Regular Rifleman";
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
_man forceAddUniform "rhsgref_uniform_altis_lizard";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 8 do {_man addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 6 do {_man addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
_man addItemToUniform "ACE_CableTie";
for "_i" from 1 to 2 do {_man addItemToUniform "SmokeShell";};
_man addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";
_man addVest "rhsgref_6b23_khaki_rifleman";
for "_i" from 1 to 6 do {_man addItemToVest "rhs_30Rnd_762x39mm_Savz58";};
_man addItemToVest "rhs_mag_rgn";
_man addItemToVest "rhs_mag_rgo";
_man addBackpack "rhs_sidor";
_man addItemToBackpack "ACE_Flashlight_MX991";
_man addItemToBackpack "rhs_1PN138";
_man addItemToBackpack "SmokeShellRed";
_man addItemToBackpack "SmokeShellBlue";
_man addItemToBackpack "rhsusf_mag_17Rnd_9x19_JHP";
_man addItemToBackpack "rhsusf_mag_17Rnd_9x19_FMJ";
_man addItemToBackpack "rhs_mag_rgn";
_man addItemToBackpack "rhs_mag_rgo";
_man addHeadgear "rhsgref_helmet_pasgt_altis_lizard";

comment "Add weapons";
_man addWeapon "rhs_weap_savz58p_black";
_man addWeapon "rhsusf_weap_glock17g4";
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemRadio";
_man linkItem "ItemGPS";
