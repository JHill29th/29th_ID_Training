comment "29th Infantry Division";
comment "Greenfor INSURGENT GRNFOR";
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
_man forceAddUniform "rhsgref_uniform_woodland_olive";
_man addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_morphine";};
for "_i" from 1 to 5 do {_man addItemToUniform "ACE_fieldDressing";};
_man addItemToUniform "ACE_CableTie";
_man addItemToUniform "ACE_Cellphone";
_man addItemToUniform "Chemlight_blue";
for "_i" from 1 to 2 do {_man addItemToUniform "SmokeShell";};
_man addItemToUniform "SmokeShellYellow";
_man addItemToUniform "rhs_mag_m67";
_man addItemToUniform "ACE_HandFlare_White";
_man addVest "rhsgref_6b23_ttsko_mountain_rifleman";
for "_i" from 1 to 5 do {_man addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 6 do {_man addItemToVest "rhs_30Rnd_762x39mm_89";};
_man addItemToVest "rhs_mag_9x18_8_57N181S";
_man addHeadgear "H_Bandanna_gry";
_man addGoggles "rhs_scarf";

comment "Add weapons";
_man addWeapon "rhs_weap_m70ab2";
_man addWeapon "rhs_weap_makarov_pm";
reload _man;
_man addWeapon "Binocular";

comment "Add items";
_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemWatch";

_man addItemToVest "rhs_30Rnd_762x39mm_89";