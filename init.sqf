enableSaving [false, false];

// Load mission parameters.
van_param_locations_type = "van_locations_type" call BIS_fnc_getParamValue;

// Initialize server-side logic.
if (isServer) then {
	private _locations = ["Cities", "Villages"] call VAN_fnc_getMapLocations;
	van_target_locations = _locations apply { _x call VAN_fnc_initCapturePoint };

	// Initialize capture watchdog for each point.
	{ 
		[_x, 10] spawn VAN_fnc_captureWatchdog;
	} forEach van_target_locations;
};