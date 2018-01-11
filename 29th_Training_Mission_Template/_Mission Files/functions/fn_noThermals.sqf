if (!hasInterface) exitWith {};
_theGuy = _this select 0 select 0;
_layer = 85125; 

if (currentVisionMode _theGuy == 2) then {
  _layer	cutText ["FLIR Mode is disallowed. Please Turn off Thermals.","BLACK",-1];
  playSound "FD_CP_Not_Clear_F";
  waituntil {currentVisionMode _theGuy != 2};
  _layer cutText ["", "PLAIN"];
};