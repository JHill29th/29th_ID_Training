======================================================
  UNA Targets v0.9 - Realistic target board (script)
  --------------------------------------------------
  Script by Walker
  http://www.united-nations army.eu
======================================================

Description:
This script simulates a realistic 0 to 10 score target board. The target records your hits and calculates your score.


Features:
- Working 0 to 10 score target board. For example if you hit a 9 this score will be saved to the target board. The scores can be checked after your shooting session.
- In default mode you wont get any instant feedback about your score, like it is in real life. After your shooting session you have to walk close to the target board itself in order to check your score. The mission designer has how ever the possibility to assign the check score action also to a different object, so the players would not be forced to always run to the target after each shooting sessions.
- Works with all rifles and pistols.
- MP compatibility, with this script you will be able to compete at the target range with your friends online.
- This is a script not an addon. At the moment is only vanilla Arma 2 or OA required. (Thx to Bier AIG Razor)
- Easy installation and setup, launch the script with a single command
- Example missions included.


How does it work:
The target is constantly checking if somebody has shot on it. Once a hit on the target has been recognized, the world position of the hit is converted into a coordinate on the board, where the orgin [0,0] is number 10 on the board. The coordinate from each hit is recorded into a table. When somebody wants to check the score the coordinates of each hit is calculated into scores which is displayed to the player. When somebody clears the target, the table with the targets recorded hits will be cleared.


Quick installation:
1. Extract una_targets folder into your mission folder.	 
2. Place object "WarfareBunkerSign" on the map. You find it in the editor at Warfare-buildings->Sign.
3. Put following on the init line of the object:
nul = [this] execVM "una_targets\init_target.sqf"; 
4. If you want to create several targets just copy the first one and you are done. If you have problems please check the example missions for further instuctions.


Editor syntax:
[_target,_monitor,_target_name] execVM "una_targets\init_target.sqf";

_target  (required) - name of the target, the target needs to be editor object "WarfareBunkerSign" [object]
_monitor (optional) - name of an other object from where the player can inspect and clear the target score. [object] 
_target_name (optional) - assigned name by mission designer. Will be visible in the GUI. Default name is "target". [string]


Known issues:
- SP, no known issues in SP. The targets has been tested and works fine up to over 1000m.
- MP, hits on the target will not be registerd for clients further away than ca 100m from the target except for the shooter himself. Due to this the score can be shown differently or not at all for players at further distances.
- MP, if you clear several targets at the same time (within 0.1 second) it might be that some target was not cleared for all players.


Example missions:
una_targets_demo1.utes 
- demonstrates how to easily setup the targets.
una_targets_demo2.Desert_E 
- demonstrates how to setup the mission so the player can inspect their score from where they shoot.


Version History:

v0.9
- Clear script hotfix by [COMBAT]Geo
- New parameter, _monitor, allows the player to inspect the score from a different object than the target.
- New parameter, _target_name, allows the mission designer to assign names to the target that will be visible in the GUI.
- GUI updated.
- New example mission for OA.

v0.8
- Initial public release

Credits:
- Walker001 


Special thanx to:
- Bohemia Interactive for their great games
- UNA for supporting and testing and feedback during developement
- C5 clan for additonal testing and feedback
- Other community members supporting the project
