// M for Menu
if (room == Level1) {
	if keyboard_check_pressed(ord("M")) {
		room_goto(Menu);
	}
}

// restart level
if keyboard_check_pressed(ord("R")) {
	room_restart();
	global.keys = 0;
}

/// STEP EVENT

//  1. Get inputs and set speed
horizontal_speed = 0;
vertical_speed = 0;

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) horizontal_speed = -move_speed;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) horizontal_speed = move_speed;
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) vertical_speed = -move_speed;
if (keyboard_check(vk_down) || keyboard_check(ord("S"))) vertical_speed = move_speed;

//  2. Determine which tile layer is active 
var active_tilemap = -1;

if (instance_exists(obj_control_dimension)) {
    var ctrl = obj_control_dimension;
    if (global.dimension == "base") {
        active_tilemap = ctrl.base_tilemap;
    } else {
        active_tilemap = ctrl.contrast_tilemap;
    }
} else {
    var intro_layer = layer_get_id("DimensionA");
    if (intro_layer != -1) {
        active_tilemap = layer_tilemap_get_id(intro_layer);
    }
}

//  3. Collision checking

if (active_tilemap != -1) {
    // Store original position
    var _start_x = x;
    var _start_y = y;
    
    //  Horizontal checking
    if (horizontal_speed != 0) {
        x += horizontal_speed;
        
        // Get player's bounding box in tile coordinates
        var left_tile = floor(x / 32);
        var right_tile = floor((x + 31) / 32);
        var top_tile = floor(y / 32);
        var bottom_tile = floor((y + 31) / 32);
        
        var collision = false;
        var collision_x = 0; // Store where collision happened
        
        // Check all tiles player overlaps
        for (var xx = left_tile; xx <= right_tile; xx++) {
            for (var yy = top_tile; yy <= bottom_tile; yy++) {
                var tile = tilemap_get(active_tilemap, xx, yy);
                if (tile != 0) {
                    collision = true;
                    collision_x = xx; // Store the tile column that caused collision
                    break;
                }
            }
            if (collision) break;
        }
	
        
        // If collision, snap to wall
        if (collision) {
            if (horizontal_speed > 0) { // Moving right
                x = (collision_x * 32) - 32; // Place player left of the tile
            } else {					 // Moving left
                x = (collision_x * 32) + 32; // Place player right of the tile
            }
            horizontal_speed = 0;
        }
    }
    
    //  Vertical checking
    if (vertical_speed != 0) {
        y += vertical_speed;
        
        // Get player's bounding box in tile coordinates
        var left_tile = floor(x / 32);
        var right_tile = floor((x + 31) / 32);
        var top_tile = floor(y / 32);
        var bottom_tile = floor((y + 31) / 32);
        
        var collision = false;
        var collision_y = 0; // Store where collision happened
        
        // Check all tiles player overlaps
        for (var xx = left_tile; xx <= right_tile; xx++) {
            for (var yy = top_tile; yy <= bottom_tile; yy++) {
                var tile = tilemap_get(active_tilemap, xx, yy);
                if (tile != 0) {
                    collision = true;
                    collision_y = yy; // Store the tile row that caused collision
                    break;
                }
            }
            if (collision) break;
        }
        
        // If collision, snap to wall
        if (collision) {
            if (vertical_speed > 0)	 { // Moving down
                y = (collision_y * 32) - 32; // Place player above the tile
            } else {				// Moving up
                y = (collision_y * 32) + 32; // Place player below the tile
            }
            vertical_speed = 0;
        }
    }
}
