#include "script_component.hpp"
/*
	* Author: [79AD] S. Spartan
	* Checks if the given unit should go prone because the conditions from the settings are met.
	* Returns if the unit is prone or not
	* 
	* Arguments:
	* 0: unit to check (ACE_player)
	*
	* Return Value:
	* if the unit is prone or not
	*
	* Example:
	* [ACE_player] spawn awr_player_fnc_checkGoProneEH
	*
	* Public: No
*/
params ["_unit", "_oldbodyAreaStates", "_bodyAreaStates", "_inDeepWater"];
_oldbodyAreaStates params ["_oldBodyState", "_oldArmsState", "_oldLegsState"];
_bodyAreaStates params ["_bodyState", "_armsState", "_legsState"];
_isIncapacitated = _bodyState == 2 || _legsState > 0;
_wasIncapacitated =_oldBodyState == 2 || _oldLegsState > 0;

if (!(_isIncapacitated) && !_wasIncapacitated) exitWith {
	false
};
if !(isNull objectParent _unit) exitWith {
	false
};
if (_inDeepWater) exitWith {
	false
};
_isProne = false;

_isAceLimping = _unit getVariable [QACEVAR(medical, isLimping), false];
if (_legsState == 1) then {
	_unitHitDamage = _unit getHitPointDamage "HitLegs";
	if (!(_isAceLimping) && (_unitHitDamage < 0.5)) then {
		_unit setHitPointDamage ["HitLegs", 1];
	};
} else {
	if ((_legsState == 0) && (_oldLegsState > 0) && !(_isAceLimping)) then {
		_unit setHitPointDamage ["HitLegs", 0];
	};
};

_isFatal = _legsState == 2 || _bodyState == 2;
_wasFatal = _oldLegsState == 2 || _oldBodyState == 2;
_isFallingDown = _unit getVariable [QEGVAR(main, fallingDown), false];
if (GVAR(goProne) && (_legsState == 2 || _bodyState == 2)) then {
	if (GVAR(playFallAnimation) && _isFatal && !_wasFatal) then {
		//_unit call EFUNC(main,fallDown);
		[_unit, true] call ace_medical_engine_fnc_setUnconsciousAnim;
		[{
			params["_unit"];
			[_unit, false] call ace_medical_engine_fnc_setUnconsciousAnim;
			_unit setUnconscious true;
			[_unit, "UnconsciousFaceDown", 2] call ace_common_fnc_doAnimation;
			[{
				params["_unit"];
				[_unit,"UnconsciousReviveLegs_A",2] call ace_common_fnc_doAnimation;
			}, _unit, 6.7] call CBA_fnc_waitAndExecute;
		}, _unit, 4] call CBA_fnc_waitAndExecute;
		_isProne = true;
	} else {
		/*_isMedicAnimation = ["_medic",animationState _unit] call BIS_fnc_inString;
		if (!_isFallingDown && (lifeState _unit) != "INCAPACITATED" && stance _unit != "PRONE" && stance _unit != "UNDEFINED" && !_isMedicAnimation) then {
			SHOW_HINT(localize LSTRING(UNABLE_TO_STAND));
			 _unit call EFUNC(main,goProne);
		} else {
			_isProne = true;
		};*/
	};
} else {
	if(!_isFatal && _wasFatal) then {
		_unit setUnconscious false;
		[_unit, "UnconsciousOutProne", 2] call ace_common_fnc_doAnimation;
	};
	_isProne = false;
};

_isProne;