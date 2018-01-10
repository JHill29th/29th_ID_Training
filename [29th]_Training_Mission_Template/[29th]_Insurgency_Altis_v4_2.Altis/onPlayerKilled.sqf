_oldUnit = _this select 0;
_killer = _this select 1;
_respawn = _this select 2;
_respawnDelay = _this select 3;

	//////////////////////////////////////////////////////////////////////////
	//START EARPLUGS CODE

	5 fadeSound 1;
	earplugsout = true;
	if (!isNil "inCaseOfDeath") then {
		removeAllActions inCaseofDeath;
		inCaseofDeath setVariable ["HasEarplugMenu","hasNoMenu"];
	};
	if (!isNil "theOneTrueName") then {
		removeAllActions theOneTrueName;
		theOneTrueName setVariable ["HasEarplugMenu","hasNoMenu"];
	};
	
	player setVariable ["Has_EPEH_Loop", "Yep"];
	//systemChat "Diablo's minions grow stronger...";
	if (!isNil "cmKeyPress") then {
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", cmKeyPress];
	};
	//cmEARPLUGS CODE END
	//////////////////////////////////////////////////////////////////////////