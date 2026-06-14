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

if(health <= 0)
{
	//show_message("Game Over");
	//game_restart();
	room_goto(rm_gameover);
}
