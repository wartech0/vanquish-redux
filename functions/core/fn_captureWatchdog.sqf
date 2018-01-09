/*
	Function: VAN_fnc_captureWatchdog
	
	Author: David K
	
	Description:
	Watchdog operation that wakes periodically to check the ownership status of map points. Assigns marker a color based on the dominant faction and marks the area as owned by a particular faction.

	Parameter(s):
		points:
			Array of markers to periodically update ownership for.

	Returns:
	
	Examples:
		_points spawn VAN_fnc_captureWatchdog
*/

params [["_point", [], [[]]],
		["_interval", 10, [0]]];

private _marker = _point select 1;

while { true } do {
	sleep _interval;

	private _dom = _marker call VAN_fnc_getDominantSide;

	_point set [2, _dom];

	if (!isNil "_dom") then {
		switch (_dom) do {
			case "GUER": { _marker setMarkerColor "ColorGreen" };
			case "WEST": { _marker setMarkerColor "ColorBlue" };
			case "EAST": { _marker setMarkerColor "ColorRed" };
			default { _marker setMarkerColor "ColorBlack" };
		};
	};

	diag_log format ["%1", van_target_locations];
};
