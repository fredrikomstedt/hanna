/// @description Spawns enemies

spider_spawn = random_range(0, 1);
if(spider_spawn <= spider_spawn_rate/room_speed) {
	alarm[0] = 1;	
}

deminion_spawn = random_range(0, 1);
if(deminion_spawn <= deminion_spawn_rate/room_speed) {
	alarm[2] = 1;	
}
