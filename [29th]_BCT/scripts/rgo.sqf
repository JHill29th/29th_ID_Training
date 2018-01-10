private ["_text"];
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	_text = "<t align='center'><img image='pictures\m67.jpg' size='8' /></t><br />
	The M67 grenade has a spherical steel body that contains 6.5 oz (180 g) of composition B explosive.<br /><br />
	The M67 grenade weighs 14 oz (400 g) in total and has a safety clip to prevent the safety pin on the grenade from being pulled accidentally.<br /><br />
	It uses the M213 pyrotechnic delay fuse. The fuse delays detonation between 4 and 5 seconds after the spoon is released.<br />
	The M67 can be thrown 30 to 35 metres (98 to 115 ft) by the average soldier.<br />
	Steel fragments are provided by the grenade body and produce an injury radius of 15 metres (49 ft), with a fatality radius of 5 metres (16 ft), though some fragments may disperse as far out as 250 metres (820 ft).<br />
	<br />
	M69 Practice Grenade<br />
	The M69 grenade is used for grenade training to safely simulate the M67 grenade. The fuse screws into the body, and is replaceable after use. The simulator produces a report and small puff of white smoke when properly employed.<br />
	The M69 has a blue-painted lever and a blue body. This is to indicate that it is a safe practice grenade rather than a live fragmentation grenade like the M33 or M67<br />";

	"M67 Fragmentation Grenade" hintC parseText format ["DEFENSIVE GRENADE<br />%1",_text];
} else {
	_text = "<t align='center'><img image='pictures\rgo.jpg' size='8' /></t><br />
	The RGO grenade consists of a double layered steel pre-fragmented body.<br /><br />
	The grenade shell consists of two internally serrated aluminium hemispheres.<br /><br />
	The fuse has both impact and time delay functions, the impact fuse arms after a pyrotechnic delay of 1 to 1.8 seconds.  If the grenade <t underline='true'>strikes an object</t> after this time a spherical lead shot filled impact weight will <t underline='true'>trigger detonation</t>.  The impact fuse <t underline='true'>detonates when it hits any terrain</t>.  If the grenade has <t underline='true'>not struck anything after 3.2 to 4.2  seconds</t> the second pyrotechnic delay will <t underline='true'>detonate the grenade</t>.<br />
	The fragments produced by the RGO grenade generate a lethal radius of between approximately 6 metres and 20 metres, with the safety radius being approximately 100 metres .<br />";

	"RGO Hand Grenade" hintC parseText format ["DEFENSIVE GRENADE<br />%1",_text];
};