///spider_move_state()
//Moves the spider according to direction and gravity

var on_ground = !place_empty(x, y + 1, obj_solid);

//Throw spear
var spear_throw = random_range(0, 1);
if(spear_throw <= 0.5) {
	if(can_throw) {
		state = deminion_throw_state;
		sprite_index = spr_deminion_throw;
		script_execute(state);
		exit;
	}
}

//Move towards Hanna
dir = sign(hanna.x - x);

//Horizontal movement
velocity[0] = clamp(velocity[0]+dir*acceleration, -max_velocity[0], max_velocity[0]);

//Animation
image_xscale = -sign(dir);
if(on_ground) {
	image_speed = 1;
} else {
	image_speed = 0;
}

//Gravity
velocity[1] += grav;

//Move and contact tiles
move(velocity);