[] spawn {
	_markers = ["orbit1","orbit2","orbit3","orbit4","orbit5","orbit5_1"];
	_randomMarker = _markers select (floor (random (count _markers)));
	_pos = getMarkerPos _randomMarker;
	
	[_pos,//location
		"Welcome to the 29th Infantry Division Basic Combat Training",//Message
		45,//Altitude
		45,//Radius in metres
		180,//viewing angle in deg
		0,//Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
		[]
	] spawn BIS_fnc_establishingShot;   
};