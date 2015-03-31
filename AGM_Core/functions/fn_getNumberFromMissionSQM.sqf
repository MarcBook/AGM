/*
 * Author: commy2
 *
 * Get a number from the mission.sqm file. Mission has to be saved in the Editor.
 * 
 * Argument:
 * 0: Path of the entry in the mission.sqm (Array)
 * 
 * Return value:
 * Value of the entry. Note: If the entry does not exist, it might return 0 or an entry with the same name of another class! (Number)
 */

private "_number";

_number = _this call AGM_Core_fnc_getStringFromMissionSQM;

parseNumber _number;
