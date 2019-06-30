/// @author Fredrik Omstedt
/// @description
randomize();

globalvar seconds_passed;
seconds_passed = 0;

globalvar d_key;
d_key = 0;
globalvar a_key;
a_key = 0;
globalvar space_key;
space_key = 0;
globalvar space_key_let_go;
space_key_let_go = 0;
globalvar spear_key;
spear_key = 0;
globalvar heal_key;
heal_key = 0;
globalvar fire_key;
fire_key = 0;
globalvar paused;
paused = true;
globalvar dont_jump;
dont_jump = true;

hanna = instance_create_layer(175, 702, "Instances", obj_hanna);

// Make platforms that will be removed later
platforms = ds_list_create();
for(var i = 0; i < 6; i++) {
	ds_list_add(platforms, instance_create_layer(room_width/2 - 320 + i * 32, 866, "Instances", obj_solid));	
}
for(var i = 0; i < 6; i++) {
	ds_list_add(platforms, instance_create_layer(room_width/2 + 320  - (i + 1) * 32, 866, "Instances", obj_solid));	
}

//Countdown for boss mode
start_countdown = false;

talkboxes = ds_list_create();

var talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "So this is The Arena... I have to save Fredrik!";
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "I think I can walk with [A] and [D], as well as [<] and [>]. I can also\njump and double-jump with [SPACE].";
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "I should be able to kill enemies by\njumping on them! Let's save Fredrik!";
ds_list_add(talkboxes, talkbox);
instance_deactivate_object(talkbox);

paused_image = noone;
alarm[1] = 5;