if !(hasInterface) exitWith {};

waitUntil {!isNull player && player == player};

[player, [profileNamespace, "temp"]] call bis_fnc_SaveInventory;

private _VALoadouts = +(profileNamespace getvariable ["bis_fnc_saveInventory_data",[]]);
private _aceLoadouts = +(profileNamespace getVariable ["ace_arsenal_saved_loadouts",[]]);

if (_VALoadouts isEqualTo []) exitWith {
  ["No VA Loadouts to transfer"] call BIS_fnc_error;
};

if (_VALoadouts isEqualTo []) exitWith {};

for "_i" from 0 to (count _VALoadouts - 1) step 2 do {
  _name = _VALoadouts select _i;
  _inventory = _VALoadouts select (_i + 1);

  private _sameNameLoadoutsList = _aceLoadouts select {_x select 0 == _name};
  [player, [profileNamespace, _name]] call bis_fnc_loadinventory;
  private _loadout = getUnitLoadout player;

  if (count _sameNameLoadoutsList > 0) then {
    _aceLoadouts set [_aceLoadouts find (_sameNameLoadoutsList select 0), [_name, _loadout]];
  } else {
    _aceLoadouts pushBack [_name, _loadout];
  };
};

profileNamespace setVariable ["ace_arsenal_saved_loadouts", _aceLoadouts];

[player, [profileNamespace, "temp"]] call BIS_fnc_loadInventory;
sleep 0.2;
player spawn Hill_fnc_setInsignia;

[player, [profileNamespace, "temp"], [], true] call BIS_fnc_saveInventory;