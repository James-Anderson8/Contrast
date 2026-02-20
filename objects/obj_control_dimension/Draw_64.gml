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
	
	
    if (global.dimension == "base") {
        draw_text(room_width/2, 30, "Normal");
    } else {
        draw_text(room_width/2, 30, "Contrast");
    }
    
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}