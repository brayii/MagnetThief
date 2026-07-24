draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(display_get_gui_width() / 2, 180, "GAME OVER");
draw_text(display_get_gui_width() / 2, 230, "Score: " + string(global.last_score));
draw_text(display_get_gui_width() / 2, 270, "High Score: " + string(global.high_score));
draw_text(display_get_gui_width() / 2, 330, "Press ENTER to Restart");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
