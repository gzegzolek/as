#include "..\..\script_macros.hpp"
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(life_inv_gpsTracker isEqualTo 0) exitWith {hint "Potrzebujesz GPS."};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Nie możesz dodać trasy w samochodzie"};
if(player distance _unit > 7) exitWith {hint "Musisz być bliżej"};
if(!([false,"gpstracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 4;
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Jesteś za daleko!","PLAIN"];};
titleText["You have placed the GPS Tracker","PLAIN"];

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_Traceur_GPS",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "GPS Tracker "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
	if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
	_marker setMarkerPosLocal getPos _veh;
	uiSleep 2;
	};
};
