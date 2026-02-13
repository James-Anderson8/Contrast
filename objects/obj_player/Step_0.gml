if keyboard_check(vk_left) or keyboard_check(ord("A"))
{
	if (!place_meeting(x - move_speed, y, obj_wall))
	{
		x -= move_speed;
	}
}

if keyboard_check(vk_right) or keyboard_check(ord("D"))
{
	if (!place_meeting(x + move_speed, y, obj_wall))
	{
		x += move_speed;
	}
}

if keyboard_check(vk_up) or keyboard_check(ord("W"))
{
	if (!place_meeting(x, y - move_speed, obj_wall))
	{
		y -= move_speed;
	}
}

if keyboard_check(vk_down) or keyboard_check(ord("S"))
{
	if (!place_meeting(x, y + move_speed, obj_wall))
	{
		y += move_speed;
	}
}

/*
// Space key to toggle dimension
if (keyboard_check_pressed(vk_space)) {
	dimension_manager();
}

*/