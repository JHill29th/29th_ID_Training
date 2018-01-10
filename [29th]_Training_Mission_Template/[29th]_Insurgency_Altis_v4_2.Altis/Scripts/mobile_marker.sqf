/*==============================
Written by: Rellikplug AKA CW3 Hill
==============================*/

if (!isServer) exitWith {};

private ["_mrv_dead","_mrv_alive","_mrv_disabled"];

				_mrv_dead = createMarker ["mrv_dead", [0,0,0]];
				"mrv_dead" setMarkerType "Empty";
				"mrv_dead" setMarkerSize [0.01,0.01];
				
				_mrv_alive = createMarker ["mrv_alive", [0,0,0]];
				"mrv_alive" setMarkerType "Empty";
				"mrv_alive" setMarkerSize [0.01,0.01];
				
				_mrv_disabled = createMarker ["mrv_disabled", [0,0,0]];
				"_mrv_disabled" setMarkerType "Empty";
				"_mrv_disabled" setMarkerSize [0.01,0.01];				


				
[] spawn {
	while {true} do {
	
		if (alive mrv && canMove mrv) then {
		
			if (getMarkerType "mrv_dead" != "Empty") then {
				"mrv_dead" setMarkerPos [0,0,0];
				"mrv_dead" setMarkerType "Empty";
			};
			
			if (getMarkerType "mrv_disabled" != "Empty") then {
				"mrv_disabled" setMarkerPos [0,0,0];
				"mrv_disabled" setMarkerType "Empty";
			};
			
			if (getMarkerType "mrv_alive" != "mill_dot") then { 
				"mrv_alive" setMarkerType "mil_dot";
				"mrv_alive" setMarkerSize [0.01,0.01];
				"mrv_alive" setMarkerColor "colorGreen";
				"mrv_alive" setMarkerText " MRV";
			};
			
			"mrv_alive" setMarkerPos getPos mrv;
			
		} else {
		
			if (!canMove mrv && alive mrv) then {
			
				if (getMarkerType "mrv_dead" != "Empty") then {
					"mrv_dead" setMarkerPos [0,0,0];
					"mrv_dead" setMarkerType "Empty";
				};
				if (getMarkerType "mrv_alive" != "Empty") then {
					"mrv_alive" setMarkerPos [0,0,0];
					"mrv_alive" setMarkerType "Empty";
				};
				if (getMarkerType "mrv_disabled" != "mil_dot") then {
					"mrv_disabled" setMarkerType "mil_dot";
					"mrv_disabled" setMarkerSize [0.01,0.01];
					"mrv_disabled" setMarkerColor "colorOrange";
					"mrv_disabled" setMarkerText " MRV Disabled";
				};
				
				"mrv_disabled" setMarkerPos getPos mrv;
				
			} else {
			
				if (!alive mrv) then {
				
					if (getMarkerType "mrv_alive" != "Empty") then {
						"mrv_alive" setMarkerPos [0,0,0];
						"mrv_alive" setMarkerType "Empty";
					};
					if (getMarkerType "mrv_disabled" != "Empty") then {
						"mrv_disabled" setMarkerPos [0,0,0];
						"mrv_disabled" setMarkerType "Empty";
					};
					if (getMarkerType "mrv_dead" != "mil_dot") then {					
						"mrv_dead" setMarkerType "mil_dot";
						"mrv_dead" setMarkerSize [0.01,0.01];
						"mrv_dead" setMarkerColor "colorRed";
						"mrv_dead" setMarkerText " MRV Destroyed";
					};
					
					"mrv_dead" setMarkerPos getPos mrv;
					
				};
				
			};	
			
		};
		
	sleep 1;
	
	};
};