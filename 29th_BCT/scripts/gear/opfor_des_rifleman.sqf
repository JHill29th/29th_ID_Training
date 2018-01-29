comment "29th Infantry Division";
comment "Opfor Desert Rifleman";
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
_man forceAddUniform "rhs_uniform_emr_des_patchless";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 8 do {_man addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 6 do {_man addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {_man addItemToUniform "rhs_mag_rdg2_black";};
_man addVest "rhs_6b23_6sh116";
for "_i" from 1 to 8 do {_man addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
for "_i" from 1 to 4 do {_man addItemToVest "rhs_mag_rgd5";};
_man addItemToVest "rhs_mag_rdg2_black";
for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_9x19_17";};
_man addBackpack "rhs_assault_umbts";
_man addItemToBackpack "rhs_1PN138";
_man addItemToBackpack "ACE_CableTie";
_man addItemToBackpack "ACE_EntrenchingTool";
_man addItemToBackpack "ACE_Flashlight_XL50";
_man addHeadgear "rhs_6b7_1m";

comment "Add weapons";
_man addWeapon "rhs_weap_ak74m";
_man addWeapon "rhs_weap_pya";
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "tf_microdagr";
_man linkItem "ItemRadio";
_man linkItem "ItemGPS";
