//[[2018, 3, 30, 12, 0]] call BIS_fnc_setDate;
setDate [2018, 3, 30, 12, 0]; //[YR, MO, DY, HR, MIN]
//[0.1] call BIS_fnc_setOvercast;
0 setOvercast 0.1;
//[0.1, 0.01, 0] BIS_fnc_setFog;
0 setFog [0.1, 0.01, 0];
forceWeatherChange;