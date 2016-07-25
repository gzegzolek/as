#include "..\..\script_macros.hpp"
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_classNameLife","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellMultiplier","_price","_storageFee","_purchasePrice","_assurPrice","_assur"];
_control = SEL(_this,0);
_index = SEL(_this,1);

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format["%1",_dataArr];
_className = SEL(_dataArr,0);
_classNameLife = _className;
_assur = SEL(_dataArr,2);

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleColor = SEL(SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_classNameLife,"textures"),SEL(_dataArr,1)),0);
if(isNil "_vehicleColor") then {_vehicleColor = "Default";};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"price");
_assurPrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"assurPrice");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_storage_fee_multiplier");

switch(playerSide) do {
	case civilian: {
	
	/* NORMAL */
	if ((FETCH_CONST(life_donorlevel) == 0)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
				_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
	
	/* BRONZE */
	if ((FETCH_CONST(life_donorlevel) == 1)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_BRONZE");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_DONATOR_BRONZE");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
				_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
	/* SILVER */
	if ((FETCH_CONST(life_donorlevel) == 2)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_SILVER");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_DONATOR_SILVER");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
				_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
	/* GOLD */
	if ((FETCH_CONST(life_donorlevel) == 3)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_GOLD");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_DONATOR_GOLD");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
				_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
	/* PLATINUM */
	if ((FETCH_CONST(life_donorlevel) == 4)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_PLATINUM");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_DONATOR_PLATINUM");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
				_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};
	/* DIAMANTE */
	if ((FETCH_CONST(life_donorlevel) == 5)) then 
	{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_DONATOR_DIAMANTE");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_DONATOR_DIAMANTE");
		}else{
				_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
				_seguroPrice = _assurPrice * LIFE_SETTINGS(getNumber,"vehicle_assure_multiplier_CIVILIAN");
				_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
	};

	};
	case west: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
	};
	case independent: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
	};
	case east: {
		_purchasePrice = _price * LIFE_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
		_sellMultiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
	};
};
_retrievePrice = _purchasePrice * _storageFee;
_sellPrice = _purchasePrice * _sellMultiplier;
_pseguroPrice = _seguroPrice;

if(!(_sellPrice isEqualType 0) OR _sellPrice < 1) then {_sellPrice = 500;};
if(!(_retrievePrice isEqualType 0) OR _retrievePrice < 1) then {_retrievePrice = 500;};
if(!(_pseguroPrice isEqualType 0) OR _pseguroPrice < 1) then {_pseguroPrice = 500;};

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_RetrievalP")+ " <t color='#8cff9b'>$%1</t><br/>
	" +(localize "STR_Shop_Veh_UI_SellP")+ " <t color='#8cff9b'>$%2</t><br/>
	" +(localize "STR_Shop_Veh_UI_SeguroP")+ " <t color='#8cff9b'>$%9</t><br/>
	" +(localize "STR_Shop_Veh_UI_SeguroE")+ " %10<br/>
	" +(localize "STR_Shop_Veh_UI_Color")+ " %8<br/>
	" +(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %3 km/h<br/>
	" +(localize "STR_Shop_Veh_UI_HPower")+ " %4<br/>
	" +(localize "STR_Shop_Veh_UI_PSeats")+ " %5<br/>
	" +(localize "STR_Shop_Veh_UI_Trunk")+ " %6<br/>
	" +(localize "STR_Shop_Veh_UI_Fuel")+ " %7
	",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
SEL(_vehicleInfo,8),
SEL(_vehicleInfo,11),
SEL(_vehicleInfo,10),
if(_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
SEL(_vehicleInfo,12),
_vehicleColor,
[_assurPrice] call life_fnc_numberText,
if(_assur == 1) then {"<t color='#8cff9b'>Ubezpieczony</t>"} else {"<t color='#FF0000'>NIe ubezpieczony</t>"},
SEL(_vehicleInfo,9)
];

if(_assur == 1) then {
ctrlShow [97480,False];
}else{
ctrlShow [97480,True];
};

ctrlShow [2803,true];
ctrlShow [2830,true];
