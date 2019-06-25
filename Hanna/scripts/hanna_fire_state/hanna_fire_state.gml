///hanna_fire_state()

if(image_index > image_number - 1) {
	mana = max(0, mana - 40);
	for(var i = -1; i <= 1; i += 0.5) {
		for(var j = -1; j <= 1; j += 0.5) {
			if(i == 0 && j == 0) {
				continue;	
			}
			
			var fireball = instance_create_layer(x, y, "Instances", obj_fire);
			var dir = point_direction(0, 0, i, j);
			fireball.velocity[0] = lengthdir_x(10, dir);
			fireball.velocity[1] = lengthdir_y(10, dir);
		}
	}
	
	sprite_index = spr_hanna;
	state = hanna_move_state;
}