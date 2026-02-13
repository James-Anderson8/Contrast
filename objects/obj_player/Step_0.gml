if keyboard_check(vk_left) or keyboard_check(ord("A"))
{
	if (!place_meeting(x - move_speed, y, obj_wall))
	{
		x -= move_speed;
	}
}

if keyboard_check(vk_right) or keyboard_check(ord("D"))
{
	if (!place_meeting(x + move_speed, y, obj_wall))
	{
		x += move_speed;
	}
}

if keyboard_check(vk_up) or keyboard_check(ord("W"))
{
	if (!place_meeting(x, y - move_speed, obj_wall))
	{
		y -= move_speed;
	}
}

if keyboard_check(vk_down) or keyboard_check(ord("S"))
{
	if (!place_meeting(x, y + move_speed, obj_wall))
	{
		y += move_speed;
	}
}

//// Collision

var active_tilemap = -1;

if (instance_exists(obj_control_dimension)) {
	var ctrl = obj_control_dimension;
	if (global.dimension == "normal") {
		active_tilemap = ctrl.base_tilemap;
	} 
	else {
		active_tilemap = ctrl.contrast_tilemap;
	}
	// For level 1
} 
else {
		var intro_layer = layer_get_id("DimensionA");
		if (intro_layer != -1) {
			active_tilemap = layer_tilemap_get_id(intro_layer);
		}
}

if (active_tilemap != -1) {
	var left = bbox_left div 32;
	var right = bbox_right div 32;
	var top = bbox_top div 32;
	var down = bbox_bottom div 32;
	
	if (hsp != 0) {
		var x_edge = (bbox_x + sign(hsp) * (mask_width/2)) div 32;
		
		for (var yy = top; yy <= bottom; yy++) {
			var tile = tilemap_get(active_tilemap, x_edge, yy);
			
			if (tile != 0) {
				if (hsp > 0) {
					x = x_edge * 32 - mask_width/2;
				}
				else {
					x = (x_edge + 1) * 32 + mask_width/2;
				}
				hsp = 0;
				break;
			}
		}
	}
	
	if (vsp != 0) {
		var y_edge = (bbox_y + sign(vsp) * (mask_height/2)) div 32;
		
		for (var xx = left; xx <= right; xx++) {
			var tile = tilemap_get(active_tilemap, xx, y_edge);
			
			if (tile != 0) {
				if (vsp > 0) {
					y = y_edge * 32 - mask_height/2;
				}
				else {
					y = (y_edge + 1) * 32 + mask_height/2;
				}
				vsp = 0;
				break;
			}
		}
	}
}

					