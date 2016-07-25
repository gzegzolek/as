#include "..\..\script_macros.hpp"
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_Pos","_rndmrk","_mrkstring"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
_action = [_this,2] call BIS_fnc_param;//Action name
_cops = (west countSide playableUnits);

if(_cops < 1) exitWith {hint "NIe można napadać , ponieważ nie ma psów";};
//if(_cops < 30) exitWith {hint "Sorry feature disabled until I fix it, should be fixed soon though.";};
if(side _robber isEqualTo west) exitWith { hint "Co ty robisz?" };
if(side _robber isEqualTo independent) exitWith { hint "Co myślisz jak to zrobić?" };
if(_robber distance _shop > 20) exitWith { hint "Aby obrabować sklep musisz znajdowoac sie w promieniu 5 metrów!" };
if (vehicle player != _robber) exitWith { hint "Wyjdź z auta!" };

if (currentWeapon _robber isEqualTo "") exitWith { hint "Nie można okraść ponieważ jesteś laczkiem!" };

if !(alive _robber) exitWith {};

_kassa = 40000 + round(random 30000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then {[1,format["ALARM! - %1 Napadanie trwa...", _shop]] remoteExec ["life_fnc_broadcast",west]; };
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["NIe lękaj się psiarni nie ma w promieniu 5 metrów (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

   _rndmrk = random(1000);
   _mrkstring = format ["wrgMarker_%1", _rndmrk];
   _Pos = position player;
   _marker = createMarker [_mrkstring, _Pos];
   _marker setMarkerColor "ColorRed";
   _marker setMarkerText "!Uwaga! >>>>>> Trwa napad <<<<<< !Uwaga!";
   _marker setMarkerType "mil_warning";
[1,"Sklep jest obrabowywany!"] remoteExec ["life_fnc_broadcast",0]; // General broadcast alert to everyone, uncomment for testing, or if you want it anyway.

while{true} do
{
	uiSleep 2.00;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Trwa napad musisz być w obębie 5 metrów(%1%2)...",round(_cP * 100),"%"];

	if(_cP >= 1 OR !alive _robber) exitWith {};
	if(_robber distance _shop > 5.1) exitWith { };
	if((_robber getVariable["restrained",false])) exitWith {};
	if(life_istazed) exitWith {} ;
	if(life_interrupted) exitWith {};
};


	if!(alive _robber) exitWith { life_rip = false;call life_fnc_hudUpdate; };
	if(_robber distance _shop > 5.1) exitWith { deleteMarker _marker; hint "Jesteś frajerem nie udało ci się!"; 5 cutText ["","PLAIN"]; life_rip = false; call life_fnc_hudUpdate;};
	if(_robber getVariable "restrained") exitWith { life_rip = false; hint "Jesteś aresztowany!"; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;};
	if(life_istazed) exitWith { deleteMarker _marker; life_rip = false; hint "Jesteś obezwładniony!"; 5 cutText ["","PLAIN"]; call life_fnc_hudUpdate;};

   5 cutText ["","PLAIN"];
   titleText[format["Leci kasiorka $%1 z napadu, Szybko!!",[_kassa] call life_fnc_numberText],"PLAIN"];
   deleteMarker _marker;
   ADD(CASH,_kassa);
   [] call life_fnc_hudSetup;

   _rip = false;
	sleep (30 + random(30)); //Clerk in the store takes between 30-210 seconds before he manage to warn the police about the robbery.
	life_use_atm = true; // Robber can not use the ATM at this point.
	playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
	if!(alive _robber) exitWith {};
[0,format["Policyjne wiadomości: Sklep został okradziony suma pieniędzy była $%3!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",west];
[0,format["Szmatławiec News: Sklep został okradziony suma pieniędzy była $%3!, może jest jakiś konfident i zgłosi to na Policje!",name _robber, _shop, [_kassa] call life_fnc_numberText]] remoteExec ["life_fnc_broadcast",civilian];
[getPlayerUID _robber,name _robber,"15"] remoteExec ["life_fnc_wantedAdd",2];


uiSleep 1200;
_action = _shop addAction["Rob Shop",life_fnc_robShops];
_shop switchMove "";
