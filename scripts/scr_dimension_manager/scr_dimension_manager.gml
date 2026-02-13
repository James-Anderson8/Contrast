/*

#macro BOTH 0
#macro NORMAL 1
#macro CONTRAST 2


function dimension_manager() {
	global.current_dimension = !global.current_dimension;
}

with (obj_wall) {
	if (dimension == BOTH) {
		visible = true;
		solid = true;
	}
	else if (dimension == NORMAL && !global.current_dimension) {
		visible = true;
		solid = true;
	}
	else if (dimension == CONTRAST && global.current_dimension) {
		visible = true;
		solid = true;
	} else {
		visible = false;
		solid = false;
	}
}
*/