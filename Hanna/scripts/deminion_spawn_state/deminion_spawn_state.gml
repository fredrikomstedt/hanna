///spider_spawn_state()
//Handles movement of spider during spawn

var on_ground = !place_empty(x, y + 1, obj_solid);

if(on_ground) {
	state = deminion_move_state;	
}

//Gravity
velocity[1] += grav;

//Move and contact tiles
move(velocity);