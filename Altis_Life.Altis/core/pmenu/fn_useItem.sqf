#include "..\..\script_macros.hpp"
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
					player enableFatigue true;
				};
			};
		};
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorObject] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorObject] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorObject] spawn life_fnc_defuseKit;
	};

	case (_item isEqualTo "gpstracker"): {
		[cursorTarget] spawn life_fnc_gpsTracker;closeDialog 0;
	};

	case (EQUAL(_item,"storagesmall")): {
		[false] call life_fnc_storageBox;
	};

	case (EQUAL(_item,"storagebig")): {
		[true] call life_fnc_storageBox;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};

	case (_item isEqualTo "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
  };

	case (EQUAL(_item,"nitro")): {
		[] spawn life_fnc_nitro;
	};

	case (EQUAL(_item,"blindfold")): {
		if(playerSide in [independent]) exitWith {hint "Nie można użyć tego elementu!"};
		if(vehicle player != player) exitWith {hint "Nie można użyć tego elementu w pojezdzie!"};
		_unit = cursorTarget;
		if(isNull _unit) exitWith {};
		if((player distance _unit > 3)) exitWith {hint "Jesteś za daleko!";};
		if(!(_unit getVariable "civrestrained")) exitWith {hint "Ofiara musi mieć kajdanki!";};
		if((_unit getVariable "masked")) exitWith {hint "Osoba jest już porwana!";};
		if(player isEqualTo _unit) exitWith {};
		if(!isPlayer _unit) exitWith {};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_maskAction;
		};
	};

	case (EQUAL(_item,"beer")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
		};
	};
        case (_item == "heba"): {

		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo1";};

		if (([false,_item, 1] call life_fnc_handleInv)) then {

			[] spawn life_fnc_useheba;
		};
	};
	case (EQUAL(_item,"whiskey")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
		};
	};

	case (EQUAL(_item,"moonshine")): {
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
			[player,"drink"] remoteExec ["life_fnc_say3D",RANY];
		};
	};

	case (EQUAL(_item,"cocaine_processed")):
	{
		if(playerSide in [west,independent]) exitWith {hint "Nie możesz ćpać na służbie!";};
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Jesteś na haju!";};
		if(([false,_item,1] call life_fnc_handleInv)) then
			{
				if(isNil "life_drug") then {life_drug = 0;};
				life_drug = life_drug + 0.08;
				if (life_drug < 0.00) exitWith {};
				[] spawn life_fnc_Cocaine;
			};
	};

	case (EQUAL(_item,"heroin_processed")):
	{
		if(playerSide in [west,independent]) exitWith {hint "Nie możesz ćpać na służbie!";};
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Jesteś na haju!";};
		if(([false,_item,1] call life_fnc_handleInv)) then
			{
				if(isNil "life_drug") then {life_drug = 0;};
				life_drug = life_drug + 0.08;
				if (life_drug < 0.00) exitWith {};
				[] spawn life_fnc_Heroin;
			};
	};


	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;};
					[player,"eat"] remoteExec ["life_fnc_say3D",RANY];
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	default {
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_inventory;
[] call life_fnc_hudUpdate;
