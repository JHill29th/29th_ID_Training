/*
	Author: Mossarelli

	Description:
	PreInits variables that the other functions needs.
*/

//Assign the initial variables to player.
player setVariable ["MossShooterScoreInfo",[player],false];
player setVariable ["MossPlayerLogicName","",false];
player setVariable ["MossShooterCamera","",false];

MOSS_TargetMarkers = true; //Enable the Orange markers on the target.
MOSS_TargetMarkerAliveTime = 5; //How long will the orange marker be shown.

//MOSS_RifleOnTable = "arifle_MX_f"; //The rifle to put on the table.
//MOSS_Magazine = "30Rnd_65x39_caseless_mag"; //The magazine to put in the box.
//MOSS_Box = "Box_NATO_Ammo_F"; //The box.

//These two must be two different objects.
MOSS_TargetObject = "SignAd_Sponsor_ARMEX_F"; //Type of Object for the target. Important for the init of the logic.
//MOSS_MonitorObject = "SignAd_Sponsor_ION_F"; //Type of Object for the Camera Monitor. Important for the init of the logic.


MOSS_SignObject = "Land_InfoStand_V2_F"; //Type of Object for the sign. Important for the init of the logic.
MOSS_NumberSignObject = "UserTexture1m_F"; //Type of Object for the Number Sign. Important for the init of the logic.
MOSS_TableObject = "Land_CampingTable_small_F"; //Type of Object for the sign. Important for the init of the logic.

MOSS_TargetHeighOffset = 81; //Because center of the signs height is not center of the paper target's center, an offset must be used.

MOSS_ShowAverages = true; //Show the average score in the score message.

//Debug variable to get information from the scripts
MOSS_DEBUG = false;