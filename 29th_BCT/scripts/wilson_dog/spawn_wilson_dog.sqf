waitUntil {!isNil "BIS_fnc_init"};
waitUntil {time > 0.1};

private ["_leader"];

if (isNil "di") then {waitUntil {!isNil "di"};};
if !(isNil "di") then {

	_state = "wait";

	wilson = createAgent ["Alsatian_Sandblack_F", getMarkerPos "dog_marker", [], 0, "NONE"];
	wilson setVariable ["BIS_fnc_animalBehaviour_disable", true];
	wilson setVariable ["state",_state];
	wilson allowDamage false;
	
	if (isNil {wilson getVariable "leader"}) then {		//--- for the first time in formation
			_leader = objNull;
	};
	if (isNull _leader) then {		//I am new leader of my own formation (there is no animal with defined leader around)
		_leader = wilson;
		wilson setVariable ["leader",_leader];
		wilson setVariable ["members",[]];
		_members = _leader getVariable ["members",[]];
		_leader setVariable ["members",_members + [wilson]];
	};

 
	0 = [wilson] spawn {
//		params ["wilson"];
		
		wilson playMove "Dog_Idle_Stop";
		
		while {alive wilson} do {
		
//			wilson moveTo getPos di;
			
			wilson playMove "Dog_Sit";
			sleep 100;
			wilson playMove "Dog_Idle_Stop";
			sleep 4;
		};
	};
};