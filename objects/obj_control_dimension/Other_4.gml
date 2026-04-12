// Now layers exist so get their IDs
base_layer = layer_get_id("Normal_tiles");
contrast_layer = layer_get_id("Contrast_tiles");

// Get tilemap IDs if layers exist
if (base_layer != -1) {
    base_tilemap = layer_tilemap_get_id(base_layer);
    layer_set_visible(base_layer, true);
}

if (contrast_layer != -1) {
    contrast_tilemap = layer_tilemap_get_id(contrast_layer);
    layer_set_visible(contrast_layer, false);
}

if (room == Level3 || room == Level5) {
	background_dark = true;
} 
else {
	background_dark = false;
}

