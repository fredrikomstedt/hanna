///manamonster_move_state()
//Moves the manamonster according to direction and gravity

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

//Fire
if(can_create_fire) {
	can_create_fire = false;
	var fire = instance_create_layer(x, bbox_top - 16, "Instances", obj_enemy_fire);
	fire.velocity[0] = irandom_range(-7, 7);
	fire.velocity[1] = irandom_range(-5, -10);
	alarm[0] = irandom_range(5*room_speed, 10*room_speed);
}

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