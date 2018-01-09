/*
	Function: VAN_fnc_getDominantSide
	
	Author: David K
	
	Description:
	Utility function for determining the dominant faction in a given area.

	Parameter(s):
		marker:
			Marker denoting the area to check.

	Returns:
	
	Examples:
		_marker call VAN_fnc_getDominantSide
*/

params ["_marker"];

private _size = getMarkerSize _marker;
private _radius = (_size select 0) max (_size select 1);

private _east = count ([getMarkerPos _marker, _radius, ["EAST","entity"]] call ALIVE_fnc_getNearProfiles);
private _west = count ([getMarkerPos _marker, _radius, ["WEST","entity"]] call ALIVE_fnc_getNearProfiles);
private _res = count ([getMarkerPos _marker, _radius, ["GUER","entity"]] call ALIVE_fnc_getNearProfiles);

if (selectMax [_east, _west, _res] == 0) exitWith { "NONE" };

private _dist = [
	[_east, "EAST"],
	[_west, "WEST"],
	[_res, "GUER"]
];

_dist sort false;
(_dist select 0) select 1