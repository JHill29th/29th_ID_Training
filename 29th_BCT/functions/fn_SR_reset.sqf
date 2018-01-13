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
private ["_arg"];
_arg = _this select 3;

/*
_animSources = configProperties [configFile >> "CfgVehicles" >> typeOf <object>  >> "AnimationSources", "isClass _x", true];
{
    _animSources set [_forEachIndex, configName _x]
} foreach _animSources;
copyToClipboard str _animSources;
*/

//"a3\structures_f\training\data\target_longrange_co.paa"
//"a3\structures_f\training\data\target_figure_co.paa"
switch (true) do {
	case (_arg == "srlane1"): {
		_objType = typeOf Target59;
		_skeetPoles = [Target59,Target60,Target61,Target62];
		_posPole1 = getPosATLVisual Target59; //_dirPole1 = getDir Target59;
		_posPole2 = getPosATLVisual Target60; //_dirPole2 = getDir Target60;
		_posPole3 = getPosATLVisual Target61;// _dirPole3 = getDir Target61;
		_posPole4 = getPosATLVisual Target62; //_dirPole4 = getDir Target62;
//		_posOfPoles = _posPole1 + _posPole2 + _posPole3 + _posPole4;
		{deleteVehicle _x} forEach _skeetPoles;
		Target59 = _objType createVehicle _posPole1;
		Target60 = _objType createVehicle _posPole2;
		Target61 = _objType createVehicle _posPole3;
		Target62 = _objType createVehicle _posPole4;
		{ _x setDir 94.747 } forEach _skeetPoles;
//		{ _x setVectorDirAndUp [[1,0,0],[0,0,1]]; } forEach _skeetPoles;
//		{_x setPos ({getPos _x} forEach _skeetPoles) } forEach _skeetPoles;
	};
	case (_arg == "srlane2"): {
		{Target63 animateSource [_x, 0];} forEach ["Plate_1_source","Plate_2_source","Plate_3_source"];
		{Target63 animateSource [_x, 1];} forEach ["Plate_4_source","Plate_5_source","Plate_6_source"];
	};
	case (_arg == "srlane3"): {
		{Target64 animateSource [_x, 0];} forEach ["Plate_1_source","Plate_2_source","Plate_3_source"];
		{Target64 animateSource [_x, 1];} forEach ["Plate_4_source","Plate_5_source","Plate_6_source"];
	};
	case (_arg == "srlane4"): {
		{_x animate ["terc", 0];} forEach [Target65,Target66,Target67,Target68,Target69,Target70,Target71,Target72,Target73,Target74];
	};
	case (_arg == "srlane5"): {
		{_x animate ["terc", 0];} forEach [Target75,Target76,Target77,Target78];
	};
	case (_arg == "srlane6"): {
		{_x animate ["terc", 0];} forEach [Target79,Target80,Target81,Target82];
	};
	case (_arg == "srall"): {
		{_x animate ["terc", 0];} forEach [Target63,Target64,Target65,Target66,Target67,Target68,Target69,Target70,Target71,Target72,Target73,Target74,Target75,Target76,Target77,Target78,Target79,Target80,Target81,Target82];
	};
};

//  this addEventHandler ["Hit", "scoreSR = scoreSR + 1; publicVariable 'scoreSR';"];