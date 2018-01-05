/*
	Function: VAN_fnc_initCapturePoints
	
	Author: David K
	
	Description:
	Initializes capture point structures for the given array of locations.

	Parameter(s):
		locations:
			Array of location data to initialize as capture points.

	Returns:
		List of configured capture points.
	
	Examples:
		_locs call VAN_fnc_initCapturePoints
*/

private _points = [];
{
	private _marker = createMarker [
		format ["CapturePoint%1", _forEachIndex], 
		_x select 1
	];
	_marker setMarkerShape (if (_x select 4) then 
		[{ "RECTANGLE" }, { "ELLIPSE" }]);
	_marker setMarkerSize [_x select 3, _x select 3];
	_marker setMarkerColor "ColorBlack";
	_marker setMarkerAlpha 0.5;

	_points pushBack _marker;
} forEach _this; 

// Start a process to monitor capture status of our locations.
_points spawn VAN_fnc_captureWatchdog;

_points