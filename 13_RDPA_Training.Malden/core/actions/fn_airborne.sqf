{
private ["_start", "_end", "_height", "_speed", "_class", "_side"];
_start   = param [0,position player,[[]]];
_end   = param [1,[0,0,0],[[]]];
_height  = param [2,500,[0]];
_speed  = param [3,"FULL",[""]];
_class   = param[4,"RHS_C130J",[""]];
_side  = param [5,WEST,[WEST]];

_start set [2, _height];

private "_direction";
_direction = [_start, _end] call BIS_fnc_dirTo;

private ["_vehicleContainer", "_vehicle", "_vehicleCrew", "_vehicleGroup"];
_vehicleContainer = [_start, _direction, _class, _side] call BIS_fnc_spawnVehicle;
_vehicle   = _vehicleContainer select 0;
_vehicleCrew  = _vehicleContainer select 1;
_vehicleGroup  = _vehicleContainer select 2;

_vehicle disableAi "TARGET";
_vehicle disableAi "AUTOTARGET";
_vehicleGroup allowFleeing 0;

_vehicle flyInHeight _height;

private "_waypoint";
_waypoint = _vehicleGroup addWaypoint [_end, 0];

_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointSpeed _speed;

_waypoint setWaypointStatements [
 "true",
 "private ['_group', '_vehicle']; _group = group this; _vehicle = vehicle this; { deleteVehicle _x } forEach units _group; deleteVehicle _vehicle; deleteGroup _group;"
];

if (!isNull _vehicle) then {
 _vehicle;
} else {
 false;
};

player moveInAny _vehicle;