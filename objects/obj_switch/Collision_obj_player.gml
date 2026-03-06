if (!flipped) {
	flipped = true;
	sprite_index = spr_switch_down;
	
	with (obj_switch_block) {
		if (switch_id == other.switch_id) {
			instance_destroy();		// Remove block
		}
	}
}