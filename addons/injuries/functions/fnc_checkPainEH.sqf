#include "script_component.hpp"
/*
* Author: [79AD] S. Spartan
* Event Handler to check the current pain level of the unit.
* Sets the GVAR(draggableCarryable) to false if the system is not enabled or the pain is below the threshold.
* 
* Arguments:
* 0: unit to check (ACE_player)
*
* Return Value:
* nothing
*
* Example:
* [ACE_player] spawn snad_injuries_fnc_checkPainEH;
*
* Public: No
*/
params ["_unit", "_painLevel"];
if (!alive _unit) exitWith {};
if (GVAR(isEnabled) && _painLevel >= GVAR(painThreshold)) then {
	_isCarryable = [_unit, _painLevel] call FUNC(checkGoProne);
	[_unit, _painLevel] call FUNC(checkHandleWeapon);
	_unit setVariable [QGVAR(draggableCarryable), _isCarryable, true];
} else {
	_unit setVariable [QGVAR(draggableCarryable), false, true];
};