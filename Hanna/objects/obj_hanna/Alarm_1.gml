/// @description Toggle hurt flash.
if(!can_get_hurt) {
	hurt_flash = !hurt_flash;
	alarm[1] = room_speed/8;
}