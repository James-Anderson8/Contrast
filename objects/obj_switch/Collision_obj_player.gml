if (!flipped) {
	flipped = true;
	sprite_index = spr_switch_down;
	
	var control = obj_control_dimension;
	var base_map = control.base_tilemap;
	var contrast_map = control.contrast_tilemap;
	
	for (var xx = block_x; xx < block_x + block_width; xx++) {
		for (var yy = block_y; yy < block_y + block_height; yy++) {
			tilemap_set(base_map, 0, xx, yy);
			tilemap_set(contrast_map, 0, xx, yy);
		}
	}
}