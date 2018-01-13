private ["_group","_group_less_instructors","_group_instructors"];
_group = [man1,man2,man3,man1_1,man1_2,man1_3,man1_4,man1_5,man2_1,man2_2,man3_1,man3_2];
_group_less_instructors = [man1_1,man1_2,man1_3,man1_4,man1_5,man2_1,man2_2,man3_1,man3_2];
//_animation_sets = [["LISTEN_BRIEFING", "ASIS"],["GUARD", "ASIS"]];
//_anim = _animation_sets call BIS_fnc_selectRandom;
_group_instructors = [man1,man2,man3];
/*
{
	[_x, "BRIEFING_POINT_LEFT", "ASIS"] call BIS_fnc_ambientAnim;
} forEach [man1,man2,man3];
*/
/*{
	[_x, "LISTEN_BRIEFING", "ASIS"] call BIS_fnc_ambientAnim;
} forEach [man1_1,man1_2,man1_4,man2_1,man3_1];*/

{
	if (!isNil "_x") then {
		[_x, "GUARD", "ASIS"] call BIS_fnc_ambientAnim;
	};
} forEach _group_less_instructors;

{
	if (isClass (configFile >> "CfgPatches" >> "29th_Insignias")) then {
		if (!isNil "_x") then {
			[_x, ""] call BIS_fnc_setUnitInsignia;
			[_x, "CoHQ"] call BIS_fnc_setUnitInsignia;
		};
	};
} forEach _group;

{
	if (!isNil "_x") then {
		_x disableAi "ANIM";
		[[[_x], { (_this select 0) switchMove "HubBriefing_lookAround1"; }], "BIS_fnc_spawn", nil, true] call BIS_fnc_mp;
	};
} forEach _group_instructors;