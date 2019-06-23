///hanna_heal_state()

if(image_index > image_number - 1) {
	mana = max(0, mana - 20);	
	hp = min(hp + 20, max_hp);
	repeat(irandom_range(20, 30)) {
		instance_create_layer(x + random_range(-abs(sprite_width)/2, abs(sprite_width)/2), y + random_range(-sprite_height/4, sprite_height/2), "Instances", obj_heal_blob);	
	}
	sprite_index = spr_hanna;
	state = hanna_move_state;
}

//Friction
velocity[0] = lerp(velocity[0], 0, .2);

//Gravity
velocity[1] += grav;

move(velocity);