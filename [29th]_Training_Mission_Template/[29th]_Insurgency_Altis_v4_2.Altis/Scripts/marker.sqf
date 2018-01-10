if (!isServer) exitWith {};
private ["_vehicle","_marker","_text"];
// Define variables
 	_vehicle = _this select 0; // Vehicle/Object
	_text = if (count _this > 1) then {_this select 1} else {format ["%1",_vehicle];}; // marker Text
	_displayHints = if (count _this > 2) then {_this select 2} else {false}; // Display Hints?
	_displayDestroyed = if (count _this > 3) then {_this select 3} else {false}; // Show Destroyed marker?	
	_markerType = if (count _this > 4) then {_this select 4} else {"b_support"}; // Mobile Marker type
	_markerColor = if (count _this > 5) then {_this select 5} else {"ColorWEST"}; // Mobile color
	_disabledMarker = if (count _this > 6) then {_this select 6} else {"b_maint"}; // Disabled Marker type
	_disabledColor = if (count _this > 7) then {_this select 7} else {"ColorBlack"}; // Disabled marker color
	_destroyedType = if (count _this > 8) then {_this select 8} else {"hd_destroy"}; // destrotyed marker type
	_destroyedColor = if (count _this > 9) then {_this select 9} else {"ColorRed"}; // destroyed color
	_marker = format ["%1",_vehicle]; // format vehicle name for marker name
	_hintFixed = FALSE; // set to false until after vehicle becomes disabled
	_hintDisabled = _displayHints; // Will hints be displayed, true or false?

	_markerstr = createMarker [_marker, position _vehicle]; // Create new Marker
	_markerstr setMarkerShape "ICON"; // Set Shape
	
while {(alive _vehicle)} do { // If victor is alive, loop script
	_marker setMarkerPos getPos _vehicle; // Set Marker Position to Object/Vehicle

//	hint format ["Marker %1 attached to vehicle %2", _marker, _vehicle]; //Debugging, continuous hint while alive
	
		if (!canMove _vehicle) then { // if the vehicle cant move then
			_marker setMarkerType _disabledMarker; // set marker type
			_marker setMarkerColor _disabledColor; // Set color
			_marker setMarkerText format ["%1 Disabled",_text]; // Set Text
				if (_hintDisabled) then { // Display disabled hint?
					hint format ["%1 Has Been Disabled",_text]; // Hint vehicle disabled
					_hintDisabled = false; // set hinting to false to stop it from repeating
					_hintFixed = _displayHints; }; // set fixed hinting to variable
		} else  { // change marker back when fixed
			_marker setMarkerType _markerType; // Set Type
			_marker setMarkerColor _markerColor; // Set Color
			_marker setMarkerText format ["%1 Mobile",_text]; // Set Text
				if (_hintFixed) then { // Display disabled hint?
					hint format ["%1 Has Been Repaired",_text]; // Hint vehicle disabled
					_hintDisabled = _displayHints; // set disabled hinting back to variable
					_hintFixed = false; // set hinting to false to stop it from repeating
				}; // Close if hintFixed
		}; // close else
	sleep 3; // Timer for Marker/Loop Refresh 
	}; // close while

if (_displayDestroyed) then { // Is the destroyed marker being displayed?
	_marker setMarkerType _destroyedType; // If so, set type
	_marker setMarkerColor _destroyedColor; // Set color
	_marker setMarkerText format ["%1 Destroyed",_text]; } else { // Set Text
	deleteMarker _marker; };// Delete marker if not displayed

if (_displayHints) then { // Display destruction hint?
	Hint format ["%1 Has Been Destroyed",_text];}; // Hint the destruction