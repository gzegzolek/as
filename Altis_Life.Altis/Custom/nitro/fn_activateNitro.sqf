_vehicle = vehicle player;
if (_vehicle isEqualTo player) exitWith {};
if (driver _vehicle != player) exitWith {};
if ((_vehicle getVariable ["nitro",0]) < 1) exitWith {};
if ((speed _vehicle) <= 40) exitWith { systemChat format ["Musisz jechać powyżej 40km/h."]; };
_vehicle setvariable["nitro",((_vehicle getVariable["nitro",0]) - 1),true];
_vehicle setvariable["nitroTime", time, false];
systemChat format ["Nitro aktywne."];
_vehicle say3D "nitro";
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 33;
_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+ (cos _dir*_speed),(_vel select 2)];