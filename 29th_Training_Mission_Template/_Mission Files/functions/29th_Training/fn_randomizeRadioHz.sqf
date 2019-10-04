  if (!hasInterface) exitWith {};
  if !(isClass (configfile >> "CfgPatches" >> "task_force_radio_items")) exitWith {};
  /*
  private _SwRadio = _this call TFAR_fnc_activeSwRadio;
  private _LrRadio = _this call TFAR_fnc_activeLrRadio;
  if (!isNil "_SwRadio") then {
    _SwChannels = [1,2,3,4,5,6,7,8,9];
    {
      private _Hz = str (floor random [30,250,512]);
      [(_SwRadio), _x, _Hz] call TFAR_fnc_SetChannelFrequency;
    } forEach _SwChannels;
    if (((_SwRadio) call TFAR_fnc_getAdditionalSwChannel)) != -1) then {
      [(_SwRadio), -1] call TFAR_fnc_setAdditionalSwChannel;
    };
  };
  if (!isNil "_LrRadio") then {
    _LrChannels = [1,2,3,4,5,6,7,8,9,10];
    {
      private _Hz = str (floor random [30,55,87]);
      [(_LrRadio), _x, _Hz] call TFAR_fnc_SetChannelFrequency;
    } forEach _LrChannels;
    if (((_LrRadio) call TFAR_fnc_getAdditionalLrChannel)) != -1) then {
      [(_LrRadio), -1] call TFAR_fnc_setAdditionalLrChannel;
    };
  };
  
  _SwHz = (_SwRadio) call TFAR_fnc_getSwFrequency;
  _SwAdditionalChannel = (_SwRadio) call TFAR_fnc_getAdditionalSwChannel;
  _LrHz = (_LrRadio) call TFAR_fnc_getLrFrequency;
  _LrAdditionalChannel = (_LrRadio) call TFAR_fnc_getAdditionalLrChannel;
  
  [[_SwHz,_SwAdditionalChannel],[_LrHz,_LrAdditionalChannel]]
  */

/*  
  if ( (((getUnitLoadout _this) select 9) select 2) != "") then {
    _this unlinkItem (((getUnitLoadout _this) select 9) select 2);
    //need to remove back pack too.
  };
true
*/

  //params ["_unit","_newSWRadio","_oldSWRadio"];
  systemChat format ["%1",_unit];
  switch (side (group _unit)) do {
    case (WEST): {
      if (_newSWRadio == "tf_fadak" || _newSWRadio == "tf_anprc148jem") then {
      private _SwRadio = _this call TFAR_fnc_activeSwRadio;
      private _SwChannels = [1,2,3,4,5,6,7,8,9];
        {
          private _Hz = str (floor random [30,250,512]);
          [(_SwRadio), _x, _Hz] call TFAR_fnc_SetChannelFrequency;
        } forEach _SwChannels;
      };
    };
    case (EAST): {
      if (_newSWRadio == "tf_anprc152" || _newSWRadio == "tf_anprc148jem") then {
      private _SwRadio = _this call TFAR_fnc_activeSwRadio;
      private _SwChannels = [1,2,3,4,5,6,7,8,9];
        {
          private _Hz = str (floor random [30,250,512]);
          [(_SwRadio), _x, _Hz] call TFAR_fnc_SetChannelFrequency;
        } forEach _SwChannels;
      };
    };
    case (INDEPENDENT): {
      if (_newSWRadio == "tf_fadak" || _newSWRadio == "tf_anprc152") then {
      private _SwRadio = _this call TFAR_fnc_activeSwRadio;
      private _SwChannels = [1,2,3,4,5,6,7,8,9];
        {
          private _Hz = str (floor random [30,250,512]);
          [(_SwRadio), _x, _Hz] call TFAR_fnc_SetChannelFrequency;
        } forEach _SwChannels;
      };
    };
    default {false};
  };
  true