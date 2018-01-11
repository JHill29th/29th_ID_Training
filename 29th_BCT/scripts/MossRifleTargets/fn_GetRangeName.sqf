/*
	Author: Mossarelli

	Description:
	Function to get the name of the range from the array in the file RangeNamesConfig.sqf

	Parameter(s):
	Uses Logic names as objects to store the variable on.
	
	Returns:
	N/A
*/

#include "RangeNamesConfig.sqf"

{
	(_x select 0) setVariable ["MossRangeNumber",(_x select 1),true];
} foreach Moss_ListOfLanes;