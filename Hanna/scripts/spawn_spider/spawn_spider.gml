/// @description Spawn a spider.
var spawn_x = choose(sprite_get_width(spr_spider), room_width - sprite_get_width(spr_spider));
var spawn_y = 710;

var spider = instance_create_layer(spawn_x, spawn_y, "Instances", obj_spider);
spider.velocity[0] = irandom_range(4*spider.max_velocity[0], 6*spider.max_velocity[0]);
if(spawn_x > room_width/2) {
	spider.velocity[0] = -spider.velocity[0];	
}
spider.velocity[1] = irandom_range(-3*spider.max_velocity[1], -5*spider.max_velocity[1]);