if (switch_cooldown > 0) {
	switch_cooldown--;
}


// Space to switch dimensions
if (keyboard_check_pressed(vk_space) && switch_cooldown == 0) {
	if (global.dimension == "base") {	// Maybe change to "normal"
		global.dimension = "contrast";
		if (base_layer != -1) layer_visible(base_layer, false);
		if (contrast_layer != -1) layer_visible(contrast_layer, true);
	}
	else {
		global.dimension = "base";
		if (base_layer != -1) layer_visible(base_layer, true);
		if (contrast_layer != -1) layer_visible(contrast_layer, false);
	}
	
	switch_cooldown = 15;
	flash_timer = 6;
}

if flash_timer > 0 {
	flash_timer--;
}