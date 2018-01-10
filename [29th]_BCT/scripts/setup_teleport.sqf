//add addActions to flag poles
{
	if ( _x != barracks_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Barracks</t>",RP_fnc_teleport,["barracks"]];
	};
	if (_x != kh_flag || _x != kh_flag_2) then {
		_x addAction ["<t color='#FFFF00'>Teleport to CQB Range</t>",RP_fnc_teleport,["shoothouse"]];
	};
	if !(_x == grRange_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Grenade Range</t>",RP_fnc_teleport,["grenade"]];  
	};
	if !(_x == obstacle_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Obstacle Course</t>",RP_fnc_teleport,["obstacle"]];  
	};
	if !(_x == srRange_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to SR Firing Range</t>",RP_fnc_teleport,["srrange"]];  
	};
	if !(_x == kamLrRange_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Kamino Firing Range</t>",RP_fnc_teleport,["kamino"]];  
	};
	if !(_x == quals_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Qualifications Range</t>",RP_fnc_teleport,["qual"]];  
	};
	if !(_x == moPool_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Motor Pool</t>",RP_fnc_teleport,["vehSpawn"]];  
	};
	if !(_x == berring_flag) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Bearing Training</t>",RP_fnc_teleport,["compass"]];  
	};
//	if !(_x == airDisp_flag) then {
//		_x addAction ["<t color='#FFFF00'>Teleport to Aircraft Display</t>",RP_fnc_teleport,["aircraft"]]; 
//	};
//	if !(_x == marina_flag) then {
//		_x addAction ["<t color='#FFFF00'>Teleport to Marina</t>",RP_fnc_teleport,["marina"]]; 
//	};
//	if !(_x == dive_flag) then {
//		_x addAction ["<t color='#FFFF00'>Teleport to Diving Range</t>",RP_fnc_teleport,["diving"]];
//	};
} forEach [barracks_flag, obstacle_flag, srRange_flag, grRange_flag, berring_flag, kh_flag, kh_flag_2, quals_flag, moPool_flag, dive_flag, airDisp_flag, marina_flag, milRange_flag, kamLrRange_flag, opforBase_flag];

{
	if !(_x == camp_map) then {
		_x addAction ["<t color='#FFFF00'>Teleport to Barracks</t>",RP_fnc_teleport,["barracks"]];
	};
	if !(_x == cmpMaxwell_flag) then {
		_x addAction ["<t color='#FFFF00'>Camp Maxwell</t>",RP_fnc_teleport,["maxwell"]]; 
	};
	if !(_x == cmpRogain_flag) then {
		_x addAction ["<t color='#FFFF00'>Camp Rogain</t>",RP_fnc_teleport,["rogain"]]; 
	};
	if !(_x == kf_flag) then {
		_x addAction ["<t color='#FFFF00'>The Kill Farm</t>",RP_fnc_teleport,["killfarm"]]; 
	};
	if !(_x == spartan_flag) then {
		_x addAction ["<t color='#FFFF00'>The Spartan</t>",RP_fnc_teleport,["spartan"]]; 
	};
	if !(_x == milRange_flag) then {
		_x addAction ["<t color='#FFFF00'>Military Range</t>",RP_fnc_teleport,["militaryrange"]]; 
	};
	if !(_x == am26_flag) then {
		_x addAction ["<t color='#FFFF00'>Air Station Mike 26</t>",RP_fnc_teleport,["asm26"]]; 
	};
	if !(_x == lzConnor_flag) then {
		_x addAction ["<t color='#FFFF00'>LZ Connor</t>",RP_fnc_teleport,["connor"]]; 
	};
	if !(_x == cmpTempest_flag) then {
		_x addAction ["<t color='#FFFF00'>Camp Tempest</t>",RP_fnc_teleport,["tempest"]];
	};
} forEach [camp_map, cmpMaxwell_flag, cmpTempest_flag, spartan_flag, lzConnor_flag, am26_flag, cmpRogain_flag, kf_flag];