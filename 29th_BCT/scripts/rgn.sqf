private ["_text"];
_text = "<t align='center'><img image='pictures\rgn.jpg' size='8' /></t><br />
The RGN grenade consists of a single layered aluminium pre-fragmented body.<br /><br />
The grenade shell consists of two internally serrated aluminium hemispheres.<br /><br />
The fuse has both impact and time delay functions, the impact fuse arms after a pyrotechnic delay of 1 to 1.8 seconds.  If the grenade <t underline='true'>strikes an object</t> after this time a spherical lead shot filled impact weight will trigger <t underline='true'>detonation</t>.  The impact fuse <t underline='true'>detonates when it hits any terrain</t>.  If the grenade has <t underline='true'>not struck anything after approximately 3.5 to 4 seconds</t> the second pyrotechnic delay will <t underline='true'>detonate</t> the grenade.<br />
The RGN grenade has a <t underline='true'>lethal radius</t> of between approximately <t underline='true'>4 and 10 meters</t>, and a safety radius of approximately 25 meters.  It can be thrown approximately 20 to 30 meters.<br />";

"RGN Hand Grenade" hintC parseText format ["OFFENSIVE GRENADE<br />%1",_text];