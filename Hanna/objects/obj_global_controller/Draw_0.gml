/// @description Insert description here
// You can write your code in this editor
if(paused && paused_image != noone) {
	draw_sprite_ext(paused_image, 0, 0, 0, room_width/sprite_get_width(paused_image), room_height/sprite_get_height(paused_image), 0, c_white, 1);
}