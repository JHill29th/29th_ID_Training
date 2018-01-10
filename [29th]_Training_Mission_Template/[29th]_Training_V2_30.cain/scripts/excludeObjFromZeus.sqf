if (!isServer) exitWith {};

curatorExcludedObjects = [] spawn {
	private ["_ex_AmmoBoxes","_ex_SpectateTerminal","_ex_Garbage","_ex_BaseLights","_er_TargetRange","_ex_RespawnPos","_ex_zeus_modules","_office","_excluded","_editableObjects"];
	_ex_AmmoBoxes = [/*tr_bunker,tr_ammo,tr_ammo_1,*/blu_ammo,blu_ammo_1,blu_ammo_2,red_ammo,red_ammo_1,red_ammo_2,grn_ammo,grn_ammo_1,grn_ammo_2];
	_ex_SpectateTerminal = [terminal,terminal_1,terminal_2,table,table_1,table_2/*,table_3,tr_arrow*/];
	_ex_Garbage = [blu_garbage,red_garbage,green_garbage,/*tr_garbage,*/hq_chair,blu_cone];
	_ex_BaseLights = [light,light_1,light_2,light_3,light_4,light_5/*,light_6,light_7*/];
	//_er_TargetRange = [tr_barrier,tr_barrier_1,tr_roof,tr_roof_1,tr_roof_2,tr_roof_3,tr_roof_4,tr_s_pos,tr_s_pos_1,tr_s_pos_2,tr_s_pos_3,tr_s_pos_4,tr_pole,tr_pole_1,tr_pole_2,tr_windsock,tr_windsock_1,tr_windsock_2,tr_windsock_3];
	_ex_RespawnPos = [res_blu,res_red,res_grn,res_civ];
	_ex_zeus_modules = [zeus_co,zeus_snco,zeus_cs,zeus_admin,zeus_plt1_pl,zeus_plt1_ps,zeus_plt2_pl,zeus_plt2_ps];
	_office = office nearObjects 10;
	_excluded = [];
	_excluded = (_excluded + (_office + (_ex_zeus_modules + (_ex_RespawnPos + (_ex_AmmoBoxes + (_ex_SpectateTerminal + (_ex_Garbage + /*(_er_TargetRange + */_ex_BaseLights/*)*/)))))));
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
		sleep 5;
	};
};