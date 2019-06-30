image_alpha -= 0.3/room_speed;

if(image_alpha <= 0) {
	instance_destroy();	
}