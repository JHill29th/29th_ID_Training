/*
	Author: Mossarelli

	Description:
	Function called by the sign with the actions to reset the shooter's score.

	Parameter(s):
		0: The name of the object the Action is on.
		1: Object using the action
		2: ID of the Action being UsedIt
		3: Additional Parameters
*/

private ["_name","_caller","_id","_params"];
_name = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_params = _this select 3;

//Reset score.
player setVariable ["MossShooterScoreInfo",[player],false];

//Only local message.
systemChat "Your score has been reset.";