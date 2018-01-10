// https://forums.bistudio.com/topic/166808-making-placed-units-be-editable-for-every-zeus/page-2#entry2904634
{    _x addEventHandler ["CuratorGroupPlaced",{[_this,"FETT_fnc_grpPlaced",false] spawn BIS_fnc_MP}];
    _x addEventHandler ["CuratorObjectPlaced",{[_this,"FETT_fnc_objPlaced",false] spawn BIS_fnc_MP}];
} forEach allCurators;  