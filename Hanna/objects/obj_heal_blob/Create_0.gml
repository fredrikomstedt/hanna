/// @description Initialize splat drop

velocity = [random_range(-1, 1), -irandom_range(2, 5)]
steps = 0;
alive_time = 2*room_speed + irandom_range(-room_speed/2, room_speed/2);
alarm[0] = alive_time;

scale = random_range(1, 2);
image_xscale = scale;
image_yscale = scale;