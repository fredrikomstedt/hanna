/// @description Draws Hanna's health and mana

//Health
draw_healthbar(50, 50, 299, 88, hanna.hp, c_black, c_red, $87ab29, 0, false, false);
draw_sprite(spr_healthbar, 0, 50, 50);

//Mana
if(hanna.show_mana) {
	draw_healthbar(50, 120, 299, 158, hanna.mana, c_black, $f7b03e, $f7b03e, 0, false, false);
	draw_sprite(spr_healthbar, 0, 50, 120);
}