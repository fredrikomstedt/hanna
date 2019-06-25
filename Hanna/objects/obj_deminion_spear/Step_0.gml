/// @description Move
x += velocity[0];
y += velocity[1];

velocity[1] = min(velocity[1] + grav, 15);

var dir = point_direction(0, 0, velocity[0], velocity[1]);

image_angle = dir;

if(x < -abs(sprite_width)/2 || x >= room_width + abs(sprite_width)/2 || y < -abs(sprite_height)/2 || y > room_height + abs(sprite_height)/2) {
	instance_destroy();
}

if(place_meeting(x, y, obj_solid)) {
	instance_create_layer(x - velocity[0], y - velocity[1], "Instances", obj_spear_pickup);
	instance_destroy();
}