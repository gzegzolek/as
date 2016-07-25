#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private["_skinName"];

switch(playerSide) do {
	case civilian: {
		if(EQUAL(LIFE_SETTINGS(getNumber,"civ_skins"),1)) then {
			if(uniform player isEqualTo "U_C_Poloshirt_blue") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\gay.jpg"];
			};
			if(uniform player isEqualTo "U_C_Poloshirt_stripped") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\batrman.jpg"];
			};
			if(uniform player isEqualTo "U_C_Poloshirt_redwhite") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\cat.jpg"];
			};
			if(uniform player isEqualTo "U_OrestesBody") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\hand.jpg"];
			};
			if(uniform player isEqualTo "U_C_Commoner1_1") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\joker.jpg"];
			};
			if(uniform player isEqualTo "U_C_Poloshirt_tricolour") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\lacoste.jpg"];
			};
			if(uniform player isEqualTo "U_C_Commoner1_3") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\roupaundead.jpg"];
			};
			if(uniform player isEqualTo "U_C_Poloshirt_salmon") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\wolf.jpg"];
			};
			if(uniform player isEqualTo "U_C_Poloshirt_burgundy") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\superman.jpg"];
			};
			if(uniform player isEqualTo "U_C_Commoner_shorts") then {
				player setObjectTextureGlobal [0, "textures\Civ\Clothing\pika.jpg"];
			};
					
		};
		
		////////////////////////VIP INICIO/////////////////////////////////////////////////
		if ((uniform player == "U_C_Commoner1_3") && (FETCH_CONST(life_donorlevel) == 0)) then
		{
			player setObjectTextureGlobal [0, "textures\Civ\Clothing\roupaundead.jpg"];
		};

		if ((uniform player == "U_C_Commoner1_3") && (FETCH_CONST(life_donorlevel) == 1)) then
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\bronze.jpg"];
		};
		if ((uniform player == "U_C_Commoner1_3") && (FETCH_CONST(life_donorlevel) == 2)) then
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\silver.jpg"];
		};
		if ((uniform player == "U_C_Commoner1_3") && (FETCH_CONST(life_donorlevel) == 3)) then
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\gold.jpg"];
		};
		if ((uniform player == "U_C_Commoner1_3") && (FETCH_CONST(life_donorlevel) == 4)) then
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\platinum.jpg"];
		};
		if ((uniform player == "U_C_Commoner1_3") && (FETCH_CONST(life_donorlevel) == 5)) then
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\diamante.jpg"];
		};
            
		if (uniform player isEqualTo "U_B_CombatUniform_mcam" && (FETCH_CONST(life_donorlevel) >= 1)) then 
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\nh.jpg"];
		};
		if (uniform player isEqualTo "U_B_CombatUniform_mcam_vest" && (FETCH_CONST(life_donorlevel) >= 1)) then 
		{
			player setObjectTextureGlobal [0, "textures\Vip\Clothing\VIParctic.jpg"];
		};
		if (backpack player isEqualTo "B_Bergen_mcamo" && (FETCH_CONST(life_donorlevel) >= 1)) then 
		{
			backpackContainer player setObjectTextureGlobal [0, "textures\Civ\Clothing\VIPgayruck.jpg"];
		};
		if (backpack player isEqualTo "B_Bergen_blk" && (FETCH_CONST(life_donorlevel) >= 1)) then 
		{
			backpackContainer player setObjectTextureGlobal [0, "textures\Civ\Clothing\murica_bag.jpg"];
		};
		if (backpack player isEqualTo "B_Carryall_cbr" && (FETCH_CONST(life_donorlevel) >= 0)) then 
		{
			backpackContainer player setObjectTextureGlobal [0, "textures\Civ\Clothing\backpack_PSP_Carry.jpg"];
		};
		if (backpack player isEqualTo "B_Kitbag_cbr" && (FETCH_CONST(life_donorlevel) >= 0)) then 
		{
			backpackContainer player setObjectTextureGlobal [0, "textures\Civ\Clothing\rebelbackpack.jpg"];
		};
		if (backpack player isEqualTo "B_Kitbag_sgg" && (FETCH_CONST(life_donorlevel) >= 0)) then 
		{
			backpackContainer player setObjectTextureGlobal [0, "textures\Civ\Clothing\backpack_SBP_Kitbag.jpg"];
		};
		
		/////////////////////////VIP END///////////////////////////////////////////////////
		
		
		
		
		/*
		if(uniform player isEqualTo "U_B_CombatUniform_mcam") then {
			player setObjectTextureGlobal [0, "textures\Supporter\vipOrange.jpg"];
		};
		if(uniform player isEqualTo "U_B_CombatUniform_mcam_vest") then {
			player setObjectTextureGlobal [0, "textures\Civ\Supporter\VIParctic.jpg"];
		};
		if(uniform player isEqualTo "U_I_CombatUniform") then {
			player setObjectTextureGlobal [0, "textures\Civ\Supporter\bh.jpg"];
		};
		if ((backpack player) isEqualTo "B_Bergen_mcamo") then {
			backpackContainer player setObjectTextureGlobal [0, "textures\Civ\Supporter\VIPgayruck.jpg"];
		};
		*/
	};

	case west: {
	
	if ((uniform player == "U_Rangemaster") && (FETCH_CONST(life_coplevel) == 0)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\cop_uniform.jpg"];
		};

		if ((uniform player == "U_Rangemaster") && (FETCH_CONST(life_coplevel) == 1)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\recruta.jpg"];
		};
		if ((uniform player == "U_Rangemaster") && (FETCH_CONST(life_coplevel) == 2)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\soldado.jpg"];
		};
		if ((uniform player == "U_Rangemaster") && (FETCH_CONST(life_coplevel) == 3)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\cabo.jpg"];
		};
		if ((uniform player == "U_Rangemaster") && (FETCH_CONST(life_coplevel) == 4)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\sargento.jpg"];
		};
		if ((uniform player == "U_B_SpecopsUniform_sgg") && (FETCH_CONST(life_coplevel) == 5)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\tenente.paa"];
		};
		if ((uniform player == "U_B_SpecopsUniform_sgg") && (FETCH_CONST(life_coplevel) == 6)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\capitao.paa"];
		};
		if ((uniform player == "U_B_SpecopsUniform_sgg") && (FETCH_CONST(life_coplevel) == 7)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\major.paa"];
		};
		if ((uniform player == "U_B_SpecopsUniform_sgg") && (FETCH_CONST(life_coplevel) == 8)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\tencoronel.paa"];
		};
		if ((uniform player == "U_B_SpecopsUniform_sgg") && (FETCH_CONST(life_coplevel) == 9)) then
		{
			player setObjectTextureGlobal [0, "textures\Cop\Clothing\coronel.paa"];
		};
	
	
	if(playerSide isEqualTo west) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
};

	case independent: {
		if(uniform player isEqualTo "U_Rangemaster") then {
			player setObjectTextureGlobal [0, "textures\Med\Clothing\medic_uniform.jpg"];
		};
		if ((uniform player) isEqualTo "U_C_Scientist") then {
		player setObjectTextureGlobal [0, "textures\Med\Clothing\medic3_uniform.paa"];
		};
		if(playerSide isEqualTo independent) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
};
