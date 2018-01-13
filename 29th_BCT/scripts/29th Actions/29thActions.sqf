/*===============================================================================
=		\/RP		by: Rellikplug		\/RP																			=
================================================================================*/

if (isDedicated) exitWith {};

waitUntil {
	!(isNull player) && 
	{(player == player)} &&
	{!isNil "BIS_fnc_init"}
};
	
 //MP chat functions: side and global
RP_fnc_mpGlobalChat = {
     (_this select 0) globalChat (_this select 1);
};

RP_fnc_mpSideChat = {
     (_this select 0) sideChat (_this select 1);
};

	//Salute
	RP_fnc_salute = {
		player addAction [
			"<img image='pictures\29.paa' /><t color='#4cccd1'>  *Salute*</t>",
			"scripts\29th Actions\salute.sqf",
			"",
			-95,
			false,
			true,
			"Salute",
			""
		];
		nil  // -- This (now) called function doesn't need to return anything. So lets return "void" so we know exactly what the return is (or isn't in our case).
	};

	//Push-ups!
	RP_fnc_pushups = {
		player addAction [
			"<img image='pictures\29.paa' /><t color='#4cccd1'>  Push-ups</t>",
			"scripts\29th Actions\pushups.sqf",
			"",
			-96,
			false,
			true,
			"",
			""
		];
		nil
	};

	//At-Ease!
	RP_fnc_attention = {
		player addAction [
			"<img image='pictures\29.paa' /><t color='#4cccd1'>  Attention</t>",
			"scripts\29th Actions\attention.sqf",
			"",
			-95,
			false,
			true,
			"",
			"!(currentWeapon _target == '')"
		];
		nil
	};

	// Init
	[] spawn RP_fnc_salute;
	player addEventHandler ["Respawn", {
		[] spawn RP_fnc_salute;
	}];

	[] spawn RP_fnc_pushups;
	player addEventHandler ["Respawn", {
		[] spawn RP_fnc_pushups;
	}];

	[] spawn RP_fnc_attention;
	player addEventHandler ["Respawn", {
		[] spawn RP_fnc_attention;
	}];

	//  event handler removes actions from players dead body. (_this select 0)=killed, (_this select 1)=Killer

	player addEventHandler ["Killed", {
		removeAllActions (_this select 0);
	}];
