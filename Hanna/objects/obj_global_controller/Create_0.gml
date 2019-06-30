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

hanna = instance_create_layer(480, 940, "Instances", obj_hanna);

// Make platforms that will be removed later
platforms = ds_list_create();
for(var i = 0; i < 6; i++) {
	ds_list_add(platforms, instance_create_layer(room_width/2 - 320 + i * 32, 866, "Instances", obj_solid));	
}
for(var i = 0; i < 6; i++) {
	ds_list_add(platforms, instance_create_layer(room_width/2 + 320  - (i + 1) * 32, 866, "Instances", obj_solid));	
}

//Countdown for boss mode
alarm[0] = room_speed*5;//room_speed*60*3;