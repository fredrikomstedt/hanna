/// @description Move
x += velocity[0];
y += velocity[1];

if(x < -sprite_width/2 || x >= room_width + sprite_width/2 || y < -sprite_height/2 || y > room_height + sprite_height/2) {
	instance_destroy();
}

if(place_meeting(x, y, obj_solid)) {
	instance_destroy();
}

//Kill spiders
var spider_list = ds_list_create();
var spiders = instance_place_list(x, y, obj_spider, spider_list, false);
if(spiders > 0) {
	for(var i = 0; i < ds_list_size(spider_list); i++) {
		instance_destroy(spider_list[| i]);	
	}
}
ds_list_destroy(spider_list);

//Kill deminions
var deminion_list = ds_list_create();
var deminions = instance_place_list(x, y, obj_deminion, deminion_list, false);
if(deminions > 0) {
	for(var i = 0; i < ds_list_size(deminion_list); i++) {
		instance_destroy(deminion_list[| i]);	
	}
}
ds_list_destroy(deminion_list);

//Kill manamonsters
var manamonster_list = ds_list_create();
var manamonsters = instance_place_list(x, y, obj_manamonster, manamonster_list, false);
if(manamonsters > 0) {
	for(var i = 0; i < ds_list_size(manamonster_list); i++) {
		instance_destroy(manamonster_list[| i]);	
	}
}
ds_list_destroy(manamonster_list);

//Dr. Demon
var dr_demon = instance_place(x, y, obj_dr_demon);
if(dr_demon != noone) {
	if(dr_demon.can_get_hurt) {
		dr_demon.hp -= 10;
		dr_demon.can_get_hurt = false;
		dr_demon.alarm[1] = 2*room_speed;
		dr_demon.alarm[2] = room_speed/8;
		audio_play_sound(snd_dr_demon_damage, 6, false);
	}
}