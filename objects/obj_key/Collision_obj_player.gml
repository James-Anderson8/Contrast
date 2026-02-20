if (!collected) {
	collected = true;
	global.keys += 1;
	audio_play_sound(snd_key_pickup, 0, false);
	instance_destroy();
}