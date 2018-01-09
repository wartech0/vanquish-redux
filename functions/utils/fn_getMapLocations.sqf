/*
	Function: VAN_fnc_getMapLocations
	
	Author: David K
	
	Description:
	Retrieves major geographic locations for the current map. May be scoped to particular scale of location.

	The location data returned by this function contains the following data at the given indices:

		0: Name (String)
		1: Position ([Number, Number])
		3: Size ([Number, Number])
		2: Direction (Number)

	Parameter(s):
		filters:
			Optional list of location filters.

	Returns:
		The list of locations in the current world matching the given criteria.
	
	Examples:
		["Cities", "Villages"] call VAN_fnc_getMapLocations
*/

private _locations = [];
private _filters = _this;

private _categories = if (count _filters == 0) then 
	[{ "true" configClasses (missionConfigFile >> "TargetLocations") }, 
	 { "configName _x in _filters" configClasses (missionConfigFile >> "TargetLocations") }];

{ 
	private _instances = "true" configClasses _x;
	_locations = _locations + (_instances apply {
		[
			getText (_x >> "name"),
			getArray (_x >> "position"),
			getArray (_x >> "size"),
			getNumber (_x >> "rotation")
		]
	});
} forEach _categories;

_locations