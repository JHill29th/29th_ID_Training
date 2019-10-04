  if (!hasInterface) exitWith {};
  if !(isClass (configfile >> "CfgPatches" >> "task_force_radio_items")) exitWith {};
  
  params ["_theClient"];
  //[MyID, EventName, Code, Object] call TFAR_fnc_addEventHandler;
  ["randomizeStolenRadioHz", "OnSWChange", {
    params ["_unit","_newSWRadio","_oldSWRadio"];
    ["_unit","_newSWRadio","_oldSWRadio"] call Hill_fnc_randomizeRadioHz;
  }, _theClient] call TFAR_fnc_addEventHandler;