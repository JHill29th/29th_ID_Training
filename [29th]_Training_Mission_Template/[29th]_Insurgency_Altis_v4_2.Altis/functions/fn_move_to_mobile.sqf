/*==========================
Written by Rellikplug  AKA FSgt. Hill [29th ID]
==========================*/

if (!hasInterface) exitWith {};

private ["_caller","_pos"];

_caller = _this select 1;

_mrv_img = "<t color='#E56C6C' size='2.5'><img image='\A3\ui_f\data\Map\VehicleIcons\iconAPC_ca.paa'/></t><br/>";
_mrv_destroyed_msg =  "<t color='#E56C6C' size='1.5'>MRV was destroyed<br/>Wait for it to respawn</t>";
_mrv_disabled_msg =   "<t color='#F96003' size='1.5'>MRV is disabled<br/>Repair it!</t>";
_mrv_moving_msg =   "<t color='#F9C903' size='1.5'>MRV is moving<br/>Wait for it to stop</t>";

//First see if Mobile is even up...
if (!alive mrv) exitWith {hintSilent parseText format ["%1 %2",_mrv_img,_mrv_destroyed_msg];};
if (alive mrv && !canMove mrv) exitWith {hintSilent parseText format ["%1 %2",_mrv_img,_mrv_disabled_msg];};
if (speed mrv >= 2 && alive mrv) exitWith {hintSilent parseText format ["%1 %2",_mrv_img,_mrv_moving_msg];};


if (alive mrv && canMove mrv && speed mrv < 2) then {
	_pos = getPos mrv;

	_camx = _pos select 0;
	_camy = _pos select 1;
	_camz = _pos  select 2;
	
	_cam = "camera" CamCreate [_camx - 300 ,_camy + 200,_camz + 100];
	
	_cam CamSetTarget mrv;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;
	
	_cam camsetpos [_camx - 100 ,_camy + 50,_camz + 20];
	_cam CamCommit 5;
	
	_cam camsetpos [_camx + 50 ,_camy - 30,_camz + 10];
	_cam CamCommit 8;
	["Moving", "to Mobile Respawn", "Vehicle"] call BIS_fnc_infoText;

	waitUntil {camCommitted _cam;};
	titleText ["","BLACK FADED"];
	if (mrv emptyPositions "cargo" == 0) then {
		hint "No room in MRV.";
		_caller setpos [(_pos select 0) + ((random 20) - (random 20)), (_pos select 1) + ((random 20) - (random 20)), 0];
	} else {
		_caller moveInCargo mrv;
	};
		sleep 0.5;
		_cam CameraEffect ["Terminate","Back"];
		CamDestroy _cam;
		titleText ["","BLACK IN"];
};