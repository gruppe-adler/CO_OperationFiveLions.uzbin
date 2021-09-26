["Five Lions", "Convoy Start", {
    ConvoyScript = [] execVM "USER\simpleConvoy\mcdiodconvoy.sqf";
}] call zen_custom_modules_fnc_register;


["Five Lions", "Show Intro Start", {
     ["intro.paa", 15, 3] remoteExec ["USER\customCam\fn_showIntro.sqf", 0];
}] call zen_custom_modules_fnc_register;


["Five Lions", "Show Intro Raid 1", {
     ["firstraid.paa", 15, 3] remoteExec ["USER\customCam\fn_showIntro.sqf", 0];
}] call zen_custom_modules_fnc_register;


["Five Lions", "Show Intro Raid 2", {
     ["firstraid.paa", 15, 3] remoteExec ["USER\customCam\fn_showIntro.sqf", 0];
}] call zen_custom_modules_fnc_register;


["Five Lions", "Convert to Taliban Flag", {
     params ["_position", "_object"];

     if (isNull _object) then {
            private _flags = nearestObjects [ASLtoAGL _position, ["FlagCarrierCore"], 50];
            if (count _flags > 0) then {
                _flags params ["_flag"];

                _flag setFlagTexture "data\tali_flag.paa";
            } else {
                private _vehicles = nearestObjects [ASLtoAGL _position, ["AllVehicles"], 50];
                if (count _vehicles > 0) then {
                    _vehicles params ["_vehicle"];
                    _vehicle forceFlagTexture "data\tali_flag.paa";
                } else {
                    hint "no flag or vehicle found";
                };
        };
     } else {
        if (_flag isKindOf "FlagCarrierCore") then {
            _flag setFlagTexture "data\tali_flag.paa";
        } else {
            hint "no flag found";
        };
    };
}] call zen_custom_modules_fnc_register;


["Five Lions", "Convert to Afghan Army Flag", {
     params ["_position", "_object"];

     if (isNull _object) then {
            private _flags = nearestObjects [ASLtoAGL _position, ["FlagCarrierCore"], 50];
            if (count _flags > 0) then {
                _flags params ["_flag"];

                _flag setFlagTexture "data\flag3.paa";
            } else {
                private _vehicles = nearestObjects [ASLtoAGL _position, ["AllVehicles"], 50];
                if (count _vehicles > 0) then {
                    _vehicles params ["_vehicle"];
                    _vehicle forceFlagTexture "data\flag3.paa";
                } else {
                    hint "no flag or vehicle found";
                };
        };
     } else {
        if (_flag isKindOf "FlagCarrierCore") then {
            _flag setFlagTexture "data\flag3.paa";
        } else {
            hint "no flag found";
        };
    };
}] call zen_custom_modules_fnc_register;