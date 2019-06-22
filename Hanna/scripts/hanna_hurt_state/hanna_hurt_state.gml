///hanna_hurt_state()

if(hurt_flash) {
	image_alpha = 0;	
} else {
	image_alpha = 1;	
}

velocity[0] = lerp(velocity[0], 0, .2);
velocity[1] += grav;

move(velocity);