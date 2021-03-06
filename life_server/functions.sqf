#include "script_macros.hpp"
/*
	File: functions.sqf
	Author: 

	Description:
	
*/
TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith
		{
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};

	[life_atmbank,life_cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall [""life_fnc_admininfo"",_ret];
";
publicVariable "TON_fnc_player_query";
publicVariable "TON_fnc_index";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""You have been kicked out of the gang."";
	};
";

publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 has gave you keys for a %2"",_giver,_name];
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall [""TON_fnc_keyManagement"",2];
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""You have been made the new leader."";
	};
";

publicVariable "TON_fnc_clientGangLeader";

TON_fnc_clientGangLeft =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""You have quit the gang."";
	};
";

publicVariable "TON_fnc_clientGangLeft";

//Cell Phone Messaging
/*
	-fnc_cell_textmsg
	-fnc_cell_textcop
	-fnc_cell_textadmin
	-fnc_cell_adminmsg
	-fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest =
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3022,true];};

	[_msg,name player,5,mapGridPosition player,player] remoteExecCall [""TON_fnc_clientMessage"",independent];
	[] call life_fnc_cellphone;
	hint format[""Wysłałeś widomosć do medyków."",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Musisz wybrać osobę której chcesz wysłać sms!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Musisz potwierdzić aby wysłać!"";ctrlShow[3015,true];};

	[_msg,name player,0] remoteExecCall [""TON_fnc_clientMessage"",_to];
	[] call life_fnc_cellphone;
	hint format[""You sent %1 a message: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""The Police"";
	if(_msg == """") exitWith {hint ""Musisz potwierdzić aby wysłać!"";ctrlShow[3016,true];};

	[_msg,name player,1,mapGridPosition player,player] remoteExecCall [""TON_fnc_clientMessage"",-2];
	[] call life_fnc_cellphone;
	hint format[""You sent %1 a message: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""Musisz potwierdzić aby wysłać!"";ctrlShow[3017,true];};

	[_msg,name player,2,mapGridPosition player,player] remoteExecCall [""TON_fnc_clientMessage"",-2];
	[] call life_fnc_cellphone;
	hint format[""You sent %1 a message: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""NIe jesteś adminem!"";};
	private[""_msg"",""_to""];
	ctrlShow[3020,false];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3020,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3020,true];};
	if(_msg == """") exitWith {hint ""Musisz potwierdzić aby wysłać!"";ctrlShow[3020,true];};

	[_msg,name player,3] remoteExecCall [""TON_fnc_clientMessage"",_to];
	[] call life_fnc_cellphone;
	hint format[""Wiadomość dla admina: %1 - Wiadomość: %2"",name _to,_msg];
	ctrlShow[3020,true];
";

TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""You are not an admin!"";};
	private[""_msg"",""_from""];
	ctrlShow[3021,false];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Musisz potwierdzić aby wysłać!"";ctrlShow[3021,true];};

	[_msg,name player,4] remoteExecCall [""TON_fnc_clientMessage"",-2];
	[] call life_fnc_cellphone;
	hint format[""Wyślij wiadomość do wszystkich: %1"",_msg];
	ctrlShow[3021,true];
";
//komunikaty policji
TON_fnc_cell_PSA =
compileFinal "
    if (isServer) exitWith {};
    if ((call life_coplevel) < 1) exitWith {hint ""You are not a WhiteListed Cop"";};
    private[""_msg"",""_from""];
    ctrlShow[3024,false];
    _msg = ctrlText 3003;
    if (_msg isEqualTo """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3024,true];};

    [_msg,name player,6] remoteExecCall [""TON_fnc_clientMessage"",-2];
    [] call life_fnc_cellphone;
    hint format[""Wiadmość od policji: %1"",_msg];
    ctrlShow[3024,true];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
publicVariable "TON_fnc_cell_PSA";
//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = format["">>>MESSAGE FROM %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>New Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""You Received A New Private Message From %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
            _messages = player getVariable ""cellphone_messages"";
			_newArray = [[_from,_msg]];
			
			{
				_newArray pushback _x;
			}	foreach _messages;
			
			player setVariable [""cellphone_messages"",_newArray];		
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message"",""_loc"",""_unit""];
			_loc = _this select 3;
			_unit = _this select 4;
			_message = format[""--- 911 DISPATCH FROM %1: %2"",_from,_msg];
			if(isNil ""_loc"") then {_loc = ""Unknown"";};
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>New Dispatch<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Officers<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3"",_from,_loc,_msg];

			[""PoliceDispatch"",[format[""A New Police Report From: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message"",""_loc"",""_unit""];
			_loc = _this select 3;
			_unit = _this select 4;
			_message = format[""!!! ADMIN REQUEST FROM %1: %2"",_from,_msg];
			if(isNil ""_loc"") then {_loc = ""Unknown"";};
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3"",_from,_loc,_msg];

			[""AdminDispatch"",[format[""%1 Has Requested An Admin!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 3 :
		{
			private[""_message""];
			_message = format[""!!! ADMIN MESSAGE: %1"",_msg];
			_admin = format[""Sent by admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""You Have Received A Message From An Admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
			_messages = player getVariable ""cellphone_messages"";
			_newArray = [[_from,_msg]];
			
			{
				_newArray pushback _x;
			}	foreach _messages;
			
			player setVariable [""cellphone_messages"",_newArray];
		};

		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN MESSAGE: %1"",_msg];
			_admin = format[""Sent by admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Players<br/><t color='#33CC33'>From: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""You Have Received A Message From An Admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			_messages = player getVariable ""cellphone_messages"";
			_newArray = [[_from,_msg]];
			
			{
				_newArray pushback _x;
			}	foreach _messages;
			
			player setVariable [""cellphone_messages"",_newArray];
			
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};

		case 5: {
			if(side player != independent) exitWith {};
			private[""_message"",""_loc"",""_unit""];
			_loc = _this select 3;
			_unit = _this select 4;
			_message = format[""!!! EMS REQUEST: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>EMS Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><t color='#33CC33'>Coords: <t color='#ffffff'>%2<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3"",_from,_loc,_msg];

			[""TextMessage"",[format[""EMS Request from %1"",_from]]] call bis_fnc_showNotification;
		};
		case 6: { 
          private[""_message"",""_from""];
          _message = format[""SMS POLICJA:: %1"",_msg];
          _from = format[""Policja wysłała: %1"", _from];
          hint parseText format [""<t color='#1684ca'><t size='3'><t align='center'>Policja do wszystkich<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Wszystkich<br/><t color='#33CC33'>From: <t color='#ffffff'>Policja<br/><br/><t color='#33CC33'>Wiadmość:<br/><t color='#ffffff'>%1"",_msg];

          [""AdminMessage"",[""Otrzymano ALARM od Policji!""]] call bis_fnc_showNotification;
          systemChat _message;
          if ((call life_coplevel) > 0) then {systemChat _from;};
        };
	};
";
publicVariable "TON_fnc_clientMessage";

TON_fnc_MapMarkersAdmin = compileFinal "
  life_markers_Vehicles = [];
  life_markers_Players = [];
  if (!life_markers) then {
    life_markers = true;
    hint localize ""STR_ANOTF_MEnabled"";
  } else {
    life_markers = false;
    hint localize ""STR_ANOTF_MDisabled"";
  };
  while {life_markers} do {
    {
      if ((vehicle _x isKindOf ""LandVehicle"") || (vehicle _x isKindOf ""Air"") || (vehicle _x isKindOf ""Ship"")) then {
        if (count(crew vehicle _x) > 0) then {
          {
            if (!(_x in life_markers_Vehicles) && (alive _x) && (getPlayerUID _x != """")) then {
              private[""_pos"", ""_Markers"", ""_Vehicle""];
              _Vehicle = vehicle _x;
              _pos = visiblePosition _x;
              _Markers = createMarkerLocal[format[""CRW%1%2"", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
              _TypeVehicle = (gettext(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
              _Markers setMarkerTextLocal format['%1---%2---%3m', name _x, _TypeVehicle, round(_x distance player)];
              _Markers setMarkerTypeLocal ""mil_dot"";
              if (side _x == independent) then {
                _Markers setMarkerColorLocal (""ColorIndependent"");
              };
              if (side _x == civilian) then {
                _Markers setMarkerColorLocal (""ColorCivilian"");
              };
              if (side _x == west) then {
                _Markers setMarkerColorLocal (""ColorBLUFOR"");
              };
              _Markers setMarkerSizeLocal[1, 1];
              life_markers_Vehicles pushback _x;
              [_x, _Markers, _Vehicle, _TypeVehicle] spawn {
                private[""_PlayersOrVehicles"", ""_Marker"", ""_CrewVehicle""];
                _PlayersOrVehicles = _this select 0;
                _Marker = _this select 1;
								_TypeVehicle = _this select 3;
                while {life_markers && (alive _PlayersOrVehicles) && (vehicle _PlayersOrVehicles != _PlayersOrVehicles) && (getPlayerUID _PlayersOrVehicles != """")} do {
                  _CrewVehicle = ((crew vehicle _PlayersOrVehicles) find _PlayersOrVehicles);
                  _Marker setMarkerPosLocal([(visiblePosition _PlayersOrVehicles select 0) + 20, (visiblePosition _PlayersOrVehicles select 1) - (25 + _CrewVehicle * 20), 0]);
									_Marker setMarkerTextLocal format['%1---%2---%3m', name _PlayersOrVehicles, _TypeVehicle, round(_PlayersOrVehicles distance player)];
                  sleep 0.01;
                };
                deleteMarkerLocal _Marker;
                if (_PlayersOrVehicles in life_markers_Vehicles) then {
                  life_markers_Vehicles set[(life_markers_Vehicles find _PlayersOrVehicles), -1];
                  life_markers_Vehicles = life_markers_Vehicles - [-1];
                };
                true;
              };
            };
          } forEach crew vehicle _x;
        };
      } else {
        if (!(_x in life_markers_Players) && (vehicle _x == _x) && (getPlayerUID _x != """")) then {
          private[""_pos"", ""_Markers""];
          _pos = visiblePosition _x;
          _Markers = createMarkerLocal[format[""PLR%1%2"", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
          _Markers setMarkerTypeLocal ""mil_dot"";
          _Markers setMarkerSizeLocal[1, 1];
          if (side _x == independent) then {
            _Markers setMarkerColorLocal (""ColorIndependent"");
          };
          if (side _x == civilian) then {
            _Markers setMarkerColorLocal (""ColorCivilian"");
          };
          if (side _x == west) then {
            _Markers setMarkerColorLocal (""ColorBLUFOR"");
          };
          _Markers setMarkerTextLocal format[""%1---%2"", name _x, round(_x distance player)];
          if (_x == player) then {
            _Markers setMarkerColorLocal ""ColorGreen"";
          };
          life_markers_Players pushback _x;
          [_x, _Markers] spawn {
            private[""_PlayersOrVehicles"", ""_Marker""];
            _PlayersOrVehicles = _this select 0;
            _Marker = _this select 1;
            while {life_markers && (alive _PlayersOrVehicles) && (vehicle _PlayersOrVehicles == _PlayersOrVehicles) && (getPlayerUID _PlayersOrVehicles != """")} do {
              _Marker setMarkerPosLocal([visiblePosition _PlayersOrVehicles select 0, visiblePosition _PlayersOrVehicles select 1, 0]);
              _Marker setMarkerTextLocal format[""%1---%2"", name _PlayersOrVehicles, round(_PlayersOrVehicles distance player)];
              sleep 0.01;
            };
            deleteMarkerLocal _Marker;
            if (_PlayersOrVehicles in life_markers_Players) then {
              life_markers_Players set[(life_markers_Players find _PlayersOrVehicles), -1];
              life_markers_Players = life_markers_Players - [-1];
            };
            true;
          };
        };
      };
    } forEach playableUnits;
    sleep 0.3;
  };
  {
    _Markers = str _x;
    deleteMarkerLocal _Markers;
  } forEach playableUnits;
";

publicVariable "TON_fnc_MapMarkersAdmin";