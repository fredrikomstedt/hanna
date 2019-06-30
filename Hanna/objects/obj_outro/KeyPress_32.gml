/// @description Handle talkboxes

if(first_line) {
	first_line = false;
	with(obj_talkbox) {
		instance_destroy();	
	}
	alarm[1] = room_speed/4; //Hanna's first line
}

if(second_line) {
	second_line = false;
	with(obj_talkbox) {
		instance_destroy();	
	}
	var heart = instance_create_layer(334, 800, "Instances", obj_heart);
	alarm[2] = heart.alive_time + room_speed/4;
}

if(third_line) {
	third_line = false;
	with(obj_talkbox) {
		instance_destroy();	
	}
	alarm[3] = room_speed/4; //Fredrik's second line
}

if(fourth_line) {
	fourth_line = false;
	with(obj_talkbox) {
		instance_destroy();	
	}
	hanna.run_out = true;
	fredrik.run_out = true;
}