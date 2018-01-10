_DCG_switch = "dcg" call BIS_fnc_getParamValue;

if (_DCG_switch == 1) then {

	_DCG_enemy_side = "dcg_main_enemySide" call BIS_fnc_getParamValue;
	
	switch (true) do {
	
		case (_DCG_enemy_side == 0): {
			dcg_main_enemySide = EAST;  //set main enemy faction side
			publicVaraible "dcg_main_enemySide";
			systemChat format ["DCG is Running.  Enemy side is: %1",(str _DCG_enemy_side)];
		};
		case (_DCG_enemy_side == 2): {
			dcg_main_enemySide = INDEPENDENT;  //set main enemy faction side
			publicVaraible "dcg_main_enemySide";
			systemChat format ["DCG is Running.  Enemy side is: %1",(str _DCG_enemy_side)];
		};
		default {
			dcg_main_enemySide = EAST;  //set main enemy faction side
			publicVaraible "dcg_main_enemySide";
			systemChat format ["DCG is Running.  Enemy side is: %1",(str _DCG_enemy_side)];
		};
		
	};
	
	dcg_main_playerSide = WEST; //set players' side
	publicVaraible "dcg_main_playerSide";
	
};
"dcg_base" setMarkerAlpha 0;