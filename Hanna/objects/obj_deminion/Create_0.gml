/// @description The initialization of the deminion.

grav = 2;
velocity = [0, 0];
max_velocity = [3, 16];
acceleration = 1;

state = deminion_spawn_state;
hanna = obj_hanna;

can_throw = false;
alarm[0] = irandom_range(0, room_speed*2);