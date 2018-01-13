private ["_deadGuy","_theKiller","_theInstigator"];

_deadGuy = _this select 0;
_theKiller = _this select 1;
_theInstigator = _this select 2;

if ((side (group _theKiller)) != (side (group _deadGuy))) exitWith {};

if (_theKiller == vehicle player) then {
  _theKiller = _theInstigator;
};

if (_deadGuy in allPlayers && _theKiller in allPlayers) then {
  {
    if ((side (group _x)) == (side (group _deadGuy))) then {
    sideChat format ["TEAMKILL:  %1 killed %2.", _theKiller, _deadGuy];
  }; forEach allPlayers;
};