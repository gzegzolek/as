/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["187V",16500]};
	case "187": {_type = ["187",250000]};
	case "901": {_type = ["901",155450]};
	case "215": {_type = ["215",55200]};
	case "213": {_type = ["213",251000]};
	case "211": {_type = ["211",111100]};
	case "207": {_type = ["207",175350]};
	case "207A": {_type = ["207A",88200]};
	case "390": {_type = ["390",551500]};
	case "487": {_type = ["487",60150]};
	case "488": {_type = ["488",22070]};
	case "480": {_type = ["480",30100]};
	case "481": {_type = ["481",170000]};
	case "482": {_type = ["482",80500]};
	case "483": {_type = ["483",200950]};
	case "459": {_type = ["459",150650]};
	case "666": {_type = ["666",55200]};
	case "667": {_type = ["667",504500]};
	case "668": {_type = ["668",71500]};

	case "1": {_type = ["1",22250]};
	case "2": {_type = ["2",22100]};
	case "3": {_type = ["3",23375]};
	case "4": {_type = ["4",33125]};
	case "5": {_type = ["5",21250]};
	case "6": {_type = ["6",11140]};
	case "7": {_type = ["7",8875]};
	case "8": {_type = ["8",72500]};
	case "9": {_type = ["9",82500]};
	case "10": {_type = ["10",87500]};
	case "11": {_type = ["11",75000]};
	case "12": {_type = ["12",21250]};
	case "13": {_type = ["13",22750]};
	case "14": {_type = ["14",82250]};
	case "15": {_type = ["15",111250]};
	case "16": {_type = ["16",80750]};
	case "17": {_type = ["17",20050]};
	case "18": {_type = ["18",11750]};
	case "19": {_type = ["19",11250]};
	case "20": {_type = ["20",7250]};
	case "21": {_type = ["21",5250]};
	case "22": {_type = ["22",211000]};
	case "23": {_type = ["23",532500]};
	case "24": {_type = ["24",200000]};
	case "25": {_type = ["25",510000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_query = format["SELECT wantedID FROM wanted WHERE wantedID='%1'",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_val = [(_type select 1)] call DB_fnc_numberSafe;
_number = _type select 0;

if(count _queryResult != 0) then
{
	_crime = format["SELECT wantedCrimes, wantedBounty FROM wanted WHERE wantedID='%1'",_uid];
	_crimeresult = [_crime,2] call DB_fnc_asyncCall;
	_pastcrimess = [_crimeresult select 0] call DB_fnc_mresToArray;
	if(typeName _pastcrimess == "STRING") then {_pastcrimess = call compile format["%1", _pastcrimess];};
	_pastCrimes = _pastcrimess;
	_pastCrimes pushBack _number;
	_pastCrimes = [_pastCrimes] call DB_fnc_mresArray;
	_query = format["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
	[_query,1] call DB_fnc_asyncCall;
} else {
	_crimes = [_type select 0];
	_crimes = [_crimes] call DB_fnc_mresArray;
	_query = format["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1', '%2', '%3', '%4', '1')",_uid,_name,_crimes,_val];
	[_query,1] call DB_fnc_asyncCall;
};
