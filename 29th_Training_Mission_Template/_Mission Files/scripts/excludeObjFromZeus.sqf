if (!isServer) exitWith {};

curatorExcludedObjects = [] spawn {
	private ["_ex_AmmoBoxes","_ex_SpectateTerminal","_ex_Garbage","_ex_BaseLights","_ex_RespawnPos","_ex_zeus_modules","_excluded","_editableObjects"];
	_ex_AmmoBoxes = [blu_ammo,red_ammo,grn_ammo];
	_ex_SpectateTerminal = [terminal,terminal_1,terminal_2,table,table_1,table_2];
	_ex_Garbage = [blu_garbage,red_garbage,green_garbage];
	_ex_BaseLights = [light,light_1,light_2,light_3,light_4,light_5];
	_ex_RespawnPos = [res_blu,res_red,res_grn,res_civ];
	_ex_zeus_modules = [zeus_admin,zeus_ltc,zeus_maj,zeus_msgt,zeus_co,zeus_snco,zeus_cs,zeus_plt1_pl,zeus_plt1_ps,zeus_plt2_pl,zeus_plt2_ps,zeus_red,zeus_red_1,zeus_grn,zeus_grn_1];
	_ex_misc = [tfar_settings];
	_excluded = [];
	_excluded = (_excluded + (_ex_misc + (_ex_zeus_modules + (_ex_RespawnPos + (_ex_AmmoBoxes + (_ex_SpectateTerminal + (_ex_Garbage + _ex_BaseLights)))))));
	_editableObjects = [];
	while {true} do {
		{
			_editableObjects = _editableObjects + curatorEditableObjects _x;
		} forEach allCurators;
	
		{
			if (_x in _editableObjects) then {
				{
					_x removeCuratorEditableObjects [_excluded,false];
				} forEach allCurators;
			};
		} forEach _excluded;
    if (count _editableObjects > 1000) then {
      _editableObjects = [];
    };
		sleep 3;
	};
};