//pull_speed *= 0.09;

//x += lengthdir_x(pull_speed, direction);
//y += lengthdir_y(pull_speed, direction);

// Move in substeps so high magnet velocity cannot skip through thin walls.
var horizontal_steps = ceil(abs(hsp));

if (horizontal_steps > 0)
{
	var horizontal_move = hsp / horizontal_steps;

	repeat (horizontal_steps)
	{
		if (place_meeting(x + horizontal_move, y, obj_wall))
		{
			hsp = 0;
			break;
		}

		x += horizontal_move;
	}
}

var vertical_steps = ceil(abs(vsp));

if (vertical_steps > 0)
{
	var vertical_move = vsp / vertical_steps;

	repeat (vertical_steps)
	{
		if (place_meeting(x, y + vertical_move, obj_wall))
		{
			vsp = 0;
			break;
		}

		y += vertical_move;
	}
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
