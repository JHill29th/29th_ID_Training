[

[["Task1","Eliminate Insurgents in Altis","Clear all the red squares of enemy. The squares are light red until you get within a certain distance, the square turns dark red and the enemy spawns.<br/>
Eliminate all the enemy and be inside the square and it will turn green. Turn all the squares green and the mission will restart.<br/>
<br/>
Good luck and happy hunting."]],

[

// -------------Server Rules -------------------
[
	"Call Signs",
	"Air Transport Assets:
	<br/>
	MH-9 Hummingbird - 'RoadRunner'
	<br/>
	UH-80 Ghosthawk - 'Falcon'
	<br/>
	Huron - 'AirBus'
	<br/><br/>
	Close Air Support Assets:
	<br/>
	AH-99 Blackfoot - 'SledgeHammer'
	<br/><br/>
	Armor Assets:
	<br/>
	M2A1 Slammer - 'Sword'
	<br/>
	FV-720 Mora - 'Deputy'
	<br/>
	M4 Scorcher - 'SteelRain'
	"
	,true
],

[
	"Radio Frequencies - OFFLINE",
	"
	Ground Forces
	<br/>
	AN/PRC 152: Channel 1 (Frequency 30.1)
	<br/><br/>
	Air Assets
	<br/>
	RT-1523G (ASIP): Channel 2 (Frequency 40.1)
	<br/><br/>
	Armor Assets
	<br/>
	RT-1523G (ASIP): Channel 3 (Frequency 50.1)
	<br/><br/>
	Special Operations Forces
	<br/>
	AN/PRC 152: Channel 4 (Frequency 60.1)
	<br/><br/>
	JTAC Personnel
	<br/>
	RT-1523G (ASIP): Channel 5 (Frequency 70.1)
	"
	,true
]

]
] execvm "Scripts\taskmaster.sqf";

player createDiarySubject ["29th", "29th ID Info"];

player createDiaryRecord ["29th",

[
	"Server Info",
	"
	Game Server Name:
	<br/>
	29th ID A3 Battalion Server
	<br/><br/>
	Game Server IP:
	<br/>
	74.91.123.18
	<br/><br/>
	Game Server Port:
	<br/>
	2302
	<br/><br/><br/>
	TeamSpeak 3 host-name and port:
	<br/>
	twentyninth.ts.nfoservers.com:35750
	<br/><br/>
	TeamSpeak Password:
	<br/>
	29th
	<br/><br/>
	Website:
	<br/>
	www.29th.org
	"
]];

player createDiaryRecord ["29th",

[
	"29th ID Info",
	"
	<img image='BlueAndGreyA.paa' width='244' height='244'/>
	<br/><br/>
	The 29th Infantry Division is a realism gaming unit that focuses on squad tactics and communication. We train in both COOP and PvP environments. We welcome you to join us on our Teamspeak server for the duration of your visit.
	<br/><br/>
	The 29th Infantry Division is a ~400 member unit. We are actively recruiting candidates ages 15 and older.
	<br/><br/>
	We welcome mature individuals interested in team-play. 	Those interested in enlisting, please contact any current 29th ID personnel or for more information and to start your enlistment process visit www.29th.org/enlist for details.
	<br/>
	"
]];

player createDiarySubject ["TS", "TeamSpeak 3"];

player createDiaryRecord ["TS",

[
	"TeamSpeak 3 Information",
	"
	We welcome you to join us in TeamSpeak for the duration of your stay.
	<br/><br/>
	Host-name and port:
	<br/>
	twentyninth.ts.nfoservers.com:35750
	<br/><br/>
	Password:
	<br/>
	29th
	<br/>
	"
]];

player createDiarySubject ["Rules", "Rules and Regs."];

player createDiaryRecord ["Rules",

[
	"Rules of Engagement",
	"
	- You have the right to use force to defend yourself against attacks or threats of attack.
	<br/><br/>
	- Hostile fire may be returned effectively and promptly to stop a hostile act.
	<br/><br/>
	- When U.S. Forces are attacked by unarmed hostile elements, mobs, and/or rioters, U.S. Forces should use the minimum force necessary under the circumstances and proportional to the threat.
	<br/><br/>
	- You may not seize the property of others to accomplish your mission.
	<br/><br/>
	- Detention of civilians is authorized for security reasons or in self-defense.
	"
]];

player createDiaryRecord ["Rules",

[
	"Server Rules and Regulations",
	"
	Rule 1: Absolutely no team killing. Accidents happen from time to time. If it occurs, please apologize immediately following the incident. Failure to do so may get you kicked.
	<br/><br/>
	Rule 2: Weapons are to be placed on SAFE while on base. To do so, simply lower your weapon.
	<br/><br/>
	Rule 3: Destruction of friendly equipment is prohibited. In regards to this rule, if you are shot down or disabled by enemy fire, you will not be held accountable by this rule. However, purposeful destruction such as crashing into the side of a mountain, shooting the tracks or engines, etc is prohibited.
	<br/><br/>
	Rule 4: All pilots and armour crewman must be on Teamspeak 3. The reason for this is communication. All pilots and armour crewman need to be able to communicate with ground troops as well as other pilots/armour crewman in order to prevent fatal accidents resulting in air collision, incorrect target location, etc.
	<br/><br/>
	Rule 5: No racist, anti-Semitic, sexist, or obscene comments, slurs, or language. There is a zero tolerance policy regarding this behaviour. You will be banned if you act out in this manner.
	<br/><br/>
	Rule 6: The Highest ranking 29th member is the Administrator. Do not argue with administrators or 29th ID personnel.
	<br/>
	"
]];