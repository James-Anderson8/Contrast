room_goto_next()
/*
if (room = Level1 || room == Level2) {
	room_goto_next()
}
else {
	if (!variable_global_exists("keys")) {
		global.keys = 0;
	}
	if (global.keys > 0) {
		global.keys--;
		room_goto_next()
	}
	else {
		show_message("Door is locked!")
	}
}