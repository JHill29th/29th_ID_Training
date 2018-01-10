_vic = _this select 0;

nul=[] execVM "IntLight.sqf";
clearWeaponCargoGlobal _vic;
zeu_1 addCuratorEditableObjects [[_vic],true];
