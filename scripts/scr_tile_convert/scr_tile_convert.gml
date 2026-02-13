function scr_tile_convert(){
	var base_layer = layer_get_id("Normal_tiles")	
	var contrast_layer = layer_get_id("Contrast_tiles")
	var tileset = spr_cube;

// Tilemaps
var tilemap_w = room_width div 32;
var tilemap_h = room_height div 32;


var base_tilemap = layer_tilemap_get_id(base_layer);
if base_tilemap == -1 {
	base_tilemap = layer_tilemap_create(base_layer, 0, 0, tileset, tilemap_w, tilemap_h);
}
	
var contrast_tilemap = layer_tilemap_get_id(contrast_layer);
if contrast_tilemap == -1 {
	contrast_tilemap = layer_tilemap_create(contrast_layer, 0, 0, tileset, tilemap_w, tilemap_h);
}		
	
// Convert obj_wall instances to tiles
var wall_count = 0;
with (obj_wall) {
	var grid_x = floor(x / 32);
	var grid_y = floor(y / 32);
	
	if image_index == 0 {
		tilemap_set(base_tilemap, 1, grid_x, grid_y);
		wall_count++;
	}
	else if image_index == 1 {
		tilemap_set(contrast_tilemap, 2, grid_x, grid_y);
		wall_count++;
	}
}



show_debug_message("Conversion complete! " + string(wall_count) + " walls converted to tiles. Now you can delete obj_wall instances.");
}