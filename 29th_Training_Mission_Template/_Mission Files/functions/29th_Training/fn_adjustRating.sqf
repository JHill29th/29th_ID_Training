params ["_ratingToSet","_unit"];

_setVal = (rating _unit) * 0;
_addVal = _setVal + _ratingToSet;

_unit addRating _addVal;

/*_getRating = rating _unit;
_addVal = 350 - _getRating;
_unit addRating _addVal;*/
_getNewRating = rating _unit;
[_unit,_getNewRating]