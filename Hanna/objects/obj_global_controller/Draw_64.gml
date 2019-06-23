/// @description Draws Hanna's health and mana

//Health
draw_healthbar(50, 50, 299, 88, hanna.hp, c_black, c_red, $87ab29, 0, false, false);
draw_sprite(spr_healthbar, 0, 50, 50);

//Spear
if(hanna.show_spears) {
	draw_sprite(spr_spear_ability, 0, 82, 212);	
}

//Mana
if(hanna.show_mana) {
	draw_healthbar(50, 120, 299, 158, hanna.mana, c_black, $f7b03e, $f7b03e, 0, false, false);
	draw_sprite(spr_healthbar, 0, 50, 120);
	
	//Heal ability
	draw_sprite(spr_heal_ability, 0, 175, 212);
	
	//Fire ability
	draw_sprite(spr_fire_ability, 0, 267, 212);
}