/// @description Boss battle engaged
for(var i = 0; i < ds_list_size(platforms); i++) {
	instance_destroy(platforms[| i]);	
}
ds_list_destroy(platforms);

for(var xx = room_width/2 - 64; xx < room_width/2 + 64; xx += 32) {
	instance_create_layer(xx, 1024, "Instances", obj_solid);
	instance_create_layer(xx, 1024+32, "Instances", obj_solid);
}

instance_create_layer(obj_dr_demon_before.x, obj_dr_demon_before.y, "Instances", obj_dr_demon);
instance_destroy(obj_dr_demon_before);
instance_destroy(obj_spawner);

paused = true;
dont_jump = true;
var talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
talkbox.person = spr_dr_demon_face;
talkbox.name = "Dr. Demon";
talkbox.text = "I grow tired of this!\nI will kill you myself!";
talkbox.sound = snd_dr_demon_arena;
ds_list_add(obj_global_controller.talkboxes, talkbox);
instance_deactivate_object(talkbox);

talkbox = instance_create_layer(0, room_height-256, "GUI", obj_talkbox);
talkbox.person = spr_hanna_face;
talkbox.name = "Hanna";
talkbox.text = "Uh oh, shit just got real...";
talkbox.sound = snd_hanna_arena_4;
ds_list_add(obj_global_controller.talkboxes, talkbox);
instance_deactivate_object(talkbox);

obj_global_controller.alarm[1] = 1;