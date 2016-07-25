#include "..\..\script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price","_price","_storageFee","_purchasePrice"];
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

_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");

switch(playerSide) do {
	case civilian: {
	
	/* NORMAL */
	if ((FETCH_CONST(life_donorlevel) == 0)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};
	
	/* BRONZE */
	if ((FETCH_CONST(life_donorlevel) == 1)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_BRONZE");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};
	/* SILVER */
	if ((FETCH_CONST(life_donorlevel) == 2)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_SILVER");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};
	/* GOLD */
	if ((FETCH_CONST(life_donorlevel) == 3)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_GOLD");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};
	/* PLATINUM */
	if ((FETCH_CONST(life_donorlevel) == 4)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_PLATINUM");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};
	/* DIAMANTE */
	if ((FETCH_CONST(life_donorlevel) == 5)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_DIAMANTE");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
	};

	
	};
	case west: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");};
	case independent: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");};
	case east: {_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");};
};
_price = _purchasePrice * _storageFee;

if(!(_price isEqualType 0) OR _price < 1) then {_price = 500;};
if(TTPBANK < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(life_garage_sp isEqualType []) then {
	if(life_HC_isActive) then {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
	} else {
		[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
	};
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		if(life_HC_isActive) then {
			[_vid,_pid,life_garage_sp,_unit,_price,0,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
		} else {
			[_vid,_pid,life_garage_sp,_unit,_price,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	} else {
		if(life_HC_isActive) then {
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC_Life];
		} else {
			[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["TON_fnc_spawnVehicle",RSERV];
		};
	};
};

hint localize "STR_Garage_SpawningVeh";
SUB(TTPBANK,_price);
[1] call SOCK_fnc_updatePartial;
closeDialog 0;
