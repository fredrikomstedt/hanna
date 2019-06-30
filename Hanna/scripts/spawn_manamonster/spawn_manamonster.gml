/// @description Spawn a manamonster
var spawn_x = choose(sprite_get_width(spr_manamonster), room_width - sprite_get_width(spr_manamonster));
var spawn_y = 700;

var manamonster = instance_create_layer(spawn_x, spawn_y, "Instances", obj_manamonster);
manamonster.velocity[0] = irandom_range(4*manamonster.max_velocity[0], 6*manamonster.max_velocity[0]);
if(spawn_x > room_width/2) {
	manamonster.velocity[0] = -manamonster.velocity[0];	
}
manamonster.velocity[1] = irandom_range(-3*manamonster.max_velocity[1], -5*manamonster.max_velocity[1]);
