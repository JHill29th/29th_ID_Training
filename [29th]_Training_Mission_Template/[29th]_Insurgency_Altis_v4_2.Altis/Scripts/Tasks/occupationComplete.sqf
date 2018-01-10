if (!isServer) exitwith {};
sleep 1;
_eosMarkers=server getvariable "EOSmarkers";
{
waituntil {getMarkerColor _x == "ColorGreen";};
}foreach _eosMarkers;

["Task1","succeeded"] call SHK_Taskmaster_upd;

["Altis has been secured. Great Job. Thank you for playing on the 29th Infantry Division Battalion Server",True,true] call BIS_fnc_endMission;
forceEnd;