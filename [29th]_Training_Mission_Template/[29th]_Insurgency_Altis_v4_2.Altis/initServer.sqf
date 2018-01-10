diag_log text "";
diag_log text format["|=============================   %1   =============================|", missionName];
diag_log text "";

["Initialize", [true]] call BIS_fnc_dynamicGroups;

_TimeAcceleration = "TimeAcceleration" call BIS_fnc_getParamValue;
_Weather = "Weather" call BIS_fnc_getParamValue;
_TimeOfDay = "TimeOfDay" call BIS_fnc_getParamValue;
outPosts = "outPosts" call BIS_fnc_getParamValue;

cleaner = [10,120,false] spawn RP_fnc_cleaner; //[<amount of dead bodies and vics allowed>,<cycle time>,<debug on/off>]
//null=[] execVM "Scripts\BaseVehicleProtection.sqf"; //base vehicle protection
hc_init = execVM "HC\hc.sqf";

//{zeu_1 addCuratorEditableObjects [[_x],true]} forEach vehicles;

/*============= Parrams settings ===========*/
//for time of day ("select 0" is from description.ext class Params )
skipTime ((_TimeOfDay - daytime + 24) % 24);

//weather ("select 1" is from description.ext class Params )
switch (_Weather) do {
	case 1: { 0 setOvercast 0; 0 setRain 0; 0 setFog 0; forceWeatherChange; }; //clear
	case 2: { 0 setOvercast 1; 0 setRain 1; 0 setFog [0.001,-0.14,200]; setWind [10, 15, false]; 0 setGusts 0.5; 1800 setWindForce 1; forceWeatherChange; }; //stormy
	case 3: { 0 setOvercast 0.68; 0 setRain 0; 0 setFog 0.2; forceWeatherChange; }; //cloudy
	case 4: { 0 setOvercast 0.4; 0 setRain 0; 0 setFog [0.75,0.09,10]; forceWeatherChange; }; //foggy
};

//time multiplier
switch (_TimeAcceleration) do {
	case 1: {setTimeMultiplier 0}; //no time acceleration
	case 2: {setTimeMultiplier 2}; //x2
	case 3: {setTimeMultiplier 4}; //x4
	case 4: {setTimeMultiplier 6}; //x6
	case 5: {setTimeMultiplier 8}; //x8
	case 6: {setTimeMultiplier 10}; //x10 - Default
	case 7: {setTimeMultiplier 20}; //x20
	case 8: {setTimeMultiplier 60}; //x60
	};

//oputposts
if (outPosts == 1) then {
	["op_morra","op_wilson"] call RP_fnc_opSetUp;
};
/*============= Parrams settings ===========*/