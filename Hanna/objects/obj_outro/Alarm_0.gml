/// @description Fredrik's first line
var talkbox = talkboxes[| 0];
ds_list_delete(talkboxes, 0);
instance_activate_object(talkbox);
first_line = true;