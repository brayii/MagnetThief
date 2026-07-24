var move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
var move_y = keyboard_check(vk_down) - keyboard_check(vk_up);

move_x += keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_y += keyboard_check(ord("S")) - keyboard_check(ord("W"));

//x += move_x * move_speed;
//y += move_y * move_speed;

if(move_x !=0 || move_y != 0)
{
	var move_dir = point_direction(0,0,move_x,move_y);
	
	//x += lengthdir_x(move_speed, move_dir);
	//y += lengthdir_y(move_speed, move_dir);
	
	var player_hsp = lengthdir_x(move_speed, move_dir);
	var player_vsp = lengthdir_y(move_speed, move_dir);
	
	if(!place_meeting(x + player_hsp, y, obj_wall))
	{
		x += player_hsp;
	}
	
	if(!place_meeting(x, y + player_vsp, obj_wall))
	{
		y += player_vsp;
	}
}

// Keep the player's collision mask fully inside the room.
if (bbox_left < 0)
{
	x -= bbox_left;
}
else if (bbox_right >= room_width)
{
	x -= bbox_right - (room_width - 1);
}

if (bbox_top < 0)
{
	y -= bbox_top;
}
else if (bbox_bottom >= room_height)
{
	y -= bbox_bottom - (room_height - 1);
}

if (keyboard_check(vk_space))
{
	with (obj_scrap)
	{
		//if (!variable_instance_exists(id, "hsp")) hsp = 0;
		//if (!variable_instance_exists(id, "vsp")) vsp = 0;

		var dist = point_distance(x, y, other.x, other.y);

		if (dist < other.magnet_range)
		{
			var dir = point_direction(x, y, other.x, other.y);

			hsp += lengthdir_x(other.magnet_force, dir);
			vsp += lengthdir_y(other.magnet_force, dir);
		}
	}

    with (obj_bomb)
	{
		//if (!variable_instance_exists(id, "hsp")) hsp = 0;
		//if (!variable_instance_exists(id, "vsp")) vsp = 0;

		var dist = point_distance(x, y, other.x, other.y);

		if (dist < other.magnet_range)
		{
			var dir = point_direction(x, y, other.x, other.y);

			hsp += lengthdir_x(other.magnet_force, dir);
			vsp += lengthdir_y(other.magnet_force, dir);
		}
	}
}


/*if(instance_number(obj_scrap) <= 0)
{
	show_message("You win!");
	game_restart();
}*/

if(player_health <= 0)
{
	var wave_controller = instance_find(obj_wave_controller, 0);

	if (wave_controller != noone)
	{
		global.last_score = wave_controller.run_score;
		global.high_score = max(global.high_score, global.last_score);
	}

	room_goto(rm_gameover);
}
