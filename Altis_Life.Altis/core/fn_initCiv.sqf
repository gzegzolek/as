#include "..\script_macros.hpp"
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian..
*/

private["_spawnPos","_end"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(str(player) in ["civ_7","civ_8","civ_9","civ_10"]) then
 {
	if((FETCH_CONST(life_donorlevel) isEqualTo 0) && (FETCH_CONST(life_adminlevel) isEqualTo 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
if(life_is_alive && !life_is_arrested) then {
	/* Spawn at our last position */
	player setVehiclePosition [life_civ_position, [], 0, "CAN_COLLIDE"];
} else {
	if(!life_is_alive && !life_is_arrested) then {
		if(EQUAL(LIFE_SETTINGS(getNumber,"save_civilian_positionStrict"),1)) then {
			_handle = [] spawn life_fnc_civLoadout;
      waitUntil {scriptDone _handle};
        CASH = 0;
        [0] call SOCK_fnc_updatePartial;
		};
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	} else {
		if(life_is_arrested) then {
			life_is_arrested = false;
			[player,true] spawn life_fnc_jail;
		};
	};
};

player setVariable["viprank",(FETCH_CONST(life_donorlevel)),true];

//Pagamento VIP
switch (FETCH_CONST(life_donorlevel)) do
{
	case 1: { life_paycheck = life_paycheck + 1000; };  //Bronze
    case 2: { life_paycheck = life_paycheck + 2000; }; //Silver
    case 3: { life_paycheck = life_paycheck + 3000; }; //Gold
    case 4: { life_paycheck = life_paycheck + 5000; }; //Platinum
    case 5: { life_paycheck = life_paycheck + 7000; };//Diamante
	default { life_paycheck = life_paycheck };
};


life_is_alive = true;
player addRating 9999999;
