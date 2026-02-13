// Flash effect when switching

if (flash_timer > 0) {
	draw_set_alpha(0.15);
	
	if global.dimension == "base" {
		draw_set_colour(c_white);
	}
	else {
		draw_set_colour(c_black);
	}
	
	
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
}

// Dimension indicator

draw_set_font(Game_text);
draw_set_halign(fa_center);

if (global.dimension == "base") {
	draw_set_colour(c_white);
	draw_text(room_width/2, 30, " NORMAL DIMENSION ");
}
else {
	draw_set_colour(c_black);
	draw_text(room_width/2, 30, " CONTRAST DIMENSION ");
}

draw_set_halign(fa_left)
draw_set_colour(c_white)

