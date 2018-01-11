//
// this addAction ["<t color='#0099FF'>Sit Down</t>","Chair\sitdown.sqf","",1.5,false,true,"","((_target distance _this) < 0.5)"];
// Add ^^this^^ to the chair
//
// 42nd Seating Script (MP Compatible)
// By MAJ Bruce
// Edited by Rellikplug (FSgt. Hill [29th ID])


private ["_target"];

_target = _this select 0;

player attachTo [_target,[0,0,-0.4]]; 
//player setDir 90;
player setDir ((getDir _target) - 185); //180 default
[[ player, "HubSittingChairA_idle1" ], "switchMove" ] call BIS_fnc_MP;
sleep 0.5; //default is 2
detach player;

getup= player addAction ["<t color='#9988FF'>Stand Up</t>", {
	detach player;
	player removeAction getup; 
	[[ player, "AidlPercMstpSlowWrflDnon_AI" ], "switchMove" ] call BIS_fnc_MP;
}]; 
/*
// ================================== New better
/*https://github.com/MaDmaX1337/GamersCentral.de-AW-Invade-Annex/blob/master/scripts/sitdown.sqf

 Script Made By  MacRae    
 Modded by [KH]Jman
 Tweaked by Quiksilver for the addAction shit
 
private ["_chair","_unit"];
_chair = _this select 0; 
_unit = _this select 1; 
[[_unit, "Crew"],"QS_fnc_switchMoveMP"] spawn BIS_fnc_MP;
player setVariable ["seated",true];
_unit setPos (getPos _chair); 
_unit setDir ((getDir _chair) - 180); 
standup = _unit addaction [
	"<t color='#0099FF'>Stand Up</t>",
	"scripts\standup.sqf",
	[],
	10,
	true,
	true,
	'',
	'(player getVariable "seated")'
];
_unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) +1)];
*/