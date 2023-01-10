#include "script_component.hpp"
/*
* Author: [79AD] S. Spartan
* Gets the damage states for the areas of the unit
* 
* Arguments:
* 0: unit to check (ACE_player)
* 1: the type to handle the states:
*    - 0: Pain only
*    - 1: Damage only
*    - 2: Both
*
* Return Value:
* The states for the areas ([body,arms,legs])
* Each is 0-2:
* 0: Everything fine
* 1: It's Injured
* 2: Critical
*
* Example:
* _areaDamages = [ACE_player,2] call awr_main_fnc_getAreaDamages
* _areaDamages params ["_bodyState","_armsState","_legsState"];
*
* Public: No
*/
params ["_unit","_incapacitationType"];
private _areaDamages = [0,0,0]; // body/head, arms, legs

_painStates = [0,0,0];
// pain
if(_incapacitationType in [0,2]) then {
    _painStates = [_unit] call FUNC(getPartsStatesByPain);
};
_damageStates = [0,0,0];
// damage
if(_incapacitationType in [1,2]) then {
    _damageStates = [_unit] call FUNC(getPartsStatesByDamage);
};
_areaDamages set [0, (_painStates select 0) max (_damageStates select 0)];
_areaDamages set [1, (_painStates select 1) max (_damageStates select 1)];
_areaDamages set [2, (_painStates select 2) max (_damageStates select 2)];
_areaDamages; // return the areaDamages