/// @description Handle cutscene
if(run_out) {
	if(!run_out_set) {
		sprite_index = spr_hanna_running;
		image_speed = 1;
		image_xscale = 1;
		run_out_set = true;
	}
	x += 8;
	if(x >= room_width + 100) {
		run_out = false;
		var fadeout = instance_create_layer(0, 0, "FadeIn", obj_fadeout);
		fadeout.room_transition = rm_end;
	}
}