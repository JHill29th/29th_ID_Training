if (!isServer) exitWith {};
private ["_morra","_wilson","_op_morra_vics","_op_wilson_vics","_op_morra_mkrs","_op_wilson_mkrs"];

//_the_trigger = _this select 0;

_morra = nil;
_wilson= nil;

_morra = _this select 0;
_wilson = _this select 1;

_op_morra_vics = [hemttTrans_1,hunter_5,hunter_6];
_op_wilson_vics = [hemttTrans_2,hunter_7,hunter_8];

_op_morra_mkrs = ["4_EOS_312","4_EOS_351","4_EOS_357","4_EOS_358"];
_op_wilson_mkrs = ["2_EOS_98","2_EOS_204","2_EOS_205","2_EOS_206","2_EOS_207"];

switch (true) do {

	case (_morra == "op_morra" && _wilson == ""): {
//		getMarkerColor "4_EOS_312" == "ColorGreen" && getMarkerColor "4_EOS_351" == "ColorGreen" && getMarkerColor "4_EOS_357" == "ColorGreen" && getMarkerColor "4_EOS_358" == "ColorGreen";
//		{_x setMarkerColor "ColorGreen"} forEach ["4_EOS_312","4_EOS_351","4_EOS_357","4_EOS_358"];
		["General",["New OP Established","Respawn at OP Morra is now available!"]] remoteExecCall ["BIS_fnc_showNotification"];
		
		{zeu_1 addCuratorEditableObjects [[_x],true];} forEach _op_morra_vics;
		
		_op_morra = createMarker ["op_morra_mkr", base_4];
		_op_morra setMarkerShape "ICON";
		_op_morra setMarkerType "b_hq";
		_op_morra setMarkerSize [0.5,0.5];
		_op_morra setMarkerText "OP Morra";
		
		if (!triggerActivated op_morra) then {
			{_x setMarkerColor "ColorGreen"} forEach _op_morra_mkrs;
		};

		deleteVehicle op_morra;
	};
	
	case (_wilson == "op_wilson" && _morra == ""): {
//		getMarkerColor "2_EOS_98" == "ColorGreen" && getMarkerColor "2_EOS_204" == "ColorGreen" && getMarkerColor "2_EOS_205" == "ColorGreen" && getMarkerColor "2_EOS_206" == "ColorGreen" && getMarkerColor "2_EOS_207" == "ColorGreen";
//		{_x setMarkerColor "ColorGreen"} forEach ["2_EOS_98","2_EOS_204","2_EOS_205","2_EOS_206","2_EOS_207"];
		["General",["New OP Established","Respawn at OP Wilson is now available!"]] remoteExecCall ["BIS_fnc_showNotification"];
		
		{zeu_1 addCuratorEditableObjects [[_x],true];} forEach _op_wilson_vics;
		
		_op_wilson = createMarker ["op_wilson_mkr", base_5];
		_op_wilson setMarkerShape "ICON";
		_op_wilson setMarkerType "b_hq";
		_op_wilson setMarkerSize [0.5,0.5];
		_op_wilson setMarkerText "OP Wilson";
		
		if (!triggerActivated op_wilson) then {
			{_x setMarkerColor "ColorGreen"} forEach _op_wilson_mkrs;
		};

		deleteVehicle op_wilson;
	};
	
	case (_morra == "op_morra" && _wilson == "op_wilson"): {

//		["General",["New OP Established","Respawn at OP Morra is now available!"]] remoteExecCall ["BIS_fnc_showNotification"];
		{zeu_1 addCuratorEditableObjects [[_x],true];} forEach _op_morra_vics;
			
		_op_morra = createMarker ["op_morra_mkr", base_4];
		_op_morra setMarkerShape "ICON";
		_op_morra setMarkerType "b_hq";
		_op_morra setMarkerSize [0.5,0.5];
		_op_morra setMarkerText "OP Morra";
			
		if (!triggerActivated op_morra) then {
			{_x setMarkerColor "ColorGreen"} forEach _op_morra_mkrs;
		};
//			[_op_morra_mkrs]	call EOS_Deactivate;
		{_x setMarkerColor "ColorBlack"; _x setMarkerAlpha 0;} foreach _op_morra_mkrs;

		deleteVehicle op_morra;

//		["General",["New OP Established","Respawn at OP Wilson is now available!"]] remoteExecCall ["BIS_fnc_showNotification"];
		{zeu_1 addCuratorEditableObjects [[_x],true];} forEach _op_wilson_vics;
		
		_op_wilson = createMarker ["op_wilson_mkr", base_5];
		_op_wilson setMarkerShape "ICON";
		_op_wilson setMarkerType "b_hq";
		_op_wilson setMarkerSize [0.5,0.5];
		_op_wilson setMarkerText "OP Wilson";
		
		if (!triggerActivated op_wilson) then {
			{_x setMarkerColor "ColorGreen"} forEach _op_wilson_mkrs;
		};
//			[_op_wilson_mkrs] call EOS_Deactivate;		
			{_x setMarkerColor "colorblack"; _x setMarkerAlpha 0;} foreach _op_wilson_mkrs;

			deleteVehicle op_wilson;
	};
	
};