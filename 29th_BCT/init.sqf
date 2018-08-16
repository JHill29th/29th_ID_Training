//runs last in MP after other event scripts

/*[] spawn {
	waitUntil {time > 1.5}; wilson enableSimulation false;
};*/

enableSaving [false,false];
enableSentences false;
enableEnvironment [false,false]; //disable environment sounds
enableRadio false;
{_x setSpeaker "NoVoice"} forEach playableUnits;

if (local player) then {
	missionNamespace setVariable ['Ares_Allow_Zeus_To_Execute_Code', false];
};

//0 setGusts 0.75;

//execVM "scripts\targets\SR_moving_targets.sqf";
	
vehSpawnStand execVM "scripts\Vehicle Spawner\RP_spawnActions.sqf";

//add addActions to gear box at main parade square

{
  if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Ace Arsenal</t>", {[_this select 1, _this select 1, true] call ace_arsenal_fnc_openBox;}];
    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Transfer VA to AA</t>", {[] spawn RP_fnc_transferVAtoAA;}];
//    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Virtual Arsenal</t>", {["Open", true] spawn BIS_fnc_arsenal;}];
    _x addAction ["<t color='#004cff'>Parade Kit</t>", "scripts\gear\parade.sqf"];
    _x addAction ["<t color='#004cff'>BLUFOR Rifleman Kit</t>", "scripts\gear\blufor_rifleman.sqf"];
    _x addAction ["<t color='#e50000'>OPFOR Desert Rifleman Kit</t>", "scripts\gear\opfor_des_rifleman.sqf"];
    _x addAction ["<t color='#e50000'>OPFOR Summer Rifleman Kit</t>", "scripts\gear\opfor_wd_rifleman.sqf"];
    _x addAction ["<t color='#119600'>GRNFOR Regular Rifleman Kit</t>", "scripts\gear\grnfor_reg_rifleman.sqf"];
    _x addAction ["<t color='#009b7c'>GRNFOR Insurgent Rifleman Kit</t>", "scripts\gear\grnfor_ins_rifleman.sqf"];
  } else {
    _x addAction ["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#bf3eff'>  Virtual Arsenal</t>", {["Open", true] spawn BIS_fnc_arsenal;}];
    _x addAction ["<t color='#004cff'>Parade Kit</t>", "scripts\gear\parade.sqf"];
    _x addAction ["<t color='#004cff'>BLUFOR Rifleman Kit</t>", "scripts\gear\blufor_rifleman.sqf"];
    _x addAction ["<t color='#e50000'>OPFOR Desert Rifleman Kit</t>", "scripts\gear\opfor_des_rifleman.sqf"];
    _x addAction ["<t color='#e50000'>OPFOR Summer Rifleman Kit</t>", "scripts\gear\opfor_wd_rifleman.sqf"];
    _x addAction ["<t color='#119600'>GRNFOR Regular Rifleman Kit</t>", "scripts\gear\grnfor_reg_rifleman.sqf"];
    _x addAction ["<t color='#009b7c'>GRNFOR Insurgent Rifleman Kit</t>", "scripts\gear\grnfor_ins_rifleman.sqf"];
  };
} forEach [box_1, box_2, box_3, box_4, box_5, box_6, box_7, box_8, box_9, box_10, box_11, box_12, box_13, box_14, box_15];

rank_board addAction ["<t color='#FFCCE5'>Show Rank Board</t>", {(_this select 0) setObjectTextureGlobal [0,"pictures\ranks\rank_board.paa"];}, "", 99, true, true, "", "((getObjectTextures _target) select 0) == ''", 3];
rank_board addAction ["<t color='#FFCCE5'>Hide Rank Board</t>", {(_this select 0) setObjectTextureGlobal [0,""];}, "", 99, true, true, "", "((getObjectTextures _target) select 0) != ''", 3];

execVM "scripts\setup_teleport.sqf";

//Name Tags
if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	[] execVM "scripts\tags.sqf";
};

frrScore = 0;
//shots = 0;
//Dott's Killhouse
//nopop=true;
scoreDKH = 0;
null = [[Monitor1,Monitor2],["di","adi_1","adi_2","adi_3","adi_4","obs1","obs2","rec1","rec2","rec3","rec4","rec5","rec6","rec7","rec8","rec9","rec10","rec11","rec12","rec13","rec14","rec15"]] execVM "scripts\DottsKillhouse\LFC\feedInit.sqf";

/*
// Rolls-Gear selection
[west, "CADET"] call BIS_fnc_addRespawnInventory;
[west, "DI"] call BIS_fnc_addRespawnInventory;
[west, "ADI"] call BIS_fnc_addRespawnInventory;
[west, "OBSERVER"] call BIS_fnc_addRespawnInventory;
[east, "OPRiflemanU"] call BIS_fnc_addRespawnInventory;
[east, "OPRifleman"] call BIS_fnc_addRespawnInventory;
[east, "OPMedic"] call BIS_fnc_addRespawnInventory;
*/
{
	[_x,[-1,-2,6]] call BIS_fnc_setCuratorVisionModes; // -2 = NV, -1 = normal, 3rd number is TI see https://community.bistudio.com/wiki/setCamUseTi
	_x call BIS_fnc_drawCuratorLocations; // add location names to curators UI
} forEach allCurators;

execVM "scripts\instructorAnim.sqf";

/*=========================================================================================*/
diag_log text format["|=============================   %1  init.sqf finished=============================|", missionName];