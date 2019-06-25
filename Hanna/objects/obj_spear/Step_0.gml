/// @description Move
x += velocity[0];
y += velocity[1];

if(x < -abs(sprite_width)/2 || x >= room_width + abs(sprite_width)/2 || y < -abs(sprite_height)/2 || y > room_height + abs(sprite_height)/2) {
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
spiders = instance_place_list(x, y + sprite_height, obj_spider, spider_list, false);
if(spiders > 0) {
	for(var i = 0; i < ds_list_size(spider_list); i++) {
		instance_destroy(spider_list[| i]);	
	}
}
spiders = instance_place_list(x, y - sprite_height, obj_spider, spider_list, false);
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
deminions = instance_place_list(x, y + sprite_height, obj_deminion, deminion_list, false);
if(deminions > 0) {
	for(var i = 0; i < ds_list_size(deminion_list); i++) {
		instance_destroy(deminion_list[| i]);	
	}
}
deminions = instance_place_list(x, y - sprite_height, obj_deminion, deminion_list, false);
if(deminions > 0) {
	for(var i = 0; i < ds_list_size(deminion_list); i++) {
		instance_destroy(deminion_list[| i]);	
	}
}
ds_list_destroy(deminion_list);