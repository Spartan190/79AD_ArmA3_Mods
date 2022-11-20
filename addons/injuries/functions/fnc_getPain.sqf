#include "script_component.sqf"
/*
* Author: [79AD] S. Spartan
* Gets the pain level from ACE_medical
* 
* Arguments:
* 0: unit to check (ACE_player)
*
* Return Value:
* The pain level from ACE_medical
*
* Example:
* [ACE_player] call snad_injuries_fnc_getPain
*
* Public: No
*/
params ["_unit"];
_value = GET_PAIN_PERCEIVED(_unit);
_value;