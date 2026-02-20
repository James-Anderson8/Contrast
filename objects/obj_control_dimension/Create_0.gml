global.dimension = "base";
global.keys = 0; // Key count initialised

base_layer = layer_get_id("Normal_tiles");
contrast_layer = layer_get_id("Contrast_tiles");

if (base_layer != -1) {
	base_tilemap = layer_tilemap_get_id(base_layer);
}
if (contrast_layer != -1) {
	contrast_tilemap = layer_tilemap_get_id(contrast_layer);
}

if (base_layer != -1) layer_set_visible(base_layer, true);
if (contrast_layer != -1) layer_set_visible(contrast_layer, false);

base_layer = -1;
contrast_layer = -1;
base_tilemap = -1;
contrast_tilemap = -1;

switch_cooldown = 0;
flash_timer = 0;
show_dimension_text = 0;

