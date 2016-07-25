#include "..\..\script_macros.hpp"
/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!dialog) then {
	createDialog "pInteraction_Menu";
};

if(!isPlayer _curTarget && side _curTarget isEqualTo civilian) exitWith {closeDialog 0;}; //Bad side check?
if(player distance _curTarget > 4 ) exitWith {closeDialog 0;}; // Prevents menu accessing from far distances.

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
life_pInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

if((life_inv_pliers > 0) && (_curTarget GVAR ["restrained",false])) then
{
    _Btn1 ctrlEnable true;
} else {
    _Btn1 ctrlEnable false;
};

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
	_Btn2 ctrlSetText localize "STR_pInAct_Escort";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};


if((_curTarget GVAR ["restrained",false])) then
{
    _Btn2 ctrlEnable true;
} else {
    _Btn2 ctrlEnable false;
};


//Button 3 - Set put in car button
	_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
	_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;
	closeDialog 0;";
if((primaryWeapon player != "")) then { 
	_Btn3 ctrlEnable true;
} else {
    _Btn3 ctrlEnable false;
};
//Button 7 - Rouba
_Btn3 ctrlSetText localize "STR_pAct_RobPerson";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_robAction; closeDialog 0;";

//Button 4 - Set Lockpick Button
_Btn4 ctrlSetText localize "STR_pInAct_Lockpick";
_Btn4 buttonSetAction "[] spawn life_fnc_lockpick; closeDialog 0;";

if((_curTarget GVAR ["restrained",false]) && (life_inv_lockpick > 0)) then
{
    _Btn4 ctrlEnable true;
} else {
    _Btn4 ctrlEnable false;
};

//Button 5 - undefined
_Btn5 ctrlSetText "Tortura";
_Btn5 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_torture; closeDialog 0;";

if (life_inv_pliers > 0) then
{
    _Btn5 ctrlEnable true;
} else {
    _Btn5 ctrlEnable false;
};
//Button 6 - undefined
_Btn6 ctrlSetText "Usun nerke";
_Btn6 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_takeOrgans; closeDialog 0;";

if(life_inv_knife > 0) then
{
    _Btn6 ctrlEnable true;
} else {
    _Btn6 ctrlEnable false;
};
//SeizeWeapons Button
_Btn8 ctrlSetText localize "STR_pInAct_Seize";
_Btn8 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_seizePlayerAction; closeDialog 0;";
/*
//Button 7 - Rouba
_Btn7 ctrlSetText localize "STR_pAct_RobPerson";
_Btn7 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_robAction; closeDialog 0;";
*/

