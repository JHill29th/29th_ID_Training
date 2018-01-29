if (isServer) then {
  diag_log text "Adding Mandatory Addons";
//  ["29th_Insignias"] call BIS_fnc_activateAddons;
//if !(isserver) exitwith {"The function can be called only on server." call bis_fnc_error; []};
//if (time > 0) exitwith {"The function can be activated only during the mission init." call bis_fnc_error; []};

  private ["_input","_addons"];
  _input = ["29th_Insignias"];
  _addons = activatedaddons;
  {
    private ["_addon"];
    _addon = _x param [0,"",[""]];
    _addon = if (isclass (configfile >> "cfgpatches" >> _addon)) then {[_addon]} else {unitaddons _addon};
      {
        if !(_x in _addons) then {_addons set [count _addons,_x];};
      } foreach _addon;
  } foreach _input;
  activateaddons _addons;
  _addons
};