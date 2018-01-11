//nopop=true; this animate["terc", 1];    this addMPEventHandler ["MPHit", "scoreDKH = scoreDKH + 1; publicVariable 'scoreDKH';"];

_target = _this;
//_shooter = _this select 3;

scoreDKH = scoreDKH + 1;
publicVariable 'scoreDKH';

//_shooter setVariable ["DKH_score", (_shooter getVariable "DKH_score") + 1, true];
