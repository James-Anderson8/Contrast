/// DRAW GUI EVENT
// Screen flash effect
if (flash_timer > 0) {
    draw_set_alpha(0.15);
    
    if (global.dimension == "normal") {
        draw_set_color(c_white);
    } else {
        draw_set_color(c_black);
    }
    
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

// Only show HUD if we're in a dimension-switching level
if (show_dimension_text > 0) {
	show_dimension_text--;
	
	var alpha = min(1, show_dimension_text / 15);
	draw_set_alpha(alpha)
	draw_set_halign(fa_center);
	if (global.dimension == "base") {
		draw_set_colour(c_black);
		draw_text(room_width / 2, 30, "Normal");
	}
	else {
		draw_set_colour(c_black);
		draw_text(room_width/2, 30, "Contrast");
	}
	
	draw_set_alpha(1);
	draw_set_halign(fa_left);
}

// Key counter
draw_sprite(spr_key, 0, 50, 50);
draw_text(80, 55, "x " + string(global.keys));