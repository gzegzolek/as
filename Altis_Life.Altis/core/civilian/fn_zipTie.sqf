#include "..\..\script_macros.hpp"
/*
	File: fn_zipTie.sqf
	Auhtor: Bad^^Eye
	
	Description:
	Main functionality for civ restrain.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(_unit getVariable "restrained" || _unit getVariable "Escorting" || _unit getVariable "zipTie") exitWith {};
if(!(_unit getVariable ["surrender",false]) && !(animationState _unit == "Incapacitated") && !(_unit getVariable ["tazed",false])) exitWith {};
if(isNull _unit) exitWith {};
if(player == unit) exitWith { hint "Nie możesz się skuć!";};
if(life_inv_zipties == 0) exitWith { hint "Nie masz zippów!";};
if(player getVariable ["restrained",false] || player getVariable ["zipTie",false] || player getVariable ["surrender",false]) exitWith { hint "Nie możesz skuć skutego!";};
if(player distance _unit > 4) exitWith { hint "Jesteś zbyt daleko!";};

//Monitor excessive restrainment
[] spawn {
	private "_time";
	while {true} do {
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};

		if(!(player GVAR ["zipTie",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player GVAR ["zipTie",FALSE]) && vehicle player == player) exitWith {
			player SVAR ["zipTie",FALSE,TRUE];
			player SVAR ["Escorting",FALSE,TRUE];
			player SVAR ["transporting",false,true];
			detach player;
			titleText[localize "STR_Cop_ExcessiveRestrain","PLAIN"];
		};
	};
};

life_inv_zipties = life_inv_zipties - 1;
[[player], "life_fnc_ZipTieAction",_unit,false] spawn life_fnc_MP;
player say3D "cuff";