#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the personal aid kit treatment time based on amount of damage to heal
 *
 * Arguments:
 * unit <OBJECT>
 *
 * Return Value:
 * treatment time <NUMBER>
 *
 * Example:
 * [_target] call ace_medical_fnc_treatmentAdvanced_fullHealTreatmentTime
 *
 * Public: No
 */

private _totalDamage = 0;

{
    _totalDamage = _totalDamage + _x;
} forEach (_this getVariable [QGVAR(bodyPartStatus), []]);

(GVAR(useTimeMin_PAK) max (_totalDamage * 10) min (GVAR(useTimeCoeff_PAK)*GVAR(useTimeMin_PAK)))
