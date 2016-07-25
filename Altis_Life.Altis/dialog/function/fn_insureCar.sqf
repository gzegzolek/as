#include "..\..\script_macros.hpp"
/*
	File: fn_insureCar.sqf
	Author: Guit0x "Lintox" Adapter 4.4r3 by Mateuus
	
	Description:
	Insure a vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_assurPrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = steamid;
_unit = player;
_spawntext = localize "STR_Garage_spawn_Success";
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_assurPrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"assurPrice");


switch(playerSide) do {
	case civilian: {_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");};
	case west: {_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");};
	case independent: {_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");};
	case east: {_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");};
};
_seguroPrice = _assurPrice;

if(!(_assurPrice isEqualType 0) OR _assurPrice < 1) then {_assurPrice = 500;};
if(TTPBANK < _assurPrice) exitWith {hint format[(localize "STR_Garage_CashError"),[_assurPrice] call life_fnc_numberText];};

[_vid,_pid,_assurPrice,player,life_garage_type] remoteExecCall ["TON_fnc_insureCar",RSERV];
hint format[localize "STR_Assur_OK"],

SUB(TTPBANK,_assurPrice);
closeDialog 0;