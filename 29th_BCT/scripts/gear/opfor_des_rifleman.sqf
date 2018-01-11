comment "29th Infantry Division";
comment "Opfor Desert OPFOR";
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
_man forceAddUniform "rhs_uniform_emr_des_patchless";
_man addItemToUniform "ACE_DefusalKit";
_man addItemToUniform "ACE_Clacker";
_man addItemToUniform "ACE_IR_Strobe_Item";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 10 do {_man addItemToUniform "ACE_fieldDressing";};
_man addItemToUniform "ACE_CableTie";
_man addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 3 do {_man addItemToUniform "ACE_morphine";};
_man addItemToUniform "ACE_MapTools";
_man addItemToUniform "ACE_Flashlight_KSF1";
_man addItemToUniform "SmokeShell";
_man addVest "rhs_6b23_6sh116";
_man addItemToVest "rhs_1PN138";
for "_i" from 1 to 7 do {_man addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
for "_i" from 1 to 3 do {_man addItemToVest "rhs_mag_rgd5";};
_man addItemToVest "rhs_mag_rdg2_black";
_man addItemToVest "ACE_HandFlare_White";
for "_i" from 1 to 2 do {_man addItemToVest "SmokeShell";};
_man addItemToVest "Chemlight_red";
_man addItemToVest "rhs_mag_9x19_17";
_man addHeadgear "rhs_6b7_1m_olive";

comment "Add weapons";
_man addWeapon "rhs_weap_ak74m";
_man addPrimaryWeaponItem "rhs_acc_dtk";
_man addWeapon "rhs_weap_pya";
reload _man;
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "tf_microdagr";
_man linkItem "ItemGPS";

_man addItemToVest "rhs_30Rnd_545x39_7N22_AK";