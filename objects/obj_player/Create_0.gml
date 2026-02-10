move_speed = 3;

// Creating dimension system

if (!variable_instance_exists(id, "dimension_initialised")) {
	if (!variable_global_exists("current_dimension")) {
		global.current_dimension = false; // false = normal dim, true = contrast dim
	
	}
	dimension_initialised = true;
}
// TEST FOR GITHUB
// TEST 2