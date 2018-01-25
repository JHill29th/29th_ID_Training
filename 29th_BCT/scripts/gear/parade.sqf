comment "29th Infantry Division";
comment "Parade Loadout";
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
_man forceAddUniform "rhs_uniform_cu_ocp";
for "_i" from 1 to 3 do {_man addItemToUniform "rhs_mag_30Rnd_556x45_M855_Stanag";};
_man addVest "rhsusf_iotv_ocp";
for "_i" from 1 to 6 do {_man addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 4 do {_man addItemToVest "ACE_morphine";};
_man addHeadgear "rhsusf_patrolcap_ocp";

comment "Add weapons";
_man addWeapon "rhs_weap_m4a1";
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemWatch";
_man linkItem "ItemRadio";
_man linkItem "ItemGPS";
