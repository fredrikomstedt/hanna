///dr_demon_move_state()
//Moves Dr. Demon according to direction and gravity

//Switch direction on impact or drop
if(!place_empty(x + dir, y, obj_solid)) {
	dir = -dir;
}

//Change direction
var change_dir = random_range(0, 1);

if(change_dir <= 0.2/room_speed) {
	dir = irandom_range(-1, 1);
}

//Animation
if(dir == 0) {
	image_speed = 0;	
} else {
	image_xscale = dir;
	image_speed = 1;
}

//Horizontal movement
velocity[0] = clamp(velocity[0]+dir*acceleration, -max_velocity[0], max_velocity[0]);

//Gravity
velocity[1] = min(velocity[1] + grav, max_velocity[1]);

//Move and contact tiles
move(velocity);