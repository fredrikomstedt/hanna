/// @description Insert description here
// You can write your code in this editor
for(var i = -1; i <= 1; i += 0.5) {
	for(var j = -1; j <= 1; j += 0.5) {
		if(i == 0 && j == 0) {
			continue;	
		}
			
		var fireball = instance_create_layer(x, y, "Instances", obj_enemy_fire);
		var dir = point_direction(0, 0, i, j);
		fireball.velocity[0] = lengthdir_x(10, dir);
		fireball.velocity[1] = lengthdir_y(10, dir);
	}
}