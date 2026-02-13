global.dimension = "base"; // Maybe change to "normal" if not working

base_layer = layer_get_id("Normal_Tiles");
contrast_layer = layer_get_id("Tiles_Contrast");

if (base_layer != -1) {
	base_tilemap = layer_tilemap_get_id(base_layer);
}
if (contrast_layer != -1) {
	contrast_tilemap = layer_tilemap_get_id(contrast_layer);
}

if (base_layer != -1) layer_visible(base_layer, true);
if (contrast_layer != -1) layer_visible(contrast_layer, false);

switch_cooldown = 0;
flash_timer = 0;