/// @description Hanna's second line
var talkbox = talkboxes[| 0];
ds_list_delete(talkboxes, 0);
instance_activate_object(talkbox);
audio_play_sound(talkbox.sound, 8, false);
fifth_line = true;