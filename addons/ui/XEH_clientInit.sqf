//#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

["SettingsInitialized", {
    // Initial settings
    [true] call FUNC(setElements);

    // On load and entering/exiting a vehicle
    ["infoDisplayChanged", {
        // Selective UI Advanced
        // Defaults must be set in this EH to make sure controls are activated and advanced settings can be modified
        private _force = [true, false] select (GVAR(allowSelectiveUI));
        {
            [_x select 0, _x select 1, _x select 2, _force] call FUNC(setAdvancedElement);
        } forEach ELEMENTS_ADVANCED;
    }] call EFUNC(common,addEventHandler);

    // On changing settings
    ["SettingChanged", {
        params ["_name"];

        // Selective UI Basic
        if (_name in ELEMENTS_BASIC) then {
            call FUNC(setElements);
        };

        // Selective UI Advanced
        {
            params ["_idd", "_elements", "_name"];

            if (_name == _name) then {
                [_idd, _elements, _name] call FUNC(setAdvancedElement);
                TRACE_2("Setting Changed",_name,_name);
            };
        } forEach ELEMENTS_ADVANCED;
    }] call EFUNC(common,addEventHandler);

}] call EFUNC(common,addEventHandler);
