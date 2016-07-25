#define SAFETY_ZONES    [["safezone_kav", 100],["safezone_ath", 100], ["safezone_pygros", 100], ["safezone_sof", 100], ["safezone_vip", 100]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "!!!!!!Jesteś w strefie zielonej. NIe strzelaj!!!!!!"

     if (isDedicated) exitWith {};
     waitUntil {!isNull player};

switch (playerSide) do
{
	case west:
	{
	};
	
	case independent:
	{
		player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
             deleteVehicle (_this select 6);
             titleText [MESSAGE, "PLAIN", 3];
             };
        }];
	};
	case civilian:
	{
     player addEventHandler ["Fired", {
            if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
            {
             deleteVehicle (_this select 6);
             titleText [MESSAGE, "PLAIN", 3];
             };
        }];
	};
};