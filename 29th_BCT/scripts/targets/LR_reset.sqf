//  this addAction ["<t color='#ED2744'>Reset LR</t>", "scripts\targets\LR_reset.sqf", "", 0, false, true, "", "((_target distance _this) < 2)"];
//  this addEventHandler ["Hit", "scoreLR = scoreLR + 1; publicVariable 'scoreLR';"];

private ["_target","_caller","_ID","_arg"/*,"_percentage","_sign"*/];

_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_arg = _this select 3;
/*
_percentage = round ((scoreLR / 17) * 100);
_sign = "%";
hintC format ["RKH Score:\n-------------\n%1 of 17\n-------------\n%2 %3",scoreLR,_percentage,_sign];
sleep 5;
scoreRKH = 0;
publicVariable "scoreRKH";
*/
if (_arg == "right") then {
	{_x animate ["terc", 0];} forEach [Target83,Target84,Target85,Target86,Target87,Target88,Target89,Target90,Target91,Target92,Target93,Target94,Target95,Target96,Target97,Target98,Target99,Target100,Target101,Target102,Target103,Target104,Target105,Target106,Target107,Target108,Target109,Target110,Target111];
};
if (_arg == "left") then {
	{_x animate ["terc", 0];} forEach [Target113_1,Target112_2,Target113,Target113_2,Target112_1,Target113_3,Target113_4,Target120,Target121,Target112,Target114,Target115,Target117,Target116,Target119,Target118];
};