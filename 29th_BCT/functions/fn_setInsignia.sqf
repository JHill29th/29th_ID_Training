if (!hasInterface) exitWith {};
private ["_theClient","_sqdParams","_theClientSquad"];

_theClient = _this;
[_theClient, ""] call BIS_fnc_setUnitInsignia;

// [[squadNick,squadName,squadEmail,squadWeb,squadPicture,squadTitle],[memberId,memberNick,memberName,memberEmail,memberIcq,memberRemark]]
_sqdParams = squadParams _theClient;
if !(count _sqdParams == 0) then {
	_theClientSquad = ((_sqdParams select 1) select 4);
};

_insigTrue = isClass (configFile >> "CfgPatches" >> "29th_Insignias");

if (_insigTrue && !(count _sqdParams == 0)) then {
	switch (_theClientSquad) do {
		case ("Bn. HQ"): {
			[_theClient, "BnHQ"] call BIS_fnc_setUnitInsignia; // apply _theClient's insignia
		};
		case ("C HQ"): {
			[_theClient, "CoHQ"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP1 HQ"): {
			[_theClient, "CP1"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP1S1"): {
			[_theClient, "CP1S1"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP1S2"): {
			[_theClient, "CP1S2"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP1S3"): {
			[_theClient, "CP1S3"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP2 HQ"): {
			[_theClient, "CP2"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP2S1"): {
			[_theClient, "CP2S1"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP1S1"): {
			[_theClient, "CP2S2"] call BIS_fnc_setUnitInsignia;
		};
		case ("CP2S3"): {
			[_theClient, "CP2S2"] call BIS_fnc_setUnitInsignia;
		};
		default {};
	};
};

_theClient_Insig = _theClient call BIS_fnc_getUnitInsignia;
_theClient_Insig