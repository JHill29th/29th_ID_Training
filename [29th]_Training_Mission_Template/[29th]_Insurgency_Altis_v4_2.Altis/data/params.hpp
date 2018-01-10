	class TimeOfDay 
	{
	//paramsarray [0]
    title = "Time of Day";
    texts[] = {"0000","0100","0200","0300","0400","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300"};
    values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
    default = 5;
//		isGlobal = 1;
	};

	class Weather 
	{
		//paramsarray [1]
		title = "Weather";
		texts[] = {"Clear", "Stormy", "Cloudy", "Foggy"};
		values[] = {1,2,3,4};
		default = 1;
	};
	
	class TimeAcceleration
	{
		title = "Time Acceleration";
		texts[] = {"None","x2","x4","x6","x8","x10","x20","x60"};
		values[] = {1,2,3,4,5,6,7,8};
		default = 6;
	};
	
		class typeAI
	{
		title="Type of Enemy";
		texts[]={"Regular Forces","Insurgents"};
		values[]={0,1};
		default=1;
	};
	
		class noThermals
	{
		title="Thermal Imaging Optics";
		texts[]={"Off","On"};
		values[]={0,1};
		default=0;
	};
	
		class outPosts
	{
		title="Start with OPs?";
		texts[]={"No","Yes"};
		values[]={0,1};
		default=1;
	};

	class headlessClient
	{
		title="Headless Client";
		texts[]={"Disabled","Enabled"};
		values[]={0,1};
		default=1;
	};