_target = _this select 0;
_pos = getPos _target;
_direction = getDir _target;
_target setDir _direction;
_target setposATL [_pos select 0,_pos select 1, 0.5];