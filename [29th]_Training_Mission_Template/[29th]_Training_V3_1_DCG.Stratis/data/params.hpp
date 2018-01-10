	class autoSpectate {  
		title = "Automatic Spectate on Respawn?";
		values[] = {1,0};
		texts[] = {"Enabled","Disabled  (Default)"};
		default = 0;
	};

	class disabledTI 
  {
		title = "Allow thermal imaging optics?";
		values[] = {0,1};
		texts[] = {"No","Yes  (Default)"};
		default = 1;
  };
	
	class dcg {
		title = "Enable Dynamic Combat Generator?";
		values[] = {0,1};
		texts[] = {"No  (Default)", "Yes"};
		default = 0;
	};
	
	class dcg_main_enemySide {
		title = "        Dynamic Combat Generator - Enemy Side";
		values[] = {0,2};
		texts[] = {"OPFOR  (Default)", "GUERILLA"};
		default = 0;
		dcg_setting = 0;
		typeName = "SIDE";
	};