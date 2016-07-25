#include "..\..\script_macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_handle"];
_itemArray = life_gear;
waitUntil {!(isNull (findDisplay 46))};

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if(EQUAL(count _itemArray,0)) exitWith {
    switch(playerSide) do {
        case west: {
            [] call life_fnc_copLoadout;
        };
        
        case civilian: {
            [] call life_fnc_civLoadout;
        };

        case independent: {
            [] call life_fnc_medicLoadout;
        };
    };
};

_itemArray params [
	"_uniform",
	"_vest",
	"_backpack",
	"_goggles",
	"_headgear",
	["_items",[]],
	"_prim",
	"_seco",
	["_uItems",[]],
	["_uMags",[]],
	["_bItems",[]],
	["_bMags",[]],
	["_vItems",[]],
	["_vMags",[]],
	["_pItems",[]],
	["_hItems",[]],
	["_yItems",[]]
];

if(!(EQUAL(_goggles,""))) then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_headgear,""))) then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_uniform,""))) then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_vest,""))) then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_backpack,""))) then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

/* Hotfix for losing virtual items on login */
if(!isNil {SEL(_this,0)}) then {
	ADD(life_maxWeight,(round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,(backpack player),"maximumload") / 4)));
};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} forEach _items;

{player addItemToUniform _x;} forEach (_uItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
{player addItemToVest _x;} forEach (_vItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
{player addItemToBackpack _x;} forEach (_bItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);
life_maxWeight = 100;

{
    [true,SEL(_x,0),SEL(_x,1)] call life_fnc_handleInv;
} forEach (_yItems);

/* Réglage de la capacité en fonction des sac à dos */
life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");

/* Réglage de la capacité en fonction des sac à dos */
[] spawn
{
    while{true} do
    {
        waitUntil {!(EQUAL(backpack player,""))};
        _bp = backpack player;
        _cfg = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_bp,"maximumload");
        _load = round(_cfg / 4);
        if(EQUAL(backpack player,"B_OutdoorPack_blk")) then { _load = 25; };
		if(EQUAL(backpack player,"B_AssaultPack_khk")) then { _load = 25; };
        if(EQUAL(backpack player,"B_AssaultPack_dgtl")) then { _load = 35; };   		
        if(EQUAL(backpack player,"B_AssaultPack_rgr")) then { _load = 35; };
        if(EQUAL(backpack player,"B_AssaultPack_blk")) then { _load = 35; };
        if(EQUAL(backpack player,"B_AssaultPack_cbr")) then { _load = 35; };            
        if(EQUAL(backpack player,"B_AssaultPack_sgg")) then { _load = 45; };
		if(EQUAL(backpack player,"B_AssaultPack_mcamo")) then { _load = 45; };
		if(EQUAL(backpack player,"B_Kitbag_mcamo")) then { _load = 55; };
		if(EQUAL(backpack player,"B_FieldPack_blk")) then { _load = 55; };
		if(EQUAL(backpack player,"B_FieldPack_ocamo")) then { _load = 55; };
		if(EQUAL(backpack player,"B_FieldPack_oucamo")) then { _load = 55; };
        if(EQUAL(backpack player,"B_Bergen_blk")) then { _load = 65; };
        if(EQUAL(backpack player,"B_TacticalPack_oli")) then { _load = 65; };
        if(EQUAL(backpack player,"B_Bergen_sgg")) then { _load = 65; };
        if(EQUAL(backpack player,"B_Bergen_rgr")) then { _load = 65; }; 
        if(EQUAL(backpack player,"B_Bergen_mcamo")) then { _load = 75; };		
        if(EQUAL(backpack player,"B_Kitbag_cbr")) then { _load = 75; };
        if(EQUAL(backpack player,"B_Kitbag_sgg")) then { _load = 75; };            
        if(EQUAL(backpack player,"B_Carryall_khk")) then { _load = 85; };
		if(EQUAL(backpack player,"B_Carryall_ocamo")) then { _load = 85; };
		if(EQUAL(backpack player,"B_Carryall_oucamo")) then { _load = 85; };
		if(EQUAL(backpack player,"B_Carryall_mcamo")) then { _load = 100; };
		if(EQUAL(backpack player,"B_ViperLightHarness_khk_F")) then { _load = 100; };
		if(EQUAL(backpack player,"B_ViperLightHarness_blk_F")) then { _load = 100; };
        if(EQUAL(backpack player,"B_Carryall_oli")) then { _load = 100; };    
        if(EQUAL(backpack player,"B_Carryall_cbr")) then { _load = 220; };
		if(EQUAL(backpack player,"B_AssaultPack_tna_F")) then { _load = 130; };
		if(EQUAL(backpack player,"B_FieldPack_ghex_F")) then { _load = 150; };
		if(EQUAL(backpack player,"B_ViperHarness_blk_F")) then { _load = 160; };
		if(EQUAL(backpack player,"B_Bergen_dgtl_F")) then { _load = 240; };
        life_maxWeight = life_minWeight + _load;
        waitUntil {!(EQUAL(backpack player,_bp))};
        if(EQUAL(backpack player,"")) then {
            life_maxWeight = life_minWeight;
        };
    };
};    
//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(!(EQUAL(_prim,""))) then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(!(EQUAL(_seco,""))) then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{
    if (!(EQUAL(_x,""))) then {
        player addPrimaryWeaponItem _x;
    };
} forEach (_pItems);
{
    if (!(EQUAL(_x,""))) then {
        player addHandgunItem _x;
    };
} forEach (_hItems);

[] call life_fnc_playerSkins;