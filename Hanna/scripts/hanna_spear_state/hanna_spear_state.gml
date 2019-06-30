///hanna_spear_state()

if(image_index > image_number - 1) {
	spears = max(0, spears-1);
	
	var spear = instance_create_layer(x, y, "Instances", obj_spear);
	spear.velocity[0] = 10*image_xscale;
	spear.image_xscale = image_xscale;
	audio_play_sound(snd_spear, 8, false);
	
	sprite_index = spr_hanna;
	state = hanna_move_state;
}