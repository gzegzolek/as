closeDialog 0;
player setDamage (0.35 + (damage player));
[] call life_fnc_hudUpdate;

hint "To teraz się zacznie !";
sleep 5;

player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";

player setVariable ["Druged", true, true];
playsound "hebasound" call life_fnc_globalSound;
//player say3D "heba_sound"intro";";

[] spawn {
	sleep 120 + random 240;
	player setVariable ["useheba", false, true];
};

[] spawn {
	"colorInversion" ppEffectEnable true;
	while {player getVariable ["useheba", true]} do {
		"colorInversion" ppEffectAdjust [random 1,random 1,random 1];
		"colorInversion" ppEffectCommit 1;
		sleep 3 + random 7;
	};
	"colorInversion" ppEffectEnable false;
};

[] spawn {
	"dynamicBlur" ppEffectEnable true;
	while {player getVariable ["useheba", true]} do {
		"dynamicBlur" ppEffectAdjust [random 3];
		"dynamicBlur" ppEffectCommit 0.5;
		sleep 3 + random 7;
	};
	"dynamicBlur" ppEffectEnable false;
};

[] spawn {
	"chromAberration" ppEffectEnable true;
	while {player getVariable ["useheba", true]} do {
		"chromAberration" ppEffectEnable true;
		"ChromAberration" ppEffectAdjust[0.24, 0, true];
		"chromAberration" ppEffectCommit (0.3 + random 0.1);
	waituntil {ppEffectCommitted "chromAberration"};
	sleep 3 + random 7;
	};
	"chromAberration" ppEffectEnable false;
};