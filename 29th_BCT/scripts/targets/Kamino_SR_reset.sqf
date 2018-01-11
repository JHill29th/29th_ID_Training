/*
hintC format ["SR Score:\n-------------\n%1",scoreSR];
sleep 5;
scoreSR = 0;
publicVariable "scoreSR";
*/
/*
_this addAction [
	"<t color='#ED2744'>Reset Lane 1</t>",
	"scripts\CQB\SR_reset.sqf",
	"srlane1",
	0,
	false,
	true,
	"",
	"((_target distance _this) < 2)"
];
*/

private ["_target","_caller","_ID","_arg"];

_target = _this select 0;
_caller = _this select 1;
_ID = _this select 2;
_arg = _this select 3;

if (_arg == "srlane1") exitWith {
		{_x animate ["terc", 0];} forEach [Target59_1,Target60_1,Target61_1,Target62_1];
	};
if (_arg == "srlane2") exitWith {
		{_x animate ["terc", 0];} forEach [Target63_1,Target64_1,Target65_1,Target66_1];
	};
if (_arg == "srlane3") exitWith {
		{_x animate ["terc", 0];} forEach [Target67_1,Target68_1,Target69_1,Target70_1];
	};
if (_arg == "srlane4") exitWith {
		{_x animate ["terc", 0];} forEach [Target71_1,Target72_1,Target73_1,Target74_1];
	};
if (_arg == "srlane5") exitWith {
		{_x animate ["terc", 0];} forEach [Target75_1,Target76_1,Target77_1,Target78_1];
	};
if (_arg == "srlane6") exitWith {
		{_x animate ["terc", 0];} forEach [Target79_1,Target80_1,Target81_1,Target82_1];
	};
if (_arg == "srall") exitWith {
		{_x animate ["terc", 0];} forEach [Target59_1,Target60_1,Target61_1,Target62_1,Target63_1,Target64_1,Target65_1,Target66_1,Target67_1,Target68_1,Target69_1,Target70_1,Target71_1,Target72_1,Target73_1,Target74_1,Target75_1,Target76_1,Target77_1,Target78_1,Target79_1,Target80_1,Target81_1,Target82_1];
	};

//  this addEventHandler ["Hit", "scoreSR = scoreSR + 1; publicVariable 'scoreSR';"];