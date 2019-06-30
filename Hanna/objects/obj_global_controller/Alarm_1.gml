/// @description Initial pause
screen_save(working_directory + "paused.png");
paused_image = sprite_add(working_directory + "paused.png", 0, 0, 0, 0, 0);
instance_deactivate_all(true);
var talkbox = talkboxes[| 0];
ds_list_delete(talkboxes, 0);
instance_activate_object(talkbox);
