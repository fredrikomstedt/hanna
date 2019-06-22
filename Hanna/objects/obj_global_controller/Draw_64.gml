/// @description Draws Hanna's health and mana

var health_start = 50;
var health_length = sprite_get_width(spr_healthbar) - 4;
var health_height = sprite_get_height(spr_healthbar) - 4;
draw_healthbar(health_start + 2, health_start + 2, health_start + 2 + health_length, health_start + 2 + health_height, hanna.hp, c_black, c_red, $87ab29, 0, false, false);
draw_sprite(spr_healthbar, 0, health_start, health_start);