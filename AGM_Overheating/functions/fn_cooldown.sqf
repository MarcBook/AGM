/*
 * Author: CAA-Picard
 *
 * Calculate cooling down of the weapon.
 *
 * Argument:
 * 0: Last temperature (number)
 * 1: Barrel mass (number)
 * 2: Time (number)
 *
 * Return value:
 * New temperature (number)
 */

private ["_temperature", "_barrelMass", "_totalTime", "_barrelSurface", "_time", "_deltaTime"];

_temperature = _this select 0;
_barrelMass  = _this select 1;
_totalTime   = _this select 2;

// If a long time passed since the last shot, there's no need to calculate anything; the weapon should be cool
if (_totalTime > 1800) exitWith {0};

_barrelSurface = _barrelMass / 7850 / 0.003;

_time = 0;
while {true} do {
  _deltaTime = (_totalTime - _time) min 20;

  _temperature = _temperature - (
                  // Convective cooling
                  25 * _barrelSurface * _temperature
                  // Radiative cooling
                  + 0.4 * 5.67e-8 * _barrelSurface *
                  ( (_temperature + 273.15)*(_temperature + 273.15)
                  * (_temperature + 273.15)*(_temperature + 273.15)
                  - 273.15 * 273.15 * 273.15 *273.15 )
                  ) * _deltaTime / (_barrelMass * 466);

  if (_temperature < 1) exitWith {0};

  if (isNil "_temperature") exitWith {
    diag_log text format ["[AGM] ERROR: _totalTime = %1; _time = %2; _deltaTime = %3;", _totalTime, _time, _deltaTime];
    0
  };

  _time = _time + _deltaTime;
  if (_time >= _totalTime) exitWith { _temperature max 0 };
};
