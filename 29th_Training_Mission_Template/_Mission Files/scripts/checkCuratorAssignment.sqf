params ["_theClient"];

switch (_theClient) do {
  case (blu_co): {
    [blu_co, zeus_co] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (blu_cs): {
    [blu_cs, zeus_cs] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (blu_snco): {
    [blu_snco, zeus_snco] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (ltc): {
    [ltc, zeus_ltc] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (maj): {
    [maj, zeus_maj] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (msgt): {
    [msgt, zeus_msgt] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (blu_plt1_pl): {
    [blu_plt1_pl, zeus_plt1_pl] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (blu_plt1_ps): {
    [blu_plt1_ps, zeus_plt1_ps] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (blu_plt2_pl): {
    [blu_plt2_pl, zeus_plt2_pl] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (blu_plt2_ps): {
    [blu_plt2_ps, zeus_plt2_ps] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (red): {
    [red, zeus_red] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (red_1): {
    [red_1, zeus_red_1] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (grn): {
    [grn, zeus_grn] remoteExec ["Hill_fnc_assignCurator",2];
  };
  case (grn_1): {
    [grn_1, zeus_grn_1] remoteExec ["Hill_fnc_assignCurator",2];
  };
  default {};
};