/*
	Function: VAN_fnc_initCapturePoints
	
	Author: David K
	
	Description:
	Initializes capture point structure for a given location.

	Parameter(s):
		location:
			Array of location data to initialize as capture points.

	Returns:
		List of configured capture points.
	
	Examples:
		_locs call VAN_fnc_initCapturePoints
*/

params ["_name", "_position", "_size", "_rotation"];

private _id = floor random 1000;
private _marker = createMarker [format ["%1%2", _name, _id], _position];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerColor "ColorBlack";
_marker setMarkerSize [selectMax _size, selectMax _size];
_marker setMarkerDir _rotation;
_marker setMarkerAlpha 0.6;

[_this, _marker]