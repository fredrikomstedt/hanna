/// @description Handle fading

if(fade) {
	image_alpha -= 1/room_speed;
	
	if(image_alpha <= 0) {
		instance_destroy();	
	}
}

velocity[1] += grav;
move(velocity);