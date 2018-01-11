_scoretable = _this select 3 select 0;
_target_name = _this select 3 select 1;

//_borders = [0.460,0.410,0.365,0.320,0.270,0.225,0.175,0.130,0.080,0.035, 0]; <-- Default
_borders = [0.351,0.314,0.277,0.243,0.205,0.168,0.134,0.098,0.062,0.020, 0];
_scorelist = [];
_totalscore = 0;
_i = 0;
while {(2 * _i) < count _scoretable} do {

    _xb =  _scoretable select (2 * _i);
    _yb =  _scoretable select (2 * _i + 1);

    _hit_distance_from_center = sqrt(_xb*_xb + _yb*_yb);

    _j = 0;
    while {_hit_distance_from_center < (_borders select _j)} do {
    _j= _j + 1;
    };
    _score = _j;
    
    _scorelist = _scorelist + [_score];
    _totalscore = _totalscore + _score;
    
    _i = _i + 1;
    
    
};


hintSilent format["%1\n----------------------------------------------\n\nNumber of hits: %4\n\n%2\n\nTotal score: %3\n",_target_name,_scorelist,_totalscore, count _scorelist];
//
//hintSilent format["%1\n----------------------------------------------\n\nNumber of hits: %4\n\n%2\n\nTotal score: %3\n",toUpper(_target_name),_scorelist,_totalscore, count _scorelist];
  
//Old GUI  
//hintSilent format["You've hit the target %3 times:\n\n %1 \n\n Total score: %2\n",_scorelist,_totalscore, count _scorelist];
