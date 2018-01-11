//=====================================================================
//script by Walker
//www.united-nations-army.eu
//fixed and modified for A3 by Hill aka Rellikplug
//www.29th.org
//=====================================================================
// This script initilizes a new target, collects the positions of the hits.
// The saved positions are passed to check_target.sqf
// Init line: nul = [this] execVM "una_targets\init_target.sqf";
//=====================================================================

private ["_monitor","_score_table_count_before","_action_cs","_action_ct","_action_csm","_action_ctm","_scoretable"];

_target_name = "target";
_monitor = nil;

_path = "una_targets\";
_target = _this select 0;

if (count _this > 1) then {
	_monitor = _this select 1;
};
if (count _this > 2) then {
	_target_name = _this select 2;
};

_scoretable = [];

//_target_name = _this select 3

//_target setVectorUp [0,0,1];

//-----------------------------------------------
//Initilize target
//-----------------------------------------------

//set target texture
_target setObjectTexture [0,_path + 'circular_target.paa'];


WALK_TARGET_PUBVAR = nil;
publicVariable "WALK_TARGET_PUBVAR";

//get target center position default: _offset =[0.00,-1.306];
_offset =[0.00,-1.861];
//[1707.46,5074.64,1.861]
//sphere pos log = [1707.46,5074.62,1.861]
//sign pos log = [1707.46,5074.64,0]


//calibrated score borders
//_borders = [0.460,0.410,0.365,0.320,0.270,0.225,0.175,0.130,0.080,0.035, 0]; <-- Default
_borders = [0.351,0.314,0.277,0.243,0.205,0.168,0.134,0.098,0.062,0.020, 0];
_holelist = [];
_score_table_count_before = 0;
_action_cs = nil;
_action_ct = nil;
_action_csm = nil;
_action_ctm = nil;

//how often the the target is checked for new hits (in seconds)
_sweeptime = 0.1;


//-----------------------------------------------
//target loop
//-----------------------------------------------
_xb = 0;
_yb = 0;

While {true} do {
  
  //if there has been new hits to the target -> update check target actions 
  if(count _scoretable > _score_table_count_before) then {
 
    _score_table_count_before = count _scoretable;
//    _target removeAction _action_cs;
		[_target,_action_cs] remoteExec ["removeAction",0];	
    _action_cs = _target addaction [format["Inspect %1", _target_name], _path + "check_target.sqf", [_scoretable,_target_name]];
//    _target removeAction _action_ct;
		[_target,_action_ct] remoteExec ["removeAction",0];	
    _action_ct = _target addaction [format["Clear %1", _target_name], _path + "clear_target.sqf",_target];
    

   
    //Enable target actions from a monitor object
    if(!isNull _monitor) then {

        _monitor = _this select 1;
//        _monitor removeAction _action_csm;
				[_monitor,_action_csm] remoteExec ["removeAction",0];	
        _action_csm = _monitor addaction [format["Inspect %1",_target_name], _path + "check_target.sqf",[_scoretable,_target_name]];
//        _monitor removeAction _action_ctm;
				[_monitor,_action_ctm] remoteExec ["removeAction",0];
        _action_ctm = _monitor addaction [format["Clear %1",_target_name], _path + "clear_target.sqf",_target];
    
    };
    
  }
  else {
    _score_table_count_before = count _scoretable;
  };
 
  //if target has been cleared
  if (!isNil "WALK_TARGET_PUBVAR") then {
		if (WALK_TARGET_PUBVAR == _target) then { //(WALK_TARGET_PUBVAR == _target)
          _scoretable = nil; //[COMBAT]Geo modification
          _scoretable = [];
          _score_table_count_before = 0; //[COMBAT]Geo modification
          WALK_TARGET_PUBVAR = nil;
          publicVariable "WALK_TARGET_PUBVAR";
          
//          _target removeAction _action_cs;
					[_target,_action_cs] remoteExec ["removeAction", 0];					
//          _target removeAction _action_ct;
					[_target,_action_ct] remoteExec ["removeAction", 0];
//          _monitor removeAction _action_csm;
					[_monitor,_action_csm] remoteExec ["removeAction", 0];
//          _monitor removeAction _action_ctm;
					[_monitor,_action_ctm] remoteExec ["removeAction", 0];
          
          //Enable target actions from a monitor object
     
			if(!isNull _monitor) then {
				_monitor = _this select 1;
//        _monitor removeAction _action_cs;
				[_monitor,_action_cs] remoteExec ["removeAction", 0];
        _action_cs = _target addAction [format ["Inspect %1", _target_name], _path + "check_target.sqf",[_scoretable, _target_name]];
//        _monitor removeAction _action_ct;
				[_monitor, _action_ct] remoteExec ["removeAction", 0];
        _action_ct = _target addAction [format ["Clear %1", _target_name], _path + "clear_target.sqf", _target];
    
			};
          
		};
	};
   
  
  //wait sweeptime
  sleep _sweeptime;
  

  //get recent hits
  _hits = [(getposATL _target select 0),(getposATL _target select 1),(getposATL _target select 2) - (_offset select 1)] nearObjects ["#craterOnVehicle",1];
																																		// ^ default -
    if(count _hits > 0) then {
      
      _last_hit = _hits select (count _hits - 1);
    
        
        _j = 0;
        //iteratet trough all hits since last sweep
        while { !(_last_hit in _holelist) } do {
          
          _holelist = _holelist + [_last_hit]; 
          
          //position of last hit (in world coords)
          _xh = getpos _last_hit select 0;
          _yh = getpos _last_hit select 1;
          _zh = getpos _last_hit select 2;

          //position of target (in world coords)
          _xt = getposATL _target select 0;
          _yt = getposATL _target select 1;
          _zt = getposATL _target select 2;
          
          //position of last hit (in target coords)
          _xb = sqrt((_xh-_xt)*(_xh-_xt) + (_yh-_yt)*(_yh-_yt)) + (_offset select 0);
          _yb = _zh + (_offset select 1);
					//   ^ Default +
          
          if (_xh < _xt) then {
            _xb = -_xb;
          };
          if ((getdir _target) >= 180) then {
             _xb = -_xb;
          };
          
          //save the hit positions into an array
          _scoretable = _scoretable + [_xb,_yb];
          
          _j = _j + 1;
          
          if (count _hits > (_j)) then {
               _last_hit = _hits select (count _hits - (_j + 1));
          };

        };
  
      };  
};  