if(isServer)exitWith{};
private["_ziel", "_rang", "_marke", "_org", "_message"];
if(vehicle player != player )exitWith{};
_ziel = cursorTarget;
if(isNull _ziel) then {_ziel = player;};    
if(!(_ziel isKindOf "Man")) then {_ziel = player;};  
if(!(alive _ziel)) then {_ziel = player;};     
switch(playerSide)do{
 case west:{
  switch (call life_coplevel) do{
	case 1: { _rang = "Praktykant"; };
	case 2: { _rang = "Kadet"; };
	case 3: { _rang = "Posterunkowy"; };
	case 4: { _rang = "Komisarz"; };
	case 5: { _rang = "Oficer"; };
	case 6: { _rang = "Sierżant"; };
	case 7: { _rang = "Porucznik"; };
	case 8: { _rang = "Kapitan"; };
	case 9: { _rang = "Komendant"; };
	default { _rank =  "Error";};
  };
  _marke = "marke_cop";
  _org = "Policja Altis";
 };
 case independent:{
  switch (call life_mediclevel) do{
	case 1: { _rang = "Salowy"; };
	case 2: { _rang = "Kaczkowy"; };
	case 3: { _rang = "Pielegniarz"; };
	case 4: { _rang = "Lekarz"; };
	case 5: { _rang = "Logistyk"; };
    case 6: { _rang = "Doktor"; };
	case 7: { _rang = "Ordynator"; };
	default {_rank =  "Error";};
  };
  _marke = "marke_mtd";
  _org = "MTD Altis";
 };
 case civilian:{
  if(playerSide == civilian)then{
   _rang = "Cywil";
   _marke = "marke_ziv";
   _org = "Republik Altis";
  }else{
   _rang = "Zivilist";
   _marke = "marke_abi";
   _org = "Republik Altis";
  };  
 };
};
_message = format["<img size='10' color='#FFFFFF' image='icons\ausweis\%1.paa'/><br/><br/><t size='2.5'>%2</t><br/><t size='1.8'>%3</t><br/><t size='1'>%4</t>",_marke, name player, _rang, _org];
[player, _message] remoteExec ["life_fnc_Lizenzsehen",_ziel];
