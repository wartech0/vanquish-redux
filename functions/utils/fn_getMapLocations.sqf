/*
	Function: VAN_fnc_getMapLocations
	
	Author: David K
	
	Description:
	Retrieves major geographic locations for the current map. May be scoped to particular scale of location.

	The location data returned by this function contains the following data at the given indices:

		0: Name (String)
		1: Position ([Number, Number])
		2: Direction (Number)
		3: Size ([Number, Number])
		4: Rectangular (Boolean)

	Parameter(s):
		types:
			Array of requested location types.

	Returns:
		The list of locations in the current world matching the given criteria.
	
	Examples:
		["City", "Village"] call VAN_fnc_getMapLocations
*/

private _locs = [];
{
	private _type_locs = nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize];
	{
		private _size = size _x;
		_locs pushBack [
			text _x, 
			locationPosition _x, 
			direction _x, 
			(_size select 0) max (_size select 1),
			rectangular _x
		];
	} forEach _type_locs;

} forEach _this;

_locs
