/*
if (!flipped) {
	flipped = true;
	sprite_index = spr_switch_down;
	
	with (obj_switch_block) {
		if (switch_id == other.switch_id) {
			instance_destroy();		// Remove block
		}
	}
}
*/

if (!flipped) {
	flipped = true;
	sprite_index = spr_switch_down;
	
	var base_map = obj_control_dimension.base_tilemap;
	var contrast_map = obj_control_dimension.contrast_layer;
	
	if (variable_global_exists("block_x") && variable_global_exists("block_y")) {
		tilemap_set(base_map, 0, block_x, block_y);
		tilemap_set(contrast_map, 0, block_x, block_y);
	}	
}
		