/// @description Hanna's first line
var talkbox = talkboxes[| 0];
ds_list_delete(talkboxes, 0);
instance_activate_object(talkbox);
second_line = true;