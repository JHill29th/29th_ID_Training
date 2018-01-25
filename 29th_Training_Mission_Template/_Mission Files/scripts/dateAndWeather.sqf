switch (true) do {
  case (hasInterface): {
    [] spawn {
      if (isNil "serverDateAndWeatherSet") then {waitUntil {!isNil "serverDateAndWeatherSet";};};
      if (serverDateAndWeatherSet) then {
        _name = profileName;
        if (isNil "forcedDate" || isNil "forcedOvercast" || isNil "forcedFog") then {waitUntil {!isNil "forcedDate" && !isNil "forcedOvercast" && !isNil "forcedFog";};};
        setDate forcedDate;
        0 setOvercast forcedOvercast;
        0 setFog forcedFog;
        simulWeatherSync;
        diag_log text format ["Client Set Weather:  client = %1, date = %2, overcast = %3, fog = %4", _name, date, overcast, fogParams];
        serverDateAndWeatherSet = false; publicVariable "serverDateAndWeatherSet";
      };
    };
  };
  case (isServer): {
    serverDateAndWeatherSet = false; publicVariable "serverDateAndWeatherSet";
    setDate [2018, 3, 30, 12, 0];
    forcedDate = date; publicVariable "forcedDate";
    0 setOvercast 0.1;
    forcedOvercast = overcast; publicVariable "forcedOvercast";
    0 setFog [0.1, 0.01, 0];
    forcedFog = fogParams; publicVariable "forcedFog";
    forceWeatherChange;
    serverDateAndWeatherSet = true; publicVariable "serverDateAndWeatherSet";
    diag_log text format ["Server Set Weather:  date = %1, overcast = %2, fog = %3", date, overcast, fogParams];
  };
  default {};
};