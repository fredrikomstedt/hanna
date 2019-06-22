/// @description Toggle hurt flash.
if(state == hanna_hurt_state) {
	hurt_flash = !hurt_flash;
	alarm[1] = room_speed/8;
}