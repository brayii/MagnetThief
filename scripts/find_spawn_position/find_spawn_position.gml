function find_spawn_position(_object_type)
{
	var tries = 100;
	var spawn_sprite = object_get_sprite(_object_type);
	var left_offset = sprite_get_bbox_left(spawn_sprite) - sprite_get_xoffset(spawn_sprite);
	var right_offset = sprite_get_bbox_right(spawn_sprite) - sprite_get_xoffset(spawn_sprite);
	var top_offset = sprite_get_bbox_top(spawn_sprite) - sprite_get_yoffset(spawn_sprite);
	var bottom_offset = sprite_get_bbox_bottom(spawn_sprite) - sprite_get_yoffset(spawn_sprite);
	
	repeat(tries)
	{
		var random_x = irandom_range(64, room_width - 64);
		var random_y = irandom_range(64, room_height - 64);
		
		var random_blocked = collision_rectangle(
			random_x + left_offset,
			random_y + top_offset,
			random_x + right_offset,
			random_y + bottom_offset,
			all,
			false,
			true
		) != noone;
		
		if(!random_blocked)
		{
			return {x:random_x, y:random_y};
		}
	}
	
	for (var scan_y = 64; scan_y <= room_height - 64; scan_y += 32)
	{
		for (var scan_x = 64; scan_x <= room_width - 64; scan_x += 32)
		{
			var scan_blocked = collision_rectangle(
				scan_x + left_offset,
				scan_y + top_offset,
				scan_x + right_offset,
				scan_y + bottom_offset,
				all,
				false,
				true
			) != noone;

			if (!scan_blocked)
			{
				return {x:scan_x, y:scan_y};
			}
		}
	}

	return noone;
}
