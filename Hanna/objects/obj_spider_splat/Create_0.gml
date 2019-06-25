/// @description Initialize splat
fade = false;
velocity = [0, 0];
grav = 1.5;

alarm[0] = 5*room_speed;

repeat(irandom_range(3, 8)) {
	instance_create_layer(x + irandom_range(-10, 10), y, "Instances", obj_spider_splat_drop);	
}