/*
	Author: Mossarelli

	Description:
	Function called by the sign with the actions to calculate and show score on targets.

	Parameter(s):
		0: The name of the object the Action is on.
		1: Object using the action
		2: ID of the Action being Used
		3: Additional Parameters

	Returns:
	Nothing, but shows score in game.
*/

private ["_name","_caller","_id","_params"];
_name = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_params = _this select 3;

//Get Distance from center array information.
_bulletinfo = player getVariable "MossShooterScoreInfo";
//Initiate variables used in next scope.
_score = 0;
_scoreinfo = "";

//Default array contains only one object which is the player name. The player needs to shoot at least one target once in order to start calculating score.
if (isNil "_bulletinfo" /*(count _bulletinfo) == 1*/) exitWith { systemChat "There is no score to show. Register shooter then shoot at the targets then show score."; };

/*
The next object has been calibrated for the default target used in the script called T_1.jpg. If you for some reason do not like this target and want to use your own, you can easily edit the script below to add your own scoring.
*/
{
	if (_forEachIndex > 0) then //The first object in the index will always be an array with the object player. So naturally we want to skip this index.
	{	
		_bulletFromCenter = _x select 0; //This is the calibrated distance from the center of target that the bullet hit.
		_bulletOnTarget = _x select 1; //This variable is used in case the player hits the target on the model that is not the target area. It was used for pop up targets when hitting the metal box which does not count as a hit but the game would turn the target down anyway.
		
		_bulletscore = 0; //Init the variable so it can be passed from the next scope.
		
			if (_bulletFromCenter > 0) then //The first one in the list is the center hit.
			{
				_bulletscore = 3;
			};
			if (_bulletFromCenter > 17) then //To add more scores, just calibrate the new target by shooting at it with the DEBUG variable set to true, then input the new distance from center value here and then edit the score to what you want.
			{
				_bulletscore = 2;
			};
			if (_bulletFromCenter > 31) then
			{
				_bulletscore = 1;
			};
			if (_bulletFromCenter > 48) then //Last check is outside the whole area which is counted as zero points. It's used for hitting the rim, the legs or the big white area outside the circle.
			{
				_bulletscore = 0;
			};
			_score = _score + _bulletscore;
	};
} foreach _bulletinfo;

//Format the score message. Change the test variable in MainInit.
if (MOSS_ShowAverages) then
{
	//With average
	if (_score > 0) then { //Line added by Hill [29th ID] aka rellikplug
		_scoreinfo = format ["%1 with Average: %2 in %3 rounds",_score,(_score / ((count _bulletinfo) - 1)),((count _bulletinfo) - 1)];
	} else { //Line added by Hill [29th ID] aka rellikplug
		_scoreinfo = format ["%1, with %2 rounds",_score,((count _bulletinfo) - 1)]; //Line added by Hill [29th ID] aka rellikplug
	}; //Line added by Hill [29th ID] aka rellikplug
} else {
	//Without average
	_scoreinfo = format ["%1, with %2 rounds",_score,((count _bulletinfo) - 1)];
};

if (!isNil "_bulletinfo") then { //Line added by Hill [29th ID] aka rellikplug
	//Broadcast score
	call compile format
	[
		'
			[ { systemChat "%1: %2 score is %3."; }, "BIS_fnc_Spawn", true, false, false ] call BIS_fnc_MP;
		',(_params getVariable "MossRangeNumber"),(name _caller),_scoreinfo
	];

//8 Lines below added by Hill [29th ID] aka rellikplug
//Show lane score info in mission log accessed via map screen
//[<object>,<title>,<text>] call BIS_fnc_createLogRecord;
	if ((count _bulletinfo) > 1) then {
		_title = format ["%1",(_params getVariable "MossRangeNumber")];
		_text = format ["%1 score is %2.",(name _caller),_scoreinfo];
		{[_x,_title,_text] call BIS_fnc_createLogRecord;} forEach allPLayers;
	};
};