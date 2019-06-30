/// @description Move
x += velocity[0];
y += velocity[1];

image_alpha = (alive_time - steps)/alive_time;
steps++;

image_xscale = min(1, image_xscale + 0.6/room_speed);
image_yscale = min(1, image_yscale + 0.6/room_speed);