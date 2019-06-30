/// @description Handle cutscene
if(run_in) {
	if(!run_in_set) {
		image_speed = 1;
		image_xscale = -1;
		run_in_set = true;
	}
	x -= 8;
	if(x <= 400) {
		run_in = false;
		intro_controller.alarm[2] = room_speed/4;
		image_speed = 0;
	}
}

if(run_out) {
	if(!run_out_set) {
		image_speed = 1;
		image_xscale = 1;
		run_out_set = true;
	}
	x += 8;
	intro_controller.fredrik.x = x + 54;
	intro_controller.fredrik.y = y;
	if(x >= room_width + 100) {
		run_out = false;
		intro_controller.alarm[4] = room_speed/4;
		image_speed = 0;
	}
}