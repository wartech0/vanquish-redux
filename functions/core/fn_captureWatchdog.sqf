/*
	Function: VAN_fnc_captureWatchdog
	
	Author: David K
	
	Description:
	Watchdog operation that wakes periodically to check the ownership status of map points.

	Parameter(s):
		points:
			Array of markers to periodically update ownership for.

	Returns:
	
	Examples:
		_points spawn VAN_fnc_captureWatchdog
*/

while { true } do {
	sleep 30;
	diag_log format ["%1", _this];

	{
		private _marker = _x;
		private _pos = getMarkerPos _marker;
		private _rad = (getMarkerSize _marker) select 0;
		private _dom = [_pos, _rad] call ALiVE_fnc_getDominantFaction;

		if (!isNil "_dom") then {
			switch (_dom) do {
				case "IND_C_F": { _marker setMarkerColor "ColorGreen" };
				case "BLU_F": { _marker setMarkerColor "ColorBlue" };
				case "OPF_F": { _marker setMarkerColor "ColorRed" };
				default { };
			};
		};
	} forEach _this;
};
