private ["_text"];
_text = "<t align='center'><img image='pictures\nav_1.jpg' size='10' /></t><br />
Bearing is a term used in navigation to refer, depending on the context, to the direction of motion or the direction of a distant object relative to the current course.<br />
In land navigation, a magnetic bearing is ordinarily calculated in a clockwise direction starting from a reference direction of 0° (magnetic North) and increasing clockwise to 359.9 degrees.<br /><br />

Measured in this way, a bearing is referred to as an <t underline='true'>azimuth by the US Army</t> but not by armies in other English speaking nations, which use the term bearing.<br /><br />

If the reference direction is north (either true north, magnetic north, or grid north), the bearing is termed an absolute bearing.<br />
In a contemporary land navigation context, true, magnetic, and grid bearings are always measured in this way, with true north, magnetic north, or grid north being 0° in a 360-degree system.<br /><br />

Bearing or azimuth can be measured in mils or degrees.  Both are scaled on your compass.<br />
	- There are 17.7 mils in one (1) degree.<br />
	- There are 6400 mils in 360 degrees (full circle).<br /><br />

There are three Norths on a military map<br />
	- 1.  True North<br />
	- 2.  Magnetic North<br />
	- 3.  Grid North<br />
<t underline='true'>In ArmA 3 all three are the same.</t>";
"Land Navigation" hintC parseText format ["Magnetic Bearing<br />%1",_text];