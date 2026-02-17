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
if (base_layer != -1 && contrast_layer != -1) {
    draw_set_halign(fa_center);
    
    if (global.dimension == "normal") {
        draw_set_color(c_white);
        draw_text(room_width/2, 30, "NORMAL DIMENSION");
    } else {
        draw_set_color(c_black);
        draw_text(room_width/2, 30, "Base DIMENSION");
    }
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}
