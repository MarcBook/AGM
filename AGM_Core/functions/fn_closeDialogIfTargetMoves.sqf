/*
 * Author: commy2
 *
 * Closes the current dialog if the target moves, changes vehicle etc.
 *
 * Arguments:
 * 0: Target unit
 * 1: Ignore the unit being dead? (Optional, default: No)
 *
 * Return Value:
 * None
 */

_this spawn {
  _target = _this select 0;
  _ignoreDead = _this select 1;
  if (isNil "_ignoreDead") then {_ignoreDead = false};

  _vehicleTarget = vehicle _target;
  _vehiclePlayer = vehicle AGM_player;
  _inVehicle = _target != _vehicleTarget;

  _position = getPosASL _target;

  _fnc_check = {
    // either unit changed vehicles
    if (_vehiclePlayer != vehicle AGM_player) exitWith {True};
    if (_vehicleTarget != vehicle _target) exitWith {True};

    // target died
    if (!alive _target && {!_ignoreDead}) exitWith {True};

    // player fell unconscious
    if (AGM_player getVariable ["AGM_isUnconscious", False]) exitWith {True};

    // target moved (outside of vehicle)
    (!_inVehicle && {getPosASL _target distanceSqr _position > 1})
  };

  waitUntil {
    if (call _fnc_check) then {
      closeDialog 0;
      call AGM_Interaction_fnc_hideMenu;
    };
    (isNil "AGM_Interaction_MainButton" && !dialog) || {!isNull (uiNamespace getVariable ["AGM_Core_dlgDisableMouse", displayNull])} //Exit loop if DisableMouse dialog open
  };
};
