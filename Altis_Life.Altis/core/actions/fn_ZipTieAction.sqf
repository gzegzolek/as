#include "..\..\script_macros.hpp"
/*
	File: fn_ZipTieAction.sqf
	Author: Bryan "Tonic" Boardwine
	Description: Retrains the target.
*/
private["_unit", "_ziptied"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "restrained")) exitWith {};
if(player == _unit) exitWith {};
if (side player == civilian) then
{
	if(life_inv_zipties < 1) then
	{
		_ziptied = false;
	}
	else
	{
		_ziptied = true;
		life_inv_zipties = life_inv_zipties - 1;
		_unit setVariable["ziptied",true,true];
		hint "Zakułeś gostka";
	}
};

if( (!_ziptied) && (side player == civilian) ) exitWith { hint "You have no zipties."; };
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff";

_unit setVariable["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
[0,"STR_NOTF_Ziptied",true,[_unit GVAR["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",civilian];