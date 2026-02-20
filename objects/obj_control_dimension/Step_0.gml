/// STEP EVENT
// Cooldown timer
if (switch_cooldown > 0) {
    switch_cooldown--;
}

// Spacebar to switch dimensions (only if both layers exist)
if (keyboard_check_pressed(vk_space) && switch_cooldown == 0) {
    if (base_layer != -1 && contrast_layer != -1) {
        if (global.dimension == "base") {
            global.dimension = "contrast";
            layer_set_visible(base_layer, false);
            layer_set_visible(contrast_layer, true);
        } else {
            global.dimension = "base";
            layer_set_visible(base_layer, true);
            layer_set_visible(contrast_layer, false);
        }
        
        switch_cooldown = 15;
        flash_timer = 6;
		show_dimension_text = 30;
    }
}

if (flash_timer > 0) {
    flash_timer--;
}