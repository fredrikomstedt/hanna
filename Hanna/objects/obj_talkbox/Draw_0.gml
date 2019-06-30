/// @description 

draw_self();

draw_sprite(person, 0, x + 128, y + 128);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(fnt_spears);

draw_text(x + sprite_width/2 + 256, y + 128, text);
draw_text(x + 128, y + sprite_height - 32, name);
draw_text(x + sprite_width - 200, y + sprite_height - 32, "Press [SPACE] to continue...");