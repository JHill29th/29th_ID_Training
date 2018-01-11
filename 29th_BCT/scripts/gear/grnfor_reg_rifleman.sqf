comment "29th Infantry Division";
comment "Grnfor Woodland GRNFOR";
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
_man forceAddUniform "rhsgref_uniform_ERDL";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 10 do {_man addItemToUniform "ACE_fieldDressing";};
_man addItemToUniform "ACE_CableTie";
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_morphine";};
_man addItemToUniform "ACE_Chemlight_Shield";
_man addItemToUniform "ACE_Flashlight_MX991";
_man addItemToUniform "ACE_HandFlare_White";
_man addItemToUniform "rhsusf_mag_17Rnd_9x19_FMJ";
for "_i" from 1 to 2 do {_man addItemToUniform "SmokeShell";};
_man addItemToUniform "SmokeShellGreen";
_man addItemToUniform "Chemlight_green";
_man addVest "rhsgref_6b23_khaki_rifleman";
_man addItemToVest "rhs_1PN138";
for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 7 do {_man addItemToVest "rhsgref_30rnd_556x45_m21";};
_man addItemToVest "rhsgref_30rnd_556x45_m21_t";
_man addHeadgear "rhsgref_helmet_pasgt_woodland";

comment "Add weapons";
_man addWeapon "rhs_weap_m21a";
_man addPrimaryWeaponItem "rhsusf_acc_SF3P556";
_man addPrimaryWeaponItem "rhs_acc_perst1ik";
_man addWeapon "rhsusf_weap_glock17g4";
reload _man;
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemWatch";
_man linkItem "ItemGPS";

_man addItemToVest "rhsgref_30rnd_556x45_m21";