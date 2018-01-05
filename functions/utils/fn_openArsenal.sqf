/*
	Function: VAN_fnc_openArsenal
	
	Author: David K
	
	Description:
	Action handler to open the virtual armory. 

	Parameter(s):
		target:
			Object that is requesting arsenal access.

	Returns:
	
	Examples:
		_crate call VAN_fnc_openArsenal		
*/

params [["_target", objNull, [objNull]]];

diag_log format ["Opening arsenal for %1.", _target];
["Open", true] spawn BIS_fnc_arsenal;

_target
