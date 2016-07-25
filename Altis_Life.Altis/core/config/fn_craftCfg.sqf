#include "..\..\script_macros.hpp"

/*
	File: fn_craftCfg.sqf
	Author: EdgeKiller

	Description:
	Master configuration file for the crafting menu.

*/
private["_craft","_return","_craftSites"];
if(!((player distance (getMarkerPos "CraftingArea1") < 50) OR  (player distance (getMarkerPos "CraftingArea2") < 50) OR  (player distance (getMarkerPos "CraftingArea3") < 50))) then  {
	closeDialog 0;
	_return = false;
	hint "Musisz być w miejscu wyznaczonym na mapie!";
	} else {

_craft = [_this,0,"",["","goldcoin",10]] call BIS_fnc_param;
if(_craft isEqualTo "") exitWith {closeDialog 0}; //Bad shop type passed.

_craftSites = ["CraftingArea1","CraftingArea2","CraftingArea3"];

switch(_craft) do
{
	case "weapon":
	{
		_return = [
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2,"goldcoin",10]],]
				["hgun_Rook40_F", ["steel",6,"barrel",1,"trigger",1,"oil_processed",2,"goldcoin",2]],
				["hgun_Pistol_heavy_02_F", ["steel",9,"barrel",1,"trigger",1,"iron_refined",3,"goldcoin",4]],
				["arifle_TRG21_F", ["steel",12,"barrel",2,"trigger",1,"butt",2,"sight",1,"goldcoin",8]],
				["arifle_AKS_F", ["steel",13,"barrel",2,"trigger",1,"butt",2,"sight",1,"goldcoin",11]],
				["LMG_Zafir_F", ["steel",16,"barrel",4,"trigger",2,"butt",2,"sight",2,"goldcoin",15]],
				["srifle_DMR_01_F", ["steel",18,"barrel",5,"trigger",1,"butt",5,"sight",5,"goldcoin",10]]
		 ];
	};

    case "vehicle":
    {
		_return = [
			];
    };

	case "uniform":
	{
         _return = [
				["U_O_Wetsuit",["cloth",5,"rubber",3,"goldcoin",5]],
				["U_O_CombatUniform_oucamo",["cloth",11,"goldcoin",4]],
				["U_B_GhillieSuit",["cloth",20,"goldcoin",6,"cannabis",7]],
				["U_O_FullGhillie_sard",["cloth",30,"goldcoin",7,"cannabis",12]]
        ];
	};

	case "backpack":
	{
        _return = [
				
			];
	};

	case "item":
	{
        _return = [
      ["lockpick",["iron_refined",2,"goldcoin",10]],
      ["pickaxe",["iron_refined",2,"rubber",1,"goldcoin",10]],
			["butt",["iron_refined",2,"rubber",2,"goldcoin",10]],
			["sight",["iron_refined",2,"steel",1,"goldcoin",10]],
			["barrel",["iron_refined",2,"steel",3,"goldcoin",10]],
			["trigger",["iron_refined",2,"goldcoin",10]],
			["fuelFull",["iron_refined",1,"oil_processed",3,"goldcoin",10]],
			["blastingcharge",["cloth",4,"C4",5,"trigger",1,"goldcoin",10]],
			["storagesmall",["steel",100,"iron_refined",8,"goldcoin",10]]
      ];
	};

    case "vest":
    {
        _return = [
        ["V_PlateCarrierL_CTRG",["cloth",16,"steelplate",2,"goldcoin",10]]
		 ];
    };
    case "ammo":
    {
        _return = [
        ["150Rnd_762x54_Box_Tracer",["iron_refined",10,"gunpowder",12,"nitroamine",3,"goldcoin",8]],
		["30Rnd_556x45_Stanag_Tracer_Red",["iron_refined",8,"gunpowder",16,"nitroamine",4,"goldcoin",8]],
		["30Rnd_545x39_Mag_Green_F",["iron_refined",8,"gunpowder",16,"nitroamine",4,"goldcoin",8]],
		["10Rnd_762x54_Mag",["iron_refined",10,"gunpowder",12,"nitroamine",2,"goldcoin",10]],	
		["30Rnd_9x21_Mag",["iron_refined",5,"gunpowder",4,"nitroamine",1,"goldcoin",1]],
		["6Rnd_45ACP_Cylinder",["iron_refined",5,"gunpowder",4,"nitroamine",3,"goldcoin",8]]
      	];
    };

    case "attach":
    {
        _return = [
        ["optic_Aco",["sight",1,"iron_refined",1,"goldcoin",10]],
        ["optic_Aco_grn",["sight",1,"iron_refined",1,"goldcoin",10]],
        ["optic_MRCO",["sight",1,"iron_refined",3,"goldcoin",10]],
        ["optic_MRD",["sight",1,"iron_refined",1,"goldcoin",10]],
		["muzzle_snds_M",["steel",10,"sight",1,"iron_refined",1,"goldcoin",10]],
		["toolkit",["steel",1,"copper_refined",1,"iron_refined",1]],
        ["FirstAidKit",["cloth",3,"goldcoin",2]]
			];
		};
	};
	_return;
};
