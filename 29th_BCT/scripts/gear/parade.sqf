comment "29th Infantry Division";
comment "PARADE BLUERFOR";
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
for "_i" from 1 to 4 do {_man addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
_man addVest "rhsusf_iotv_ocp";
for "_i" from 1 to 3 do {_man addItemToVest "ACE_fieldDressing";};
_man addItemToVest "ACE_morphine";
for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
_man addHeadgear "29th_Helmet";

comment "Add weapons";
_man addWeapon "rhs_weap_m16a4_carryhandle";
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemWatch";
_man linkItem "ItemGPS";