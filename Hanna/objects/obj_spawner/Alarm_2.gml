/// @description Spawn a deminion
var spawn_x = choose(sprite_get_width(spr_deminion), room_width - sprite_get_width(spr_deminion));
var spawn_y = 700;

var deminion = instance_create_layer(spawn_x, spawn_y, "Instances", obj_deminion);
deminion.velocity[0] = irandom_range(4*deminion.max_velocity[0], 6*deminion.max_velocity[0]);
if(spawn_x > room_width/2) {
	deminion.velocity[0] = -deminion.velocity[0];	
}
deminion.velocity[1] = irandom_range(-3*deminion.max_velocity[1], -5*deminion.max_velocity[1]);
