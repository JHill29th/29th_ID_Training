//Add actions to spectator terminals
_terminals = [terminal, terminal_1, terminal_2];
_ammo_boxes = [blu_ammo,red_ammo,grn_ammo];
_garbages = [blu_garbage,red_garbage,green_garbage];

{
  _x addAction ["<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Follow.paa'/><t color='#00ff00'>  Spectator</t>", "[] spawn Hill_fnc_spectator", nil, 6, false, true, "", "true", 4];
//	playerStatsCheck = _x addAction ["<t color='#228415'>Check Stats</t>","scripts\Stats\checkStats.sqf","",-1,false,true,"","(_target distance _this) < 5"];
} forEach _terminals;

{
  if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Ace Arsenal</t>", {[_this select 1, _this select 1, true] call ace_arsenal_fnc_openBox;}, nil, 1.5, true, true, "", "true", 75];
//    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Transfer VA to AA</t>", {[] spawn Hill_fnc_transferVAtoAA;}];
//    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Virtual Arsenal</t>", {["Open", true] spawn BIS_fnc_arsenal;}];
  } else {
    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Virtual Arsenal</t>", {["Open", true] spawn BIS_fnc_arsenal;}, nil, 1.5, true, true, "", "true", 75];
  };
} forEach _ammo_boxes;

{
  _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa'/><t color='#FF0080'>  Clean-Up</t>", "call Hill_fnc_cleaner", nil, 1, false, true, "", "true", 2];
} forEach _garbages;