function find_spawn_position()
{
	var tries = 100;
	
	repeat(tries)
	{
		var xx = irandom_range(64, room_width - 64);
		var yy = irandom_range(64, room_height - 64);
		
		var blocked = position_meeting(xx, yy, obj_wall) || 
						position_meeting(xx, yy, obj_depot);
		
		if(!blocked)
		{
			return {x:xx, y:yy};
		}
	}
	
	return {x:128, y:128};
}