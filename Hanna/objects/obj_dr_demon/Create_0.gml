/// @description Initialize Dr. Demon.
image_speed = 0;

dir = 0;

state = dr_demon_move_state;

velocity = [0, 0];
max_velocity = [3, 12];
acceleration = 1;
grav = 2;

hp = 100;
frenzy = false;
can_get_hurt = true;

//Attack cooldown
alarm[0] = irandom_range(room_speed, 10*room_speed);