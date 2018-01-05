enableSaving [false, false];

// Load mission parameters.
van_param_locations_type = "van_locations_type" call BIS_fnc_getParamValue;

// Initialize server-side logic.

if (isServer) then {
	private _scopes = [];
	switch (van_param_locations_type) do {
		case 0: { _scopes pushBack "NameLocal" };
		case 1: { _scopes pushBack "NameVillage" };
		case 2: { _scopes pushBack "NameCity" };
		case 3: { _scopes pushBack "NameCityCapital" };
		default { };
	};

	private _locations = _scopes call VAN_fnc_getMapLocations;
	van_target_locations = _locations call VAN_fnc_initCapturePoints;
};