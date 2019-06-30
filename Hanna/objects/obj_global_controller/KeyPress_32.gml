/// @description Insert description here
// You can write your code in this editor
if(paused) {
	if(ds_list_size(talkboxes) > 0) {
		with(obj_talkbox) {
			instance_destroy();
		}
		var talkbox = talkboxes[| 0];
		ds_list_delete(talkboxes, 0);
		instance_activate_object(talkbox);
	} else {
		with(obj_talkbox) {
			instance_destroy();
		}
		paused = false;
		paused_image = noone;
		instance_activate_all();
		if(!start_countdown) {
			start_countdown = true;
			alarm[0] = room_speed*60*3;
		}
	}
}