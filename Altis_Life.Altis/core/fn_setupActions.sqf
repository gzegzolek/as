/*
	File: fn_setupActions.sqf
	Author:

	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
	case civilian: {
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		/*
//Throw in car
		life_actions = life_actions + [player addAction["<t color = '#6baf41'>Throw in car</t>",life_fnc_throwcar,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 2.5 && isPlayer cursorTarget && (cursorTarget getVariable "restrained") ']];	
		*/
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable["robbed",FALSE]) ']];
		// Suicide Bomb
			life_actions = life_actions + [player addAction["<t color='#FF0000'>Wysadż się</t>",life_fnc_suicideBomb,"",0,false,false,"",
			'vest player isEqualTo "V_HarnessOGL_brn" && alive player && playerSide isEqualTo civilian && !life_istazed && !life_isSuicide && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
			//dokument
		     life_actions = life_actions + [player addAction["Pokaż dokument",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
		 	};
		
	case west:
		{
		life_actions pushBack [player addAction[localize "STR_pAct_DriverSeat",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player isEqualTo player) && (locked cursorObject) != 0 && cursorObject distance player < 5']];
		life_actions pushBack [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_copEnter,"passenger",100,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player isEqualTo player)&& (locked cursorObject) != 0 && cursorObject distance player < 5 && (!(cursorObject isKindOf "B_Heli_Attack_01_F"))']];
		life_actions pushBack [player addAction[localize "STR_pAct_CGunnerSeat",life_fnc_copEnter,"commander",100,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship"))&& (vehicle player isEqualTo player) && (locked cursorObject) != 0 && cursorObject distance player < 5 && ((cursorObject isKindOf "B_Heli_Attack_01_F")||(cursorObject isKindOf "B_Heli_Transport_01_F")||(cursorObject isKindOf "B_MRAP_01_hmg_F"))']];
		life_actions pushBack [player addAction[localize "STR_pAct_GoOut",life_fnc_copEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player) isEqualTo 2)']];
		//seize Objects
       life_actions = life_actions + [player addAction["Konfiskata",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];
       //Seize weapons
       life_actions = life_actions + [player addAction["Skonfiskuj broń",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
			//dokument
	   life_actions = life_actions + [player addAction["Pokaż odznakę",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
	    	// nano EMP Little Bird
	   life_actions = life_actions + [player addAction["<t color='#FF0000'>EMP konsola</t>",life_fnc_openEmpMenu,[],8,false,false,"",'[_this] call life_fnc_isEmpOperator']];
			};
		
case independent: 
 {
	life_actions pushBack [player addAction[localize "STR_pAct_DriverSeat",life_fnc_medEnter,"driver",200,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player isEqualTo player) && (locked cursorObject) != 0 && cursorObject distance player < 5']];
	life_actions pushBack [player addAction[localize "STR_pAct_PassengerSeat",life_fnc_medEnter,"passenger",100,false,false,"",'!isNull cursorObject && ((cursorObject isKindOf "Car")||(cursorObject isKindOf "Air")||(cursorObject isKindOf "Ship")) && (vehicle player isEqualTo player)&& (locked cursorObject) != 0 && cursorObject distance player < 5 && (!(cursorObject isKindOf "B_Heli_Attack_01_F"))']];
	life_actions pushBack [player addAction[localize "STR_pAct_GoOut",life_fnc_medEnter,"exit",100,false,false,"",'(vehicle player != player) && (locked(vehicle player) isEqualTo 2)']];			
	//dokument  
	        life_actions = life_actions + [player addAction["Pokaż dokument",life_fnc_Lizenzzeigen,"",1,false,true,"",'!isNull cursorTarget && cursorTarget isKindOf "Man"']];
			//pasy
		
     
};
};
life_actions pushBack (player addAction ["<img image='icons\seatOn.paa' /><t color='#BBBB00'>zapnij pasy</t>", {life_seatbelt=true}, "", 3, false, true, "", 'vehicle player isKindOf "Car" && !life_seatbelt && vehicle player != player']);
life_actions pushBack (player addAction ["<img image='icons\seatOff.paa' /><t color='#BBBB00'>odepnij pasy</t>", {life_seatbelt=false}, "", 3, false, true, "", 'vehicle player isKindOf "Car" && life_seatbelt && vehicle player != player']);

//life_actions pushBack (player addAction ["<img image='icons\seatOn.paa' /><t color='#BBBB00'>Pasy On</t>", {life_imAuto = false;}, "", 3, true, true, "", 'vehicle player isKindOf "Car" && !life_imAuto']);
//life_actions pushBack (player addAction ["<img image='icons\seatOff.paa' /><t color='#BBBB00'>Pasy Off</t>", {life_imAuto = true;}, "", 3, true, true, "", 'vehicle player isKindOf "Car" && life_imAuto']);
//remove mask
life_actions = life_actions + [player addAction["<t color='#FFB124'>Zdejmij worek</t>",life_fnc_unmask,"",1,false,true,"",' playerSide isEqualTo west OR playerSide isEqualTo civilian && !isNull cursorTarget && cursorTarget getVariable "masked" && player distance cursorTarget < 3 && cursorTarget isKindOf "Man" ']];
//pasy
