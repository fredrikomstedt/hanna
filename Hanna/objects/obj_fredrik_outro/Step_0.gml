/// @description Handle cutscene
if(run_out) {
	if(!run_out_set) {
		sprite_index = spr_fredrik_running;
		image_speed = 1;
		image_xscale = 1;
		run_out_set = true;
	}
	x += 8;
	if(x >= room_width + 100) {
		run_out = false;
	}
}