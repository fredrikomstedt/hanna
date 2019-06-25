///player_move_state()
//Moves the player according to input and gravitational forces

//Get input
var right = d_key;
var left = a_key;
var jump = space_key;
var jump_let_go = space_key_let_go;
var spear = spear_key;
var heal = heal_key;
var fire = fire_key;
var x_input = (right - left) * acceleration;

var on_ground = !place_empty(x, y + 1, obj_solid);

//Take damage
if(can_get_hurt) {
	if(!place_empty(x, y, obj_spider)) {
		hp -= 10;
		can_get_hurt = false;
		velocity[0] = irandom_range(-3*max_velocity[0], 3*max_velocity[0]);
		velocity[1] = -jump_speed;
		sprite_index = spr_hanna;
		alarm[1] = room_speed/8;
		alarm[0] = 2*room_speed;
		exit;
	}
	if(!place_empty(x, y, obj_deminion)) {
		hp -= 10;
		can_get_hurt = false;
		velocity[0] = irandom_range(-3*max_velocity[0], 3*max_velocity[0]);
		velocity[1] = -jump_speed;
		sprite_index = spr_hanna;
		alarm[1] = room_speed/8;
		alarm[0] = 2*room_speed;
		exit;
	}
	var enemy_spear = instance_place(x, y, obj_deminion_spear);
	if(enemy_spear != noone) {
		instance_destroy(enemy_spear);
		hp -= 10;
		can_get_hurt = false;
		velocity[0] = irandom_range(-3*max_velocity[0], 3*max_velocity[0]);
		velocity[1] = -jump_speed;
		sprite_index = spr_hanna;
		alarm[1] = room_speed/8;
		alarm[0] = 2*room_speed;
		exit;
	}
}

var mana_potion = instance_place(x, y, obj_mana);
if(mana_potion != noone) {
	mana = min(mana + 30, max_mana);
	if(!show_mana) {
		show_mana = true;	
	}
	instance_destroy(mana_potion);
}

var spear_pickup = instance_place(x, y, obj_spear_pickup);
if(spear_pickup != noone) {
	spears = min(spears + irandom_range(1, 4), max_spears);
	if(!show_spears) {
		show_spears = true;	
	}
	instance_destroy(spear_pickup);
}

if(hurt_flash) {
	image_alpha = 0;	
} else {
	image_alpha = 1;	
}

//Damage enemies
if(!on_ground) {
	//Spiders
	var spider_list = ds_list_create();
	var spiders = instance_place_list(x, y + velocity[1], obj_spider, spider_list, false);
	if(spiders > 0) {
		for(var i = 0; i < ds_list_size(spider_list); i++) {
			instance_destroy(spider_list[| i]);	
		}
	}
	spiders = instance_place_list(x - sprite_width/4, y + velocity[1], obj_spider, spider_list, false);
	if(spiders > 0) {
		for(var i = 0; i < ds_list_size(spider_list); i++) {
			instance_destroy(spider_list[| i]);	
		}
	}
	spiders = instance_place_list(x + sprite_width/4, y + velocity[1], obj_spider, spider_list, false);
	if(spiders > 0) {
		for(var i = 0; i < ds_list_size(spider_list); i++) {
			instance_destroy(spider_list[| i]);	
		}
	}
	ds_list_destroy(spider_list);	
	
	//Deminions
	var deminion_list = ds_list_create();
	var deminions = instance_place_list(x, y + velocity[1], obj_deminion, deminion_list, false);
	if(deminions > 0) {
		for(var i = 0; i < ds_list_size(deminion_list); i++) {
			instance_destroy(deminion_list[| i]);	
		}
	}
	deminions = instance_place_list(x - sprite_width/4, y + velocity[1], obj_deminion, deminion_list, false);
	if(deminions > 0) {
		for(var i = 0; i < ds_list_size(deminion_list); i++) {
			instance_destroy(deminion_list[| i]);	
		}
	}
	deminions = instance_place_list(x + sprite_width/4, y + velocity[1], obj_deminion, deminion_list, false);
	if(deminions > 0) {
		for(var i = 0; i < ds_list_size(deminion_list); i++) {
			instance_destroy(deminion_list[| i]);	
		}
	}
	ds_list_destroy(deminion_list);	
}

//Abilities
//Spear
if(spear) {
	if(spears > 0) {
		sprite_index = spr_hanna_ability;
		state = hanna_spear_state;
		script_execute(state);
		exit;
	}
}

//Healing
if(heal) {
	if(mana >= 20 && hp < max_hp) {
		sprite_index = spr_hanna_ability;
		state = hanna_heal_state;
		script_execute(state);
		exit;
	}
}

//Fire
if(fire) {
	if(mana >= 40) {
		sprite_index = spr_hanna_ability;
		state = hanna_fire_state;
		script_execute(state);
		exit;
	}
}

//Horizontal movement
velocity[0] = clamp(velocity[0]+x_input, -max_velocity[0], max_velocity[0]);

//Friction
if(x_input == 0) {
    velocity[0] = lerp(velocity[0], 0, .2);
	if(on_ground) {
		sprite_index = spr_hanna;
	} else {
		sprite_index = spr_hanna_jump;
	}
} else {
	image_xscale = sign(x_input);
	if(on_ground) {
		sprite_index = spr_hanna_running;
	} else {
		sprite_index = spr_hanna_jump;
	}
}

//Gravity
velocity[1] += grav;

//Jumping
if(on_ground) {
    jumps = jump_amount;
    if(jump) {
        velocity[1] = -jump_speed;
        jumps--;
    }
} else {
    //Control jump height
    if(jump_let_go && velocity[1] <= -(jump_speed/3)) {
        velocity[1] = -(jump_speed/3);
    }
    
    if(jump && jumps > 0) {
        velocity[1] = -jump_speed;
        jumps--;
    }
}

//Move and contact tiles
move(velocity);