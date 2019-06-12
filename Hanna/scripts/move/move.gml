///move(velocity)
//Moves the object with regards to a collision object
var velocity = argument0;

//Horizontal collisions
if(velocity[0] > 0) {
    var collision_right = !place_empty(x + velocity[0], y, obj_solid);   
    if(collision_right) {
        while(place_empty(x + 1, y, obj_solid)) {
            x += 1;   
        }
        velocity[@ 0] = 0;
    }
} else {
    var collision_left = !place_empty(x + velocity[0], y, obj_solid);   
    if(collision_left) {
        while(place_empty(x - 1, y, obj_solid)) {
            x -= 1;   
        }
        velocity[@ 0] = 0;
    }
}

//Horizontal movement
x += velocity[0];

//Vertical collisions
if(velocity[1] > 0) {
    var collision_bottom = !place_empty(x, y + velocity[1], obj_solid);
    if(collision_bottom) {
        while(place_empty(x, y + 1, obj_solid)) {
            y += 1;   
        }
        velocity[@ 1] = 0;
    }
} else {
    var collision_top = !place_empty(x, y + velocity[1], obj_solid);   
    if(collision_top) {
        while(place_empty(x, y - 1, obj_solid)) {
            y -= 1;   
        }
        velocity[@ 1] = 0;
    }
}

//Vertical movement
y += velocity[1];