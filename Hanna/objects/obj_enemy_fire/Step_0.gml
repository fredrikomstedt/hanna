/// @description Move
x += velocity[0];
y += velocity[1];

if(x < -sprite_width/2 || x >= room_width + sprite_width/2 || y < -sprite_height/2 || y > room_height + sprite_height/2) {
	instance_destroy();
}

if(place_meeting(x, y, obj_solid)) {
	instance_destroy();
}