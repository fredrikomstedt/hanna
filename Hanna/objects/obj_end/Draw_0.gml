/// @description draw info
draw_set_font(fnt_game_over);
draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_text(room_width/2, room_height/2, "THE END");
draw_set_font(fnt_spears);
draw_text(room_width/2, 3*room_height/4, "PRESS [ESC] TO QUIT");