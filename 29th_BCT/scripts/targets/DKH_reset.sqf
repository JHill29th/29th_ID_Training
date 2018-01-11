//  this addAction ["<t color='#ED2744'>Reset DKH</t>", "scripts\CQB\DKH_reset.sqf", "", 0, false, true, "", "((_target distance _this) < 2)"];
//  this addEventHandler ["Hit", "scoreDKH = scoreDKH + 1; publicVariable 'scoreDKH';"];

private ["_targets","_total_targets","_percentage","_sign","_time","_title","_text"];

_targets = [TR_1, TR_2, TR_3, TR_4, TR_5, TR_6, TR_7, TR_8, TR_9, TR_10, TR_11, TR_12, TR_13, TR_14, TR_15, TR_16, TR_17, TR_18, TR_19, TR_20, TR_21, TR_22, TR_23, TR_24, TR_25, TR_26, TR_27, TR_28, TR_29, TR_30, TR_31, TR_32, TR_33, TR_34, TR_35, TR_36, TR_37, TR_38, TR_39, TR_40, TR_41, TR_42, TR_43, TR_44, TR_45, TR_46, TR_47, TR_48, TR_49, TR_50, TR_51, TR_52, TR_53, TR_54, TR_55, TR_56, TR_57, TR_58, TR_59, TR_60, TR_61, TR_62, TR_63, TR_64, TR_65, TR_66, TR_67, TR_68];

_total_targets = count _targets;

_percentage = round ((scoreDKH / _total_targets) * 100);
_sign = "%";
_time = cqb_end_time - cqb_start_time;
_time = [_time,"MM:SS.MS"] call BIS_fnc_secondsToString;
hintC format ["DKH Score:\n-------------\n%1 of %2\n-------------\n%3 %4\n\nTime --  %5 ",scoreDKH,_total_targets,_percentage,_sign,_time];
//[<object>,<title>,<text>] call BIS_fnc_createLogRecord;
_title = format ["CQB:  %1", cqb_name];
_text = format ["SCORE:  %1   TIME:  %2", scoreDKH, _time];
{ [_x, _title, _text] call BIS_fnc_createLogRecord; } forEach allPLayers;

//sleep 5;

{_x animate ["terc", 1]; } forEach _targets;
cqb_end_time = 0;
publicVariableServer "cqb_end_time";
cqb_start_time = 0;
publicVariableServer "cqb_start_time";
scoreDKH = 0;
publicVariable "scoreDKH";