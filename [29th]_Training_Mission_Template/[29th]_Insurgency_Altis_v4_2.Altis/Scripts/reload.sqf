private ["_removed","_config2","_magazines","_config","_count_other","_count","_object","_type"];

_object = _this;

_type = typeOf _object;

diag_log format ["x_reload: %1/%2, air:%3, land:%4", _object, _type, _object isKindOf "Air", _object isKindOf "LandVehicle"];

if ( (_object isKindOf "Air") || (_object isKindOf "LandVehicle") ) then
{
    x_reload_time_factor = 2; //default=2

    _object vehicleChat format ["Servicing %1. Stand by.", _type];

    _object setVelocity [0,0,0];

    _object setVehicleAmmo 1;
    _object setFuel 0;
    _object engineOn false;

    _magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

    if (count _magazines > 0) then {
        _removed = [];
        {
            if (!(_x in _removed)) then {
                _object removeMagazines _x;
                _removed = _removed + [_x];
            };
        } forEach _magazines;
        {
            _object vehicleChat format ["Reloading %1", _x];
            sleep x_reload_time_factor;
            _object addMagazine _x;
        } forEach _magazines;
    };

    _count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

    if (_count > 0) then {
        for "_i" from 0 to (_count - 1) do {
            scopeName "xx_reload2_xx";
            _config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
            _magazines = getArray(_config >> "magazines");
            _removed = [];
            {
                if (!(_x in _removed)) then {
                    _object removeMagazines _x;
                    _removed = _removed + [_x];
                };
            } forEach _magazines;
            {
                _object vehicleChat format ["Reloading %1", _x];
                sleep x_reload_time_factor;
                _object addMagazine _x;
                sleep x_reload_time_factor;
            } forEach _magazines;
            _count_other = count (_config >> "Turrets");
            if (_count_other > 0) then {
                for "_i" from 0 to (_count_other - 1) do {
                    _config2 = (_config >> "Turrets") select _i;
                    _magazines = getArray(_config2 >> "magazines");
                    _removed = [];
                    {
                        if (!(_x in _removed)) then {
                            _object removeMagazines _x;
                            _removed = _removed + [_x];
                        };
                    } forEach _magazines;
                    {
                        _object vehicleChat format ["Reloading %1", _x]; 
                        sleep x_reload_time_factor;
                        _object addMagazine _x;
                        sleep x_reload_time_factor;
                    } forEach _magazines;
                };
            };
        };
    };
    _object setVehicleAmmo 1;	// Reload turrets / drivers magazine

    sleep x_reload_time_factor;
    _object vehicleChat "Repairing.";
    _object setDamage 0;

    sleep x_reload_time_factor;
    _object vehicleChat "Refueling.";

    while {fuel _object < 0.99} do 
    {
        _object setFuel ((fuel _object + 0.02) min 1);
        _object engineOn false;
        _object setVelocity [0,0,0];
        sleep 0.1;
    };

    _object vehicleChat format ["%1 is Ready.", _type];

    sleep 30;
};
