/*	File: fn_autoMessages.sqf	Author: BenjaminSansNom		Description:	Auto messages in game every X seconds*/
[] spawn {	
	_messages = [ 		"Restarty o 8,12,16,20,24,04 <br/> <t color='#e32828' size='1.5'>www.altisland.pl</t>",		
	"TeamSpeak:<br/><t color='#e32828' size='1.5'>51.254.132.75</t>"	];	
	_refreshTime = 1200; 
	_i = 0;	while {true} do {		
	_count = count _messages;		
	_message = _messages select _i;	
	hint parseText format["<t color='#ffffff' size='2'>AltisLand</t><t color='#c45454' size='2'>V2</t><br/><br/><img shadown='false' size='6' image='textures\armalife.jpg'/><br/><br/>%1", 
	_message];		
	sleep _refreshTime;		if (_i == (_count - 1)) then {			_i = 0;		} else {			_i = _i + 1;		};	};};