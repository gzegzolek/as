/*
Description : Taxi Script to Kavala
Author : Mahony
*/
_price = 20000;
_taxigerufen  = "<t color='#FFFF00' size='2' shadow='1' shadowColor='#000000' align='center'>Taksówka została wezwana!</t>";
_taxiangekommen  = "<t color='#FFFF00' size='2' shadow='1' shadowColor='#000000' align='center'>Taksówka powinna byc już na miejscu masz 5 sec aby do niej wsiąść </t>";
if ((life_atmbank) < _price + 25000) exitWith {
hint "Na Taxi trzeba mieć pieniądze ! !";
closeDialog 0;
};
if ((life_cash) == _price) exitWith {
hint "Akceptujemy tylko karty !";
closeDialog 0;
};
life_atmbank = life_atmbank - _price;
if (player distance (getMarkerPos "civ_spawn_1") <= 1000) exitWith {
hint "Ty już jesteś w Kavala !";
closeDialog 0;
};
if (player distance (getMarkerPos "jail_marker") <= 500) exitWith {
hint "Jesteś w wiezieniu !";
closeDialog 0;
};
if(player getVariable ["restrained",false]) exitWith {
hint "Jesteś aresztowany lub związany!";
closeDialog 0;
};

closeDialog 0;
sleep 2;
hint parseText (_taxigerufen);
sleep 30;
_taxiK = "C_Hatchback_01_yellow_F" createVehicle position player;
_taxiK allowDamage false;
hint parseText (_taxiangekommen);
sleep 6;
deleteVehicle _taxiK;
waitUntil {vehicle player != player};
sleep 1;
player allowDamage true;
titleText ["Jesteś w drodze do Kavala !", "BLACK FADED", 20];
playSound "taxi";
deleteVehicle _taxiK;
sleep 28;
titleText ["Jesteś na miejscu teraz się rozliczmy", "BLACK FADED", 1];
life_atmbank = life_atmbank - _price;
sleep 1;
player setPos (getMarkerPos "civ_spawn_1");
sleep 1;
player allowDamage true;