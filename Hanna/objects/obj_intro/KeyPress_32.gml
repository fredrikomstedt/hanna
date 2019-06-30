/// @description Handle talkboxes

if(first_line) {
	first_line = false;
	with(obj_talkbox) {
		audio_stop_sound(sound);
		instance_destroy();	
	}
	var heart = instance_create_layer(334, 800, "Instances", obj_heart);
	alarm[1] = heart.alive_time + room_speed/2; //Hanna's first line
}

if(second_line) {
	second_line = false;
	with(obj_talkbox) {
		audio_stop_sound(sound);
		instance_destroy();	
	}
	dr_demon.run_in = true;
}

if(third_line) {
	third_line = false;
	with(obj_talkbox) {
		audio_stop_sound(sound);
		instance_destroy();	
	}
	alarm[3] = room_speed/4; //Fredrik's second line
}

if(fourth_line) {
	fourth_line = false;
	with(obj_talkbox) {
		audio_stop_sound(sound);
		instance_destroy();	
	}
	dr_demon.run_out = true;
}

if(fifth_line) {
	fifth_line = false;
	with(obj_talkbox) {
		audio_stop_sound(sound);
		instance_destroy();	
	}
	hanna.run_out = true;	
}