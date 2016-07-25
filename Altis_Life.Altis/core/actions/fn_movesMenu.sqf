#include "..\..\script_macros.hpp"

/*
	File: fn_movesMenu.sqf
	Author: Jack "Scarso" Farhall
*/

private["_display","_list","_moves"];
disableSerialization;
player playMoveNow "";

_moves = [
    ["Bruce Lee","AmovPercMstpSnonWnonDnon_exerciseKata"],
	["Pompki","AmovPercMstpSnonWnonDnon_exercisePushup"],
	["Przysiady (Fast)","AmovPercMstpSnonWnonDnon_exercisekneeBendB"],
	["Knee Bends (Normal)","AmovPercMstpSnonWnonDnon_exercisekneeBendA"],
	["Wystraszony","AmovPercMstpSnonWnonDnon_Scared"],
	["Siusiu","Acts_AidlPercMstpSlowWrflDnon_pissing"],
	//["Pijak","AcinPercMstpSnonWnonDnon_agony"],
	["Hm","Acts_starterPistol_out"]
	];

waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
lbClear _list;

{

	_list lbAdd format["%1", _x select 0];
	_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
} foreach _moves;
