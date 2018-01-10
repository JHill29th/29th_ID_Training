if !(hasInterface) exitWith {};

private ["_theClient"];

	_theClient = _this select 0;
	
	waitUntil {time > 5};
	
	switch (true) do {
		case (groupID (group _theClient) == "BN HQ"): {
			[ _theClient, "BnHQ" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true]; // apply player's insignia globally
//			_Insignia = [_theClient] call BIS_fnc_getUnitInsignia; 
//			_theClient setVariable ["Insignia", _Insignia];
		};
		case (groupID (group _theClient) == "Charlie HQ"): {
			[ _theClient, "CoHQ" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true]; 
		};
		case (groupID (group _theClient) == "CP1 HQ - Charlie 1"): {
			[ _theClient, "CP1" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP1S1 - Charlie 1-1"): {
			[ _theClient, "CP1S1" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP1S2 - Charlie 1-2"): {
			[ _theClient, "CP1S2" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP1S3 - Charlie 1-3"): {
			[ _theClient, "CP1S3" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP2 HQ- Charlie 2"): {
			[ _theClient, "CP2" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP2S1 - Charlie 2-1"): {
			[ _theClient, "CP2S1" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP1S1 - Charlie 2-2"): {
			[ _theClient, "CP2S2" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		case (groupID (group _theClient) == "CP2S3 - Charlie 2-3"): {
			[ _theClient, "CP2S2" ] remoteExec [ "BIS_fnc_setUnitInsignia",0,true];
		};
		default {};
	};