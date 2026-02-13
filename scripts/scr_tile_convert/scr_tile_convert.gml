function scr_tile_convert(){
	var base_layer = layer_get_id("Normal_tiles")
	var contrast_layer = layer_get_id("Contrast_tiles")


// Tilemaps

var base_tilemap = layer_tilemap_get_id(base_layer);
if base_tilemap == -1 {
	base_tilemap = layer_tilemap_create(base_layer, 0, 0, room_width, room_height, 32); //// Flag
}
	
var contrast_tilemap = layer_tilemap_get_id(contrast_layer);
if contrast_tilemap == -1 {
	contrast_tilemap = layer_tilemap_create(contrast_layer, 0, 0, room_width, room_height, 32);
}		
	
tilemap_clear(base_tilemap);
tilemap_clear(contrast_tilemap);

// Loop through all obj_wall's in the room
with (obj_wall) {
	var grid_x = floor(x / 32);
	var grid_y = floor(y / 32);
	
	  // Check which sprite this wall uses
    if sprite_index == spr_wall_black {
        tilemap_set(normal_tilemap, 2, grid_x, grid_y); // tile index 2 = black
    }
    else if sprite_index == spr_wall_white {
        tilemap_set(contrast_tilemap, 3, grid_x, grid_y); // tile index 3 = white
    }
    // If you have walls that should appear in BOTH dimensions,
    // you need to place both a black AND a white tile at the same grid position.
    // You can do that manually after conversion, or add a third sprite type.
}

show_debug_message("Conversion complete! Now you can delete obj_wall instances.");
}