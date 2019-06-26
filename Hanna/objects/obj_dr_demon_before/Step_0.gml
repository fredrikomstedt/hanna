/// @description Move

//Stay in the room
if(x > room_width - abs(sprite_width)/2) {
	x = room_width - abs(sprite_width)/2;	
	dir = -dir;
}
if(x < abs(sprite_width)/2) {
	x = abs(sprite_width/2);
	dir = -dir;
}


//Change direction
var change_dir = random_range(0, 1);

if(change_dir <= 0.2/room_speed) {
	dir = irandom_range(-1, 1);
}

if(dir == 0) {
	image_speed = 0;	
} else {
	image_xscale = dir;
	image_speed = 1;
	
	x += dir * 2;
}