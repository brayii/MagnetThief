//pull_speed *= 0.09;

//x += lengthdir_x(pull_speed, direction);
//y += lengthdir_y(pull_speed, direction);

if (!place_meeting(x + hsp, y, obj_wall))
{
	x += hsp;
}
else
{
	hsp = 0;
}

if (!place_meeting(x, y + vsp, obj_wall))
{
	y += vsp;
}
else
{
	vsp = 0;
}

// Keep the collision mask inside the room and stop outward momentum.
if (bbox_left < 0)
{
	x -= bbox_left;
	hsp = 0;
}
else if (bbox_right >= room_width)
{
	x -= bbox_right - (room_width - 1);
	hsp = 0;
}

if (bbox_top < 0)
{
	y -= bbox_top;
	vsp = 0;
}
else if (bbox_bottom >= room_height)
{
	y -= bbox_bottom - (room_height - 1);
	vsp = 0;
}

hsp *= 0.90;
vsp *= 0.90;
