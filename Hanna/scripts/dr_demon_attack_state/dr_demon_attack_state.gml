///dr_demon_attack_state

//Go into frenzy if not in frenzy but should be
if(hp <= 50 && !frenzy) {
	frenzy = true;
	max_velocity[0] *= 2;
	max_velocity[1] *= 2;
	acceleration *= 2;	
}

var choice = irandom_range(0, 2);

switch(choice) {
	case 0: //Fire
		var target_x = obj_hanna.x;
		var target_y = obj_hanna.y;
		var target_dir = point_direction(x, y, target_x, target_y);
		var velocity_x = lengthdir_x(15, target_dir);
		var velocity_y = lengthdir_y(15, target_dir);
		var fire = instance_create_layer(x, y, "Instances", obj_enemy_fire);
		fire.velocity[0] = velocity_x;
		fire.velocity[1] = velocity_y;
		break;
	case 1: //Spear/Fire Spear
		if(frenzy) {
			
		} else {
			var target_x = obj_hanna.x;
			var target_y = obj_hanna.y;
			var target_dir = point_direction(x, y, target_x, target_y);
			var spear = instance_create_layer(x, y, "Instances", obj_deminion_spear);
			
			var velocity_x = lengthdir_x(30, target_dir);
			var velocity_y = lengthdir_y(50, target_dir) - 15;
			spear.velocity[0] = velocity_x;
			spear.velocity[1] = velocity_y;
		}
		break;
	case 2: //Minions
		repeat(irandom_range(1, 3)) {
			spawn_spider();
		}
		repeat(irandom_range(0, 2)) {
			spawn_deminion();	
		}
		repeat(irandom_range(0, 1)) {
			spawn_manamonster();	
		}
		break;
}

state = dr_demon_move_state;