if (keys_needed <= 0) {
	room_goto_next();
	exit;
}

// keys needed

if (!variable_global_exists("keys")) {
	global.keys = 0;
}

if (global.keys >= keys_needed) {
	global.keys -= keys_needed;
	room_goto_next();
}

else {
	if (!message_shown) {
	show_message("Door is locked! You need " + string(keys_needed) + " key(s) and you have " + string(global.keys) + " collected");
	message_shown = true;
	}
}

