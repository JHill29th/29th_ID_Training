		class Default
	{
		title = ""; 			// Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; 		// Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; 			// Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; 		// Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; 	// Icon and text color
		duration = 5; 			// How many seconds will the notification be displayed
		priority = 0; 			// Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; 		// Required difficulty settings. All listed difficulties has to be enabled
	};
	class General
	{
		title = "%1";
		description = "%2";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 4;
		priority = 1;
	};
	class TimeWarning
	{
		title = "Time Warning";
		description = "%1";
		iconPicture = "\a3\Modules_F_Curator\Data\portraitCountdown_ca.paa";
		color[] = {1, 0.81, 0.06, 1};
		duration = 5;
		priority = 2;
	};