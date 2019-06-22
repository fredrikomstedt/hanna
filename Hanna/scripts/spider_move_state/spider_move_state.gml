///spider_move_state()
//Moves the spider according to direction and gravity

var on_ground = !place_empty(x, y + 1, obj_solid);

//Switch direction on impact or drop
if(!place_empty(x + dir, y, obj_solid)) {
	dir = -dir;
	velocity[0] = dir;
} 
if(on_ground && place_empty(x + sprite_width/2 + dir, y + 1, obj_solid)) {
	dir = -dir;	
	velocity[0] = dir;
}

//Horizontal movement
velocity[0] = clamp(velocity[0]+dir, -max_velocity[0], max_velocity[0]);

//Animation
image_xscale = sign(dir);
if(on_ground) {
	image_speed = 1;
} else {
	image_speed = 0;
}

//Gravity
velocity[1] += grav;

//Move and contact tiles
move(velocity);