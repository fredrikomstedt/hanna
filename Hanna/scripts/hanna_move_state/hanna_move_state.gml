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
	if(!place_empty(x, y, obj_manamonster)) {
		hp -= 10;
		can_get_hurt = false;
		velocity[0] = irandom_range(-3*max_velocity[0], 3*max_velocity[0]);
		velocity[1] = -jump_speed;
		sprite_index = spr_hanna;
		alarm[1] = room_speed/8;
		alarm[0] = 2*room_speed;
		exit;
	}
	var enemy_fire = instance_place(x, y, obj_enemy_fire);
	if(enemy_fire != noone) {
		instance_destroy(enemy_fire);
		hp -= 10;
		can_get_hurt = false;
		velocity[0] = irandom_range(-3*max_velocity[0], 3*max_velocity[0]);
		velocity[1] = -jump_speed;
		sprite_index = spr_hanna;
		alarm[1] = room_speed/8;
		alarm[0] = 2*room_speed;
		exit;
	}
	
	if(!place_empty(x, y, obj_dr_demon)) {
		if(obj_dr_demon.can_get_hurt) {
			hp -= obj_dr_demon.frenzy ? 20 : 10;
			can_get_hurt = false;
			velocity[0] = irandom_range(-3*max_velocity[0], 3*max_velocity[0]);
			velocity[1] = -jump_speed;
			sprite_index = spr_hanna;
			alarm[1] = room_speed/8;
			alarm[0] = 2*room_speed;
			exit;
		}
	}
}

//Death
if(hp <= 0) {
	room_goto(rm_game_over);	
}

var mana_potion = instance_place(x, y, obj_mana);
if(mana_potion != noone) {
	mana = min(mana + 30, max_mana);
	if(!show_mana) {
		paused = true;
		dont_jump = true;
		var talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
		talkbox.person = spr_hanna_face;
		talkbox.name = "Hanna";
		talkbox.text = "I just got some mana! I can\nheal myself when damaged by pressing [2],\nand with more mana I can\nshoot fire by pressing [3]!";
		ds_list_add(obj_global_controller.talkboxes, talkbox);
		instance_deactivate_object(talkbox);
		obj_global_controller.alarm[1] = 1;
		show_mana = true;	
	}
	instance_destroy(mana_potion);
}

var spear_pickup = instance_place(x, y, obj_spear_pickup);
if(spear_pickup != noone) {
	spears = min(spears + irandom_range(1, 4), max_spears);
	if(!show_spears) {
		paused = true;
		dont_jump = true;
		var talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
		talkbox.person = spr_hanna_face;
		talkbox.name = "Hanna";
		talkbox.text = "I just picked up a spear! I can throw it\nin the direction I am facing\nby pressing [1]!";
		ds_list_add(obj_global_controller.talkboxes, talkbox);
		instance_deactivate_object(talkbox);
		obj_global_controller.alarm[1] = 1;
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
if(!on_ground && velocity[1] > 0) {
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
	
	//manamonsters
	var manamonster_list = ds_list_create();
	var manamonsters = instance_place_list(x, y + velocity[1], obj_manamonster, manamonster_list, false);
	if(manamonsters > 0) {
		for(var i = 0; i < ds_list_size(manamonster_list); i++) {
			instance_destroy(manamonster_list[| i]);	
		}
	}
	manamonsters = instance_place_list(x - sprite_width/4, y + velocity[1], obj_manamonster, manamonster_list, false);
	if(manamonsters > 0) {
		for(var i = 0; i < ds_list_size(manamonster_list); i++) {
			instance_destroy(manamonster_list[| i]);	
		}
	}
	manamonsters = instance_place_list(x + sprite_width/4, y + velocity[1], obj_manamonster, manamonster_list, false);
	if(manamonsters > 0) {
		for(var i = 0; i < ds_list_size(manamonster_list); i++) {
			instance_destroy(manamonster_list[| i]);	
		}
	}
	ds_list_destroy(manamonster_list);	
	
	//Dr. Demon
	var dr_demon = instance_place(x, y + velocity[1], obj_dr_demon);
	if(dr_demon != noone) {
		if(dr_demon.can_get_hurt) {
			dr_demon.hp -= 10;
			dr_demon.can_get_hurt = false;
			dr_demon.alarm[1] = 2*room_speed;
			dr_demon.alarm[2] = room_speed/8;
			velocity[1] = -jump_speed;
		}
	}
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
		if(!dont_jump) {
			velocity[1] = -jump_speed;
			jumps--;
		} else {
			dont_jump = false;
		}
    }
} else {
    //Control jump height
    if(jump_let_go && velocity[1] <= -(jump_speed/3)) {
        velocity[1] = -(jump_speed/3);
    }
    
    if(jump && jumps > 0) {
        if(!dont_jump) {
			velocity[1] = -jump_speed;
			jumps--;
		} else {
			dont_jump = false;
		}
    }
}

//Move and contact tiles
move(velocity);