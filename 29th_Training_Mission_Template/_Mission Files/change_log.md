---
v3.8
18 SEP 2018

---

* Changed location of `saveProfileNamespace` as part of stats system
  - Moved from `onPlayerKilled.sqf` to `functions\29th_Training\fn_checkStats.sqf`
* Removed failed attempt at wizardry from `onPlayerRespawn.sqf` that was attempting to prevent respawn ghost issue.
  - This issue is a BIS created problem and it is stupid.
* 

---
v3.8
16 SEP 2018

---

* Tweaked `onPlayerRespawn.sqf`
  - (hopefully) prevent briefly seeing the respawned player at the player's death location.

---
v3.8
10 SEP 2018

---

* Changed stats system
  - Save variables to `profileNamespace` instead of the player object in `scripts\init_stats.sqf`
    - **This will allow player stats to persist between team switching and game sessions.**
  - Moved `scripts\Stats\init_stats.sqf` from `\Stats` folder to `\scripts` folder
  - Changed `scripts\Stats\checkStats.sqf` to a registered function `Hill_fnc_checkStats`
    - Adds file `functions\29th_Training\fn_checkStats.sqf`
    - Alters file `functions\29th_Training\CfgFunctions.cfg`
    - Alters file `scripts\init_stats.sqf` to call the new function `Hill_fnc_checkStats` instead of the removed script file
    - Removed obsolete folder `\scripts\Stats`
  - Added an `addAction` option to reset statistics in `scripts\init_stats.sqf`
* Tweaked `onPlayerRespawn.sqf`
  - (hopefully) prevent briefly seeing the respawned player at the player's death location.
* Changed how the check for curator assignment is handled
  - Operation is now completely server side
  - Fixes an error that caused the function to fail
  - Re-wrote `functions\29th_Training\fn_assignCurator.sqf`
  - Moved script call `execVM "scripts\checkCuratorAssignment.sqf";` from `initPlayerServer.sqf` to `initServer.sqf`
* Removed obsolete function `Hill_fnc_transferVAtoAA`
  - Removes file `functions\29th_Training\fn_transferVAtoAA.sqf`
  - Alters file `functions\29th_Training\CfgFunctions.hpp`
  - Alters file `scripts\baseObjectInit.sqf`
* Added removal of radios from dead players
  - Adds mission parameter to toggle on or off at mission start
    - **Default setting is ON to remove radios from dead players**
  - Adds file `functions\29th_Training\fn_removeRadios.sqf`
  - Alters file `functions\29th_Training\CfgFunctions.hpp`
  - Alters file `data\params.hpp`
* Added an event handler to display a message in the server .rpt file when a player opens the curator interface
  - Alters file `scripts\init_curators.sqf`


---
v3.8
8 SEP 2018

---

* Fixed some group names not entered for some groups for some scenarios
* Fixed wrong version displayed in loading screen of some scenarios
* Changed `data\cfginventories.hpp` to use new 29th OCP items for BLUFOR parade loadout
* Removed reference to `scripts\recognise.sqf` from `initPlayerLocal.sqf`
  - Script didn't exist in folder and this is done server side now anyway
* Removed `functions\29th_Training\fn_activateAddons.sqf`
  - This failed attempt at wizardry is FUBAR so I'm throwing it out to forget about it
* Removed `functions\29th_Training\fn_playerAdmin.sqf`
  - This wizardry is obsolete
* Added curator assignment check to (hopefully) fix having to respawn for curator access
  - `scripts\checkCuratorAssignment.sqf` called from `initPlayerLocal.sqf`
  - `functions\29th_Training\fn_assignCurator.sqf` called by `scripts\checkCuratorAssignment.sqf`
* Added `hideObjectGlobal true` and `hideObjectGlobal false` to newly respawned unit in `onPlayerRespawn.sqf`
  - (hopefully) prevent briefly seeing the respawned player at the player's death location.
* Changed distance base arsenal is available as an action in `scripts\baseObjectsInit.sqf`
  - Increased distance from 50 metres to 75 metres
* Changed addAction for spectator terminals, arsenal ammo boxes, and garbage cans in `scripts\baseObjectsInit.sqf`
  - Removed the condition parameter check for caller's distance to object and replaced with radius parameter
* Removed obsolete argument variable from function `functions\29th_Training\fn_cleaner.sqf`
* Changed the way negative player ratings were handled
  - Added `handleRating` event handler in `playerInitLocal.sqf`
  - Removed `functions\29th_Training\fn_adjustRating.sqf`
* Changed `scripts\player_arsenal_handlers.sqf` from using in-line functions to registered functions
  - Added `functions\29th_Traning\fn_addRadio.sqf`
  - Added `functions\29th_Training\fn_arsenalClosed.sqf`
* Added `Require CBA` module because CBA is required...
* Added player stats tracking at spectate box.
  - shots fired
  - targets hit (men only; AI and Human)
  - Accuracy
  - deaths
  - `scripts\checkStats.sqf`
  - `scripts\stats.sqf`

---
v3.7
29 AUG 2018

---

* Changed BLUFOR Parade starting loadout in `data\cfgInventories.hpp`
  - Removed M4A1 (`rhs_weap_m4a1`) and associated M855A1 magazines (`rhs_mag_30Rnd_556x45_M855A1_Stanag`)
  - Added M1 Garand (`rhs_weap_m1garand_sa43`) with 4, 8 round magazines (`rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle`)
* Changed addActions for base ammo boxes in `scripts\baseObjectsInit.sqf`
  - Removed action menu items for `Transfer VA to AA` and `Virtual Arsenal` if Ace is running

---
v3.6
19 JAN 2018

---

* No version name change
* Removed a `diag_log` call from `initPlayerLocal.sqf`
* Added option to enable or disable the artillery computer for _all_ artillery vehicles
  - Available in the lobby via `Parameters -> Artillery Computer
  - Default selection is `Off`
* Removed some old commented code from various places.
* Changed `scripts\excludeObjectsFromZeus.sqf`
  - Added missing opfor and grnfor curator game master modules
  - Changed loop time from 5 sec. to 3 sec.

---
v3.6
14 JAN 2018

---

* No version name change
* Fixed typo in `Hill_fnc_setInsignia` which incorrectly applied insiginas to two squads in CP2
* Removed check for team kills which will display a message in sideChat
  - Removes function `Hill_fnc_teamKill` and an MPKilled event handler from `initPlayerLocal.sqf`
* Added many parameters to the `description.ext`
  - Adding the parameters to the `description.ext` makes the settings less likely to be set incorrectly or changed by accident in the editor.

---
v3.6
12 JAN 2018

---

* No version name change
* Removed initial attempts at attendance system
* Added check for team kills which will display a message in sideChat
  - Adds function `Hill_fnc_teamKill` called by an MPKilled event handler applied from `initPlayerLocal.sqf`
* Added player rating adjustment to prevent players from not being able to get into vics occupied by a team killer
  - Adds function `Hill_fnc_adjustRating` called from the `initPlayerLocal.sqf` if a player's rating < or = -1000
  - Returns player's rating to default starting value of 350
* Refactor some scripts.
* Moved custom functions config from `description.ext` to `functions\29th_Training\29th_Training.hpp`
  - Configuration by `#include "functions\29th_Training\CfgFunctions.hpp"` in the `description.ext`

---
v3.6
11 JAN 2018

---

* No version name change
* Removed the furniture spawn script
* Removed `change_log.html`
* Adjusted `Hill_fnc_setInsignia` to make sure the drab and vibrant insignias were applied at the proper time
  - no primary weapon or has M4A1 PIP with no attachments = vibrant else drab
* Removed two unused scripts
* Adjusted `arsenalClosed` event handler in `scripts\player_arsenal_handlers.sqf`
  - When ace arsenal is closed if player has no radio add faction specific radio
* Completely reworked thermal imaging restriction
  - Added `["visionMode", {}] call CBA_fnc_addPlayerEventHandler` in `initPlayerLocal,sqf`
  - Added new function `Hill_fnc_noThermals`
  - Added public variable `disabledTI` to `initServer.sqf`
  - Added a `curatorObjectPlaced` event handler to `init_curators.sqf`
     - uses `disableTIEquipment` on all objects of type "Car", "Air", "Ship", "Tank", and "StaticWeapon"

---
v3.6
9 JAN 2018

---

* Added `diag_log` to furniture script to write to report file the name of the player selected
* Added new function `Hill_fnc_transferVAtoAA`
  - transfers player's saved Virtual Arsenal loadouts to the new Ace Arsenal
* Changed how base ammo boxes access the arsenal in light of the new(ish) Ace Arsenal
  - changes in `scripts\baseObjectsInit.sqf`
  - changed base ammo box arsenal addAction call back to `{["Open", true] spawn BIS_fnc_arsenal;}`
  - added `Ace Arsenal` addAction `{[_this select 1, _this select 1, true] call ace_arsenal_fnc_openBox;}` to open the Ace Arsenal
  - added `Transfer VA to AA` addAction `{[] spawn Hill_fnc_transferVAtoAA;}` to transfer existing Virtual Arsenal loadouts into the Ace Arsenal
* Added new file `scripts\player_arsenal_handlers.sqf` to house all event handlers related to opening and closing arsenals
  - Moved said event handlers from `initPlayerLocal.sqf`
* Added call of `Hill_fnc_setInsignia` to `onPlayerRespawn.sqf`
  - Hopefully this will fix players not having insignia set when joining

---
v3.5
7 JAN 2018

---
* Added an HTML version of the change log called `change_log.html`
* Added attendance counting to the `Log` entry accessed via the map screen
* Added simulation manager function module as this is handled natively and adjusted via Attributes -> Performance in the editor
* Added TFAR radios to each faction's "parade" loadout
* Added new function `Hill_fnc_setInsignia`
  - uses `squadParams` to automatically assign proper squad insignia on mission start and at the arsenal.
* Added call for `Hill_fnc_setIngignia` in `arsenalClosed` and `arsenalOpened` event handlers in `initPlayerLocal.sqf`
  - squad insignia now properly applied to the player when opening and closing the arsenal
* Added squad and platoon names and callsigns to lobby
* Added automatic furniture spawn
  - **NEEDS TESTING**
  - On by default but can be turned off in the parameters menu via the lobby *before the mission is started*
  - picks a random player to spawn furniture in houses in a 50 metre radius.
  - deletes furniture if selected player is > 25 metres from last checked position and no players are within 7 metres of the house.
* Adjusted BLUFOR "Parade" loadout in cfgInventories to match recent loadout changes.
* Adjusted `init_curators.sqf`
  - `curatorObjectPlaced` event handler which calls `ace_fastroping_fnc_equipFRIES` function on placed helis is now applied to curators **only** if ACE is running
* Changed the `No Thermal Optics` parameter to be on by default.
* Changed base ammo box arsenal call
  - removes options to change voice, insignia, and face.
  - significantly reduces the distance the `Arsenal` action is available.
* Changed respawn time to 15 seconds
* Changed the name on the change log file from `change_log.txt` to `change_log.md` and reformatted for markdown (fuck, that took a long time!)
* Changed curator vision mode in `init_curators.sqf` from "Shade of Red and Green, Bodies are white" to "White Hot Black Cold"

---
v3.0
20 NOV 2016

---
* No version name change
* Added TFAR force usage (settings) Module.
  - Sets TFAR channel to "Training Radio Network" with a password of "123".

---
v3.0
16 OCT 2016

---
* No version name change
* Removed action option from Admin to turn Auto Spectate on or off
  - Option still available via mission parameters prior to mission start
  - Default is disabled

---
v3.0
15 OCT 2016

---
* Added script command `enableChanel [true(chat),false(VoN)];` to `initPlayerLocal.sqf to diable VoN in all of the available channels
* Added parameter `disableChannels[]` to `description.ext` to force disable VoN in all channels
* Removed voiceControl script to limit talking over specific channels.
* Added "Spectator" option from `respawnTemplates[] = {};` in description.ext because it now works
  - it is a limited version of the spectate and does not function the same as the custom one available at the spectator terminals.
* Added function `Hill_fnc_applInsig` which automatically applies the appropriate squad insignia to the player based on the group they joined (BLUFOR only)
* Added forcing players to lower weapons on first join and after exiting the virtual arsenal
* Removed TFAR frequency modules to set default SR radio freq. as per Comms. card because it wasn't reliable.

---
v3.0
6 SEP 2016

---
* Added back automatic spectate option.
  - Disabled by default.
  - Added graphics to ON and OFF actions
  - Added systemChat message to confirm action
* Removed player stats system for a very, very slight performance gain. (I don't think anyone used this anyhow)
* Removed "Spectator" option from `respawnTemplates[] = {};` in `description.ext` because it doesn't work (arrg BI)
  - This is to access the BIS Spectaor (Activate the button) from the respawn menu.
  - Removed because it is a limited version of the spectate and does not function as we like.  
	- Players can still access the spectator from the terminal boxes or if the ADMIN turns on the auto-spectate.
* Added "Parade" loadout inventory
  - For all sides
  - Uses `BIS_fnc_setRespawnInventory` in `initPlayerLocal.sqf`
  - Set as default gear when first joining.
  - Available on respawn menu
* Added functionality for saved loadout (after leaving arsenal) to be added to respawn inventory and available from the respawn menu.
* Added Headless Client functionality.
  - Not tested yet.
* Changed spectator script to registered function in functions library.
  - `functions\fn_spectator.sqf`
  - Used via `<object> spawn Hill_fnc_spectator`
* Removed in-line function for admin checking from `initPlayerLocal.sqf` in favour of a registered function.
  - `functions\fn_playerAdmin.sqf`
  - `<object> call Hill_fnc_playerAdmin`
* Adjusted addAction calls set to spectator terminals.
  - Added graphic to action menu
* Moved init call for opening arsenal from individual ammo boxes (6 total) in editor to `init.sqf`
  - Added graphic to action menu
* Removed call BIS_fnc_drawCuratorLocations from `init_curators.sqf`
  - non functioning (script error)
  - RPT spam (a shit tonne; no, seriously I mean a lot of rpt spam)
* Fixed Civilian Journalist slots having Camera action only after respawn.
* Added simulation manager function module
  - removes simulation and hides objects more that are > 5000 m from playable units
  - does not include air units
* Changed cleaner script to a registered function.
  - `functions\fn_cleaner.sqf`
  - `call Hill_fnc_cleaner`

---
v2.30
28 JUN 2016

---
* Removed automatic spectate start on player respawn.
* Added "Spectator" option to `respawnTemplates[] = {}` in `description.ext.`
* Added mission parameter option to allow/disallow TI optics.  Default is on.
  - Adds `scripts\noThermals.sqf`
* Adjusted playable units
  - Fixed role description errors.
  - Organized variable names.
  - Added Grenadier to each squad.
  - Removed setGroupID command from all units' init.  Set via edited attributes via 3D editor instead.
  - Added callsign information to group names.
  - Added playable slots for BN Leadership.
* Added TFAR frequency modules to set default SR radio freq. as per Comms. card.

---
v2.28
21 APR 2016

---
* No version name change
* Removed faction restriction from spectator. Players can now spectate all sides.
* Added 'enableEnvironment false;' command to init.sqf to disable bees, butterflies, birds, rabbits, snakes and environmental sounds, crickets etc.

---
v2.28
10 APR 2016

---
* Added `scripts\excludeObjFromZeus.sqf`
  - automatic repetitive exclusion of base objects (ammo boxes, spectate table) from being added by zeus.
  - Checks every 5 seconds for all editable objects and removes the excluded if found to be editable.
* Changed initial respawn positions from markers (respawn_<side>) to respawn modules
* Increased squad size to 20 (including leadership).
* Increased size of GRNFOR and OPFOR sides to 33 slots each.
* Added third squad to each platoon.
* Added squad name to roll description in lobby (BLUFOR only).
* Added player weapon stats tracking at spectate box.
  - shots fired
  - targets hit (men only; AI and Human)
  - Accuracy
  - deaths
  - `scripts\checkStats.sqf`
  - `scripts\stats.sqf`
* Added attendance system (WIP - not finished).
  - scripts\attendance.sqf
  - init.sqf
* Added ACE 3 Fast Roaping (FRIES) system to all zeus placed helos.
* Added automatic spectate start on player respawn.
  - Can be set off or on in the mission parameters in the lobby before starting the mission.
  - Admin can turn auto spectate on and off during the mission via the action menu.
* Added init.sqf

---
v2.25
23 FEB 2016

---
* Converted mission from 2D editor to 3D editor (Eden)
* Removed scripted (BIS) module supports to Co. and Plt. units.  Virtual Supply drop and Virtual Air transport.
* Removed variable for possible future compatibility with TAW view distance
  - View distance is adjustable by via ACE 3

---
v2.20
21 JAN 2016

---
* Removed addAction from arsenal boxes for gear saving.
* Removed RP_loadout.sqf (gear saving)
* Removed generic (default) `respawnTemplates[] = {}` as it is not needed when specific factions are specified.
* Removed teleport.sqf - not needed
* Removed init.sqf as all initialization has been appropriately distributed to localized event scripts.
* Added `initPlayerLocal.sqf` with scripting
  - to save gear upon closing the arsenal GUI.
  - for curator functions (propagating placed objects between curators)
* Added `onPlayerRespawn.sqf` with scripting to
  - load gear after respawn
  - Automatically start the spectator upon respawn
  - re-add curator placed objects back to the respawned unit.
* Added `initPlayerServer.sqf` with scripting
  - for curator functions (propagating placed objects between curators)
* Added `initServer.sqf` with scripting to
  - add thermal vision to all curators (Zeus). White hot and dark red cool.  Not sure if I like it :(
* Added functions to make all curator placed objects editable by all curators.
  - See `cfgFunctions` in `description.ext` and functions\curator\
* Added scripted (BIS) module supports to Co. and Plt. units.  Virtual Supply drop and Virtual Air transport.
  - Access through the radio key '0' (zero) then select supports and follow the menu.
* Added voiceControl script to limit talking over specific channels.
  - Access to channels increase with importance...
* Added variable for possible future compatibility with TAW view distance
* Changed respawnDelay in description.ext from 3s to 10s
* Changed 3d task and task management to new method. See `CfgTaskEnhancements` in `description.ext`
* Fixed error in `RespawnTemplatesWest[] = {};`

---
v2.15
23 DEC 2015

---
* Removed MCC Dependency

---
v2.10
23 DEC 2015

---
* No version name change
* Adjusted Spectating script to force camera back to player on exit
* Changed `respawnOnStart` parameter in `description.ext` from 1 to 0 to prevent hang on loading screen when changing sides or joining after start
  - Problem caused by BIS after recent game update
* Added separate respawnTemplates for each faction 

---
v2.10
8 DEC 2015

---
* No version name change
* Removed legacy setSquadInsigniaNEW.sqf call from `init.sqf`
* Added spectating script.  `scripts\spectator.sqf`
  - Uses `BIS_fnc_EGspectator`
* Removed ACE Spectator settings module and "ace_spectator" template from `respawnTemplates[]= {}` in the `description.ext`
* Changed respawnDelay in `description.ext` from 10s to 3s

---
v2.10
28 NOV 2015

---
* Removed squad insignia system as it has be replaced with 29thID Mod (Yay!)
* Removed 29th Actions (Salute, Attention, etc.) replaced with 29thID Mod
* Removed `setTerrainGrid 50;` from `initPlayerLocal.sqf`
* Added ACE Spectator settings module and `ace_spectator` template to `respawnTemplates[]= {}` in the `description.ext`
* Changed `respawnDelay` in `description.ext` from 4s to 10s

---
v2.00
12 AUG 2015

---
* No version name change
* Removed Arsenal preload.
* Adjusted MCC Settings modules to turn off UI interface and cover/mounted actions.

---
v2.00
23 JUN 2015

---
* Added squad insignia system
  - Uses profileNamespace to save a variable to your profile to be called when a squad insignia is needed.
* Updated initPlayerLocal.sqf to call new setUnitInsignia.sqf
* Adjusted BIS_setUnitInsignia call from BIS_saveLoadInventory.sqf to call proper insignia based
on what is set in profileNamespace from setUnitInsignia.sqf (because the Arsenal removes the custom insignia)
* Added `EndMission,Spectator,Tickets` to `respawnTemplates[] = {}` in the `description.ext`
* Removed dependency on AGM including modules.  Dependency to TFAR and MCC remain.
* Removed `RP_VArsenalDrop.sqf` from 29thActions.
* Added preload arsenal function call to initServer.sqf
* Added `setTerrainGrid 50;` to `initPlayerLocal.sqf` to force grass level to "low".
* Added Time and Weather parameters to mission lobby.
* Added functionality for 2D task waypoints and 3D task markers in the description.ext

---
v1.03

---
* Added `MenuInventory` to `respawnTemplates[] = {}` in the `description.ext`
* Tweaks to TFAR module

---
v1.02
9 NOV 2014

---
* Added two mission observer slots which can use the BIS Splendid Camera.
* Removed BIS modules for setting custom group designation.
* Removed MCC set-up from the mission `init.sqf`.
* Removed removeAllActions script as it was incorporated into `29thActions.sqf`.
  - Also removed script call from `init.sqf`.
* Added MCC modules for mission settings and access rights (all).
* Adjusted the 29thActions scripts to remove the gen_action.sqf format.
* Changed the name of all 29thAction scripts to remove "gen_action_" from name.
* NOTE: RP_VArsenalDrop.sqf is still not removing the addAction from all players of the callers' side... WIP...

---
v1.01
21 OCT 2014

---
* Adjusted the gen_action_RP_VArsenalDrop.sqf to remove the "supply drop" action from all players
  - (per side of the caller) once the drop has been called and add the action back after the crate is recovered or destroyed.
* Adjusted the BIS_SaveLoadInventory.sqf to add the custom 29th ID unitInsignia on gear respawn.
* Adjusted and cleaned up the 29th Actions scripts.
* Added a killed event handler to 29thActions.sqf to remove actions (salute, push-ups, surrender, leave captivity, and supply drop)
from player's body upon death.

---
v1.00
17 OCT 2014

---
* Inception

---