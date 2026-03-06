/// DRAW GUI EVENT
// Screen flash effect
if (flash_timer > 0) {
    draw_set_alpha(0.15);
	
    if (background_dark) {
        draw_set_color(c_white);
    } else {
        draw_set_color(c_black);
    }
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

// Dimension text
// Dimension indicator - only show when timer is active
if (show_dimension_text > 0) {
    show_dimension_text--;
    
    // Fade out effect (optional)
    var alpha = min(1, show_dimension_text / 15); // Fades after 15 frames
    draw_set_alpha(alpha);
	draw_set_halign(fa_center);
	
    if (background_dark) {
        draw_set_color(c_white);  // White text on dark background
    } else {
        draw_set_color(c_black);  // Black text on light background
    }
	
	draw_set_font(Title);
    if (global.dimension == "base") {
        draw_text(room_width/2, 30, "Normal");
    } else {
        draw_text(room_width/2, 30, "Contrast");
    }
    
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}

// Key counter

if (room == Level3 || room == Level4 || room = Level5 ) {  // Add more rooms once created
	draw_sprite(spr_key, 0, 50, 50); // I think this line is drawing the big key sprite
	
	if (background_dark) {
		draw_set_colour(c_white);
	}
	else {
		draw_set_colour(c_black);
	}
	
	draw_text(85, 55, "x " + string(global.keys));
	draw_set_colour(c_white);
}