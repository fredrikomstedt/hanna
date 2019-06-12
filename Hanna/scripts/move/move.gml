///move(velocity)
//Moves the object with regards to a collision object
var velocity = argument0;

//Horizontal collisions
if(velocity[0] > 0) {
    var collision_right = !(place_empty(bbox_right + velocity[0], bbox_bottom, obj_solid) && place_empty(bbox_right + velocity[0], bbox_top, obj_solid));   
    if(collision_right) {
        while(place_empty(bbox_right + 1, bbox_bottom, obj_solid) && place_empty(bbox_right + 1, bbox_top, obj_solid)) {
            x += 1;   
        }
        velocity[@ 0] = 0;
    }
} else {
    var collision_left = !(place_empty(bbox_left + velocity[0], bbox_bottom, obj_solid) && place_empty(bbox_left + velocity[0], bbox_top, obj_solid));   
    if(collision_left) {
        while(place_empty(bbox_left - 1, bbox_bottom, obj_solid) && place_empty(bbox_left - 1, bbox_top, obj_solid)) {
            x -= 1;   
        }
        velocity[@ 0] = 0;
    }
}

//Horizontal movement
x += velocity[0];

//Vertical collisions
if(velocity[1] > 0) {
    var collision_bottom = !(place_empty(bbox_left, bbox_bottom + velocity[1]) && place_empty(bbox_right, bbox_bottom + velocity[1]));   
    if(collision_bottom) {
        while(place_empty(bbox_left, bbox_bottom + 1, obj_solid) && place_empty(bbox_right, bbox_bottom + 1, obj_solid)) {
            y += 1;   
        }
        velocity[@ 1] = 0;
    }
} else {
    var collision_top = !(place_empty(bbox_left, bbox_top + velocity[1]) && place_empty(bbox_right, bbox_top + velocity[1]));   
    if(collision_top) {
        while(place_empty(bbox_left, bbox_top - 1, obj_solid) && place_empty(bbox_right, bbox_top - 1, obj_solid)) {
            y -= 1;   
        }
        velocity[@ 1] = 0;
    }
}

//Vertical movement
y += velocity[1];