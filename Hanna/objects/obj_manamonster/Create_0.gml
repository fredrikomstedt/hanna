/// @description The initialization of Hanna.

grav = 1.5;
velocity = [0, 0];
max_velocity = [2, 12];
dir = choose(-1, 1);
acceleration = 0.5;

state = manamonster_spawn_state;

can_create_fire = false;
alarm[0] = irandom_range(room_speed, 5*room_speed);
