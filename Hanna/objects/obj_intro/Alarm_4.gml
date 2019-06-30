/// @description Hanna's second line
var talkbox = talkboxes[| 0];
ds_list_delete(talkboxes, 0);
instance_activate_object(talkbox);
fifth_line = true;