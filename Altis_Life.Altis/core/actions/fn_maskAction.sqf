/*
	File: fn_maskAction.sqf
	Author: Larry aka. Tim
*/
private["_unit"];
params [
	["_unit",objNull,[objNull]]
];

_unit setVariable["masked",true,true];
[player] remoteExecCall ["life_fnc_masked",_unit];
hint "Worek na głoę ofiara nic nie widzi.";
if (player getVariable["isBlindfolded",false]) exitWith {};

player setVariable["isBlindfolded",true,true];

//blackscreen. maybe some heavy blur instead? or somethink like a cotton bag effect?
titleCut ["", "BLACK FADED", 999];

//free the player after 2min if no civs are nearby
[] spawn {
	while {true} do {
		sleep 220;
		if (!(player getVariable["isBlindfolded",false])) exitWith {};

		if (!([civilian,getPos player,30] call life_fnc_nearUnits)) exitWith {
			player setVariable["isBlindfolded",false,true];

		};
	};
};

//wait until the player is free
while {player getVariable["isBlindfolded",false]} do {
	//no need to check every millisec
	sleep 5;

	if (!(alive player)) exitWith {
		player setVariable ["isBlindfolded",false,true];
	
	};
};

titleCut ["", "BLACK IN", 8];