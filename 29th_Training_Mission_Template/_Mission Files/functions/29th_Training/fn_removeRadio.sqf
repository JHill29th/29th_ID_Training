if !(hasInterface) exitWith {};
if !(isClass (configfile >> "CfgPatches" >> "task_force_radio_items")) exitWith {};

_removeRadiosFromDead = "removeRadiosFromDead" call BIS_fnc_getParamValue;
if (_removeRadiosFromDead == 0) exitWith {};

params ["_unit"];

private _sw = false;
private _lr = false;

if (call TFAR_fnc_haveSWRadio) then {
  private _active_sr_radio = call TFAR_fnc_activeSwRadio; //_SwRadio = ((getUnitLoadout _unit select 9) select 2);
  _unit unlinkItem _active_sr_radio;
  _sw = true;
};
if (call TFAR_fnc_haveLRRadio) then {
  private _active_lr_radio = call TFAR_fnc_activeLrRadio;
  removeBackpack _unit;
  _lr = true;
};
[_sw,_lr]