/*
condition = this && count thisList == 1 && !(cqb_go);
on Activation = null = [] spawn { sleep 4; cqb_start_door setPos [0,0,0]; hintSilent "GO GO"; cqb_start_time = diag_tickTime; publicVariableServer "cqb_start_time"; };

after start i.e next trigger
on Activation = cqb_start_door setPos [1679.18,5111,3.4];
*/

_triggerList = _this select 0;
{
	if (_x isKindOf "Man") then {
		cqb_name = name _x;
//		_x setVariable ["DKH_score", 0, true];
	};
} forEach _triggerList;

doorStartPos = getPosATL cqb_start_door;

sleep 4;
cqb_start_door setPos [0,0,0];
"GO GO" remoteExec ["hint", 0];
//hintSilent "GO GO";
cqb_start_time = diag_tickTime;
publicVariableServer "cqb_start_time";