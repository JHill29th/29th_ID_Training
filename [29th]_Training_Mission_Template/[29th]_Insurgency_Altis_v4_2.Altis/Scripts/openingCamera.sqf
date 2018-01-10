waitUntil {!isNull player && {player in mrv || isTouchingGround player;};};

if (hasInterface) then {
	private ["_cam","_camx","_camy","_camz","_object"];
	
	titleText ["Altis Insurgency", "BLACK IN",9999];
	//["<t size='2' color='#2A1ADC'>29th</t><br/><t size='2' color='#2A1ADC'>I</t><t size='1.5' color='#A09FAB'>nfantry</t> <t size='2' color='#2A1ADC'>D</t><t size='1.5' color='#A09FAB'>ivision</t>",0,0,5,3] call bis_fnc_dynamictext;
	
//	playMusic "EventTrack01a_F_EPA";
	playMusic "RadioAmbient3";

	waituntil {!(isnull player)};
	sleep 1;
	
	_object = player;
	_camx = getposATL player select 0;
	_camy = getposATL player select 1;
	_camz = getposATL player select 2;
	
	_cam = "camera" CamCreate [_camx - 400 ,_camy + 400,_camz + 400];
	
	_cam CamSetTarget player;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;
	
	_cam camsetpos [_camx - 50 ,_camy + 50,_camz + 10];
	_cam CamCommit 16; //20
	sleep 4;
	playMusic "RadioAmbient5";	
	titleText ["Welcome to the 29th ID Battalion Server", "BLACK IN",5];
	["<t size='2' color='#2A1ADC'>29th</t><br/><t size='2' color='#2A1ADC'>I</t><t size='1.5' color='#A09FAB'>nfantry</t> <t size='2' color='#2A1ADC'>D</t><t size='1.5' color='#A09FAB'>ivision</t>",0,-0.2,10,4] call bis_fnc_dynamictext;
	//sleep 10;
	playMusic "RadioAmbient17";
	_cam camsetpos [_camx - 20 ,_camy + 20,_camz + 5];
	_cam CamCommit 5; //5
	sleep 4;
	//playMusic "RadioAmbient30";
	_cam camsetpos [_camx, _camy, _camz + 3];
	_cam CamCommit 2; //5
	sleep 4;

	_cam CameraEffect ["Terminate","Back"];
	_cam CamCommit 0;
	waitUntil {camCommitted _cam;};
	CamDestroy _cam;

//	waitUntil{!(isNil "BIS_fnc_init")};

	[str ("Insurgency"), str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("Altis")] call BIS_fnc_infoText;

//	sleep 1;

//	playMusic "";

	//titleText ["<t size='1.5' color='#2A1ADC'>Join us in TeamSpeak for the duration of your stay.\nts53.gameservers.com:9111\nPW:  29th\nTS info is also available in the notes on the map screen.</t>","PLAIN"]; sleep 13; titleFadeOut 2;

	["<t size='0.7' color='#000000' shadow='0'>Join us in TeamSpeak for the duration of your stay</t><br/><br/><t size='1' color='#2E0000' shadow='0'>twentyninth.ts.nfoservers.com:35750<br/>PW:  29th</t><br/><br/><t size='0.7' color='#000000' shadow='0'>TS info is also available in the notes on the map screen</t>",0,0.5,8,0] call bis_fnc_dynamictext;
};