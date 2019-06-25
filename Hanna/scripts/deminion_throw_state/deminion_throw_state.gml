///deminion_throw_state()

//Look towards Hanna
dir = sign(hanna.x - x);
image_xscale = -sign(dir);

//Gravity
velocity[1] += grav;

if(image_index > image_number - 1) {	
	var spear = instance_create_layer(x, y, "Instances", obj_deminion_spear);
	
	spear.velocity[0] = abs(hanna.x - x)*dir/30;
	spear.velocity[1] = -18;
	
	sprite_index = spr_deminion_walking;
	state = deminion_move_state;
	can_throw = false;
	alarm[0] = irandom_range(room_speed*5, room_speed*10);
}