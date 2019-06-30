///dr_demon_move_state()
//Moves Dr. Demon according to direction and gravity

//Go into frenzy if not in frenzy but should be
if(hp <= 50 && !frenzy) {
	frenzy = true;
	max_velocity[0] *= 2;
	max_velocity[1] *= 2;
	acceleration *= 2;
}

//Switch direction on impact or drop
if(!place_empty(x + dir, y, obj_solid)) {
	dir = -dir;
}

//Make sure Dr. Demon stays in the map
if(x < abs(sprite_width)/2) {
	x = abs(sprite_width)/2;	
}
if(x > room_width - abs(sprite_width)/2) {
	x = room_width - abs(sprite_width)/2;	
}

if(y < abs(sprite_height)/2) {
	y = abs(sprite_height)/2;	
}
if(y > 960) {
	y = 960;
}

//Change direction
var change_dir = random_range(0, 1);

if(change_dir <= 0.02) {
	dir = irandom_range(-1, 1);
}

//Animation
if(dir == 0) {
	if(velocity[0] == 0) {
		image_speed = 0;
	}
} else {
	image_xscale = dir;
	image_speed = 1;
}

//Horizontal movement
velocity[0] = clamp(velocity[0]+dir*acceleration, -max_velocity[0], max_velocity[0]);

//Gravity
var on_ground = !place_empty(x, y + 1, obj_solid);
if(on_ground) {
	velocity[1] = 0;
} else {
	velocity[1] += grav;
}

//Move and contact tiles
move(velocity);