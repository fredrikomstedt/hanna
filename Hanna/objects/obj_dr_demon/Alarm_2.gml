/// @description Toggle image alpha

if(can_get_hurt) {
	image_alpha = 1;	
} else {
	image_alpha = image_alpha == 1 ? 0 : 1;
	alarm[2] = room_speed/8;
}
