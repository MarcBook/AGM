/*
 * Author: commy2
 *
 * Get the gunner config of a vehicles turret.
 * 
 * Argument:
 * 0: vehicle type (String)
 * 
 * Return value:
 * Gunner config (Config)
 */

private ["_vehicle", "_config", "_turret"];

_vehicle = _this select 0;

_config = configFile >> "CfgVehicles" >> _vehicle;
_turret = [_vehicle] call AGM_Core_fnc_getTurretGunner;

[_config, _turret] call AGM_Core_fnc_getTurretConfigPath
