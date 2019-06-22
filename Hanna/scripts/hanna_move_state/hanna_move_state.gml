///player_move_state()
//Moves the player according to input and gravitational forces

//Get input
var right = d_key;
var left = a_key;
var jump = space_key;
var jump_let_go = space_key_let_go;
var x_input = (right - left) * acceleration;

var on_ground = !place_empty(x, y + 1, obj_solid);

//Damage
if(can_get_hurt) {
	if(on_ground && !place_empty(x, y, obj_spider)) {
		hp -= 10;
		can_get_hurt = false;
		velocity[0] = -sign(x_input) * max_velocity[0];
		velocity[1] = -jump_speed;
		state = hanna_hurt_state;
		sprite_index = spr_hanna;
		alarm[1] = room_speed/8;
		alarm[0] = 2*room_speed;
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