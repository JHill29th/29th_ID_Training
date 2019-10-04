if !(isServer) exitWith {};

if (!isNil "blu_co") then {
  [blu_co, zeus_co] spawn Hill_fnc_assignCurator;
};
if (!isNil "blu_cs") then {
  [blu_cs, zeus_cs] spawn Hill_fnc_assignCurator;
};
if (!isNil "blu_snco") then {
  [blu_snco, zeus_snco] spawn Hill_fnc_assignCurator;
};
if (!isNil "ltc") then {
  [ltc, zeus_ltc] spawn Hill_fnc_assignCurator;
};
if (!isNil "maj") then {
  [maj, zeus_maj] spawn Hill_fnc_assignCurator;
};
if (!isNil "msgt") then {
  [msgt, zeus_msgt] spawn Hill_fnc_assignCurator;
};
if (!isNil "blu_plt1_pl") then {
  [blu_plt1_pl, zeus_plt1_pl] spawn Hill_fnc_assignCurator;
};
if (!isNil "blu_plt1_ps") then {
  [blu_plt1_ps, zeus_plt1_ps] spawn Hill_fnc_assignCurator;
};
if (!isNil "blu_plt2_pl") then {
  [blu_plt2_pl, zeus_plt2_pl] spawn Hill_fnc_assignCurator;
};
if (!isNil "blu_plt2_ps") then {
  [blu_plt2_ps, zeus_plt2_ps] spawn Hill_fnc_assignCurator;
};
if (!isNil "red") then {
  [red, zeus_red] spawn Hill_fnc_assignCurator;
};
if (!isNil "red_1") then {
  [red_1, zeus_red_1] spawn Hill_fnc_assignCurator;
};
if (!isNil "grn") then {
  [grn, zeus_grn] spawn Hill_fnc_assignCurator;
};
if (!isNil "grn_1") then {
 [grn_1, zeus_grn_1] spawn Hill_fnc_assignCurator;
};
