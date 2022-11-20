[
    QGVAR(isEnabled), //"SNAD_injuries_isEnabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    [LSTRING(Injuries_DisplayName), LSTRING(Injuries_Description)],//"Enabled?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [ELSTRING(main,Category),LSTRING(SubCategory)]//"79AD Settings", "Pain Handling"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // defaultvalue
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    QGVAR(weaponHandleMode),//"SNAD_injuries_weaponHandleMode", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    [LSTRING(WeaponHandleMode_DisplayName), LSTRING(WeaponHandleMode_Description)]//"Weapon Handling", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    [ELSTRING(main,Category), LSTRING(SubCategory)]//["79AD Settings", "Pain Handling"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[0, 1, 2], ["None", "Drop", "Put on back"], 1], // defaultvalue
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    //"SNAD_pain_GoProne", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Go Prone?", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["79AD Settings", "Pain Handling"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // defaultvalue
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "SNAD_pain_PainThreshold", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Pain Threshold", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["79AD Settings", "Pain Handling"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0.0, 1.0, 0.5, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;