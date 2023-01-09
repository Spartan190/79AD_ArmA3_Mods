#include "script_component.hpp"


["CBA_settingsInitialized", {
	["ace_medical_handleUnitVitals", {
		params ["_unit"];
		if(!GVAR(isEnabled) || isPlayer _unit) exitWith {};
		_painLevel = _unit call EFUNC(main,getPain);
		_bodyAreasStates = [_unit,GVAR(incapacitationType)] call EFUNC(main,getAreaStates);
		[_unit, _painLevel, _bodyAreasStates] spawn FUNC(checkIncapacitatedEH);
	}] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;