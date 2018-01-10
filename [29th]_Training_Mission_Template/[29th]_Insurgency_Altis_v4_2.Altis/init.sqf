//enemy spawn and mission completion
null=[] execVM "eos\OpenMe.sqf";
null=[] execVM "Scripts\Tasks\occupationComplete.sqf";

//cmEARPLUGS CODE START
call compile preProcessFileLineNumbers "cmEarplugs\config.sqf";

//magRepack
[] execVM "outlw_magRepack\MagRepack_init_sv.sqf";

//mobile marker by Rellikplug
[] execVM "Scripts\mobile_marker.sqf";
/*
//functions for vehicle respawn modules, by type
//if (isServer) then {
	RP_fnc_TransHelo_Respawn =
		{
		_this addaction["<t color='#FF8000'>Virtual Arsenal</t>", {["Open", true] call BIS_fnc_arsenal},[],1.5,true,true,"","(isTouchingGround _target && speed _target <= 0.5)"];
//		_this addAction["<t color='#FF0080'>Save Gear for Respawn</t>","Scripts\RP_fnc_saveLoadInventory.sqf"];
		nul=[] execVM "IntLight.sqf";
		};

	RP_fnc_Slammer_Respawn =
		{
		nul=[] execVM "IntLight.sqf"; clearWeaponCargoGlobal _this;
		};

	RP_fnc_ServiceVehAmmo_Respawn =
		{
		_this addaction["<t color='#FF8000'>Virtual Arsenal</t>", {["Open", true] call BIS_fnc_arsenal},[],1.5,true,true,"","(speed _target <= 0.5)"];
//		_this addAction["<t color='#FF0080'>Save Gear for Respawn</t>","Scripts\RP_fnc_saveLoadInventory.sqf"];
		};
	
	RP_fnc_MobileRespawn_Respawn = //MVR
		{
		_this addaction["<t color='#FF8000'>Virtual Arsenal</t>", {["Open", true] call BIS_fnc_arsenal},[],1.5,true,true,"","(speed _target <= 0.5)"];
//		_this addAction["<t color='#FF0080'>Save Gear for Respawn</t>","Scripts\RP_fnc_saveLoadInventory.sqf"];
		nul=[] execVM "IntLight.sqf";
		};
//};
*/	
//Generic Vehicle Service
execVM "gvs\gvs_init.sqf";

//SHK Pos init
call compile preProcessFile "eos\functions\SHK_pos\shk_pos_init.sqf";

//add move to MRV action to three flags at base
{
	_x addAction ["<img image='\A3\ui_f\data\Map\VehicleIcons\iconAPC_ca.paa'/><t color='#ED2744'>  Teleport to MRV</t>", "call RP_fnc_move_to_mobile"];
	_x addAction["<img image='\A3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa'/><t color='#ff9900'>  HALO jump</t>", "ATM_airdrop\atm_airdrop.sqf"]
} forEach [base_1,base_2,base_3,base_4,base_5];

//null=[] execVM "Scripts\cleaner.sqf"; //base discarded object cleaner