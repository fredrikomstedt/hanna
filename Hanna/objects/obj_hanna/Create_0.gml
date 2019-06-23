/// @description The initialization of Hanna.

grav = 1.5;
jump_speed = 16;
jump_amount = 2;
jumps = jump_amount;
velocity = [0, 0];
max_velocity = [8, 24];
acceleration = 2;

hp = 100;
max_hp = 100;
can_get_hurt = true;
hurt_flash = false;

mana = 100;
max_mana = 100;
show_mana = mana > 0;

state = hanna_move_state;
