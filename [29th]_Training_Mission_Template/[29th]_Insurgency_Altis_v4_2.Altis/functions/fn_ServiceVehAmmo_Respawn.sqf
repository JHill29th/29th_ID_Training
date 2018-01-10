_vic = _this select 0;

_vic addaction["<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\gear_ca.paa'/><t color='#FF8000'>  Virtual Arsenal</t>", {["Open", true] call BIS_fnc_arsenal},[],1.5,true,true,"","(isTouchingGround _target && speed _target <= 0.5)"];
zeu_1 addCuratorEditableObjects [[_vic],true];